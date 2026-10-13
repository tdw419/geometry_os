//! Grid Conversion Helpers (Phase 5.4)
//!
//! Helper functions for converting spatial processor output to
//! full 128x64 grid format for GridRunner.

use crate::geoasm_materializer::CellState;
use crate::spatial::path_cache::TOTAL_CELLS;

/// Convert sparse cells with coordinates to full grid array
///
/// # Arguments
/// * `cells_with_coords` - Vector of (x, y, CellState) tuples
///
/// # Returns
/// * Full 128x64 cell array (TOTAL_CELLS = 8192)
///
/// # Grid Layout
/// - Coordinates are converted to linear index: idx = y * 128 + x
/// - Cells not in `cells_with_coords` are initialized to zero (NOP)
pub fn cells_to_grid_array(cells_with_coords: &[(usize, usize, CellState)]) -> Vec<CellState> {
    let mut grid = vec![CellState::data(0); TOTAL_CELLS];

    // Activate first instruction cell at (0, 1) - processing row
    // This is where the first LDI instruction for word 0 will be
    let first_code_idx = 1 * 128 + 0; // Row 1, Column 0

    for (x, y, cell) in cells_with_coords {
        if *x < 128 && *y < 64 {
            let idx = y * 128 + x;
            let mut cell_copy = *cell;

            // Activate the first instruction cell
            if idx == first_code_idx {
                cell_copy.is_active = 1;
            }

            grid[idx] = cell_copy;
        }
    }

    grid
}

/// Extract output data from grid (row 2)
///
/// # Arguments
/// * `grid` - Full grid array
/// * `num_words` - Number of output words to extract
///
/// # Returns
/// * Vector of output words (u32 values)
///
/// # Output Layout
/// - Row 2 (y=2) contains output DATA cells
/// - Each word corresponds to one cell at column i
pub fn extract_output_from_grid(grid: &[CellState], num_words: usize) -> Vec<u32> {
    let mut output = Vec::with_capacity(num_words);

    for i in 0..num_words {
        let idx = 2 * 128 + i; // Row 2, Column i

        if idx < grid.len() {
            // DATA cells store value in data_buffer field
            output.push(grid[idx].data_buffer);
        } else {
            output.push(0); // Out of bounds, return 0
        }
    }

    output
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cells_to_grid_array() {
        let cells = vec![
            (0, 0, CellState::data(100)), // Input at (0,0)
            (
                0,
                1,
                CellState::new(crate::geoasm_materializer::TYPE_LDI, 0, -1),
            ), // LDI at (0,1)
            (0, 2, CellState::data(0)), // Output at (0,2)
        ];

        let grid = cells_to_grid_array(&cells);

        // Check total size
        assert_eq!(grid.len(), TOTAL_CELLS);

        // Check input cell
        assert_eq!(grid[0].data_buffer, 100);

        // Check LDI cell (activated because it's at row 1, col 0)
        assert_eq!(grid[128].opcode(), crate::geoasm_materializer::TYPE_LDI);
        assert_eq!(grid[128].is_active, 1);

        // Check output cell
        assert_eq!(grid[256].data_buffer, 0);

        // Check NOP cell (not in input)
        assert_eq!(grid[129].opcode(), crate::geoasm_materializer::TYPE_NOP);
    }

    #[test]
    fn test_extract_output_from_grid() {
        let mut grid = vec![CellState::data(0); TOTAL_CELLS];

        // Set output values in row 2
        grid[256].data_buffer = 10; // (0,2)
        grid[257].data_buffer = 20; // (1,2)
        grid[258].data_buffer = 30; // (2,2)

        let output = extract_output_from_grid(&grid, 3);

        assert_eq!(output.len(), 3);
        assert_eq!(output[0], 10);
        assert_eq!(output[1], 20);
        assert_eq!(output[2], 30);
    }

    #[test]
    fn test_extract_output_bounds() {
        let mut grid = vec![CellState::data(0); TOTAL_CELLS];

        // Set output values in row 2
        grid[256].data_buffer = 10;
        grid[257].data_buffer = 20;
        grid[258].data_buffer = 30;

        let output = extract_output_from_grid(&grid, 5);

        assert_eq!(output.len(), 5);
        assert_eq!(output[0], 10);
        assert_eq!(output[1], 20);
        assert_eq!(output[2], 30);
        assert_eq!(output[3], 0); // Not set
        assert_eq!(output[4], 0); // Not set
    }
}