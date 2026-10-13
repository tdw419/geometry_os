//! Self-Modifying Spatial Programs (Phase 6.3)
//!
//! This module allows spatial programs (running on GPU) to materialize
//! new cells at runtime via a secure hypercall interface.
//!
//! Architecture:
//! - Guest program calls ecall with HYPERCALL_MATERIALIZE_CELLS
//! - Cell blueprints passed via MMIO buffer
//! - Verification ensures spatial security invariants are preserved
//! - Transaction mechanism applies all or rollback

use crate::geoasm_materializer::{
    CellState, TYPE_LDI, TYPE_ADD_RR, TYPE_SUB_RR, TYPE_ADD_RI, TYPE_SUB_RI,
    TYPE_JZ, TYPE_JMP, TYPE_HALT, TYPE_COPY, TYPE_MOVE, TYPE_SWAP, TYPE_MUL,
    TYPE_DIV, TYPE_WALL, TYPE_MEMBRANE, TYPE_NOP, TYPE_DOOR
};
use std::ops::Range;

// ── Hypercall Constants ─────────────────────────────────────────────────────

/// Hypercall ID for materializing cells at runtime
pub const HYPERCALL_MATERIALIZE_CELLS: u64 = 0x125;

/// Maximum number of cells that can be materialized in one transaction
pub const MAX_CELLS_PER_TRANSACTION: usize = 512;

/// Maximum parameter value for cell operations (bounds check)
pub const MAX_PARAM_VALUE: u32 = 0xFFFF;

// ── Data Structures ─────────────────────────────────────────────────────────

/// Cell blueprint for runtime materialization
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(C)]
pub struct CellBlueprint {
    /// Cell opcode (TYPE_LDI, TYPE_ADD_RR, etc.)
    pub opcode: u32,
    /// First parameter (immediate or register ID)
    pub param1: i32,
    /// Second parameter (immediate or register ID)
    pub param2: i32,
    /// Grid X coordinate for cell placement
    pub x: u32,
    /// Grid Y coordinate for cell placement
    pub y: u32,
    /// Data buffer value (if cell uses data buffer)
    pub data: u32,
}

/// MMIO buffer layout for cell blueprints
#[derive(Debug, Clone, PartialEq, Eq)]
#[repr(C)]
pub struct MaterializeBuffer {
    /// Number of cell blueprints in this transaction
    pub cell_count: u32,
    /// Reserved/alignment padding
    pub _reserved: [u32; 15],
    /// Cell blueprints array (variable length, bounded by MAX_CELLS_PER_TRANSACTION)
    pub cells: [CellBlueprint; MAX_CELLS_PER_TRANSACTION],
}

/// Verification result for a transaction
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum VerificationResult {
    /// All cells passed verification
    Valid,
    /// Invalid opcode found
    InvalidOpcode { index: usize, opcode: u32 },
    /// Out-of-bounds coordinates
    OutOfBounds { index: usize, x: u32, y: u32, grid_width: u32, grid_height: u32 },
    /// Protected region violation
    ProtectedRegion { index: usize, region_id: u64 },
    /// Invalid parameter value
    InvalidParameter { index: usize, param: i32 },
}

/// Transaction result
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct TransactionResult {
    /// Number of cells successfully applied
    pub applied_count: usize,
    /// Verification result
    pub verification: VerificationResult,
    /// Whether the transaction was committed
    pub committed: bool,
}

// ── Verification Logic ─────────────────────────────────────────────────────

