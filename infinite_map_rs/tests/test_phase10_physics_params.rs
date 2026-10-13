//! Phase 10.4: Unit Tests for Physics Parameters
//!
//! Tests that don't require GPU execution.

use infinite_map_rs::refinery::physics_gpu::{CellState, PhysicsParams};

#[test]
fn test_physics_params_default() {
    let params = PhysicsParams::default();
    assert_eq!(params.dt, 0.016);
    assert_eq!(params.mu, 0.001);
    assert_eq!(params.gravity, 9.81);
    assert_eq!(params.density, 1000.0);
    assert_eq!(params.grid_dim_x, 128);
    assert_eq!(params.grid_dim_y, 64);
    assert_eq!(params.grid_dim_z, 1);
    assert_eq!(params.num_cells, 8192);
    assert_eq!(params.max_fluid_level, 100.0);
}

#[test]
fn test_physics_params_custom_values() {
    let params = PhysicsParams {
        dt: 0.033,
        mu: 0.002,
        gravity: 9.80665,
        density: 970.0,
        grid_dim_x: 256,
        grid_dim_y: 128,
        grid_dim_z: 2,
        num_cells: 65536,
        max_fluid_level: 200.0,
    };

    assert_eq!(params.dt, 0.033);
    assert_eq!(params.mu, 0.002);
    assert_eq!(params.gravity, 9.80665);
    assert_eq!(params.density, 970.0);
    assert_eq!(params.grid_dim_x, 256);
    assert_eq!(params.grid_dim_y, 128);
    assert_eq!(params.grid_dim_z, 2);
    assert_eq!(params.max_fluid_level, 200.0);
}

#[test]
fn test_cell_state_default() {
    let cell = CellState::default();
    assert_eq!(cell.opcode_or_type, 0.0);
}

#[test]
fn test_cell_state_types() {
    // Cell type constants (matching WGSL)
    let empty_cell = CellState {
        opcode_or_type: 0.0,
        fluid_level: 0.0,
    };
    let tank_cell = CellState {
        opcode_or_type: 1.0,
        fluid_level: 0.0,
    };
    let pipe_cell = CellState {
        opcode_or_type: 2.0,
        fluid_level: 0.0,
    };
    let wall_cell = CellState {
        opcode_or_type: 3.0,
        fluid_level: 0.0,
    };

    assert_eq!(empty_cell.opcode_or_type, 0.0);
    assert_eq!(tank_cell.opcode_or_type, 1.0);
    assert_eq!(pipe_cell.opcode_or_type, 2.0);
    assert_eq!(wall_cell.opcode_or_type, 3.0);
}

#[test]
fn test_physics_params_layout_compatibility() {
    // Verify that PhysicsParams has the correct memory layout for WGSL uniform
    // Each field is 4 bytes, total of 9 fields
    use std::mem;

    assert_eq!(mem::size_of::<PhysicsParams>(), 36);
    assert_eq!(mem::align_of::<PhysicsParams>(), 4);
}

#[test]
fn test_physics_grid_dimensions() {
    // Test grid dimension calculations
    let grid_w = 128;
    let grid_h = 64;
    let expected_cells = grid_w * grid_h;

    let params = PhysicsParams {
        grid_dim_x: grid_w,
        grid_dim_y: grid_h,
        grid_dim_z: 1,
        num_cells: expected_cells as u32,
        ..Default::default()
    };

    assert_eq!(params.grid_dim_x, grid_w);
    assert_eq!(params.grid_dim_y, grid_h);
    assert_eq!(params.num_cells, expected_cells as u32);
}