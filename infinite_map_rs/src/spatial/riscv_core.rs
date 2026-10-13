//! Spatial RISC-V Core - Phase 8.1
//!
//! RISC-V RV32I soft-core built entirely from Geometry OS spatial cells.
//! Each register, memory cell, and ALU operation is a spatial cell in the grid.

use crate::geoasm_materializer::{CellState, TYPE_NOP, TYPE_ADD_RR, TYPE_SUB_RR, TYPE_LDI, TYPE_JZ, TYPE_JMP, TYPE_HALT, TYPE_COPY, TYPE_WALL};
use crate::spatial::spatial_memory::{SpatialMemory, MemoryConfig};
use std::collections::HashMap;

/// RISC-V RV32I Instruction Set (subset for Phase 8.1)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RiscvOpcode {
    // Arithmetic (R-type) - different funct7 values
    Add = 0b1000000, // funct7 for ADD (shifted to avoid collision)
    Sub = 0b1100001, // funct7 for SUB (shifted to avoid collision)
    // Arithmetic (I-type)
    Addi = 0b1010011, // opcode (shifted to avoid collision)
    // Load/Store
    Lw = 0b1000011,
    Sw = 0b1100011,
    // Branch - different funct3 values
    Beq = 0b100, // funct3 for BEQ (shifted)
    Bne = 0b101, // funct3 for BNE (shifted)
    // Jump
    Jal = 0b0101111,
    Jalr = 0b0100111,
    // LUI/AUIPC
    Lui = 0b1110111,
    Auipc = 0b1010111,
    // System
    Ecall = 0b0110011,
}

/// RISC-V Register Addresses (RV32I: 32 registers, x0-x31)
pub type RegAddr = u8;

pub const X0: RegAddr = 0;  // Zero register (hardwired to 0)
pub const X1: RegAddr = 1;  // Return address
pub const RA: RegAddr = 1;
pub const SP: RegAddr = 2;  // Stack pointer
pub const GP: RegAddr = 3;  // Global pointer
pub const TP: RegAddr = 4;  // Thread pointer
pub const T0: RegAddr = 5;
pub const T1: RegAddr = 6;
pub const T2: RegAddr = 7;
pub const S0: RegAddr = 8;  // Saved register / frame pointer
pub const FP: RegAddr = 8;
pub const S1: RegAddr = 9;
pub const A0: RegAddr = 10; // Function argument / return value
pub const A1: RegAddr = 11; // Function argument
pub const A2: RegAddr = 12; // Function argument
pub const A3: RegAddr = 13; // Function argument
pub const A4: RegAddr = 14; // Function argument
pub const A5: RegAddr = 15; // Function argument
pub const A6: RegAddr = 16; // Function argument
pub const A7: RegAddr = 17; // Function argument
pub const S2: RegAddr = 18; // Saved register
pub const S3: RegAddr = 19; // Saved register
pub const S4: RegAddr = 20; // Saved register
pub const S5: RegAddr = 21; // Saved register
pub const S6: RegAddr = 22; // Saved register
pub const S7: RegAddr = 23; // Saved register
pub const S8: RegAddr = 24; // Saved register
pub const S9: RegAddr = 25; // Saved register
pub const S10: RegAddr = 26; // Saved register
pub const S11: RegAddr = 27; // Saved register
pub const T3: RegAddr = 28; // Temporary register
pub const T4: RegAddr = 29; // Temporary register
pub const T5: RegAddr = 30; // Temporary register
pub const T6: RegAddr = 31; // Temporary register

/// Spatial Register Bank - maps RISC-V registers to spatial cells
pub struct SpatialRegisterBank {
    /// Map from register address to spatial grid coordinates
    reg_coords: HashMap<RegAddr, (usize, usize)>,
    /// Base coordinates for register bank in spatial grid
    base_x: usize,
    base_y: usize,
}

