//! Spatial Control Unit - Phase 8.1.4
//!
//! Handles control flow: conditional branches, jumps, and PC updates.

use crate::geoasm_materializer::CellState;
use crate::spatial::path_cache::PathCache;
use crate::spatial::riscv_core::{RegAddr, SpatialRiscvCore};
use thiserror::Error;

/// Control flow operation types
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ControlOp {
    BEQ(RegAddr, RegAddr, i32), // rd, rs1, rs2 -> branch if rs1 == rs2
    BNE(RegAddr, RegAddr, i32), // branch if rs1 != rs2
    BLT(RegAddr, RegAddr, i32), // branch if rs1 < rs2
    BGE(RegAddr, RegAddr, i32), // branch if rs1 >= rs2
    JAL(RegAddr, u32),          // jump and link: rd, imm
    JALR(RegAddr, RegAddr),     // jump and link register: rd, rs1
    ERET,                       // exception return (for now, simple return)
}

/// Control unit errors
#[derive(Error, Debug)]
pub enum ControlError {
    #[error("Invalid PC for branch: PC {0} out of bounds")]
    InvalidPC(u32),
    
    #[error("Branch target {0} unreachable from PC {1}")]
    TargetUnreachable(u32, u32),
    
    #[error("Invalid offset {0}: out of range [-2048, 2047]")]
    InvalidOffset(i32),
    
    #[error("Zero flag not set for conditional branch")]
    ZeroFlagNotSet,
    
    #[error("Link register {0} unreachable")]
    LinkRegisterUnreachable(RegAddr),
}

/// Spatial Control Unit
pub struct SpatialControlUnit {
    path_cache: PathCache,
    zero_flag_cell: Option<(usize, usize)>,
    program_counter: u32,
    base_addr: usize, // Spatial coordinates base (x, y)
}

impl SpatialControlUnit {
    pub fn new(path_cache: PathCache, base_addr: usize) -> Self {
        Self {
            path_cache,
            zero_flag_cell: None,
            program_counter: 0,
            base_addr,
        }
    }
    
    /// Get current program counter
    pub fn pc(&self) -> u32 {
        self.program_counter
    }
    
    /// Set program counter
    pub fn set_pc(&mut self, pc: u32) {
        self.program_counter = pc;
    }
    
    /// Calculate spatial coordinates from PC
    /// Simple mapping: PC -> (base_x + pc, base_y)
    fn pc_to_spatial(&self, pc: u32) -> (usize, usize) {
        (self.base_addr + pc as usize, self.base_addr)
    }
    
    /// Validate branch target is reachable
    fn validate_branch(&self, current_pc: u32, target_pc: u32) -> Result<(), ControlError> {
        let current_pos = self.pc_to_spatial(current_pc);
        let target_pos = self.pc_to_spatial(target_pc);
        
        // Check path is clear
        if !self.path_cache.path_clear(current_pos.0, current_pos.1, target_pos.0, target_pos.1) {
            return Err(ControlError::TargetUnreachable(target_pc, current_pc));
        }
        
        Ok(())
    }
    
    /// Execute BEQ (branch if equal)
    pub fn beq(
        &mut self,
        core: &SpatialRiscvCore,
        rs1: RegAddr,
        rs2: RegAddr,
        offset: i32,
    ) -> Result<Option<u32>, ControlError> {
        // Check zero flag is set (from previous comparison)
        if self.zero_flag_cell.is_none() {
            return Err(ControlError::ZeroFlagNotSet);
        }
        
        // Validate offset range [-2048, 2047]
        if offset < -2048 || offset > 2047 {
            return Err(ControlError::InvalidOffset(offset));
        }
        
        // Calculate target PC
        let current_pc = self.program_counter;
        let target_pc = current_pc.wrapping_add(offset as u32);
        
        // Validate target is reachable
        self.validate_branch(current_pc, target_pc)?;
        
        // For now, we'll branch if zero flag is set
        // In a real implementation, we'd check the zero flag value
        let should_branch = true; // Placeholder
        
        if should_branch {
            self.program_counter = target_pc;
            Ok(Some(target_pc))
        } else {
            // Fall through to next instruction
            self.program_counter = current_pc.wrapping_add(4);
            Ok(None)
        }
    }
    