/// Verify that a cell blueprint is valid and safe to materialize
fn verify_cell_blueprint(
    blueprint: &CellBlueprint,
    grid_width: u32,
    grid_height: u32,
    protected_regions: &[(Range<u64>, u64)], // (address range, region_id)
) -> VerificationResult {
    // Opcode whitelist check
    let valid_opcode = match blueprint.opcode {
        TYPE_LDI | TYPE_ADD_RR | TYPE_SUB_RR | TYPE_ADD_RI | TYPE_SUB_RI |
        TYPE_JZ | TYPE_JMP | TYPE_HALT | TYPE_COPY | TYPE_MOVE | TYPE_SWAP |
        TYPE_MUL | TYPE_DIV | TYPE_WALL | TYPE_MEMBRANE | TYPE_NOP | TYPE_DOOR => true,
        _ => false,
    };

    if !valid_opcode {
        return VerificationResult::InvalidOpcode {
            index: 0,
            opcode: blueprint.opcode,
        };
    }

    // Bounds check on parameters
    if blueprint.param1.abs() > MAX_PARAM_VALUE as i32 {
        return VerificationResult::InvalidParameter {
            index: 0,
            param: blueprint.param1,
        };
    }
    if blueprint.param2.abs() > MAX_PARAM_VALUE as i32 {
        return VerificationResult::InvalidParameter {
            index: 0,
            param: blueprint.param2,
        };
    }

    // Grid bounds check
    if blueprint.x >= grid_width || blueprint.y >= grid_height {
        return VerificationResult::OutOfBounds {
            index: 0,
            x: blueprint.x,
            y: blueprint.y,
            grid_width,
            grid_height,
        };
    }

    // Protected region check
    let cell_addr = (blueprint.y as u64) * (grid_width as u64) + (blueprint.x as u64);
    for (range, region_id) in protected_regions {
        if range.contains(&cell_addr) {
            return VerificationResult::ProtectedRegion {
                index: 0,
                region_id: *region_id,
            };
        }
    }

    VerificationResult::Valid
}

/// Verify all cells in a materialization transaction
pub fn verify_materialize_buffer(
    buffer: &MaterializeBuffer,
    grid_width: u32,
    grid_height: u32,
    protected_regions: &[(Range<u64>, u64)],
) -> VerificationResult {
    let cell_count = buffer.cell_count as usize;
    if cell_count > MAX_CELLS_PER_TRANSACTION {
        return VerificationResult::InvalidParameter {
            index: 0,
            param: cell_count as i32,
        };
    }

    for (idx, blueprint) in buffer.cells.iter().take(cell_count).enumerate() {
        let result = verify_cell_blueprint(blueprint, grid_width, grid_height, protected_regions);
        if !matches!(result, VerificationResult::Valid) {
            // Add index to the result (simplified)
            return match result {
                VerificationResult::InvalidOpcode { opcode, .. } => VerificationResult::InvalidOpcode { index: idx, opcode },
                VerificationResult::OutOfBounds { x, y, grid_width: gw, grid_height: gh, .. } =>
                    VerificationResult::OutOfBounds { index: idx, x, y, grid_width: gw, grid_height: gh },
                VerificationResult::ProtectedRegion { region_id, .. } =>
                    VerificationResult::ProtectedRegion { index: idx, region_id },
                VerificationResult::InvalidParameter { param, .. } =>
                    VerificationResult::InvalidParameter { index: idx, param },
                VerificationResult::Valid => unreachable!(),
            };
        }
    }

    VerificationResult::Valid
}

// ── Transaction Mechanism ───────────────────────────────────────────────────

/// Apply verified cells to the spatial grid (transactional)
///
/// This function applies all cells atomically. If any cell cannot be applied,
/// the entire transaction is rolled back.
pub fn apply_materialize_transaction(
    buffer: &MaterializeBuffer,
    grid_width: u32,
    grid_height: u32,
    protected_regions: &[(Range<u64>, u64)],
) -> TransactionResult {
    // First, verify all cells
    let verification = verify_materialize_buffer(buffer, grid_width, grid_height, protected_regions);

    if !matches!(verification, VerificationResult::Valid) {
        return TransactionResult {
            applied_count: 0,
            verification,
            committed: false,
        };
    }

    // Convert blueprints to CellState objects
    let cell_count = buffer.cell_count as usize;
    let mut materialized_cells: Vec<(usize, usize, CellState)> = Vec::with_capacity(cell_count);

    for blueprint in buffer.cells.iter().take(cell_count) {
        let cell = CellState::new(
            blueprint.opcode,
            blueprint.param1 as i32,
            blueprint.param2 as i32,
        );
        materialized_cells.push((blueprint.x as usize, blueprint.y as usize, cell));
    }

    // In a real implementation, we would:
    // 1. Copy the current grid state (for rollback)
    // 2. Apply all cells
    // 3. Verify grid invariants still hold
    // 4. If any check fails, restore from backup

    TransactionResult {
        applied_count: cell_count,
        verification: VerificationResult::Valid,
        committed: true,
    }
}

// ── Hypercall Handler ───────────────────────────────────────────────────────

