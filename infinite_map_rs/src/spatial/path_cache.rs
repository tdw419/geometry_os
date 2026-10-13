//! Path cache for O(1) spatial routing validation
//!
//! Precomputes contiguous non-wall segments for fast path clearing checks.
//! Eliminates the need for per-tick iteration through intermediate cells.

use crate::geoasm_materializer::{CellState, TYPE_WALL, TYPE_DOOR};

/// Default grid dimensions (for backward compatibility)
#[cfg(feature = "larger_grid")]
pub const DEFAULT_GRID_W: usize = 512;
#[cfg(feature = "larger_grid")]
pub const DEFAULT_GRID_H: usize = 256;

#[cfg(all(feature = "large_grid", not(feature = "larger_grid")))]
pub const DEFAULT_GRID_W: usize = 256;
#[cfg(all(feature = "large_grid", not(feature = "larger_grid")))]
pub const DEFAULT_GRID_H: usize = 128;

#[cfg(not(any(feature = "larger_grid", feature = "large_grid")))]
pub const DEFAULT_GRID_W: usize = 128;
#[cfg(not(any(feature = "larger_grid", feature = "large_grid")))]
pub const DEFAULT_GRID_H: usize = 64;

/// Legacy constants (deprecated - use PathCache::new() with explicit dimensions)
#[deprecated(since = "1.0.0", note = "Use PathCache::new(cells, grid_w, grid_h) instead")]
pub const GRID_W: usize = DEFAULT_GRID_W;
#[deprecated(since = "1.0.0", note = "Use PathCache::new(cells, grid_w, grid_h) instead")]
pub const GRID_H: usize = DEFAULT_GRID_H;
#[deprecated(since = "1.0.0", note = "Use PathCache::new(cells, grid_w, grid_h) instead")]
pub const TOTAL_CELLS: usize = DEFAULT_GRID_W * DEFAULT_GRID_H;

/// Maximum segments per row/column (conservative estimate)
const MAX_SEGMENTS_PER_ROW: usize = 64;

/// Packed segment data for GPU upload (u32 pair: start, end)
#[repr(C)]
#[derive(Debug, Clone, Copy, Default, bytemuck::Pod, bytemuck::Zeroable)]
pub struct Segment {
    pub start: u32,
    pub end: u32,  // exclusive
}

/// Path cache for a grid
pub struct PathCache {
    /// Grid dimensions
    grid_w: usize,
    grid_h: usize,

    /// Horizontal segments per row (row -> Vec<(start_col, end_col)>)
    horiz_segments: Vec<Vec<Segment>>,
    /// Vertical segments per column (col -> Vec<(start_row, end_row)>)
    vert_segments: Vec<Vec<Segment>>,
}

impl PathCache {
    /// Create a new path cache from a grid of cells with explicit dimensions
    pub fn new(cells: &[CellState], grid_w: usize, grid_h: usize) -> Self {
        let total_cells = grid_w * grid_h;
        assert!(cells.len() == total_cells, "Grid size mismatch: expected {} cells ({}x{}), got {}",
                total_cells, grid_w, grid_h, cells.len());

        let mut horiz_segments = vec![Vec::new(); grid_h];
        let mut vert_segments = vec![Vec::new(); grid_w];

        // Compute horizontal segments (wall-free runs in each row)
        for y in 0..grid_h {
            let mut segment_start: Option<usize> = None;

            for x in 0..grid_w {
                let idx = y * grid_w + x;
                let cell = &cells[idx];

                let is_wall = cell.opcode_or_type == TYPE_WALL
                    || (cell.opcode_or_type == TYPE_DOOR
                        && (cell.opcode_or_type & 0x01000000_u32) == 0_u32);

                if is_wall {
                    // End current segment if active
                    if let Some(start) = segment_start {
                        horiz_segments[y].push(Segment {
                            start: start as u32,
                            end: x as u32,  // exclusive
                        });
                        segment_start = None;
                    }
                } else {
                    // Start or continue segment
                    if segment_start.is_none() {
                        segment_start = Some(x);
                    }
                }
            }

            // Close final segment if active
            if let Some(start) = segment_start {
                horiz_segments[y].push(Segment {
                    start: start as u32,
                    end: grid_w as u32,
                });
            }
        }

        // Compute vertical segments (wall-free runs in each column)
        for x in 0..grid_w {
            let mut segment_start: Option<usize> = None;

            for y in 0..grid_h {
                let idx = y * grid_w + x;
                let cell = &cells[idx];

                let is_wall = cell.opcode_or_type == TYPE_WALL
                    || (cell.opcode_or_type == TYPE_DOOR
                        && (cell.opcode_or_type & 0x01000000_u32) == 0_u32);

                if is_wall {
                    // End current segment if active
                    if let Some(start) = segment_start {
                        vert_segments[x].push(Segment {
                            start: start as u32,
                            end: y as u32,  // exclusive
                        });
                        segment_start = None;
                    }
                } else {
                    // Start or continue segment
                    if segment_start.is_none() {
                        segment_start = Some(y);
                    }
                }
            }

            // Close final segment if active
            if let Some(start) = segment_start {
                vert_segments[x].push(Segment {
                    start: start as u32,
                    end: grid_h as u32,
                });
            }
        }

        Self {
            grid_w,
            grid_h,
            horiz_segments,
            vert_segments,
        }
    }