    /// Execute BNE (branch if not equal)
    pub fn bne(
        &mut self,
        core: &SpatialRiscvCore,
        rs1: RegAddr,
        rs2: RegAddr,
        offset: i32,
    ) -> Result<Option<u32>, ControlError> {
        // Similar to BEQ but branch if NOT equal
        if self.zero_flag_cell.is_none() {
            return Err(ControlError::ZeroFlagNotSet);
        }
        
        if offset < -2048 || offset > 2047 {
            return Err(ControlError::InvalidOffset(offset));
        }
        
        let current_pc = self.program_counter;
        let target_pc = current_pc.wrapping_add(offset as u32);
        
        self.validate_branch(current_pc, target_pc)?;
        
        // Branch if zero flag is NOT set
        let should_branch = false; // Placeholder (invert zero flag)
        
        if should_branch {
            self.program_counter = target_pc;
            Ok(Some(target_pc))
        } else {
            self.program_counter = current_pc.wrapping_add(4);
            Ok(None)
        }
    }
    
    /// Execute BLT (branch if less than)
    pub fn blt(
        &mut self,
        core: &SpatialRiscvCore,
        rs1: RegAddr,
        rs2: RegAddr,
        offset: i32,
    ) -> Result<Option<u32>, ControlError> {
        if offset < -2048 || offset > 2047 {
            return Err(ControlError::InvalidOffset(offset));
        }
        
        let current_pc = self.program_counter;
        let target_pc = current_pc.wrapping_add(offset as u32);
        
        self.validate_branch(current_pc, target_pc)?;
        
        // For now, don't branch (placeholder)
        self.program_counter = current_pc.wrapping_add(4);
        Ok(None)
    }
    
    /// Execute BGE (branch if greater or equal)
    pub fn bge(
        &mut self,
        core: &SpatialRiscvCore,
        rs1: RegAddr,
        rs2: RegAddr,
        offset: i32,
    ) -> Result<Option<u32>, ControlError> {
        if offset < -2048 || offset > 2047 {
            return Err(ControlError::InvalidOffset(offset));
        }
        
        let current_pc = self.program_counter;
        let target_pc = current_pc.wrapping_add(offset as u32);
        
        self.validate_branch(current_pc, target_pc)?;
        
        // For now, don't branch (placeholder)
        self.program_counter = current_pc.wrapping_add(4);
        Ok(None)
    }
    
    /// Execute JAL (jump and link)
    pub fn jal(
        &mut self,
        core: &SpatialRiscvCore,
        rd: RegAddr,
        imm: u32,
    ) -> Result<(), ControlError> {
        // Save return address (PC + 4) to rd
        let return_addr = self.program_counter.wrapping_add(4);
        
        // Validate link register is reachable
        let rd_coord = core.register_bank.get_coord(rd)
            .ok_or(ControlError::LinkRegisterUnreachable(rd))?;
        
        // For now, we don't actually write to the spatial grid
        // In a real implementation, we'd emit a writeback cell
        
        // Jump to target
        self.program_counter = imm;
        
        Ok(())
    }
    
    /// Execute JALR (jump and link register)
    pub fn jalr(
        &mut self,
        core: &SpatialRiscvCore,
        rd: RegAddr,
        rs1: RegAddr,
    ) -> Result<(), ControlError> {
        // Save return address (PC + 4) to rd
        let return_addr = self.program_counter.wrapping_add(4);
        
        // Validate registers are reachable
        let rd_coord = core.register_bank.get_coord(rd)
            .ok_or(ControlError::LinkRegisterUnreachable(rd))?;
        
        // For JALR, we'd read rs1 value and jump there
        // For now, we'll just increment PC
        self.program_counter = self.program_counter.wrapping_add(4);
        
        Ok(())
    }
    
    /// Execute ERET (exception return)
    pub fn eret(&mut self) -> Result<(), ControlError> {
        // For now, just reset PC to 0
        self.program_counter = 0;
        Ok(())
    }
    
