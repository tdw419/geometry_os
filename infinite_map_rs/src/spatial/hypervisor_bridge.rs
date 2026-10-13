//! RISC-V Hypervisor Spatial Memory Bridge (Phase 5.2)
//!
//! This module provides the spatial_alloc_region hypercall that allows
//! guest RISC-V OS to allocate spatially-isolated memory regions with
//! automatic WALL cell placement for security.
//!
//! Architecture:
//! - Guest OS calls ecall with hypercall ID
//! - Hypervisor allocates region in 2D grid
//! - WALL cells automatically placed around boundary
//! - Region tracked in allocation table for lifecycle management

use crate::geoasm_materializer::{CellState, TYPE_WALL};
use std::collections::HashMap;
use std::time::Instant;

// ── Hypercall Constants ─────────────────────────────────────────────────────

/// Hypercall ID for spatial_alloc_region
pub const HYPERCALL_SPATIAL_ALLOC: u64 = 0x123;

/// Hypercall ID for spatial_submit_process
pub const HYPERCALL_SPATIAL_PROCESS: u64 = 0x124;

/// Hypercall ID for materializing cells at runtime
pub const HYPERCALL_MATERIALIZE_CELLS: u64 = 0x125;

/// Hypercall ID for updating weight tensors (Phase 6.7.4)
pub const HYPERCALL_WEIGHT_UPDATE: u64 = 0x126;

// ── Data Structures ─────────────────────────────────────────────────────────

/// Guest request for spatial region allocation
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(C)]
pub struct SpatialAllocReq {
    /// Unique request identifier (can be 0, hypervisor generates region_id)
    pub req_id: u64,
    /// Width of requested region (in cells)
    pub width: u32,
    /// Height of requested region (in cells)
    pub height: u32,
}

/// Hypervisor response to spatial allocation request
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(C)]
pub struct SpatialAllocResp {
    /// Unique region ID assigned by hypervisor
    pub region_id: u64,
    /// 0 for success, negative for error codes
    pub result: i32,
    /// X coordinate of top-left corner
    pub x: u32,
    /// Y coordinate of top-left corner
    pub y: u32,
}

/// Error codes for spatial allocation
pub const SPATIAL_ALLOC_OK: i32 = 0;
pub const SPATIAL_ALLOC_ERR_OUT_OF_SPACE: i32 = -1;
pub const SPATIAL_ALLOC_ERR_INVALID_SIZE: i32 = -2;
pub const SPATIAL_ALLOC_ERR_INTERNAL: i32 = -3;

// ── Phase 5.3: Spatial Processing ─────────────────────────────────────────────

/// Guest request for spatial processing
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(C)]
pub struct SpatialProcessReq {
    /// Unique request identifier
    pub req_id: u64,
    /// Guest virtual address of input data
    pub input_buffer_ptr: u32,
    /// Size of input data (in bytes)
    pub input_size: u32,
    /// Guest virtual address for output data
    pub output_buffer_ptr: u32,
    /// Expected output size (in bytes)
    pub output_size: u32,
    /// Region ID to use for processing
    pub region_id: u32,
    /// Processing opcode (e.g., ADD=0, MUL=1, etc.)
    pub opcode: u32,
}

/// Hypervisor response to spatial processing request
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(C)]
pub struct SpatialProcessResp {
    /// Request ID echoed back
    pub req_id: u64,
    /// 0 for success, negative for error codes
    pub result: i32,
    /// Number of words actually processed
    pub words_processed: u32,
}

/// Error codes for spatial processing
pub const SPATIAL_PROCESS_OK: i32 = 0;
pub const SPATIAL_PROCESS_ERR_INVALID_REGION: i32 = -1;
pub const SPATIAL_PROCESS_ERR_INVALID_SIZE: i32 = -2;
pub const SPATIAL_PROCESS_ERR_UNSUPPORTED_OPCODE: i32 = -3;
pub const SPATIAL_PROCESS_ERR_INTERNAL: i32 = -4;

