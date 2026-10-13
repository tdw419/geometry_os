//! ProcessRegion Bridge Integration Tests
//!
//! Tests that verify the bridge between WindowParticle visual layers
//! and ProcessScheduler execution zones works correctly.

use crate::process_region_bridge::ProcessRegionBridge;
use crate::spatial::process_scheduler::{ProcessRegion, ProcessScheduler, ProcessState};
use crate::window_particle::{WindowParticle, WindowParticleType, ZLayer};
use glam::Vec2;

#[test]
fn test_bridge_creation() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create an execution zone
    let particle_type = WindowParticleType::RiscVVM;
    let title = "Test VM".to_string();
    let position = Vec2::new(100.0, 100.0);
    let entry_point = 0;

    let (particle_id, pid) =
        bridge.create_execution_zone(particle_type, title, position, entry_point);

    // Verify particle was created
    assert!(bridge.get_particle(particle_id).is_some());
    assert_eq!(bridge.get_particle(particle_id).unwrap().title, "Test VM");
    assert_eq!(
        bridge.get_particle(particle_id).unwrap().particle_type,
        WindowParticleType::RiscVVM
    );

    // Verify process was allocated
    assert!(bridge.get_process(pid).is_some());
    assert_eq!(bridge.get_process(pid).unwrap().pid, pid);

    // Verify mapping exists
    assert_eq!(bridge.get_process_id(particle_id), Some(pid));
    assert_eq!(bridge.get_particle_id(pid), Some(particle_id));

    // Verify particle has process region
    assert!(bridge
        .get_particle(particle_id)
        .unwrap()
        .process_region
        .is_some());
}

#[test]
fn test_bridge_move_synchronization() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create an execution zone
    let (particle_id, pid) = bridge.create_execution_zone(
        WindowParticleType::ExecutionZone,
        "Test Zone".to_string(),
        Vec2::new(200.0, 200.0),
        0,
    );

    // Move the execution zone
    let new_position = Vec2::new(300.0, 350.0);
    let success = bridge.move_execution_zone(particle_id, new_position);

    assert!(success);

    // Verify particle moved
    let particle = bridge.get_particle(particle_id).unwrap();
    assert_eq!(particle.position, new_position);

    // Verify process region updated
    let process = bridge.get_process(pid).unwrap();
    assert_eq!(process.region.start_x, 300);
    assert_eq!(process.region.start_y, 350);

    // Verify particle process region updated
    let particle_region = particle.process_region.as_ref().unwrap();
    assert_eq!(particle_region.start_x, 300);
    assert_eq!(particle_region.start_y, 350);
}

#[test]
fn test_bridge_resize_synchronization() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create an execution zone
    let (particle_id, pid) = bridge.create_execution_zone(
        WindowParticleType::AlpineVM,
        "Alpine VM".to_string(),
        Vec2::new(400.0, 400.0),
        0,
    );

    // Resize the execution zone
    let new_width = 1024.0;
    let new_height = 768.0;
    let success = bridge.resize_execution_zone(particle_id, new_width, new_height);

    assert!(success);

    // Verify particle resized
    let particle = bridge.get_particle(particle_id).unwrap();
    assert_eq!(particle.size.x, new_width);
    assert_eq!(particle.size.y, new_height);

    // Verify process region updated
    let process = bridge.get_process(pid).unwrap();
    let region = &process.region;
    assert_eq!(region.width(), 1024);
    assert_eq!(region.height(), 768);

    // Verify particle process region updated
    let particle_region = particle.process_region.as_ref().unwrap();
    assert_eq!(particle_region.width(), 1024);
    assert_eq!(particle_region.height(), 768);
}

