// Spatial RISC-V Cell Type - Phase 9.2 Integration
//
// This module provides the RISC-V cell type that integrates RISC-V execution
// into the spatial routing system.

use std::fmt;

/// RISC-V cell type - stores instruction word and execution state
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct RiscVCell {
    /// Instruction word (32-bit RISC-V encoding)
    pub instruction: u32,
    /// Cell is executing this tick (for debug visualization)
    pub executing: u32,
}

impl RiscVCell {
    /// Create a new RISC-V cell from an instruction word
    pub fn from_instruction(instruction: u32) -> Self {
        Self {
            instruction,
            executing: 0,
        }
    }

    /// Create a NOP cell
    pub fn nop() -> Self {
        Self {
            instruction: 0x00000013,  // addi x0, x0, 0
            executing: 0,
        }
    }

    /// Check if this is a valid instruction
    pub fn is_valid(&self) -> bool {
        self.instruction != 0
    }

    /// Get opcode (lower 7 bits)
    pub fn opcode(&self) -> u32 {
        self.instruction & 0x7F
    }

    /// Get rd field (bits 7-11)
    pub fn rd(&self) -> u32 {
        (self.instruction >> 7) & 0x1F
    }

    /// Get funct3 field (bits 12-14)
    pub fn funct3(&self) -> u32 {
        (self.instruction >> 12) & 0x7
    }

    /// Get rs1 field (bits 15-19)
    pub fn rs1(&self) -> u32 {
        (self.instruction >> 15) & 0x1F
    }

    /// Get rs2 field (bits 20-24)
    pub fn rs2(&self) -> u32 {
        (self.instruction >> 20) & 0x1F
    }

    /// Get funct7 field (bits 25-31)
    pub fn funct7(&self) -> u32 {
        (self.instruction >> 25) & 0x7F
    }

    /// Get I-type immediate (bits 20-31)
    pub fn imm_i(&self) -> i32 {
        let imm = ((self.instruction >> 20) & 0xFFF) as i32;
        if imm >= 0x800 {
            imm - 0x1000  // Sign extend
        } else {
            imm
        }
    }

    /// Get S-type immediate
    pub fn imm_s(&self) -> i32 {
        let imm = ((self.instruction >> 7) & 0x1F) | ((self.instruction >> 25) & 0x7F) << 5;
        let imm = imm as i32;
        if imm >= 0x800 {
            imm - 0x1000  // Sign extend
        } else {
            imm
        }
    }
}

impl fmt::Display for RiscVCell {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "RiscVCell {{ instr: 0x{:08x}, opcode: 0x{:02x}, executing: {} }}",
            self.instruction, self.opcode(), self.executing)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_nop_cell() {
        let nop = RiscVCell::nop();
        assert_eq!(nop.instruction, 0x00000013);
        assert_eq!(nop.opcode(), 0x13);  // OP_IMM
        assert_eq!(nop.rd(), 0);
        assert_eq!(nop.rs1(), 0);
        assert_eq!(nop.funct3(), 0);
    }

    #[test]
    fn test_addi_instruction() {
        // addi x5, x0, 42
        let cell = RiscVCell::from_instruction(0x00200293);
        assert_eq!(cell.opcode(), 0x13);  // OP_IMM
        assert_eq!(cell.rd(), 5);
        assert_eq!(cell.rs1(), 0);
        assert_eq!(cell.funct3(), 0);
        assert_eq!(cell.imm_i(), 42);
    }

    #[test]
    fn test_instruction_fields() {
        // lw x10, 0(x1)
        let cell = RiscVCell::from_instruction(0x00002503);
        assert_eq!(cell.opcode(), 0x03);  // LOAD
        assert_eq!(cell.rd(), 10);
        assert_eq!(cell.rs1(), 1);
        assert_eq!(cell.funct3(), 0x2);
    }
}

// Re-export for use by GridRunner
pub use bytemuck::{Pod, Zeroable};