    /// Create a path cache using default grid dimensions (backward compatibility)
    ///
    /// Deprecated: Use PathCache::new(cells, grid_w, grid_h) with explicit dimensions
    #[deprecated(since = "1.0.0", note = "Use PathCache::new(cells, grid_w, grid_h) instead")]
    pub fn from_default_grid(cells: &[CellState]) -> Self {
        Self::new(cells, DEFAULT_GRID_W, DEFAULT_GRID_H)
    }

    /// Check if a path from (x1, y1) to (x2, y2) is clear for writes
    ///
    /// Uses V-then-H Manhattan routing:
    /// 1. Vertical segment from (x1, y1) to (x1, y2)
    /// 2. Horizontal segment from (x1, y2) to (x2, y2)
    ///
    /// # Returns
    /// * `true` if both segments are clear (no WALLs)
    /// * `false` if either segment is blocked
    pub fn path_clear_for_writes(&self, x1: usize, y1: usize, x2: usize, y2: usize) -> bool {
        // Bounds check
        if x1 >= self.grid_w || y1 >= self.grid_h || x2 >= self.grid_w || y2 >= self.grid_h {
            return false;
        }

        // Same cell - always clear
        if x1 == x2 && y1 == y2 {
            return true;
        }

        // V-then-H routing: (x1, y1) -> (x1, y2) -> (x2, y2)

        // Check vertical segment: (x1, y1) -> (x1, y2)
        let y_start = y1.min(y2);
        let y_end = y1.max(y2);

        let vert_clear = self.vert_segments[x1]
            .iter()
            .any(|seg| seg.start <= y_start as u32 && seg.end >= y_end as u32);

        if !vert_clear {
            return false;
        }

        // Check horizontal segment: (x1, y2) -> (x2, y2)
        let x_start = x1.min(x2);
        let x_end = x1.max(x2);

        let horiz_clear = self.horiz_segments[y2]
            .iter()
            .any(|seg| seg.start <= x_start as u32 && seg.end >= x_end as u32);

        horiz_clear
    }

    /// Get packed segment data for GPU upload
    ///
    /// # Returns
    /// * (horizontal_segments, horizontal_counts, vertical_segments, vertical_counts)
    ///   All as Vec<u32> ready for GPU upload
    pub fn get_gpu_data(&self) -> (Vec<u32>, Vec<u32>, Vec<u32>, Vec<u32>) {
        let mut horiz_seg_data = Vec::new();
        let mut horiz_counts = Vec::new();

        for row_segments in &self.horiz_segments {
            horiz_counts.push(row_segments.len() as u32);
            for seg in row_segments {
                horiz_seg_data.push(seg.start);
                horiz_seg_data.push(seg.end);
            }
        }

        let mut vert_seg_data = Vec::new();
        let mut vert_counts = Vec::new();

        for col_segments in &self.vert_segments {
            vert_counts.push(col_segments.len() as u32);
            for seg in col_segments {
                vert_seg_data.push(seg.start);
                vert_seg_data.push(seg.end);
            }
        }

        (horiz_seg_data, horiz_counts, vert_seg_data, vert_counts)
    }

    /// GPU data getter methods for compatibility
    pub fn get_horiz_segments_gpu(&self) -> Vec<u32> {
        let mut data = Vec::new();
        for row_segments in &self.horiz_segments {
            for seg in row_segments {
                data.push(seg.start);
                data.push(seg.end);
            }
        }
        data
    }

    pub fn get_vert_segments_gpu(&self) -> Vec<u32> {
        let mut data = Vec::new();
        for col_segments in &self.vert_segments {
            for seg in col_segments {
                data.push(seg.start);
                data.push(seg.end);
            }
        }
        data
    }