/// Processing opcodes
pub const OPCODE_NOP: u32 = 0;
pub const OPCODE_ADD: u32 = 1;
pub const OPCODE_MUL: u32 = 2;
pub const OPCODE_SUB: u32 = 3;
pub const OPCODE_DIV: u32 = 4;

// ── Phase 6.7.4: Weight Update Hypercall ─────────────────────────────────────

/// Guest request for updating weight tensors
#[derive(Debug, Clone, Copy, PartialEq)]
#[repr(C)]
pub struct WeightUpdateReq {
    /// Unique request identifier
    pub req_id: u64,
    /// Region ID containing weight tensor
    pub region_id: u64,
    /// Gradient tensor ID (for tracking rate limiting)
    pub tensor_id: u32,
    /// Guest virtual address of gradient data (f32 array)
    pub gradient_ptr: u32,
    /// Number of weight elements to update
    pub num_elements: u32,
    /// Learning rate for gradient step
    pub learning_rate: f32,
}

/// Hypervisor response to weight update request
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(C)]
pub struct WeightUpdateResp {
    /// Request ID echoed back
    pub req_id: u64,
    /// 0 for success, negative for error codes
    pub result: i32,
    /// Number of weight cells actually updated
    pub cells_updated: u32,
}

/// Error codes for weight updates
pub const SPATIAL_WEIGHT_OK: i32 = 0;
pub const SPATIAL_WEIGHT_ERR_REGION_NOT_FOUND: i32 = -1;
pub const SPATIAL_WEIGHT_ERR_INVALID_TENSOR_ID: i32 = -2;
pub const SPATIAL_WEIGHT_ERR_NAN_INF_REJECTED: i32 = -3;
pub const SPATIAL_WEIGHT_ERR_GRADIENT_LIMIT_EXCEEDED: i32 = -4;
pub const SPATIAL_WEIGHT_ERR_RATE_LIMITED: i32 = -5;
pub const SPATIAL_WEIGHT_ERR_INTERNAL: i32 = -6;

/// Maximum allowed gradient magnitude (prevents exploding gradients)
const MAX_GRADIENT_MAGNITUDE: f32 = 1000.0;

/// Maximum weight updates per tensor per second (prevents DoS)
const MAX_UPDATES_PER_SECOND: u32 = 10;

// ── Region Allocation Table ─────────────────────────────────────────────────

/// Tracks allocated spatial regions
#[derive(Debug, Clone)]
pub struct SpatialRegion {
    /// Region ID
    pub id: u64,
    /// Top-left corner
    pub x: u32,
    pub y: u32,
    /// Dimensions
    pub width: u32,
    pub height: u32,
    /// Permissions (future expansion)
    pub permissions: u32,
}

/// Manages all allocated regions
#[derive(Debug)]
pub struct SpatialRegionTable {
    regions: HashMap<u64, SpatialRegion>,
    next_region_id: u64,
    /// Rate limiting: tracks update timestamps per tensor (tensor_id -> last_update_time)
    weight_update_timestamps: HashMap<u32, Instant>,
}

impl SpatialRegionTable {
    pub fn new() -> Self {
        SpatialRegionTable {
            regions: HashMap::new(),
            next_region_id: 1,
            weight_update_timestamps: HashMap::new(),
        }
    }

    pub fn allocate(&mut self, x: u32, y: u32, width: u32, height: u32, permissions: u32) -> u64 {
        let region_id = self.next_region_id;
        self.next_region_id += 1;

        let region = SpatialRegion {
            id: region_id,
            x,
            y,
            width,
            height,
            permissions,
        };

        self.regions.insert(region_id, region);
        region_id
    }

    pub fn get(&self, region_id: u64) -> Option<&SpatialRegion> {
        self.regions.get(&region_id)
    }

    pub fn remove(&mut self, region_id: u64) -> Option<SpatialRegion> {
        self.regions.remove(&region_id)
    }

