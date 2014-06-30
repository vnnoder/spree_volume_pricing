class AddDiscountTypeColumn < ActiveRecord::Migration
  def self.up
    add_column :spree_volume_prices, :discount_type, :string

    Spree::VolumePrice.reset_column_information
    Spree::VolumePrice.all.each { |v| v.update_attribute(:discount_type, 'price') }
  end

  def self.down
    remove_column :spree_volume_prices, :discount_type, :string
  end
end
