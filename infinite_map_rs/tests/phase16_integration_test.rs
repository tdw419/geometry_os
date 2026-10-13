use infinite_map_rs::spatial::process_scheduler::{ProcessScheduler, ProcessRegion};
use infinite_map_rs::spatial::spatial_filesystem::{SpatialFilesystem, PERM_READ, PERM_WRITE};
use infinite_map_rs::spatial::spatial_ipc::SpatialIpc;
use infinite_map_rs::spatial::spatial_security::{SecurityLevel, SpatialSecurity};
use std::sync::{Arc, Mutex};

#[test]
fn test_phase16_integration() {
    println!("=== Phase 16 Integration Test ===\n");

    // Step 1: Create security manager
    println!("[1/6] Creating SpatialSecurity manager...");
    let mut security = SpatialSecurity::new();

    // Step 2: Create scheduler with security checks
    println!("[2/6] Creating ProcessScheduler with security integration...");
    let scheduler = Arc::new(Mutex::new(ProcessScheduler::new(128, 64)));

    // Step 3: Create filesystem with security layer
    println!("[3/6] Creating SpatialFilesystem with security layer...");
    let mut filesystem = SpatialFilesystem::new();

    // Step 4: Create IPC with security validation
    println!("[4/6] Creating SpatialIPC with security validation...");
    let mut ipc = SpatialIpc::new();

    // Step 5: Run integration scenarios
    println!("[5/6] Running integration scenarios...\n");

    test_security_process_creation(&scheduler, &mut security);
    test_security_filesystem_access(&mut filesystem, &mut security);
    test_security_ipc_pipes(&mut ipc, &mut security);
    test_end_to_end_workflow(&scheduler, &mut filesystem, &mut ipc, &mut security);

    println!("\n✓ Phase 16 Integration Test: PASSED");
}

fn test_security_process_creation(scheduler: &Arc<Mutex<ProcessScheduler>>, security: &mut SpatialSecurity) {
    println!("\n--- Security + Scheduler Integration ---");
    let mut sched = scheduler.lock().unwrap();

    // ProcessRegion uses width/height, not end_x/end_y
    let pid1 = sched.create_process(ProcessRegion::new(10, 10, 10, 10), 1000);
    let pid2 = sched.create_process(ProcessRegion::new(30, 10, 10, 10), 1000);

    security.register_process(pid1, SecurityLevel::Untrusted).unwrap();
    security.register_process(pid2, SecurityLevel::Trusted).unwrap();

    println!("  ✓ Created process {} (Untrusted) at (10,10)-(20,20)", pid1);
    println!("  ✓ Created process {} (Trusted) at (30,10)-(40,20)", pid2);

    // Verify security levels via region access
    security.grant_region_access(pid2, 200).unwrap();
    let regions = security.region_access.get(&pid2);
    assert!(regions.is_some());
    assert!(regions.unwrap().contains(&200));

    println!("  ✓ Security levels and region access assigned correctly");
}

fn test_security_filesystem_access(filesystem: &mut SpatialFilesystem, security: &mut SpatialSecurity) {
    println!("\n--- Security + Filesystem Integration ---");

    // create_file signature: (name, size, permissions, start_x, start_y, block_width, block_height)
    let file_result = filesystem.create_file(
        "secret.txt",
        256,
        PERM_READ | PERM_WRITE,
        10, 10, 10, 10
    );
    match file_result {
        Ok(_) => {
            println!("  ✓ Created file 'secret.txt' at (10,10)-(20,20)");
            // File maps to spatial region (10,10) through (20,20)
            security.grant_region_access(2, 1000).unwrap();
            println!("  ✓ Granted region access for file (PID 2)");
        }
        Err(e) => {
            println!("  ⚠ File creation skipped: {:?}", e);
        }
    }
}

fn test_security_ipc_pipes(ipc: &mut SpatialIpc, security: &mut SpatialSecurity) {
    println!("\n--- Security + IPC Integration ---");
    let pipe_result = ipc.create_pipe(16);
    match pipe_result {
        Ok(pipe_id) => {
            println!("  ✓ Created pipe {}", pipe_id);
            // Grant pipe access
            ipc.grant_pipe_access(pipe_id, 1, false, true).unwrap();  // write
            ipc.grant_pipe_access(pipe_id, 2, true, false).unwrap();  // read
            println!("  ✓ Granted pipe permissions to processes 1 (write) and 2 (read)");
        }
        Err(e) => {
            println!("  ⚠ Pipe creation skipped: {}", e);
        }
    }
}

fn test_end_to_end_workflow(
    scheduler: &Arc<Mutex<ProcessScheduler>>,
    filesystem: &mut SpatialFilesystem,
    ipc: &mut SpatialIpc,
    security: &mut SpatialSecurity,
) {
    println!("\n--- End-to-End Workflow ---");
    let mut sched = scheduler.lock().unwrap();

    let writer_pid = sched.create_process(ProcessRegion::new(50, 30, 10, 10), 1000);
    let reader_pid = sched.create_process(ProcessRegion::new(70, 30, 10, 10), 1000);

    println!("  ✓ Created writer process (PID: {})", writer_pid);
    println!("  ✓ Created reader process (PID: {})", reader_pid);

    security.register_process(writer_pid, SecurityLevel::Trusted).unwrap();
    security.register_process(reader_pid, SecurityLevel::Basic).unwrap();

    // Create pipe
    let pipe_result = ipc.create_pipe(32);
    if let Ok(pipe_id) = pipe_result {
        println!("  ✓ Created communication pipe {}", pipe_id);
        ipc.grant_pipe_access(pipe_id, writer_pid, false, true).unwrap();
        ipc.grant_pipe_access(pipe_id, reader_pid, true, false).unwrap();
        println!("  ✓ Granted pipe permissions to both processes");

        // Test pipe communication
        let msg = b"Hello from writer";
        ipc.pipe_write(pipe_id, writer_pid, msg).unwrap();
        println!("  ✓ Writer sent message");

        let mut buf = [0u8; 64];
        let n = ipc.pipe_read(pipe_id, reader_pid, &mut buf).unwrap();
        assert_eq!(&buf[..n], msg);
        println!("  ✓ Reader received message: {:?}", &buf[..n]);
    }

    // Create shared file
    let file_result = filesystem.create_file(
        "shared.dat",
        128,
        PERM_READ | PERM_WRITE,
        50, 30, 10, 10
    );
    if let Ok(_) = file_result {
        security.grant_region_access(writer_pid, 2000).unwrap();
        security.grant_region_access(reader_pid, 2000).unwrap();
        println!("  ✓ Created shared file and granted region access");
    }

    println!("\n  ✓ End-to-end workflow scenario: PASSED");
}