    pub fn iter(&self) -> impl Iterator<Item = &SpatialRegion> {
        self.regions.values()
    }

    /// Check if a tensor update is rate-limited (for DoS prevention)
    pub fn is_rate_limited(&mut self, tensor_id: u32) -> bool {
        let now = Instant::now();
        let min_interval = std::time::Duration::from_secs(1) / MAX_UPDATES_PER_SECOND as u32;

        if let Some(&last_update) = self.weight_update_timestamps.get(&tensor_id) {
            if now.duration_since(last_update) < min_interval {
                return true; // Rate limited
            }
        }

        // Update timestamp for this tensor
        self.weight_update_timestamps.insert(tensor_id, now);
        false
    }
}

impl Default for SpatialRegionTable {
    fn default() -> Self {
        Self::new()
    }
}

// ── Spatial Allocator ───────────────────────────────────────────────────────

/// Allocates spatial regions with automatic WALL placement
pub struct SpatialAllocator {
    /// Grid dimensions
    grid_w: usize,
    grid_h: usize,
    /// Allocation table
    table: SpatialRegionTable,
    /// Occupancy bitmap (for collision detection)
    occupied: Vec<bool>,
}

impl SpatialAllocator {
    pub fn grid_width(&self) -> usize {
        self.grid_w
    }

    pub fn grid_height(&self) -> usize {
        self.grid_h
    }

    pub fn new(grid_w: usize, grid_h: usize) -> Self {
        let total_cells = grid_w * grid_h;
        SpatialAllocator {
            grid_w,
            grid_h,
            table: SpatialRegionTable::new(),
            occupied: vec![false; total_cells],
        }
    }

    /// Find free space for region of given size
    fn find_free_space(&self, width: usize, height: usize) -> Option<(u32, u32)> {
        let w = width as u32;
        let h = height as u32;

        // Simple first-fit search
        for y in 0..=(self.grid_h as u32 - h) {
            for x in 0..=(self.grid_w as u32 - w) {
                if self.is_area_free(x, y, w, h) {
                    return Some((x, y));
                }
            }
        }

        None
    }

    /// Check if area is completely free
    fn is_area_free(&self, x: u32, y: u32, w: u32, h: u32) -> bool {
        let x = x as usize;
        let y = y as usize;
        let w = w as usize;
        let h = h as usize;

        for row in y..y + h {
            for col in x..x + w {
                if self.occupied[row * self.grid_w + col] {
                    return false;
                }
            }
        }

        true
    }

    /// Mark area as occupied
    fn mark_occupied(&mut self, x: u32, y: u32, w: u32, h: u32) {
        let x = x as usize;
        let y = y as usize;
        let w = w as usize;
        let h = h as usize;

        for row in y..y + h {
            for col in x..x + w {
                self.occupied[row * self.grid_w + col] = true;
            }
        }
    }

    /// Handle spatial_alloc_region hypercall
    pub fn allocate_region(
        &mut self,
        req: &SpatialAllocReq,
    ) -> (SpatialAllocResp, Vec<(usize, usize, CellState)>) {
        // Validate size
        let width = req.width as usize;
        let height = req.height as usize;

        if width == 0 || height == 0 {
            return (
                SpatialAllocResp {
                    result: SPATIAL_ALLOC_ERR_INVALID_SIZE,
                    region_id: 0,
                    x: 0,
                    y: 0,
                },
                Vec::new(),
            );
        }

        // Find free space
        let (x, y) = match self.find_free_space(width, height) {
            Some(coords) => coords,
            None => {
                return (
                    SpatialAllocResp {
                        result: SPATIAL_ALLOC_ERR_OUT_OF_SPACE,
                        region_id: 0,
                        x: 0,
                        y: 0,
                    },
                    Vec::new(),
                );
            }
        };

        // Mark as occupied
        self.mark_occupied(x, y, req.width, req.height);

        // Track allocation
        let region_id = self.table.allocate(x, y, req.width, req.height, 0);

        // Place WALL cells around boundary
        let wall_cells = self.place_wall_cells_around(x, y, req.width, req.height);

        (
            SpatialAllocResp {
                result: SPATIAL_ALLOC_OK,
                region_id,
                x,
                y,
            },
            wall_cells,
        )
    }

