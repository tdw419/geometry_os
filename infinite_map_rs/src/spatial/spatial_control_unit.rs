//! Phase 12.1: Spatial Control Unit
//!
//! Program counter and control flow live in spatial cells on the GPU.
//! A TYPE_PC cell fetches one instruction word per tick from the grid,
//! executes it in the WGSL shader (spatial_compute_v6.wgsl), and updates
//! its own PC — no CPU-side PC tracking.
//!
//! PC block layout (three adjacent cells in a row):
//!   [TYPE_PC pc][ACC (NOP data cell)][TYPE_FLAGS flags]
//!
//! Instructions are u32 words stored in the data_buffer of passive NOP
//! cells: op in bits 31-24, arg in bits 23-0 (immediate or linear cell index).
//!
//! Draft generated with local Ollama (qwen2.5-coder:14b), reviewed and
//! corrected by hand.

use crate::spatial::path_cache::GRID_W;

/// Cell type for the program counter cell (matches spatial_compute_v6.wgsl)
pub const TYPE_PC: u32 = 32;
/// Cell type for the flags cell (bit 0 = zero flag)
pub const TYPE_FLAGS: u32 = 33;
/// Passive cell type (instruction words and data live in NOP cells)
pub const TYPE_NOP: u32 = 0;

// PC instruction opcodes (must match spatial_compute_v6.wgsl)
pub const PCOP_NOP: u32 = 0;
pub const PCOP_LDI: u32 = 1;
pub const PCOP_ADD: u32 = 2;
pub const PCOP_SUB: u32 = 3;
pub const PCOP_LOAD: u32 = 4;
pub const PCOP_STORE: u32 = 5;
pub const PCOP_JMP: u32 = 6;
pub const PCOP_JZ: u32 = 7;
pub const PCOP_HALT: u32 = 8;
pub const FLAG_ZERO: u32 = 1;

/// Pack an instruction word: op in bits 31-24, arg in bits 23-0.
pub fn encode_instr(op: u32, arg: u32) -> u32 {
    (op << 24) | (arg & 0xFF_FFFF)
}

/// Linear cell index for grid coordinates.
pub fn cell_index(x: u32, y: u32) -> u32 {
    y * GRID_W as u32 + x
}

/// Builder for PC-driven spatial programs in GridRunner binary format.
#[derive(Debug)]
pub struct SpatialProgram {
    cells: Vec<(u32, u32, u32, u32)>, // (x, y, opcode_or_type, data_buffer)
    pc_x: u32,
    pc_y: u32,
}

impl SpatialProgram {
    /// Create a program with its PC block at (pc_x, pc_y).
    /// `entry_index` is the linear cell index of the first instruction word.
    pub fn new(pc_x: u32, pc_y: u32, entry_index: u32) -> Self {
        let cells = vec![
            (pc_x, pc_y, TYPE_PC, entry_index),
            (pc_x + 1, pc_y, TYPE_NOP, 0),   // ACC
            (pc_x + 2, pc_y, TYPE_FLAGS, 0), // FLAGS
        ];
        SpatialProgram { cells, pc_x, pc_y }
    }

    /// Add a passive instruction cell at (x, y).
    pub fn add_instr(&mut self, x: u32, y: u32, op: u32, arg: u32) {
        self.cells.push((x, y, TYPE_NOP, encode_instr(op, arg)));
    }

    /// Add a passive data cell at (x, y).
    pub fn add_data(&mut self, x: u32, y: u32, value: u32) {
        self.cells.push((x, y, TYPE_NOP, value));
    }

    /// Linear index of the PC cell.
    pub fn pc_index(&self) -> u32 {
        cell_index(self.pc_x, self.pc_y)
    }

    /// Linear index of the accumulator cell.
    pub fn acc_index(&self) -> u32 {
        cell_index(self.pc_x + 1, self.pc_y)
    }

    /// Linear index of the flags cell.
    pub fn flags_index(&self) -> u32 {
        cell_index(self.pc_x + 2, self.pc_y)
    }

    /// Serialize to GridRunner binary format.
    /// Header (20 bytes): grid_w, grid_h, cell_count, first_code_x, first_code_y.
    /// The PC cell is the first-code cell, so load_binary() activates it.
    pub fn to_binary(&self) -> Vec<u8> {
        let mut binary = Vec::with_capacity(20 + self.cells.len() * 16);
        binary.extend_from_slice(&(crate::spatial::path_cache::GRID_W as u32).to_le_bytes());
        binary.extend_from_slice(&(crate::spatial::path_cache::GRID_H as u32).to_le_bytes());
        binary.extend_from_slice(&(self.cells.len() as u32).to_le_bytes());
        binary.extend_from_slice(&self.pc_x.to_le_bytes());
        binary.extend_from_slice(&self.pc_y.to_le_bytes());

        for &(x, y, opcode_or_type, data_buffer) in &self.cells {
            binary.extend_from_slice(&x.to_le_bytes());
            binary.extend_from_slice(&y.to_le_bytes());
            binary.extend_from_slice(&opcode_or_type.to_le_bytes());
            binary.extend_from_slice(&data_buffer.to_le_bytes());
        }

        binary
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_encode_instr() {
        assert_eq!(encode_instr(5, 0x123456), 0x05123456);
    }

    #[test]
    fn test_arg_masking() {
        assert_eq!(encode_instr(0, 0xFFFF_FFFF), 0x00FF_FFFF);
        assert_eq!(encode_instr(PCOP_HALT, 0), 0x0800_0000);
    }

    #[test]
    fn test_cell_index() {
        assert_eq!(cell_index(0, 0), 0);
        assert_eq!(cell_index(127, 63), 8191);
    }

    #[test]
    fn test_pc_block_layout() {
        let program = SpatialProgram::new(10, 20, 50);
        assert_eq!(program.cells.len(), 3);
        assert_eq!(program.cells[0], (10, 20, TYPE_PC, 50));
        assert_eq!(program.cells[1], (11, 20, TYPE_NOP, 0));
        assert_eq!(program.cells[2], (12, 20, TYPE_FLAGS, 0));
        assert_eq!(program.pc_index(), 20 * 128 + 10);
        assert_eq!(program.acc_index(), 20 * 128 + 11);
        assert_eq!(program.flags_index(), 20 * 128 + 12);
    }

    #[test]
    fn test_to_binary_header() {
        let mut program = SpatialProgram::new(10, 20, 50);
        program.add_instr(2, 4, PCOP_LDI, 5);
        let binary = program.to_binary();
        assert_eq!(binary.len(), 20 + 4 * 16);
        assert_eq!(&binary[..4], &128u32.to_le_bytes());
        assert_eq!(&binary[4..8], &64u32.to_le_bytes());
        assert_eq!(&binary[8..12], &4u32.to_le_bytes()); // 4 cells
        assert_eq!(&binary[12..16], &10u32.to_le_bytes()); // first_code_x = PC cell
        assert_eq!(&binary[16..20], &20u32.to_le_bytes()); // first_code_y
    }
}