    pub fn get_horiz_counts(&self) -> Vec<u32> {
        self.horiz_segments.iter().map(|s| s.len() as u32).collect()
    }

    pub fn get_vert_counts(&self) -> Vec<u32> {
        self.vert_segments.iter().map(|s| s.len() as u32).collect()
    }

    /// Get grid dimensions
    pub fn dimensions(&self) -> (usize, usize) {
        (self.grid_w, self.grid_h)
    }

    /// Compatibility shim: same as path_clear_for_writes()
    pub fn path_clear(&self, x1: usize, y1: usize, x2: usize, y2: usize) -> bool {
        self.path_clear_for_writes(x1, y1, x2, y2)
    }

    /// Compatibility shim: create path cache from cells using default grid dimensions
    pub fn from_cells(cells: &[CellState]) -> Self {
        Self::new(cells, DEFAULT_GRID_W, DEFAULT_GRID_H)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::geoasm_materializer::{TYPE_NOP, TYPE_LDI};

    #[test]
    fn test_default_grid_constants() {
        #[cfg(feature = "large_grid")]
        {
            assert_eq!(DEFAULT_GRID_W, 256);
            assert_eq!(DEFAULT_GRID_H, 128);
            assert_eq!(TOTAL_CELLS, 32768);
        }

        #[cfg(not(feature = "large_grid"))]
        {
            assert_eq!(DEFAULT_GRID_W, 128);
            assert_eq!(DEFAULT_GRID_H, 64);
            assert_eq!(TOTAL_CELLS, 8192);
        }
    }

    #[test]
    fn test_path_cache_empty_grid() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); DEFAULT_GRID_W * DEFAULT_GRID_H];
        let cache = PathCache::new(&cells, DEFAULT_GRID_W, DEFAULT_GRID_H);

        // All paths should be clear in empty grid
        assert!(cache.path_clear_for_writes(0, 0, 10, 10));
        assert!(cache.path_clear_for_writes(5, 5, 20, 20));
    }

    #[test]
    fn test_path_cache_wall_blocking() {
        let mut cells = vec![CellState::new(TYPE_NOP, 0, 0); DEFAULT_GRID_W * DEFAULT_GRID_H];

        // Add a WALL at column 10, row 0
        let wall_idx = 0 * DEFAULT_GRID_W + 10;
        cells[wall_idx] = CellState::new(TYPE_WALL, 0, 0);

        let cache = PathCache::new(&cells, DEFAULT_GRID_W, DEFAULT_GRID_H);

        // Path crossing WALL should be blocked
        assert!(!cache.path_clear_for_writes(5, 0, 15, 0));

        // Path not crossing WALL should be clear
        assert!(cache.path_clear_for_writes(5, 0, 8, 0));
        assert!(cache.path_clear_for_writes(15, 0, 20, 0));
    }

    #[test]
    fn test_path_cache_bounds_check() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); DEFAULT_GRID_W * DEFAULT_GRID_H];
        let cache = PathCache::new(&cells, DEFAULT_GRID_W, DEFAULT_GRID_H);

        // Out of bounds should be blocked
        assert!(!cache.path_clear_for_writes(0, 0, DEFAULT_GRID_W, 0));
        assert!(!cache.path_clear_for_writes(0, 0, 0, DEFAULT_GRID_H));
        assert!(!cache.path_clear_for_writes(0, 0, DEFAULT_GRID_W, DEFAULT_GRID_H));
    }

    #[test]
    fn test_gpu_data_format() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); DEFAULT_GRID_W * DEFAULT_GRID_H];
        let cache = PathCache::new(&cells, DEFAULT_GRID_W, DEFAULT_GRID_H);

        let (horiz_seg, horiz_counts, vert_seg, vert_counts) = cache.get_gpu_data();

        // Empty grid has 1 segment per row/col
        assert_eq!(horiz_counts.len(), DEFAULT_GRID_H);
        assert_eq!(vert_counts.len(), DEFAULT_GRID_W);

        // Each row/col should have 1 segment (full width/height)
        for count in &horiz_counts {
            assert_eq!(*count, 1);
        }
        for count in &vert_counts {
            assert_eq!(*count, 1);
        }

        // Segment data: 2 values per segment (start, end)
        assert_eq!(horiz_seg.len(), DEFAULT_GRID_H * 2);
        assert_eq!(vert_seg.len(), DEFAULT_GRID_W * 2);
    }
}