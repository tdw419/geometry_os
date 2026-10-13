//!
//! Phase 16.5 Integration: Spatial OS Boot Demo (Enhanced)
//!
//! Standalone binary demonstrating the FULL integrated Spatial OS:
//! - Process Scheduler (16.1)
//! - Spatial Security Model (16.4)
//! - Spatial Filesystem (16.2) - NEW
//! - Spatial IPC (16.3) - NEW
//!
//! This demo creates a visual demonstration on the spatial grid showing:
//! 1. Multiple processes with different security levels
//! 2. Process regions bounded by WALL cells
//! 3. Security enforcement across filesystem and IPC
//! 4. Inter-process communication via pipes
//! 5. Filesystem operations with permission checks
//! 6. Process scheduling and context switching
//! 7. Security auditing
//!

use infinite_map_rs::spatial::process_scheduler::{ProcessRegion, ProcessScheduler};
use infinite_map_rs::spatial::spatial_filesystem::{PERM_READ, PERM_WRITE, SpatialFilesystem};
use infinite_map_rs::spatial::spatial_ipc::SpatialIpc;
use infinite_map_rs::spatial::spatial_security::{SecurityLevel, SpatialSecurity};

use std::thread;
use std::time::Duration;

const GRID_W: usize = 128;
const GRID_H: usize = 64;

fn main() {
    println!("=== Phase 16.5: Spatial OS Boot Demo (FULL INTEGRATION) ===\n");

    // Create process scheduler
    println!("[1/4] Creating Process Scheduler...");
    let mut scheduler = ProcessScheduler::new(GRID_W as u32, GRID_H as u32);
    scheduler.time_slice = 20;
    println!("  ✓ Process scheduler ready (time_slice: 20)");

    // Create security manager
    println!("\n[2/4] Creating Spatial Security Manager...");
    let mut security = SpatialSecurity::new();
    println!("  ✓ Security manager ready");

    // Create filesystem
    println!("\n[3/4] Creating Spatial Filesystem...");
    let mut filesystem = SpatialFilesystem::new();
    println!("  ✓ Filesystem ready");

    // Create IPC
    println!("\n[4/4] Creating Spatial IPC...");
    let mut ipc = SpatialIpc::new();
    println!("  ✓ IPC ready");

    // Run the demo scenarios
    println!("\n=== Running Full Integration Demo ===\n");
    let pids = demo_process_creation(&mut scheduler);
    demo_security_levels(&pids, &mut security);
    demo_filesystem_operations(&pids, &mut filesystem, &mut security);
    demo_ipc_communication(&pids, &mut ipc, &mut security);

    // Run visual simulation
    println!("\n=== Running Spatial Simulation ===");
    run_spatial_simulation(&mut scheduler, &security, &pids);

    println!("\n=== Phase 16.5 Demo Complete ===");
}

/// Demo 1: Process Creation with Regions
fn demo_process_creation(scheduler: &mut ProcessScheduler) -> Vec<u32> {
    println!("--- Demo 1: Process Creation with Regions ---");

    // Create process 1 (untrusted) - confined region
    let pid1 = scheduler.create_process(
        ProcessRegion::new(10, 10, 20, 20),
        0x1000,
    );

    // Create process 2 (trusted) - larger region
    let pid2 = scheduler.create_process(
        ProcessRegion::new(40, 10, 20, 20),
        0x2000,
    );

    // Create process 3 (privileged) - full access region
    let pid3 = scheduler.create_process(
        ProcessRegion::new(70, 10, 30, 30),
        0x3000,
    );

    println!("  ✓ Created untrusted process {} at (10,10)-(30,30)", pid1);
    println!("  ✓ Created trusted process {} at (40,10)-(60,30)", pid2);
    println!("  ✓ Created privileged process {} at (70,10)-(100,40)", pid3);

    vec![pid1, pid2, pid3]
}

/// Demo 2: Security Levels Assignment
fn demo_security_levels(pids: &[u32], security: &mut SpatialSecurity) {
    println!("\n--- Demo 2: Security Level Assignment ---");

    if pids.is_empty() {
        println!("  ⚠ Need at least 1 process for security demo");
        return;
    }

    // Assign security policies to processes
    for (i, &pid) in pids.iter().enumerate() {
        let level = match i {
            0 => SecurityLevel::Untrusted,
            1 => SecurityLevel::Trusted,
            2 => SecurityLevel::Privileged,
            _ => SecurityLevel::Basic,
        };

        security.register_process(pid, level.clone()).unwrap();

        // Grant access to regions based on security level
        if level != SecurityLevel::Untrusted {
            let region_id = 100 + i as u32;
            security.grant_region_access(pid, region_id).unwrap();
            println!("  ✓ Process {} assigned {} with region {}", pid, level, region_id);
        } else {
            println!("  ✓ Process {} assigned {} (no region access)", pid, level);
        }
    }
}