#[test]
fn test_multiple_execution_zones() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create multiple execution zones
    let (particle1_id, pid1) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "VM 1".to_string(),
        Vec2::new(0.0, 0.0),
        0,
    );

    let (particle2_id, pid2) = bridge.create_execution_zone(
        WindowParticleType::ExecutionZone,
        "Zone 2".to_string(),
        Vec2::new(700.0, 0.0),
        100,
    );

    let (particle3_id, pid3) = bridge.create_execution_zone(
        WindowParticleType::Terminal,
        "Terminal 3".to_string(),
        Vec2::new(0.0, 700.0),
        200,
    );

    // Verify all particles exist
    assert_eq!(bridge.particle_count(), 3);
    assert!(bridge.get_particle(particle1_id).is_some());
    assert!(bridge.get_particle(particle2_id).is_some());
    assert!(bridge.get_particle(particle3_id).is_some());

    // Verify all processes exist
    assert_eq!(bridge.process_count(), 3);
    assert!(bridge.get_process(pid1).is_some());
    assert!(bridge.get_process(pid2).is_some());
    assert!(bridge.get_process(pid3).is_some());

    // Verify unique PIDs
    assert_ne!(pid1, pid2);
    assert_ne!(pid2, pid3);
    assert_ne!(pid1, pid3);

    // Verify unique particle IDs
    assert_ne!(particle1_id, particle2_id);
    assert_ne!(particle2_id, particle3_id);
    assert_ne!(particle1_id, particle3_id);

    // Verify bidirectional mappings
    assert_eq!(bridge.get_process_id(particle1_id), Some(pid1));
    assert_eq!(bridge.get_particle_id(pid1), Some(particle1_id));
    assert_eq!(bridge.get_process_id(particle2_id), Some(pid2));
    assert_eq!(bridge.get_particle_id(pid2), Some(particle2_id));
    assert_eq!(bridge.get_process_id(particle3_id), Some(pid3));
    assert_eq!(bridge.get_particle_id(pid3), Some(particle3_id));
}

#[test]
fn test_scheduler_integration() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create execution zones
    let (particle1_id, pid1) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "VM 1".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    let (particle2_id, pid2) = bridge.create_execution_zone(
        WindowParticleType::ExecutionZone,
        "Zone 2".to_string(),
        Vec2::new(500.0, 100.0),
        100,
    );

    // Verify scheduler has both processes
    assert_eq!(bridge.process_count(), 2);

    // Run scheduler tick
    let scheduled_pid = bridge.tick();

    // Verify one process was scheduled
    assert!(scheduled_pid.is_some());
    let scheduled = scheduled_pid.unwrap();
    assert!(scheduled == pid1 || scheduled == pid2);

    // Verify process state is RUNNING
    let process = bridge.get_process(scheduled).unwrap();
    assert_eq!(process.state, ProcessState::Running);
}

#[test]
fn test_sync_toggle() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create an execution zone
    let (particle_id, pid) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "Test VM".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    // Disable synchronization
    bridge.set_sync_enabled(false);
    assert!(!bridge.is_sync_enabled());

    // Move particle (should not update process region)
    let success = bridge.move_execution_zone(particle_id, Vec2::new(200.0, 200.0));
    assert!(!success);

    // Verify particle didn't move
    let particle = bridge.get_particle(particle_id).unwrap();
    assert_eq!(particle.position, Vec2::new(100.0, 100.0));

    // Re-enable synchronization
    bridge.set_sync_enabled(true);
    assert!(bridge.is_sync_enabled());

    // Move particle (should update process region now)
    let success = bridge.move_execution_zone(particle_id, Vec2::new(300.0, 300.0));
    assert!(success);

    // Verify particle moved now
    let particle = bridge.get_particle(particle_id).unwrap();
    assert_eq!(particle.position, Vec2::new(300.0, 300.0));
}

#[test]
fn test_overlap_detection() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create two overlapping execution zones
    let (particle1_id, pid1) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "VM 1".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    let (particle2_id, pid2) = bridge.create_execution_zone(
        WindowParticleType::ExecutionZone,
        "Zone 2".to_string(),
        Vec2::new(150.0, 150.0), // Overlaps with VM 1
        100,
    );

    // Detect overlaps
    let overlaps = bridge.detect_overlaps();

    // Should detect one overlap
    assert_eq!(overlaps.len(), 1);
    assert!(overlaps.contains(&(pid1, pid2)) || overlaps.contains(&(pid2, pid1)));
}