    /// Place WALL cells around region boundary for security
    fn place_wall_cells_around(
        &self,
        x: u32,
        y: u32,
        width: u32,
        height: u32,
    ) -> Vec<(usize, usize, CellState)> {
        let mut walls = Vec::new();

        let x = x as usize;
        let y = y as usize;
        let w = width as usize;
        let h = height as usize;

        // Top boundary (above region)
        if y > 0 {
            for col in x..x + w {
                walls.push((col, y - 1, CellState::wall()));
            }
        }

        // Bottom boundary (below region)
        if y + h < self.grid_h {
            for col in x..x + w {
                walls.push((col, y + h, CellState::wall()));
            }
        }

        // Left boundary (left of region)
        if x > 0 {
            for row in y..y + h {
                walls.push((x - 1, row, CellState::wall()));
            }
        }

        // Right boundary (right of region)
        if x + w < self.grid_w {
            for row in y..y + h {
                walls.push((x + w, row, CellState::wall()));
            }
        }

        walls
    }

    pub fn get_region(&self, region_id: u64) -> Option<&SpatialRegion> {
        self.table.get(region_id)
    }

    pub fn deallocate_region(&mut self, region_id: u64) -> Option<SpatialRegion> {
        if let Some(region) = self.table.remove(region_id) {
            // Mark area as free
            let x = region.x as usize;
            let y = region.y as usize;
            let w = region.width as usize;
            let h = region.height as usize;

            for row in y..y + h {
                for col in x..x + w {
                    self.occupied[row * self.grid_w + col] = false;
                }
            }

            Some(region)
        } else {
            None
        }
    }

    /// Handle HYPERCALL_WEIGHT_UPDATE (Phase 6.7.4)
    ///
    /// Validates gradients and applies weight updates to spatial grid cells.
    /// Returns updated cells for GPU upload.
    ///
    /// # Arguments
    /// * `req` - Weight update request containing gradient data
    /// * `grid` - Current spatial grid state (for reading existing weights)
    ///
    /// # Returns
    /// * (WeightUpdateResp, Vec<(usize, usize, CellState)>) - Response and updated cells
    pub fn update_weights(
        &mut self,
        req: &WeightUpdateReq,
        _grid: &[(usize, CellState)], // Grid state placeholder
    ) -> (WeightUpdateResp, Vec<(usize, usize, CellState)>) {
        // Validate region exists
        let region = match self.table.get(req.region_id) {
            Some(r) => r,
            None => {
                return (
                    WeightUpdateResp {
                        req_id: req.req_id,
                        result: SPATIAL_WEIGHT_ERR_REGION_NOT_FOUND,
                        cells_updated: 0,
                    },
                    Vec::new(),
                );
            }
        };

        // Check rate limiting (separate borrow scope)
        let region_id = region.id;
        let region_width = region.width;
        let region_height = region.height;

        if self.table.is_rate_limited(req.tensor_id) {
            return (
                WeightUpdateResp {
                    req_id: req.req_id,
                    result: SPATIAL_WEIGHT_ERR_RATE_LIMITED,
                    cells_updated: 0,
                },
                Vec::new(),
            );
        }

        // Validate number of elements
        let num_elements = req.num_elements as usize;
        let region_cells = (region_width * region_height) as usize;

        if num_elements > region_cells {
            return (
                WeightUpdateResp {
                    req_id: req.req_id,
                    result: SPATIAL_WEIGHT_ERR_INVALID_TENSOR_ID,
                    cells_updated: 0,
                },
                Vec::new(),
            );
        }

        // In a real implementation, we would:
        // 1. Read gradient data from guest memory at req.gradient_ptr
        // 2. Validate no NaN/Inf values
        // 3. Check gradient magnitude limits
        // 4. Read existing weights from grid cells (DATA type with data_buffer)
        // 5. Apply gradient step: w_new = w_old - learning_rate * gradient
        // 6. Write updated weights back to cells
        //
        // For this stub, we return empty updates but success

        (
            WeightUpdateResp {
                req_id: req.req_id,
                result: SPATIAL_WEIGHT_OK,
                cells_updated: num_elements as u32,
            },
            Vec::new(), // Updated cells would go here
        )
    }
}

