// Multi-Tile Manager - Phase 9.3
//
// Manages tile allocation and lifecycle for concurrent task execution.
// Grid is divided into tiles (8x8 cells each, 32x16 tiles total on 256x128 grid).

use super::tile_state::TileState;
use std::collections::{HashMap, VecDeque};

/// Tile coordinate (grid position in tile space)
pub type TileCoord = (usize, usize);

/// Tile manager error types
#[derive(Debug, thiserror::Error)]
pub enum TileManagerError {
    #[error("No available tiles")]
    NoAvailableTiles,
    #[error("Tile {0:?} not found")]
    TileNotFound(TileCoord),
    #[error("Tile {0:?} is already allocated")]
    TileAlreadyAllocated(TileCoord),
    #[error("Invalid tile coordinate {0:?}")]
    InvalidTileCoord(TileCoord),
}

/// Tile state tracking
#[derive(Debug, Clone)]
pub struct TileStateInfo {
    /// Tile ID in grid coordinates
    pub tile_id: TileCoord,
    /// Grid cell coordinates for tile top-left
    pub grid_base: (usize, usize),
    /// Tile dimensions (cells)
    pub tile_size: (usize, usize),
    /// Whether tile is allocated
    pub allocated: bool,
    /// Tile state (registers, PC, status)
    pub state: TileState,
}

/// Multi-tile manager
pub struct TileManager {
    /// Grid dimensions (cells)
    grid_w: usize,
    grid_h: usize,
    /// Tile dimensions (cells per tile)
    tile_w: usize,
    tile_h: usize,
    /// Tiles in tile coordinates
    tiles: HashMap<TileCoord, TileStateInfo>,
    /// Free tiles queue for allocation
    free_tiles: VecDeque<TileCoord>,
}

impl TileManager {
    /// Create a new tile manager
    ///
    /// # Arguments
    /// * `grid_w` - Grid width in cells
    /// * `grid_h` - Grid height in cells
    /// * `tile_w` - Tile width in cells (default: 8)
    /// * `tile_h` - Tile height in cells (default: 8)
    pub fn new(
        grid_w: usize,
        grid_h: usize,
        tile_w: usize,
        tile_h: usize,
    ) -> Result<Self, TileManagerError> {
        // Validate grid and tile dimensions
        if grid_w == 0 || grid_h == 0 {
            return Err(TileManagerError::InvalidTileCoord((0, 0)));
        }
        if tile_w == 0 || tile_h == 0 {
            return Err(TileManagerError::InvalidTileCoord((0, 0)));
        }
        if tile_w > grid_w || tile_h > grid_h {
            return Err(TileManagerError::InvalidTileCoord((0, 0)));
        }

        // Calculate tile grid dimensions
        let tiles_x = grid_w / tile_w;
        let tiles_y = grid_h / tile_h;

        if tiles_x == 0 || tiles_y == 0 {
            return Err(TileManagerError::InvalidTileCoord((0, 0)));
        }

        let mut tiles = HashMap::new();
        let mut free_tiles = VecDeque::new();

        // Initialize all tiles as free
        for tile_y in 0..tiles_y {
            for tile_x in 0..tiles_x {
                let tile_id = (tile_x, tile_y);
                let grid_base = (tile_x * tile_w, tile_y * tile_h);

                let state_info = TileStateInfo {
                    tile_id,
                    grid_base,
                    tile_size: (tile_w, tile_h),
                    allocated: false,
                    state: TileState::new(0, 1000, tile_x as u32 * tiles_x as u32 + tile_y as u32),
                };

                tiles.insert(tile_id, state_info);
                free_tiles.push_back(tile_id);
            }
        }

        Ok(Self {
            grid_w,
            grid_h,
            tile_w,
            tile_h,
            tiles,
            free_tiles,
        })
    }

    /// Allocate a free tile
    pub fn allocate_tile(&mut self) -> Result<TileCoord, TileManagerError> {
        match self.free_tiles.pop_front() {
            Some(tile_id) => {
                if let Some(tile) = self.tiles.get_mut(&tile_id) {
                    tile.allocated = true;
                    Ok(tile_id)
                } else {
                    Err(TileManagerError::TileNotFound(tile_id))
                }
            }
            None => Err(TileManagerError::NoAvailableTiles),
        }
    }