#[test]
fn test_overlap_resolution() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create overlapping execution zones
    let (particle1_id, pid1) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "VM 1".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    let (particle2_id, pid2) = bridge.create_execution_zone(
        WindowParticleType::ExecutionZone,
        "Zone 2".to_string(),
        Vec2::new(150.0, 150.0),
        100,
    );

    // Resolve overlaps
    let resolved_count = bridge.resolve_overlaps();

    // Should resolve one overlap
    assert_eq!(resolved_count, 1);

    // Verify no more overlaps
    let overlaps = bridge.detect_overlaps();
    assert_eq!(overlaps.len(), 0);

    // Verify Zone 2 was moved
    let particle2 = bridge.get_particle(particle2_id).unwrap();
    assert_ne!(particle2.position, Vec2::new(150.0, 150.0));
}

#[test]
fn test_region_validation() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create a valid execution zone
    let (particle_id, pid) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "Valid VM".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    // Verify regions are valid
    assert!(bridge.validate_regions());

    // Move particle out of bounds (should be handled)
    bridge.set_sync_enabled(false); // Disable sync to allow out-of-bounds move
    if let Some(particle) = bridge.get_particle_mut(particle_id) {
        particle.move_to(Vec2::new(1000.0, 1000.0));
    }

    // Verify regions are invalid now
    assert!(!bridge.validate_regions());
}

#[test]
fn test_process_region_conversion() {
    let bridge = ProcessRegionBridge::new(1024, 1024);

    // Create a window particle
    let particle = WindowParticle::new(
        0,
        WindowParticleType::RiscVVM,
        "Test".to_string(),
        Vec2::new(50.0, 75.0),
    );

    // Convert to ProcessRegion
    let process_region = particle.to_process_region();

    assert!(process_region.is_some());
    let region = process_region.unwrap();

    assert_eq!(region.start_x, 50);
    assert_eq!(region.start_y, 75);
    assert_eq!(region.width(), 640); // RiscVVM default width
    assert_eq!(region.height(), 480); // RiscVVM default height
}

#[test]
fn test_binary_serialization() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create execution zones
    let (particle_id, pid) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "Test VM".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    // Serialize to binary
    let binary = bridge.to_binary();

    // Verify binary is non-empty
    assert!(!binary.is_empty());

    // Verify binary format (header + cells)
    // Header: grid_w (4 bytes) + grid_h (4 bytes) + cell_count (4 bytes) + first_code_x (4 bytes) + first_code_y (4 bytes) = 20 bytes
    // Cells: each cell is 16 bytes (4 x u32)
    assert!(binary.len() >= 20);
}

#[test]
fn test_grid_dimensions() {
    let bridge = ProcessRegionBridge::new(512, 256);

    let (grid_w, grid_h) = bridge.grid_dimensions();
    assert_eq!(grid_w, 512);
    assert_eq!(grid_h, 256);
}

#[test]
fn test_scheduler_access() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create execution zone
    let (particle_id, pid) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "Test VM".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    // Access scheduler through bridge
    let scheduler = bridge.scheduler();
    assert!(scheduler.get_process(pid).is_some());

    // Access layout manager through bridge
    let layout_manager = bridge.layout_manager();
    assert!(layout_manager.get_particle(particle_id).is_some());
}

#[test]
fn test_particle_to_process_mapping() {
    let mut bridge = ProcessRegionBridge::new(1024, 1024);

    // Create execution zone
    let (particle_id, pid) = bridge.create_execution_zone(
        WindowParticleType::RiscVVM,
        "Test VM".to_string(),
        Vec2::new(100.0, 100.0),
        0,
    );

    // Test bidirectional mapping
    assert_eq!(bridge.get_process_id(particle_id), Some(pid));
    assert_eq!(bridge.get_particle_id(pid), Some(particle_id));

    // Test invalid lookups
    assert_eq!(bridge.get_process_id(999), None);
    assert_eq!(bridge.get_particle_id(999), None);
}
