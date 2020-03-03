class BeersController < ApplicationController

  def index
    if params[:query]
      @beers = Beer.search_by_name(params[:query])
    elsif params[:search]
      # includes acces the info of beers tags in the where
      tag_ids = params[:search][:tags].reject { |id| id == ""}
      @beers = Beer.includes(:beer_tags).where(beer_tags: { tag_id: tag_ids })
    elsif
      @beers = Beer.all.sample(3)
    else
      @beers = Beer.all
    end
  end

  def show
    @beer = Beer.find(params[:id])
  end
end
