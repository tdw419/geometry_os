//! Phase 17: Window Particle Integration Demo
//!
//! This example demonstrates the Window Particle orchestration system:
//! - Multi-tile VM orchestration
//! - Spatial layout algorithms (grid, tiling, stacking)
//! - Drag-and-drop interaction
//! - Z-indexing and collision detection
//!
//! Run with: cargo run --example window_particle_demo

use infinite_map_rs::{
    LayoutAlgorithm, SpatialLayoutManager, WindowParticle, WindowParticleType,
};
use glam::Vec2;

fn main() {
    println!("=== Phase 17: Window Particle Orchestration Demo ===\n");

    // Create a spatial layout manager
    let mut layout_manager = SpatialLayoutManager::new();
    layout_manager.set_layout_algorithm(LayoutAlgorithm::Grid);

    // Create multiple window particles representing different VMs
    let mut vm_a = WindowParticle::new(
        WindowParticleType::AlpineVM,
        "Alpine Linux A".to_string(),
        Vec2::new(50.0, 50.0),
    );

    let mut vm_b = WindowParticle::new(
        WindowParticleType::AlpineVM,
        "Alpine Linux B".to_string(),
        Vec2::new(720.0, 50.0),
    );

    let mut monitor = WindowParticle::new(
        WindowParticleType::ProcessTile,
        "System Monitor".to_string(),
        Vec2::new(50.0, 560.0),
    );

    let mut terminal = WindowParticle::new(
        WindowParticleType::Terminal,
        "Terminal".to_string(),
        Vec2::new(390.0, 560.0),
    );

    // Add particles to layout manager
    layout_manager.add_particle(vm_a);
    layout_manager.add_particle(vm_b);
    layout_manager.add_particle(monitor);
    layout_manager.add_particle(terminal);

    println!(
        "Initial state: {} window particles",
        layout_manager.particle_count()
    );
    println!();

    // Demonstrate spatial query
    println!("=== Spatial Query Test ===");
    let query_pos = Vec2::new(100.0, 100.0);
    if let Some(particle_id) = layout_manager.find_particle_at(query_pos) {
        if let Some(particle) = layout_manager.get_particle(particle_id) {
            println!(
                "Found particle at position {:?}: {}",
                query_pos, particle.title
            );
        }
    }

    let empty_pos = Vec2::new(2000.0, 2000.0);
    match layout_manager.find_particle_at(empty_pos) {
        Some(id) => println!("Unexpectedly found particle at empty position: {}", id),
        None => println!(
            "Correctly identified empty space at position {:?}",
            empty_pos
        ),
    }
    println!();

    // Demonstrate Z-ordering
    println!("=== Z-Ordering Test ===");
    println!("Bringing particle 3 (System Monitor) to front...");
    layout_manager.bring_to_front(3);
    if let Some(particle) = layout_manager.get_particle(3) {
        println!("Particle 3 Z-order: {}", particle.z_order);
    }
    println!();

    // Demonstrate layout algorithms
    println!("=== Layout Algorithm Tests ===");

    println!("\n1. Grid Layout:");
    layout_manager.set_layout_algorithm(LayoutAlgorithm::Grid);
    layout_manager.apply_layout();
    if let Some(particle) = layout_manager.get_particle(0) {
        println!("  First particle position: {:?}", particle.position);
    }

    println!("\n2. Tiling Layout:");
    layout_manager.set_layout_algorithm(LayoutAlgorithm::Tiling);
    layout_manager.apply_layout();
    if let Some(particle) = layout_manager.get_particle(0) {
        println!("  First particle position: {:?}", particle.position);
    }

    println!("\n3. Stacking Layout (centered with size offset):");
    layout_manager.set_layout_algorithm(LayoutAlgorithm::Stacking);
    layout_manager.apply_layout();
    if let Some(particle) = layout_manager.get_particle(0) {
        println!("  First particle position: {:?}", particle.position);
    }
    println!();

    // Demonstrate drag-and-drop
    println!("=== Drag-and-Drop Interaction Test ===");
    let start_pos = Vec2::new(100.0, 100.0);
    println!("Starting drag at position {:?}", start_pos);

    if let Some(particle_id) = layout_manager.start_drag(start_pos) {
        if let Some(particle) = layout_manager.get_particle(particle_id) {
            println!("Dragging particle: {}", particle.title);
            println!("  Initial position: {:?}", particle.position);
        }

        // Simulate dragging
        let drag_delta = Vec2::new(150.0, 100.0);
        layout_manager.update_drag(particle_id, drag_delta);
        if let Some(particle) = layout_manager.get_particle(particle_id) {
            println!(
                "  After drag delta {:?}: {:?}",
                drag_delta, particle.position
            );
        }

        // End drag
        layout_manager.end_drag(particle_id);
        if let Some(particle) = layout_manager.get_particle(particle_id) {
            println!("  Final position: {:?}", particle.position);
            println!("  Dragging state: {}", particle.dragging);
        }
    }
    println!();

    // Demonstrate ProcessRegion mapping
    println!("=== ProcessRegion Integration Test ===");
    if let Some(particle) = layout_manager.get_particle(0) {
        if let Some(region) = particle.to_process_region() {
            println!(
                "Window '{}' mapped to ProcessRegion:",
                particle.title
            );
            println!(
                "  Bounds: ({}, {}) to ({}, {})",
                region.start_x, region.start_y, region.end_x, region.end_y
            );
        }
    }
    println!();

    // Demonstrate particle lifecycle
    println!("=== Particle Lifecycle Test ===");
    println!(
        "Current particle count: {}",
        layout_manager.particle_count()
    );

    println!("Removing particle 2...");
    layout_manager.remove_particle(2);
    println!(
        "Particle count after removal: {}",
        layout_manager.particle_count()
    );

    println!("Adding new particle (New Terminal)...");
    let new_terminal = WindowParticle::new(
        WindowParticleType::Terminal,
        "New Terminal".to_string(),
        Vec2::new(50.0, 560.0),
    );
    layout_manager.add_particle(new_terminal);
    println!(
        "Particle count after addition: {}",
        layout_manager.particle_count()
    );
    println!();

    // Demonstrate multiple VM orchestration
    println!("=== Multi-Tile VM Orchestration Test ===");
    layout_manager.set_layout_algorithm(LayoutAlgorithm::Free); // Manual positioning

    // Create three VM instances side-by-side
    let vm1 = WindowParticle::new(
        WindowParticleType::AlpineVM,
        "VM 1: Web Server".to_string(),
        Vec2::new(50.0, 50.0),
    );

    let vm2 = WindowParticle::new(
        WindowParticleType::AlpineVM,
        "VM 2: Database".to_string(),
        Vec2::new(470.0, 50.0),
    );

    let vm3 = WindowParticle::new(
        WindowParticleType::AlpineVM,
        "VM 3: App Server".to_string(),
        Vec2::new(890.0, 50.0),
    );

    layout_manager.add_particle(vm1);
    layout_manager.add_particle(vm2);
    layout_manager.add_particle(vm3);

    println!("Created 3 VM tiles:");
    if let Some(p) = layout_manager.get_particle(6) {
        println!("  {} at {:?}", p.title, p.position);
    }
    if let Some(p) = layout_manager.get_particle(7) {
        println!("  {} at {:?}", p.title, p.position);
    }
    if let Some(p) = layout_manager.get_particle(8) {
        println!("  {} at {:?}", p.title, p.position);
    }

    // Apply grid layout to organize them
    println!("\nApplying grid layout to organize VMs...");
    layout_manager.set_layout_algorithm(LayoutAlgorithm::Grid);
    layout_manager.apply_layout();

    if let Some(p) = layout_manager.get_particle(6) {
        println!("  {} at {:?}", p.title, p.position);
    }
    if let Some(p) = layout_manager.get_particle(7) {
        println!("  {} at {:?}", p.title, p.position);
    }
    if let Some(p) = layout_manager.get_particle(8) {
        println!("  {} at {:?}", p.title, p.position);
    }
    println!();

    println!("=== Demo Complete ===");
    println!();
    println!("Summary:");
    println!("- Window particles provide a spatial abstraction for OS windows/VMs");
    println!("- Support multiple layout algorithms: Free, Grid, Tiling, Stacking");
    println!("- Drag-and-drop interaction with real-time position updates");
    println!(
        "- Z-indexing system with layered organization (Background, Base, Active, Modal, Top)"
    );
    println!("- Collision detection for layout management");
    println!("- Seamless integration with ProcessScheduler via ProcessRegion mapping");
    println!("- Multi-tile orchestration for running multiple VMs side-by-side");
}