impl SpatialRegisterBank {
    /// Create a new spatial register bank at grid position (base_x, base_y)
    /// Layout: 4 rows of 8 registers each (32 total registers)
    /// Row 0: x0-x7, Row 1: x8-x15, Row 2: x16-x23, Row 3: x24-x31
    pub fn new(base_x: usize, base_y: usize) -> Self {
        let mut reg_coords = HashMap::new();
        
        // Map 32 registers to 4x8 grid layout
        for reg in 0..32 {
            let row = reg / 8;
            let col = reg % 8;
            reg_coords.insert(reg as RegAddr, (base_x + col, base_y + row));
        }
        
        Self {
            reg_coords,
            base_x,
            base_y,
        }
    }
    
    /// Get spatial coordinates for a register
    pub fn get_coord(&self, reg: RegAddr) -> Option<(usize, usize)> {
        self.reg_coords.get(&reg).copied()
    }
    
    /// Generate spatial cells for the register bank
    /// Returns a list of cells to place on the grid
    pub fn materialize(&self) -> Vec<(usize, usize, CellState)> {
        let mut cells = Vec::new();
        
        // Create data cells for each register (initial value = 0)
        for reg in 0..32 {
            if let Some((x, y)) = self.get_coord(reg) {
                // x0 register is special: always 0 (WALL protection)
                if reg == X0 {
                    cells.push((x, y, CellState::wall()));
                } else {
                    cells.push((x, y, CellState::data(0)));
                }
            }
        }
        
        // Add WALL cells around register bank for isolation
        let width = 8;
        let height = 4;
        
        // Top wall
        for x in self.base_x..self.base_x + width + 2 {
            cells.push((x, self.base_y - 1, CellState::wall()));
        }
        // Bottom wall
        for x in self.base_x..self.base_x + width + 2 {
            cells.push((x, self.base_y + height, CellState::wall()));
        }
        // Left wall
        for y in self.base_y..self.base_y + height {
            cells.push((self.base_x - 1, y, CellState::wall()));
        }
        // Right wall
        for y in self.base_y..self.base_y + height {
            cells.push((self.base_x + width, y, CellState::wall()));
        }
        
        cells
    }
    
    /// Get bounding box of register bank (for collision detection)
    pub fn bounding_box(&self) -> ((usize, usize), (usize, usize)) {
        let min_x = self.base_x - 1;
        let min_y = self.base_y - 1;
        let max_x = self.base_x + 8; // 8 registers + 1 wall
        let max_y = self.base_y + 4; // 4 rows + 1 wall
        ((min_x, min_y), (max_x, max_y))
    }
}

/// Spatial Program Counter
pub struct SpatialPc {
    pub coord: (usize, usize),
}

impl SpatialPc {
    pub fn new(x: usize, y: usize) -> Self {
        Self { coord: (x, y) }
    }
    
    pub fn materialize(&self) -> (usize, usize, CellState) {
        (self.coord.0, self.coord.1, CellState::data(0))
    }
}

/// Spatial RISC-V Core - combines register bank, PC, ALU, control flow, and memory
pub struct SpatialRiscvCore {
    pub register_bank: SpatialRegisterBank,
    pub pc: SpatialPc,
    pub alu_base: (usize, usize),
    pub memory: Option<SpatialMemory>,
}

impl SpatialRiscvCore {
    /// Create a new spatial RISC-V core at grid position (base_x, base_y)
    /// Layout:
    ///   Register bank: (base_x, base_y) - 8x4 grid
    ///   PC: (base_x, base_y + 5)
    ///   ALU: (base_x, base_y + 6)
    pub fn new(base_x: usize, base_y: usize) -> Self {
        Self {
            register_bank: SpatialRegisterBank::new(base_x, base_y),
            pc: SpatialPc::new(base_x, base_y + 5),
            alu_base: (base_x, base_y + 6),
            memory: None,
        }
    }
    
    /// Materialize entire RISC-V core as spatial cells
    pub fn materialize(&self) -> Vec<(usize, usize, CellState)> {
        let mut cells = Vec::new();
        
        // Register bank
        cells.extend(self.register_bank.materialize());
        
        // PC
        cells.push(self.pc.materialize());
        
        // ALU placeholder (will be extended in Phase 8.1.3)
        // For now, just a NO-OP cell as marker
        cells.push((self.alu_base.0, self.alu_base.1, CellState::data(0)));
        
        cells
    }
    
