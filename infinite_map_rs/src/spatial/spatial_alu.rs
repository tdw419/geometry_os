//! Spatial ALU - Phase 8.1.3
//!
//! Validates spatial routing for arithmetic operations and propagates zero flag.

use crate::geoasm_materializer::{CellState, TYPE_NOP};
use crate::spatial::path_cache::PathCache;
use crate::spatial::riscv_core::SpatialRiscvCore;
use crate::spatial::riscv_core::RegAddr;

/// ALU operation result with metadata
#[derive(Debug, Clone)]
pub struct AluResult {
    pub cell: (usize, usize, CellState),
    pub zero_flag: bool,
    pub overflow_flag: bool,
}

/// ALU validation errors
#[derive(Debug, thiserror::Error)]
pub enum AluValidationError {
    #[error("Operand {0} at ({1},{2}) unreachable from destination ({3},{4})")]
    OperandUnreachable(RegAddr, usize, usize, usize, usize),
    
    #[error("Destination {0} at ({1},{2}) cannot receive from ALU")]
    DestinationBlocked(RegAddr, usize, usize),
    
    #[error("Invalid zero flag path for branch at ({0},{1})")]
    ZeroFlagPathInvalid(usize, usize),
}

/// Spatial ALU
pub struct SpatialAlu {
    /// Path cache for reachability checks
    path_cache: PathCache,
    /// Current zero flag cell position (if any)
    zero_flag_cell: Option<(usize, usize)>,
}

impl SpatialAlu {
    /// Create a new spatial ALU
    pub fn new(path_cache: PathCache) -> Self {
        Self {
            path_cache,
            zero_flag_cell: None,
        }
    }
    
    /// Validate and emit ADD operation
    /// Returns cell, zero flag, and validation result
    pub fn emit_add(
        &mut self,
        core: &SpatialRiscvCore,
        rd: RegAddr,
        rs1: RegAddr,
        rs2: RegAddr,
    ) -> Result<AluResult, AluValidationError> {
        // Get spatial coordinates
        let rd_coord = core.register_bank.get_coord(rd)
            .ok_or_else(|| AluValidationError::OperandUnreachable(rd, 0, 0, 0, 0))?;
        let rs1_coord = core.register_bank.get_coord(rs1)
            .ok_or_else(|| AluValidationError::OperandUnreachable(rs1, 0, 0, 0, 0))?;
        let rs2_coord = core.register_bank.get_coord(rs2)
            .ok_or_else(|| AluValidationError::OperandUnreachable(rs2, 0, 0, 0, 0))?;
        
        // Validate operand reachability (path must be clear)
        if !self.path_cache.path_clear(rs1_coord.0, rs1_coord.1, rd_coord.0, rd_coord.1) {
            return Err(AluValidationError::OperandUnreachable(
                rs1, rs1_coord.0, rs1_coord.1, rd_coord.0, rd_coord.1,
            ));
        }
        
        if !self.path_cache.path_clear(rs2_coord.0, rs2_coord.1, rd_coord.0, rd_coord.1) {
            return Err(AluValidationError::OperandUnreachable(
                rs2, rs2_coord.0, rs2_coord.1, rd_coord.0, rd_coord.1,
            ));
        }
        
        // Emit ADD cell
        let cell = core.emit_add(rd, rs1, rs2).unwrap();
        
        // Zero flag: result is zero if both operands are equal and opposite
        // For now, we don't know the actual values, so zero_flag = false
        // In a real implementation, we'd track values or add a ZF cell
        let zero_flag = false;
        
        // Create zero flag cell at rd+1 offset if this is a comparison
        self.update_zero_flag(rd_coord.0 + 1, rd_coord.1, zero_flag);
        
        Ok(AluResult {
            cell,
            zero_flag,
            overflow_flag: false,
        })
    }
    
    /// Validate and emit SUB operation
    /// Returns cell, zero flag, and validation result
    pub fn emit_sub(
        &mut self,
        core: &SpatialRiscvCore,
        rd: RegAddr,
        rs1: RegAddr,
        rs2: RegAddr,
    ) -> Result<AluResult, AluValidationError> {
        // Get spatial coordinates
        let rd_coord = core.register_bank.get_coord(rd)
            .ok_or_else(|| AluValidationError::OperandUnreachable(rd, 0, 0, 0, 0))?;
        let rs1_coord = core.register_bank.get_coord(rs1)
            .ok_or_else(|| AluValidationError::OperandUnreachable(rs1, 0, 0, 0, 0))?;
        let rs2_coord = core.register_bank.get_coord(rs2)
            .ok_or_else(|| AluValidationError::OperandUnreachable(rs2, 0, 0, 0, 0))?;
        
        // Validate operand reachability
        if !self.path_cache.path_clear(rs1_coord.0, rs1_coord.1, rd_coord.0, rd_coord.1) {
            return Err(AluValidationError::OperandUnreachable(
                rs1, rs1_coord.0, rs1_coord.1, rd_coord.0, rd_coord.1,
            ));
        }
        
        if !self.path_cache.path_clear(rs2_coord.0, rs2_coord.1, rd_coord.0, rd_coord.1) {
            return Err(AluValidationError::OperandUnreachable(
                rs2, rs2_coord.0, rs2_coord.1, rd_coord.0, rd_coord.1,
            ));
        }
        
        // Emit SUB cell
        let cell = core.emit_sub(rd, rs1, rs2).unwrap();
        
        // For SUB, zero flag is true if operands are equal
        // We'll create a zero flag cell for branch instructions to use
        let zero_flag_cell_pos = (rd_coord.0 + 1, rd_coord.1);
        self.update_zero_flag(zero_flag_cell_pos.0, zero_flag_cell_pos.1, false);
        
        Ok(AluResult {
            cell,
            zero_flag: false, // Will be computed at runtime
            overflow_flag: false,
        })
    }
    