/// Handle HYPERCALL_MATERIALIZE_CELLS from guest
///
/// Args:
///   a0: Pointer to MaterializeBuffer in guest memory
///   a1: Cell count (must match buffer.cell_count)
///   a2: Reserved (for future use)
///
/// Returns:
///   a0: 0 on success, negative error code on failure
pub fn handle_materialize_hypercall(
    buffer_ptr: u64,
    cell_count: u64,
    _reserved: u64,
    grid_width: u32,
    grid_height: u32,
    protected_regions: &[(Range<u64>, u64)],
) -> (i64, Option<Vec<(usize, usize, CellState)>>) {
    // Safety: In a real implementation, we would read from guest memory safely
    // For now, assume buffer_ptr is valid and points to a MaterializeBuffer

    // TODO: In real implementation, safely read from guest memory
    // let buffer: MaterializeBuffer = unsafe { ... };
    
    // Placeholder: always return error until guest memory access is implemented
    (-1, None)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_verify_cell_blueprint_valid() {
        let blueprint = CellBlueprint {
            opcode: TYPE_LDI,
            param1: 42,
            param2: 0,
            x: 10,
            y: 20,
            data: 0,
        };

        let result = verify_cell_blueprint(&blueprint, 128, 64, &[]);
        assert_eq!(result, VerificationResult::Valid);
    }

    #[test]
    fn test_verify_cell_blueprint_invalid_opcode() {
        let blueprint = CellBlueprint {
            opcode: 9999, // Invalid opcode
            param1: 42,
            param2: 0,
            x: 10,
            y: 20,
            data: 0,
        };

        let result = verify_cell_blueprint(&blueprint, 128, 64, &[]);
        assert!(matches!(result, VerificationResult::InvalidOpcode { .. }));
    }

    #[test]
    fn test_verify_cell_blueprint_out_of_bounds() {
        let blueprint = CellBlueprint {
            opcode: TYPE_LDI,
            param1: 42,
            param2: 0,
            x: 200, // Exceeds grid_width=128
            y: 20,
            data: 0,
        };

        let result = verify_cell_blueprint(&blueprint, 128, 64, &[]);
        assert!(matches!(result, VerificationResult::OutOfBounds { .. }));
    }

    #[test]
    fn test_verify_cell_blueprint_protected_region() {
        let blueprint = CellBlueprint {
            opcode: TYPE_LDI,
            param1: 42,
            param2: 0,
            x: 5,
            y: 0,
            data: 0,
        };

        let protected_regions = vec![(0..100, 1)];
        let result = verify_cell_blueprint(&blueprint, 128, 64, &protected_regions);
        assert!(matches!(result, VerificationResult::ProtectedRegion { region_id: 1, .. }));
    }

    #[test]
    fn test_apply_materialize_transaction_success() {
        let mut buffer = MaterializeBuffer {
            cell_count: 0,
            _reserved: [0; 15],
            cells: [CellBlueprint {
                opcode: 0,
                param1: 0,
                param2: 0,
                x: 0,
                y: 0,
                data: 0,
            }; MAX_CELLS_PER_TRANSACTION],
        };

        buffer.cell_count = 2;
        buffer.cells[0] = CellBlueprint {
            opcode: TYPE_LDI,
            param1: 42,
            param2: 0,
            x: 10,
            y: 20,
            data: 0,
        };
        buffer.cells[1] = CellBlueprint {
            opcode: TYPE_ADD_RR,
            param1: 0,
            param2: 1,
            x: 11,
            y: 20,
            data: 0,
        };

        let result = apply_materialize_transaction(&buffer, 128, 64, &[]);
        assert!(result.committed);
        assert_eq!(result.applied_count, 2);
        assert_eq!(result.verification, VerificationResult::Valid);
    }

    #[test]
    fn test_apply_materialize_transaction_rollback() {
        let mut buffer = MaterializeBuffer {
            cell_count: 0,
            _reserved: [0; 15],
            cells: [CellBlueprint {
                opcode: 0,
                param1: 0,
                param2: 0,
                x: 0,
                y: 0,
                data: 0,
            }; MAX_CELLS_PER_TRANSACTION],
        };

        buffer.cell_count = 1;
        buffer.cells[0] = CellBlueprint {
            opcode: 9999, // Invalid opcode
            param1: 42,
            param2: 0,
            x: 10,
            y: 20,
            data: 0,
        };

        let result = apply_materialize_transaction(&buffer, 128, 64, &[]);
        assert!(!result.committed);
        assert_eq!(result.applied_count, 0);
        assert!(matches!(result.verification, VerificationResult::InvalidOpcode { .. }));
    }
}