    /// Generate spatial ADD instruction: rd = rs1 + rs2
    /// Maps to spatial ADD_RR cell
    pub fn emit_add(&self, rd: RegAddr, rs1: RegAddr, rs2: RegAddr) -> Option<(usize, usize, CellState)> {
        let rd_coord = self.register_bank.get_coord(rd)?;
        let rs1_coord = self.register_bank.get_coord(rs1)?;
        let rs2_coord = self.register_bank.get_coord(rs2)?;
        
        // Calculate relative offsets from rd to rs1 and rs2
        let rel_x1 = rs1_coord.0 as i32 - rd_coord.0 as i32;
        let rel_y1 = rs1_coord.1 as i32 - rd_coord.1 as i32;
        let rel_x2 = rs2_coord.0 as i32 - rd_coord.0 as i32;
        let rel_y2 = rs2_coord.1 as i32 - rd_coord.1 as i32;
        
        // Create ADD_RR cell at rd coordinate
        Some((
            rd_coord.0,
            rd_coord.1,
            CellState::new(TYPE_ADD_RR, rel_x1, rel_y1),
        ))
    }
    
    /// Generate spatial LDI instruction: rd = immediate
    /// Maps to spatial LDI cell
    pub fn emit_ldi(&self, rd: RegAddr, imm: u32) -> Option<(usize, usize, CellState)> {
        let rd_coord = self.register_bank.get_coord(rd)?;
        
        // Create LDI cell at rd coordinate with immediate in data_buffer
        let mut cell = CellState::new(TYPE_LDI, 0, 0);
        cell.data_buffer = imm;
        
        Some((rd_coord.0, rd_coord.1, cell))
    }
    
    /// Generate spatial SUB instruction: rd = rs1 - rs2
    /// Maps to spatial SUB_RR cell
    pub fn emit_sub(
        &self,
        rd: RegAddr,
        rs1: RegAddr,
        rs2: RegAddr,
    ) -> Option<(usize, usize, CellState)> {
        let rd_coord = self.register_bank.get_coord(rd)?;
        let rs1_coord = self.register_bank.get_coord(rs1)?;
        let rs2_coord = self.register_bank.get_coord(rs2)?;
        
        // Calculate relative offsets from rd to rs1 and rs2
        let rel_x1 = rs1_coord.0 as i32 - rd_coord.0 as i32;
        let rel_y1 = rs1_coord.1 as i32 - rd_coord.1 as i32;
        
        // Create SUB_RR cell at rd coordinate
        Some((
            rd_coord.0,
            rd_coord.1,
            CellState::new(TYPE_SUB_RR, rel_x1, rel_y1),
        ))
    }

    /// Generate spatial JMP instruction: jump to target
    /// Maps to spatial JMP cell
    pub fn emit_jmp(&self, target: usize) -> Option<(usize, usize, CellState)> {
        // Place JMP at PC coordinate
        let pc_coord = self.pc.coord;
        
        // Calculate relative offset to target
        let rel_x = target as i32 - pc_coord.0 as i32;
        let rel_y = 0; // Assume targets are in same row for now
        
        // Create JMP cell
        Some((
            pc_coord.0,
            pc_coord.1,
            CellState::new(TYPE_JMP, rel_x, rel_y),
        ))
    }

    /// Generate spatial JNZ instruction: if rd != 0, jump to target
    /// Maps to chained JZ + NOT pattern (not yet implemented in GeoASM)
    /// For now, placeholder for future implementation
    pub fn emit_jnz(
        &self,
        _rd: RegAddr,
        _target: (usize, usize),
    ) -> Option<(usize, usize, CellState)> {
        // TODO: Implement JNZ once GeoASM supports NOT operation
        // For now, return None
        None
    }

    /// Generate spatial JZ instruction: if rd == 0, jump to target
    /// Maps to spatial JZ cell
    pub fn emit_jz(&self, rd: RegAddr, target: (usize, usize)) -> Option<(usize, usize, CellState)> {
        let rd_coord = self.register_bank.get_coord(rd)?;
        
        // Calculate relative offset to target
        let rel_x = target.0 as i32 - rd_coord.0 as i32;
        let rel_y = target.1 as i32 - rd_coord.1 as i32;

        // Create JZ cell
        Some((
            rd_coord.0,
            rd_coord.1,
            CellState::new(TYPE_JZ, rel_x, rel_y),
        ))
    }

