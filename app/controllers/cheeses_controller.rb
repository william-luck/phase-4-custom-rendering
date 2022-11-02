class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # only flag takes an array of symbols
    # except works in reverse
    # Can include methods which will be sent as part of the response
    render json: cheeses, except: [:created_at, :updated_at], methods: :summary
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese 
      render json: cheese
    else
      render json: { error: 'Cheese not found'}, status: :not_found
    end
  end

end
