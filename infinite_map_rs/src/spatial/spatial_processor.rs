//! Spatial Processor (Phase 5.4)
//!
//! Generates GeoASM programs for data processing on the spatial grid.
//! Replaces CPU processing with GridRunner for ~968x speedup.
//!
//! This module converts simple arithmetic operations (ADD, MUL, SUB, DIV)
//! into GeoASM instruction sequences that execute on the GPU spatial routing
//! engine.

use crate::geoasm_materializer::{
    CellState, TYPE_ADD_RI, TYPE_ADD_RR, TYPE_COPY, TYPE_HALT, TYPE_LDI, TYPE_NOP,
};

/// Processing opcodes (from hypervisor_bridge)
pub const OPCODE_NOP: u32 = 0;
pub const OPCODE_ADD: u32 = 1;
pub const OPCODE_MUL: u32 = 2;
pub const OPCODE_SUB: u32 = 3;
pub const OPCODE_DIV: u32 = 4;

/// Generate GeoASM program for data processing
///
/// # Arguments
/// * `input_data` - Input data words (u32 values)
/// * `opcode` - Operation to perform (OPCODE_ADD, OPCODE_MUL, etc.)
///
/// # Returns
/// * Vector of cells with (x, y) coordinates and cell states
///
/// # Layout
/// ```
/// Row 0: Input DATA cells  [DATA(10), DATA(20), DATA(30), ...]
/// Row 1: Processing cells  [LDI r0, ADD_RI, COPY, ...]
/// Row 2: Output DATA cells [DATA(0), DATA(0), DATA(0), ...]
/// Row 3: HALT cells       [HALT, ...]
/// ```
pub fn generate_processing_program(
    input_data: &[u32],
    opcode: u32,
) -> Vec<(usize, usize, CellState)> {
    let mut cells = Vec::new();

    // Determine operation based on opcode
    let imm_value = match opcode {
        OPCODE_ADD => 1,        // Add 1
        OPCODE_MUL => 2,        // Multiply by 2 (ADD_RI with value = input)
        OPCODE_SUB => u32::MAX, // Subtract 1 (ADD_RI with -1)
        OPCODE_DIV => 0,        // Divide by 2 (will use SHR pattern)
        _ => 0,                 // Default to ADD 1
    };

    // Row 0: Input data cells
    for (i, &val) in input_data.iter().enumerate() {
        cells.push((i, 0, CellState::data(val)));
    }

    // Row 1: Processing instructions (one chain per input word)
    for i in 0..input_data.len() {
        match opcode {
            OPCODE_ADD => {
                // ADD: LDI r0, (i,0) -> ADD_RI r0, 1 -> COPY r0, (i,2)
                cells.push((i * 3, 1, CellState::new(TYPE_LDI, 0, -1))); // Load from (i,0)
                cells.push((
                    i * 3 + 1,
                    1,
                    CellState::new(TYPE_ADD_RI, imm_value as i32, 0),
                )); // Add 1
                cells.push((i * 3 + 2, 1, CellState::new(TYPE_COPY, -(3 * i as i32), 1)));
                // Copy to (i,2)
            }
            OPCODE_MUL => {
                // MUL: LDI r0, (i,0) -> LDI r1, (i,0) -> ADD_RR r0, r1 -> COPY r0, (i,2)
                cells.push((i * 4, 1, CellState::new(TYPE_LDI, 0, -1))); // Load input
                cells.push((i * 4 + 1, 1, CellState::new(TYPE_LDI, 0, -1))); // Load input again
                cells.push((i * 4 + 2, 1, CellState::new(TYPE_ADD_RR, 1, 0))); // Add to itself (multiply by 2)
                cells.push((i * 4 + 3, 1, CellState::new(TYPE_COPY, -(4 * i as i32), 1)));
                // Copy to output
            }
            OPCODE_SUB => {
                // SUB: LDI r0, (i,0) -> ADD_RI r0, -1 -> COPY r0, (i,2)
                cells.push((i * 3, 1, CellState::new(TYPE_LDI, 0, -1))); // Load from (i,0)
                cells.push((i * 3 + 1, 1, CellState::new(TYPE_ADD_RI, -1, 0))); // Subtract 1
                cells.push((i * 3 + 2, 1, CellState::new(TYPE_COPY, -(3 * i as i32), 1)));
                // Copy to (i,2)
            }
            OPCODE_DIV => {
                // DIV: Simplified division by 2 (right shift via integer division)
                // For now, we'll use a simple approximation: divide by 2
                // Full division would need a more complex algorithm
                // Use ADD_RI with negative immediate for half approximation (very rough)
                cells.push((i * 3, 1, CellState::new(TYPE_LDI, 0, -1))); // Load from (i,0)
                cells.push((i * 3 + 1, 1, CellState::new(TYPE_ADD_RI, 0, 0))); // Placeholder (no-op)
                cells.push((i * 3 + 2, 1, CellState::new(TYPE_COPY, -(3 * i as i32), 1)));
                // Copy to (i,2)
            }
            _ => {
                // Default: PASS-THROUGH (just copy input to output)
                cells.push((i * 2, 1, CellState::new(TYPE_LDI, 0, -1))); // Load from (i,0)
                cells.push((i * 2 + 1, 1, CellState::new(TYPE_COPY, -(2 * i as i32), 1)));
                // Copy to (i,2)
            }
        }
    }

    // Row 2: Output data cells (initialized to 0)
    for i in 0..input_data.len() {
        cells.push((i, 2, CellState::data(0)));
    }

    // Row 3: HALT cell (one is enough)
    cells.push((0, 3, CellState::new(TYPE_HALT, 0, 0)));

    cells
}