    /// Execute any control flow operation
    pub fn execute(
        &mut self,
        core: &SpatialRiscvCore,
        op: ControlOp,
    ) -> Result<Option<u32>, ControlError> {
        match op {
            ControlOp::BEQ(rs1, rs2, offset) => self.beq(core, rs1, rs2, offset),
            ControlOp::BNE(rs1, rs2, offset) => self.bne(core, rs1, rs2, offset),
            ControlOp::BLT(rs1, rs2, offset) => self.blt(core, rs1, rs2, offset),
            ControlOp::BGE(rs1, rs2, offset) => self.bge(core, rs1, rs2, offset),
            ControlOp::JAL(rd, imm) => {
                self.jal(core, rd, imm)?;
                Ok(None)
            }
            ControlOp::JALR(rd, rs1) => {
                self.jalr(core, rd, rs1)?;
                Ok(None)
            }
            ControlOp::ERET => {
                self.eret()?;
                Ok(None)
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::geoasm_materializer::TYPE_NOP;
    use crate::spatial::riscv_core::SpatialRegisterBank;
    
    fn setup_test() -> (SpatialControlUnit, SpatialRiscvCore) {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64];
        let path_cache = PathCache::from_cells(&cells);
        
        let core = SpatialRiscvCore::new(10, 10);
        let control = SpatialControlUnit::new(path_cache, 20);
        
        // Note: SpatialRegisterBank doesn't have a set() method - it's materialized
        // to the grid. For testing purposes, we just verify layout works.
        
        (control, core)
    }
    
    #[test]
    fn test_pc_to_spatial_mapping() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64];
        let path_cache = PathCache::from_cells(&cells);
        let control = SpatialControlUnit::new(path_cache, 20);
        
        assert_eq!(control.pc_to_spatial(0), (20, 20));
        assert_eq!(control.pc_to_spatial(10), (30, 20));
        assert_eq!(control.pc_to_spatial(100), (120, 20));
    }
    
    #[test]
    fn test_beq_valid_offset() {
        let (mut control, core) = setup_test();
        
        // Set up zero flag
        control.zero_flag_cell = Some((100, 100));
        
        // BEQ x1, x2, 8 (should branch if equal)
        // With zero flag set, we'll branch
        let result = control.beq(&core, 1, 2, 8);
        assert!(result.is_ok());
        
        let target_pc = result.unwrap();
        // Should branch to PC + 8
        assert_eq!(target_pc, Some(8));
        assert_eq!(control.pc(), 8);
    }
    
    #[test]
    fn test_beq_invalid_offset() {
        let (mut control, core) = setup_test();
        
        // Set up zero flag first
        control.zero_flag_cell = Some((100, 100));
        
        // Offset out of range
        let result = control.beq(&core, 1, 2, 3000);
        assert!(matches!(result, Err(ControlError::InvalidOffset(_))));
    }
    
    #[test]
    fn test_bne_valid_offset() {
        let (mut control, core) = setup_test();
        
        control.zero_flag_cell = Some((100, 100));
        
        // BNE x1, x2, 12
        let result = control.bne(&core, 1, 2, 12);
        assert!(result.is_ok());
    }
    
    #[test]
    fn test_jal_updates_pc() {
        let (mut control, core) = setup_test();
        
        // JAL x1, 100
        let result = control.jal(&core, 1, 100);
        assert!(result.is_ok());
        assert_eq!(control.pc(), 100);
    }
    
    #[test]
    fn test_jalr_updates_pc() {
        let (mut control, core) = setup_test();
        
        // JALR x1, x2
        let result = control.jalr(&core, 1, 2);
        assert!(result.is_ok());
        // Should increment PC
        assert_eq!(control.pc(), 4);
    }
    
    #[test]
    fn test_eret_resets_pc() {
        let (mut control, core) = setup_test();
        
        control.set_pc(50);
        let result = control.eret();
        assert!(result.is_ok());
        assert_eq!(control.pc(), 0);
    }
    
    #[test]
    fn test_branch_reachability_validation() {
        let (control, _) = setup_test();
        
        // Test clear path
        let result = control.validate_branch(0, 10);
        assert!(result.is_ok());
        
        // Test PC 0 to PC 100
        let result = control.validate_branch(0, 100);
        assert!(result.is_ok());
    }
    
    #[test]
    fn test_control_op_dispatch() {
        let (mut control, core) = setup_test();
        
        control.zero_flag_cell = Some((100, 100));
        
        // Test BEQ dispatch
        let result = control.execute(&core, ControlOp::BEQ(1, 2, 8));
        assert!(result.is_ok());
        
        // Reset PC
        control.set_pc(0);
        
        // Test JAL dispatch
        let result = control.execute(&core, ControlOp::JAL(1, 50));
        assert!(result.is_ok());
        assert_eq!(control.pc(), 50);
        
        // Reset PC
        control.set_pc(0);
        
        // Test ERET dispatch
        let result = control.execute(&core, ControlOp::ERET);
        assert!(result.is_ok());
        assert_eq!(control.pc(), 0);
    }
}