    /// Get zero flag cell position
    pub fn get_zero_flag_cell(&self) -> Option<(usize, usize)> {
        self.zero_flag_cell
    }
    
    /// Create zero flag cell at position
    pub fn create_zero_flag_cell(&mut self, x: usize, y: usize, is_zero: bool) -> CellState {
        self.zero_flag_cell = Some((x, y));
        
        // Use data cell to store zero flag (0 = not zero, 1 = zero)
        CellState::data(if is_zero { 1 } else { 0 })
    }
    
    /// Update zero flag cell
    fn update_zero_flag(&mut self, x: usize, y: usize, is_zero: bool) {
        self.zero_flag_cell = Some((x, y));
        // In a real implementation, this would update the grid
    }
    
    /// Validate branch path (zero flag to branch target)
    pub fn validate_branch_path(
        &self,
        branch_pos: (usize, usize),
        target_pos: (usize, usize),
    ) -> Result<(), AluValidationError> {
        // Check if there's a clear path from branch to target
        if !self.path_cache.path_clear(branch_pos.0, branch_pos.1, target_pos.0, target_pos.1) {
            return Err(AluValidationError::ZeroFlagPathInvalid(branch_pos.0, branch_pos.1));
        }
        Ok(())
    }
    
    /// Validate that a writeback can reach its destination
    pub fn validate_writeback(
        &self,
        source: (usize, usize),
        dest: (usize, usize),
    ) -> Result<(), AluValidationError> {
        if !self.path_cache.path_clear(source.0, source.1, dest.0, dest.1) {
            return Err(AluValidationError::DestinationBlocked(0, dest.0, dest.1));
        }
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::geoasm_materializer::{TYPE_ADD_RR, TYPE_SUB_RR};
    
    #[test]
    fn test_alu_add_validation() {
        // Create a path cache with clear paths
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64]; // GRID_W * GRID_H
        let path_cache = PathCache::from_cells(&cells);
        
        let mut alu = SpatialAlu::new(path_cache);
        let core = SpatialRiscvCore::new(10, 10);
        
        // Test ADD: t0 = t1 + t2
        let result = alu.emit_add(&core, 5, 6, 7);
        assert!(result.is_ok());
        
        let alu_result = result.unwrap();
        assert_eq!(alu_result.cell.0, 15); // rd=5 at (15, 10)
        assert_eq!(alu_result.cell.1, 10);
        assert_eq!(alu_result.cell.2.opcode(), TYPE_ADD_RR);
    }
    
    #[test]
    fn test_alu_sub_validation() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64];
        let path_cache = PathCache::from_cells(&cells);
        
        let mut alu = SpatialAlu::new(path_cache);
        let core = SpatialRiscvCore::new(10, 10);
        
        // Test SUB: t0 = t1 - t2
        let result = alu.emit_sub(&core, 5, 6, 7);
        assert!(result.is_ok());
        
        let alu_result = result.unwrap();
        assert_eq!(alu_result.cell.0, 15); // rd=5 at (15, 10)
        assert_eq!(alu_result.cell.1, 10);
        assert_eq!(alu_result.cell.2.opcode(), TYPE_SUB_RR);
    }
    
    #[test]
    fn test_zero_flag_cell() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64];
        let path_cache = PathCache::from_cells(&cells);
        
        let mut alu = SpatialAlu::new(path_cache);
        
        // Create zero flag cell
        let cell = alu.create_zero_flag_cell(100, 100, true);
        assert_eq!(cell.opcode(), crate::geoasm_materializer::TYPE_NOP);
        assert_eq!(cell.data_buffer, 1); // is_zero = true
        
        let pos = alu.get_zero_flag_cell();
        assert_eq!(pos, Some((100, 100)));
    }
    
    #[test]
    fn test_branch_path_validation() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64];
        let path_cache = PathCache::from_cells(&cells);
        
        let alu = SpatialAlu::new(path_cache);
        
        // Clear path should validate
        let result = alu.validate_branch_path((10, 10), (15, 10));
        assert!(result.is_ok());
    }
    
    #[test]
    fn test_writeback_validation() {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64];
        let path_cache = PathCache::from_cells(&cells);
        
        let alu = SpatialAlu::new(path_cache);
        
        // Clear path should validate
        let result = alu.validate_writeback((10, 10), (15, 10));
        assert!(result.is_ok());
    }
}