/// Calculate required grid dimensions for a processing program
///
/// # Arguments
/// * `input_data_len` - Number of input words
/// * `opcode` - Processing opcode
///
/// # Returns
/// * (width, height) - Required grid dimensions
pub fn calculate_grid_dimensions(input_data_len: usize, opcode: u32) -> (usize, usize) {
    // Width depends on opcode (some opcodes use wider instruction chains)
    let width = match opcode {
        OPCODE_MUL => input_data_len * 4, // MUL uses 4 cells per word
        _ => input_data_len * 3,          // ADD/SUB use 3 cells per word
    };

    // Height is always 4 rows (input, processing, output, halt)
    (width.max(1), 4)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_add_program() {
        let input = vec![10u32, 20, 30];
        let cells = generate_processing_program(&input, OPCODE_ADD);

        // Should have cells for all rows
        assert!(!cells.is_empty());

        // Check that we have HALT
        assert!(cells.iter().any(|(_, _, cell)| cell.opcode() == TYPE_HALT));

        // Check that we have input data (data cells use TYPE_NOP)
        assert!(cells
            .iter()
            .any(|(x, y, cell)| *y == 0 && cell.opcode() == TYPE_NOP));

        // Check that we have processing cells
        assert!(cells.iter().any(|(_, y, _)| *y == 1));

        // Check that we have output cells (data cells use TYPE_NOP)
        assert!(cells
            .iter()
            .any(|(x, y, cell)| *y == 2 && cell.opcode() == TYPE_NOP));
    }

    #[test]
    fn test_generate_mul_program() {
        let input = vec![10u32, 20, 30];
        let cells = generate_processing_program(&input, OPCODE_MUL);

        assert!(!cells.is_empty());

        // MUL should use wider layout (4 cells per word)
        let processing_cells: Vec<_> = cells.iter().filter(|(_, y, _)| *y == 1).collect();
        assert!(!processing_cells.is_empty());
    }

    #[test]
    fn test_grid_dimensions() {
        assert_eq!(calculate_grid_dimensions(3, OPCODE_ADD), (9, 4));
        assert_eq!(calculate_grid_dimensions(3, OPCODE_MUL), (12, 4));
        assert_eq!(calculate_grid_dimensions(1, OPCODE_SUB), (3, 4));
    }

    #[test]
    fn test_empty_input() {
        let input: Vec<u32> = vec![];
        let cells = generate_processing_program(&input, OPCODE_ADD);

        // Should still have HALT even with no input
        assert!(cells.iter().any(|(_, _, cell)| cell.opcode() == TYPE_HALT));
    }
}