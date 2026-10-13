//! Phase 16.5 Live Tile Boot Demo - Spatial Coordinator to Visual Bridge
//!
//! This demo creates an Alpine VM as a spatial process and demonstrates
//! the visual bridge from SpatialProcessCoordinator to Live Tiles.

use infinite_map_rs::spatial::{
    SpatialProcessCoordinator, SpatialProcessType, ProcessRegion,
    spatial_security::SecurityLevel,
};

fn main() {
    println!("=== Phase 16.5: Alpine Live Tile Spatial Boot Demo ===\n");

    // Create spatial process coordinator
    println!("[1/3] Creating Spatial Process Coordinator...");
    let mut coordinator = SpatialProcessCoordinator::new(128, 64);
    println!("  ✓ Coordinator ready (128x64 grid)");

    // Create Alpine VM as spatial process
    println!("\n[2/3] Creating Alpine VM Spatial Process...");
    let region = ProcessRegion::new(5, 5, 10, 10);
    let pid = coordinator.create_alpine_vm_process(
        "alpine_live_tile".to_string(),
        SecurityLevel::Trusted,
        region.clone(),
        5900,  // VNC port
    ).expect("Failed to create Alpine VM process");
    println!("  ✓ Alpine VM process {} created at ({},{})-({},{})",
             pid,
             region.start_x,
             region.start_y,
             region.start_x + region.width,
             region.start_y + region.height);

    // Start the process
    println!("\n[3/3] Starting Process...");
    coordinator.start_process(pid).expect("Failed to start process");
    println!("  ✓ Process {} started", pid);

    // Display process metadata
    println!("\n=== Process Metadata ===");
    if let Some(metadata) = coordinator.get_process(pid) {
        println!("  PID: {}", metadata.pid);
        println!("  Name: {}", metadata.name);
        println!("  Type: {:?}", metadata.process_type);
        println!("  State: {:?}", metadata.state);
        println!("  Security: {:?}", metadata.security_level);
        println!("  Region: ({},{})-({},{})",
                 metadata.region.start_x,
                 metadata.region.start_y,
                 metadata.region.start_x + metadata.region.width,
                 metadata.region.start_y + metadata.region.height);
        println!("  Window ID: {:?}", metadata.window_id);
        println!("  Tile Position: {:?}", metadata.tile_position);
    }

    println!("\n=== Running Spatial Simulation ===");
    println!("Simulating 50 ticks...\n");

    for tick in 0..50 {
        coordinator.tick();

        // Periodic status updates
        if tick % 10 == 0 {
            if let Some(metadata) = coordinator.get_process(pid) {
                println!("[Tick {}] Process {} state: {:?}",
                         tick,
                         metadata.pid,
                         metadata.state);
            }
        }

        std::thread::sleep(std::time::Duration::from_millis(100));
    }

    println!("\n=== Demo Complete ===");
    println!("In the full infinite_map_rs compositor, this process would be");
    println!("automatically bridged to a Live Tile via integrate_spatial_coordinator()");
    println!("at world coordinates ({}, {}).",
             (region.start_x as f32 * 16.0),
             (region.start_y as f32 * 16.0));
}