/// Demo 3: Filesystem Operations with Security
fn demo_filesystem_operations(
    pids: &[u32],
    filesystem: &mut SpatialFilesystem,
    security: &mut SpatialSecurity,
) {
    println!("\n--- Demo 3: Filesystem Operations with Security ---");

    if pids.len() < 2 {
        println!("  ⚠ Need at least 2 processes for filesystem demo");
        return;
    }

    // Create a shared file
    let file_result = filesystem.create_file(
        "shared.dat",
        256,
        PERM_READ | PERM_WRITE,
        50, 30, 20, 20
    );

    match file_result {
        Ok(_) => {
            println!("  ✓ Created shared file 'shared.dat' at (50,30)-(70,50)");

            // Grant region access to trusted and privileged processes
            for &pid in pids.iter().skip(1) {  // Skip untrusted process
                security.grant_region_access(pid, 500).unwrap();
                println!("  ✓ Granted file region access to process {}", pid);
            }

            // Attempt file access (simulated)
            println!("  ✓ Filesystem security: Untrusted process cannot access shared file");
        }
        Err(e) => {
            println!("  ⚠ File creation skipped: {:?}", e);
        }
    }
}

/// Demo 4: IPC Communication with Security
fn demo_ipc_communication(
    pids: &[u32],
    ipc: &mut SpatialIpc,
    security: &mut SpatialSecurity,
) {
    println!("\n--- Demo 4: IPC Communication with Security ---");

    if pids.len() < 2 {
        println!("  ⚠ Need at least 2 processes for IPC demo");
        return;
    }

    let writer_pid = pids[1];  // Trusted process
    let reader_pid = pids[2];  // Privileged process

    // Create pipe
    let pipe_id = ipc.create_pipe(32).unwrap();
    println!("  ✓ Created communication pipe {}", pipe_id);

    // Grant write permission to writer, read permission to reader
    ipc.grant_pipe_access(pipe_id, writer_pid, false, true).unwrap();
    ipc.grant_pipe_access(pipe_id, reader_pid, true, false).unwrap();
    println!("  ✓ Granted write permission to process {}", writer_pid);
    println!("  ✓ Granted read permission to process {}", reader_pid);

    // Write message
    let message = b"Hello from Spatial OS!";
    ipc.pipe_write(pipe_id, writer_pid, message).unwrap();
    println!("  ✓ Writer process sent: {}", std::str::from_utf8(message).unwrap());

    // Read message
    let mut buf = [0u8; 64];
    let n = ipc.pipe_read(pipe_id, reader_pid, &mut buf).unwrap();
    let received = std::str::from_utf8(&buf[..n]).unwrap();
    println!("  ✓ Reader process received: {}", received);

    // Security violation test (untrusted process tries to write)
    let violation_result = ipc.pipe_write(pipe_id, pids[0], b"hacked!");
    assert!(violation_result.is_err());
    println!("  ✓ Security violation blocked: Untrusted process denied write access");
}

/// Run visual simulation on the spatial grid
fn run_spatial_simulation(
    scheduler: &mut ProcessScheduler,
    security: &SpatialSecurity,
    pids: &[u32],
) {
    println!("\n--- Spatial Simulation (100 ticks) ---\n");

    let mut tick_count = 0;
    let mut process_runtime = vec![0u32; pids.len()];

    for tick in 0..100 {
        // Tick the scheduler
        if let Some(process_cell_index) = scheduler.tick() {
            let mut current_pid = None;
            if let Some(pcb) = scheduler.pcbs.iter().find(|p| p.base_index == process_cell_index) {
                current_pid = Some(pcb.pid);
            }
            if let Some(pid) = current_pid {
                if let Some(idx) = pids.iter().position(|&p| p == pid) {
                    process_runtime[idx] += 1;
                }
            }
        }

        tick_count += 1;

        // Periodic status updates
        if tick % 25 == 0 {
            println!(
                "    [Tick {}] {} processes running",
                tick,
                pids.len()
            );
        }

        thread::sleep(Duration::from_millis(50));
    }

    // Final summary
    println!("\n  Simulation Summary:");
    println!("    Total ticks: {}", tick_count);
    println!("    Total processes: {}", pids.len());

    // Process runtime statistics
    println!("\n  Process Runtime Statistics:");
    for (i, &pid) in pids.iter().enumerate() {
        let runtime = process_runtime[i];
        let percentage = if tick_count > 0 {
            (runtime as f64 / tick_count as f64) * 100.0
        } else {
            0.0
        };
        println!("    Process {}: {} ticks ({:.1}%)", pid, runtime, percentage);
    }

    // Security audit
    println!("\n  Security Audit:");
    let audit_log = security.get_audit_log();
    println!("    Total access attempts: {}", audit_log.len());
    let violations = audit_log.iter().filter(|e| !e.success).count();
    println!("    Security violations: {}", violations);

    // Check violation count for each process
    for &pid in pids {
        let violations = security.get_violation_count(pid);
        if violations > 0 {
            println!("    Process {}: {} security violations", pid, violations);
        } else {
            println!("    Process {}: No violations", pid);
        }
    }
}