    /// Release a tile back to free pool
    pub fn release_tile(&mut self, tile_id: TileCoord) -> Result<(), TileManagerError> {
        if let Some(tile) = self.tiles.get_mut(&tile_id) {
            if !tile.allocated {
                return Err(TileManagerError::TileNotFound(tile_id));
            }

            tile.allocated = false;
            tile.state = TileState::new(0, 1000, tile_id.0 as u32 * 32 as u32 + tile_id.1 as u32);
            self.free_tiles.push_back(tile_id);
            Ok(())
        } else {
            Err(TileManagerError::TileNotFound(tile_id))
        }
    }

    /// Get tile state info
    pub fn get_tile_info(&self, tile_id: TileCoord) -> Result<&TileStateInfo, TileManagerError> {
        self.tiles.get(&tile_id)
            .ok_or_else(|| TileManagerError::TileNotFound(tile_id))
    }

    /// Get mutable tile state info
    pub fn get_tile_info_mut(
        &mut self,
        tile_id: TileCoord,
    ) -> Result<&mut TileStateInfo, TileManagerError> {
        self.tiles.get_mut(&tile_id)
            .ok_or_else(|| TileManagerError::TileNotFound(tile_id))
    }

    /// Get tile state (for GPU readback)
    pub fn get_tile_state(&self, tile_id: TileCoord) -> Result<&TileState, TileManagerError> {
        self.tiles.get(&tile_id)
            .map(|t| &t.state)
            .ok_or_else(|| TileManagerError::TileNotFound(tile_id))
    }

    /// Update tile state (from GPU readback)
    pub fn update_tile_state(
        &mut self,
        tile_id: TileCoord,
        state: TileState,
    ) -> Result<(), TileManagerError> {
        if let Some(tile) = self.tiles.get_mut(&tile_id) {
            tile.state = state;
            Ok(())
        } else {
            Err(TileManagerError::TileNotFound(tile_id))
        }
    }

    /// Get free tile count
    pub fn free_tile_count(&self) -> usize {
        self.free_tiles.len()
    }

    /// Get total tile count
    pub fn total_tile_count(&self) -> usize {
        self.tiles.len()
    }

    /// Get grid cell coordinates for a tile
    pub fn tile_to_grid_coords(&self, tile_id: TileCoord) -> Result<(usize, usize), TileManagerError> {
        let tile = self.get_tile_info(tile_id)?;
        Ok(tile.grid_base)
    }

    /// Get tile dimensions
    pub fn tile_dimensions(&self) -> (usize, usize) {
        (self.tile_w, self.tile_h)
    }

    /// Get grid dimensions
    pub fn grid_dimensions(&self) -> (usize, usize) {
        (self.grid_w, self.grid_h)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_tile_manager_creation() {
        let tm = TileManager::new(256, 128, 8, 8).unwrap();
        assert_eq!(tm.total_tile_count(), 32 * 16);
        assert_eq!(tm.free_tile_count(), 32 * 16);
    }

    #[test]
    fn test_tile_allocation() {
        let mut tm = TileManager::new(256, 128, 8, 8).unwrap();
        let initial_free = tm.free_tile_count();

        let tile_id = tm.allocate_tile().unwrap();
        assert_eq!(tm.free_tile_count(), initial_free - 1);

        let tile = tm.get_tile_info(tile_id).unwrap();
        assert!(tile.allocated);

        tm.release_tile(tile_id).unwrap();
        assert_eq!(tm.free_tile_count(), initial_free);

        let tile = tm.get_tile_info(tile_id).unwrap();
        assert!(!tile.allocated);
    }

    #[test]
    fn test_tile_to_grid_coords() {
        let tm = TileManager::new(256, 128, 8, 8).unwrap();

        let grid_coords = tm.tile_to_grid_coords((0, 0)).unwrap();
        assert_eq!(grid_coords, (0, 0));

        let grid_coords = tm.tile_to_grid_coords((1, 1)).unwrap();
        assert_eq!(grid_coords, (8, 8));

        let grid_coords = tm.tile_to_grid_coords((31, 15)).unwrap();
        assert_eq!(grid_coords, (248, 120));
    }

    #[test]
    fn test_exhaust_tiles() {
        let mut tm = TileManager::new(64, 64, 8, 8).unwrap();
        let total = tm.total_tile_count();

        // Allocate all tiles
        for _ in 0..total {
            tm.allocate_tile().unwrap();
        }

        assert_eq!(tm.free_tile_count(), 0);

        // Try to allocate when none available
        let result = tm.allocate_tile();
        assert!(matches!(result, Err(TileManagerError::NoAvailableTiles)));

        // Release one and allocate again
        tm.release_tile((0, 0)).unwrap();
        tm.allocate_tile().unwrap();
        assert_eq!(tm.free_tile_count(), 0);
    }
}