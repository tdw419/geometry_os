//! Phase 10.4 - GPU Physics Tests
//!
//! Tests for GPU-based physics engine implementation.

use infinite_map_rs::refinery::physics_gpu::PhysicsParams;

#[test]
fn test_physics_params_defaults() {
    let params = PhysicsParams::default();
    assert_eq!(params.dt, 0.016);
    assert_eq!(params.mu, 0.001);
    assert_eq!(params.gravity, 9.81);
    assert_eq!(params.density, 1000.0);
    assert_eq!(params.grid_dim_x, 128);
    assert_eq!(params.grid_dim_y, 64);
    assert_eq!(params.grid_dim_z, 1);
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