//! Alpine LXDE Live Tile Demo (Phase 11A.6)
//!
//! This demonstrates booting Alpine Linux with LXDE desktop and connecting
//! it directly to the Spatial Grid via VncLiveTileManager.

use infinite_map_rs::spatial::{
    ProcessRegion, SecurityLevel, SpatialProcessCoordinator, SpatialProcessType,
};

use std::thread;
use std::time::Duration;
use std::process::Command;

const GRID_W: usize = 256;
const GRID_H: usize = 128;

fn main() {
    println!("╔════════════════════════════════════════════════════════════╗");
    println!("║  Alpine LXDE Live Tile Demo (Phase 11A.6)                 ║");
    println!("╚════════════════════════════════════════════════════════════╝\n");

    // Start Alpine QEMU if needed, or assume it's running on 5900
    println!("[1/4] Ensuring Alpine Linux is available on VNC port 5900...");
    // We assume the user has Alpine running or we can just connect.
    
    println!("\n[2/4] Creating Spatial Process Coordinator...");
    let mut coordinator = SpatialProcessCoordinator::new(GRID_W, GRID_H);
    println!("  ✓ Coordinator ready ({}x{} grid)", GRID_W, GRID_H);

    println!("\n[3/4] Creating Alpine VM Spatial Process...");
    let alpine_region = ProcessRegion::new(10, 10, 100, 80);
    let alpine_pid = coordinator
        .create_alpine_vm_process(
            "alpine_lxde".to_string(),
            SecurityLevel::Privileged,
            alpine_region.clone(),
            5900,
        )
        .unwrap();
    println!("  ✓ Process {} created at region {:?}", alpine_pid, alpine_region);
    
    println!("\n[4/4] Wiring VNC Live Tile...");
    match coordinator.create_vnc_live_tile(alpine_pid, 5900) {
        Ok(_) => println!("  ✓ VNC Live Tile bound to PID {}", alpine_pid),
        Err(e) => println!("  ⚠ Warning: Could not bind VNC Live Tile: {} (Is Alpine running?)", e),
    }

    coordinator.start_process(alpine_pid).unwrap();
    println!("  ✓ Process {} started", alpine_pid);

    println!("\n🔄 Ticking Coordinator (Streaming VNC to Grid)...");
    println!("   Press Ctrl+C to stop.\n");

    let mut tick_count = 0;
    loop {
        coordinator.tick();

        tick_count += 1;
        thread::sleep(Duration::from_millis(50)); // 20 FPS simulation

        if tick_count % 40 == 0 {
            println!("[Tick {}] Stream active - Spatial memory updating...", tick_count);
            // In a real WGPU compositor, grid rendering happens here
        }
    }
}