    /// Generate spatial LW instruction: rd = memory[base + offset]
    /// Returns cells for load operation through spatial memory system
    pub fn emit_lw(
        &self,
        rd: RegAddr,
        rs1: RegAddr,
        imm: i32,
        rs1_coord: (usize, usize),
        rd_coord: (usize, usize),
    ) -> Result<Vec<(usize, usize, CellState)>, String> {
        let memory = self
            .memory
            .as_ref()
            .ok_or("Memory system not initialized")?;

        memory
            .emit_lw(rd as u32, rs1 as u32, imm, rs1_coord, rd_coord)
            .map_err(|e| e.to_string())
    }

    /// Generate spatial SW instruction: memory[base + offset] = rs2
    /// Returns cells for store operation through spatial memory system
    pub fn emit_sw(
        &self,
        rs2: RegAddr,
        rs1: RegAddr,
        imm: i32,
        rs2_coord: (usize, usize),
        rs1_coord: (usize, usize),
    ) -> Result<Vec<(usize, usize, CellState)>, String> {
        let memory = self
            .memory
            .as_ref()
            .ok_or("Memory system not initialized")?;

        memory
            .emit_sw(rs2 as u32, rs1 as u32, imm, rs2_coord, rs1_coord)
            .map_err(|e| e.to_string())
    }

    /// Attach memory system to the core
    pub fn with_memory(mut self, memory: SpatialMemory) -> Self {
        self.memory = Some(memory);
        self
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_register_bank_layout() {
        let bank = SpatialRegisterBank::new(10, 20);
        
        // Check x0 is at (10, 20)
        assert_eq!(bank.get_coord(X0), Some((10, 20)));
        
        // Check x7 is at (17, 20)
        assert_eq!(bank.get_coord(7), Some((17, 20)));
        
        // Check x8 is at (10, 21)
        assert_eq!(bank.get_coord(8), Some((10, 21)));
        
        // Check x31 is at (17, 23)
        assert_eq!(bank.get_coord(31), Some((17, 23)));
    }
    
    #[test]
    fn test_register_bank_materialization() {
        let bank = SpatialRegisterBank::new(10, 20);
        let cells = bank.materialize();
        
        // Should have 32 register cells + walls
        // Wall count: 10 (top) + 10 (bottom) + 4 (left) + 4 (right) = 28
        // Total: 32 + 28 = 60 cells
        assert!(cells.len() >= 32);
        
        // Check that x0 is a WALL
        let x0_cell = cells.iter().find(|(x, y, _)| *x == 10 && *y == 20);
        assert!(x0_cell.is_some());
        if let Some((_, _, cell)) = x0_cell {
            assert_eq!(cell.opcode(), TYPE_WALL);
        }
    }
    
    #[test]
    fn test_emit_add() {
        let core = SpatialRiscvCore::new(10, 20);

        // a0 = a1 + a2
        let add_cell = core.emit_add(A0, A1, A2);
        assert!(add_cell.is_some());

        if let Some((x, y, cell)) = add_cell {
            assert_eq!(x, 10 + (A0 % 8) as usize);
            assert_eq!(y, 20 + (A0 / 8) as usize);
            assert_eq!(cell.opcode(), TYPE_ADD_RR);
        }
    }
    
    #[test]
    fn test_emit_ldi() {
        let core = SpatialRiscvCore::new(10, 20);
        
        // t0 = 42
        let ldi_cell = core.emit_ldi(T0, 42);
        assert!(ldi_cell.is_some());
        
        if let Some((_, _, cell)) = ldi_cell {
            assert_eq!(cell.opcode(), TYPE_LDI);
            assert_eq!(cell.data_buffer, 42);
        }
    }
    
    #[test]
    fn test_emit_jz() {
        let core = SpatialRiscvCore::new(10, 20);
        
        // if t0 == 0, jump to (15, 30)
        let jz_cell = core.emit_jz(T0, (15, 30));
        assert!(jz_cell.is_some());
        
        if let Some((_, _, cell)) = jz_cell {
            assert_eq!(cell.opcode(), TYPE_JZ);
        }
    }
}