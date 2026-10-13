//! Multi-OS Live Tile Demo - Alpine + Ubuntu on Spatial Grid
//!
//! This demonstrates the Spatial OS Kernel (Phase 16) managing TWO Linux VMs
//! simultaneously on the spatial grid:
//! 1. Alpine Linux (x86_64, port 5900) - known-good from Phase 4
//! 2. Ubuntu Linux (RISC-V, port 5901) - new from Phase 11A
//!
//! Both VMs are managed as SpatialProcess instances with:
//! - VCC validation (Phase Alignment Stability)
//! - SpatialSecurity permission enforcement
//! - SpatialFilesystem metadata storage

use infinite_map_rs::spatial::{
    ProcessRegion, SecurityLevel, SpatialProcessCoordinator, SpatialProcessType,
};

use std::thread;
use std::time::Duration;

const GRID_W: usize = 256;
const GRID_H: usize = 128;

fn main() {
    println!("╔════════════════════════════════════════════════════════════╗");
    println!("║  Multi-OS Live Tile Demo - Alpine + Ubuntu (Phase 11A)    ║");
    println!("╚════════════════════════════════════════════════════════════╝\n");

    println!("📋 Configuration:");
    println!("   Grid: {}x{} spatial cells", GRID_W, GRID_H);
    println!("   Alpine: x86_64 ISO, VNC port 5900");
    println!("   Ubuntu: RISC-V image, VNC port 5901");
    println!();

    println!("[1/5] Creating Spatial Process Coordinator...");
    let mut coordinator = SpatialProcessCoordinator::new(GRID_W, GRID_H);
    println!("  ✓ Coordinator ready ({}x{} grid)", GRID_W, GRID_H);
    println!("  ✓ VCC validator initialized for PAS enforcement");

    println!("\n[2/5] Creating Alpine VM Live Tile (Region A)...");
    let alpine_region = ProcessRegion::new(10, 20, 80, 60);
    let alpine_pid = coordinator
        .create_alpine_vm_process(
            "alpine_x86_64".to_string(),
            SecurityLevel::Privileged,
            alpine_region.clone(),
            5900,
        )
        .unwrap();
    println!(
        "  ✓ Alpine VM process {} created at ({},{})-({},{})",
        alpine_pid,
        alpine_region.start_x,
        alpine_region.start_y,
        alpine_region.start_x + alpine_region.width,
        alpine_region.start_y + alpine_region.height
    );
    coordinator
        .set_tile_position(alpine_pid, 50.0, 100.0)
        .unwrap();
    coordinator.set_window_id(alpine_pid, 1).unwrap();
    println!("  ✓ Tile positioned at (50.0, 100.0), window ID 1");

    println!("\n[3/5] Creating Ubuntu VM Live Tile (Region B)...");
    let ubuntu_region = ProcessRegion::new(120, 20, 80, 60);
    let ubuntu_pid = coordinator
        .create_ubuntu_vm_process(
            "ubuntu_riscv64".to_string(),
            SecurityLevel::Privileged,
            ubuntu_region.clone(),
            5901,
        )
        .unwrap();
    println!(
        "  ✓ Ubuntu VM process {} created at ({},{})-({},{})",
        ubuntu_pid,
        ubuntu_region.start_x,
        ubuntu_region.start_y,
        ubuntu_region.start_x + ubuntu_region.width,
        ubuntu_region.start_y + ubuntu_region.height
    );
    coordinator
        .set_tile_position(ubuntu_pid, 300.0, 100.0)
        .unwrap();
    coordinator.set_window_id(ubuntu_pid, 2).unwrap();
    println!("  ✓ Tile positioned at (300.0, 100.0), window ID 2");

    println!("\n[4/5] Starting all spatial processes...");
    coordinator.start_process(alpine_pid).unwrap();
    println!("  ✓ Alpine VM process {} started (VNC :0)", alpine_pid);
    coordinator.start_process(ubuntu_pid).unwrap();
    println!("  ✓ Ubuntu VM process {} started (VNC :1)", ubuntu_pid);

    println!("\n╔════════════════════════════════════════════════════════════╗");
    println!("║  Multi-OS Live Tile Demo RUNNING                            ║");
    println!("╚════════════════════════════════════════════════════════════╝");

    println!("\n📊 Live Status:");
    println!(
        "   Alpine VM:   Region A (10,20)-(90,80)  |  VNC :0 (port 5900)"
    );
    println!(
        "   Ubuntu VM:   Region B (120,20)-(200,80)|  VNC :1 (port 5901)"
    );
    println!();
    println!("💡 VNC clients available:");
    println!("   vncviewer localhost:5900 (Alpine)");
    println!("   vncviewer localhost:5901 (Ubuntu)");
    println!();
    println!("🔄 VCC validates memory integrity every tick...");
    println!("   Press Ctrl+C to stop.\n");

    let mut tick_count = 0;
    loop {
        if let Some(pid) = coordinator.tick() {
            if let Some(meta) = coordinator.get_process(pid as u32) {
                println!(
                    "[Tick {}] Active process: {} ({:?})",
                    tick_count, meta.name, meta.process_type
                );
            }
        }

        tick_count += 1;
        thread::sleep(Duration::from_millis(500));

        if tick_count % 20 == 0 {
            println!("\n[Status Report - Tick {}]", tick_count);
            let all_processes = coordinator.get_all_processes();
            for meta in &all_processes {
                println!(
                    "  PID {}: {:?} - State: {:?} | Region: ({},{},{},{})",
                    meta.pid,
                    meta.process_type,
                    meta.state,
                    meta.region.start_x,
                    meta.region.start_y,
                    meta.region.width,
                    meta.region.height
                );
            }
            println!();
        }
    }
}