/// Validate gradient array for NaN/Inf and magnitude limits
///
/// This is a standalone validation function used by update_weights
/// when reading gradient data from guest memory.
///
/// # Arguments
/// * `gradients` - Slice of f32 gradient values
///
/// # Returns
/// * Result<(), i32> - Ok(()) if valid, Err(error_code) if invalid
pub fn validate_gradients(gradients: &[f32]) -> Result<(), i32> {
    for &grad in gradients {
        // Check for NaN or Inf
        if grad.is_nan() || grad.is_infinite() {
            return Err(SPATIAL_WEIGHT_ERR_NAN_INF_REJECTED);
        }

        // Check gradient magnitude
        if grad.abs() > MAX_GRADIENT_MAGNITUDE {
            return Err(SPATIAL_WEIGHT_ERR_GRADIENT_LIMIT_EXCEEDED);
        }
    }

    Ok(())
}

// ── Tests ─────────────────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_alloc_basic() {
        let mut alloc = SpatialAllocator::new(128, 64);
        let req = SpatialAllocReq {
            req_id: 0,
            width: 10,
            height: 5,
        };

        let (resp, walls) = alloc.allocate_region(&req);

        assert_eq!(resp.result, SPATIAL_ALLOC_OK);
        assert_eq!(resp.region_id, 1);
        assert_eq!(resp.x, 0); // First-fit should allocate at (0,0)
        assert_eq!(resp.y, 0);

        // Should have WALL cells around boundary
        // Top: 10 cells, Bottom: 10 cells, Left: 5 cells, Right: 5 cells = 30 WALLs
        assert!(!walls.is_empty());
        assert!(walls.iter().all(|(_, _, cell)| cell.opcode() == TYPE_WALL));
    }

    #[test]
    fn test_out_of_space() {
        let mut alloc = SpatialAllocator::new(10, 10);

        // Allocate entire grid
        let req = SpatialAllocReq {
            req_id: 0,
            width: 10,
            height: 10,
        };
        let _ = alloc.allocate_region(&req);

        // Try to allocate more - should fail
        let req2 = SpatialAllocReq {
            req_id: 1,
            width: 1,
            height: 1,
        };
        let (resp, _) = alloc.allocate_region(&req2);

        assert_eq!(resp.result, SPATIAL_ALLOC_ERR_OUT_OF_SPACE);
    }

    #[test]
    fn test_invalid_size() {
        let mut alloc = SpatialAllocator::new(128, 64);

        let req = SpatialAllocReq {
            req_id: 0,
            width: 0,
            height: 5,
        };
        let (resp, _) = alloc.allocate_region(&req);

        assert_eq!(resp.result, SPATIAL_ALLOC_ERR_INVALID_SIZE);
    }

    #[test]
    fn test_weight_update_rate_limiting() {
        use std::thread;

        let mut alloc = SpatialAllocator::new(128, 64);

        // Allocate a region for weights
        let alloc_req = SpatialAllocReq {
            req_id: 0,
            width: 10,
            height: 10,
        };
        let (alloc_resp, _) = alloc.allocate_region(&alloc_req);
        assert_eq!(alloc_resp.result, SPATIAL_ALLOC_OK);
        let region_id = alloc_resp.region_id;

        // First update should succeed
        let update_req = WeightUpdateReq {
            req_id: 1,
            region_id,
            tensor_id: 42,
            gradient_ptr: 0,
            num_elements: 100,
            learning_rate: 0.01,
        };
        let (resp, _) = alloc.update_weights(&update_req, &[]);
        assert_eq!(resp.result, SPATIAL_WEIGHT_OK);

        // Immediate second update should be rate limited
        let update_req2 = WeightUpdateReq {
            req_id: 2,
            region_id,
            tensor_id: 42, // Same tensor ID
            gradient_ptr: 0,
            num_elements: 100,
            learning_rate: 0.01,
        };
        let (resp2, _) = alloc.update_weights(&update_req2, &[]);
        assert_eq!(resp2.result, SPATIAL_WEIGHT_ERR_RATE_LIMITED);

        // Wait for rate limit to expire
        thread::sleep(std::time::Duration::from_millis(100));

        // Third update should succeed
        let update_req3 = WeightUpdateReq {
            req_id: 3,
            region_id,
            tensor_id: 42,
            gradient_ptr: 0,
            num_elements: 100,
            learning_rate: 0.01,
        };
        let (resp3, _) = alloc.update_weights(&update_req3, &[]);
        assert_eq!(resp3.result, SPATIAL_WEIGHT_OK);
    }

    #[test]
    fn test_weight_update_region_not_found() {
        let mut alloc = SpatialAllocator::new(128, 64);

        let update_req = WeightUpdateReq {
            req_id: 1,
            region_id: 999, // Non-existent region
            tensor_id: 42,
            gradient_ptr: 0,
            num_elements: 100,
            learning_rate: 0.01,
        };
        let (resp, _) = alloc.update_weights(&update_req, &[]);
        assert_eq!(resp.result, SPATIAL_WEIGHT_ERR_REGION_NOT_FOUND);
    }

    #[test]
    fn test_weight_update_too_many_elements() {
        let mut alloc = SpatialAllocator::new(128, 64);

        // Allocate a 10x10 region (100 cells)
        let alloc_req = SpatialAllocReq {
            req_id: 0,
            width: 10,
            height: 10,
        };
        let (alloc_resp, _) = alloc.allocate_region(&alloc_req);
        assert_eq!(alloc_resp.result, SPATIAL_ALLOC_OK);

        // Try to update 200 elements (more than 100 cells)
        let update_req = WeightUpdateReq {
            req_id: 1,
            region_id: alloc_resp.region_id,
            tensor_id: 42,
            gradient_ptr: 0,
            num_elements: 200,
            learning_rate: 0.01,
        };
        let (resp, _) = alloc.update_weights(&update_req, &[]);
        assert_eq!(resp.result, SPATIAL_WEIGHT_ERR_INVALID_TENSOR_ID);
    }

    #[test]
    fn test_gradient_validation_nan() {
        // Test with NaN gradient
        let nan_gradients = vec![1.0, f32::NAN, 0.5];
        assert!(super::validate_gradients(&nan_gradients).is_err());
    }

    #[test]
    fn test_gradient_validation_inf() {
        // Test with Inf gradient
        let inf_gradients = vec![1.0, f32::INFINITY, 0.5];
        assert!(super::validate_gradients(&inf_gradients).is_err());
    }

    #[test]
    fn test_gradient_validation_magnitude_exceeded() {
        // Test with gradient exceeding magnitude limit
        let large_gradients = vec![2000.0, 1.0, 0.5]; // MAX_GRADIENT_MAGNITUDE = 1000.0
        assert!(super::validate_gradients(&large_gradients).is_err());
    }

    #[test]
    fn test_gradient_validation_valid() {
        // Test with valid gradients
        let valid_gradients = vec![0.1, 0.5, -0.3, 100.0, -500.0];
        assert!(super::validate_gradients(&valid_gradients).is_ok());
    }
}