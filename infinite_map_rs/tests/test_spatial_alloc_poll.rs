// E2E Spatial Allocation Test with Polling
//
// This test creates a RISC-V guest that:
// 1. Allocates a 10x20 spatial region via hypercall 0x123
// 2. Polls the response_ready flag (at 0x2024) until it equals 2
// 3. Reads the response and verifies the allocation succeeded

use std::path::Path;
use std::sync::Arc;

#[tokio::test]
async fn test_spatial_alloc_with_polling() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("E2E Spatial Allocation Test with Response Polling (RV32)");
    println!("═══════════════════════════════════════════════════════════════");

    let binary_path = Path::new("tests/test_spatial_alloc_poll_rv32.bin");
    if !binary_path.exists() {
        eprintln!("test_spatial_alloc_poll_rv32.bin not found.");
        eprintln!("Run: riscv64-unknown-elf-as -march=rv32i tests/test_spatial_alloc_poll.S -o tests/test_spatial_alloc_poll_rv32.bin");
        panic!("Binary not found");
    }

    let binary_data = std::fs::read(binary_path).expect("Failed to read test binary");
    println!(
        "   ✓ Loaded binary from {}: {} bytes",
        binary_path.display(),
        binary_data.len()
    );

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
        .expect("No GPU adapter available");

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Test Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .expect("Failed to create GPU device");

    let device = Arc::new(device);
    let queue = Arc::new(queue);

    let mut executor = infinite_map_rs::RiscvExecutor::new_with_ram(
        device.clone(),
        queue.clone(),
        128 * 1024 * 1024,
    );

    executor.enable_spatial_hypervisor_with_ram(128, 64, 128 * 1024 * 1024);

    // Load binary directly and set PC manually
    executor
        .load_binary(&binary_data, 0x1000)
        .expect("Failed to load binary");
    executor.set_pc(0x1000);

    println!("   ✓ Binary loaded at 0x1000, PC set to 0x1000");

    // Execute multiple frames to allow polling to complete
    println!("\n[Step 1] Executing frames to allow ECALL and polling...");
    println!("   Note: Watch logs for 'Processing spatial hypercall' message");

    for i in 0..100 {
        executor.execute_frame();

        // Check if VM halted
        if !executor.is_running() {
            println!("   ✓ VM halted after {} frames", i + 1);
            break;
        }

        // After a few frames, check if ready_flag was set
        if i == 10 {
            let flag_data = executor.read_ram(0x2024, 4);
            let ready_flag =
                u32::from_le_bytes([flag_data[0], flag_data[1], flag_data[2], flag_data[3]]);
            println!("   [Frame {}] ready_flag = {} (should become 2 after processing)", i, ready_flag);
        }
    }

    if executor.is_running() {
        println!("   ⚠ VM still running after 100 frames (polling loop may not complete)");
    }

    // Read the request to verify it was written correctly
    println!("\n[Step 1.5] Checking request structure in RAM...");
    let req_data = executor.read_ram(0x2000, 16);
    println!("   req_id (u64) = {}", u64::from_le_bytes([
        req_data[0], req_data[1], req_data[2], req_data[3],
        req_data[4], req_data[5], req_data[6], req_data[7]
    ]));
    println!("   width (u32) = {}", u32::from_le_bytes([
        req_data[8], req_data[9], req_data[10], req_data[11]
    ]));
    println!("   height (u32) = {}", u32::from_le_bytes([
        req_data[12], req_data[13], req_data[14], req_data[15]
    ]));

    // Read the response structure from RAM
    let resp_data = executor.read_ram(0x2010, 20);
    let region_id = u64::from_le_bytes([
        resp_data[0],
        resp_data[1],
        resp_data[2],
        resp_data[3],
        resp_data[4],
        resp_data[5],
        resp_data[6],
        resp_data[7],
    ]);
    let result = i32::from_le_bytes([resp_data[8], resp_data[9], resp_data[10], resp_data[11]]);
    let x = u32::from_le_bytes([resp_data[12], resp_data[13], resp_data[14], resp_data[15]]);
    let y = u32::from_le_bytes([resp_data[16], resp_data[17], resp_data[18], resp_data[19]]);

    println!("\n[Step 2] Reading response from RAM...");
    println!("   region_id = {}", region_id);
    println!("   result = {}", result);
    println!("   x = {}", x);
    println!("   y = {}", y);

    // Read the ready_flag
    let flag_data = executor.read_ram(0x2024, 4);
    let ready_flag = u32::from_le_bytes([flag_data[0], flag_data[1], flag_data[2], flag_data[3]]);
    println!("   ready_flag = {}", ready_flag);

    // Verify the allocation succeeded
    assert_eq!(
        result, 0,
        "Expected allocation result 0 (SPATIAL_ALLOC_OK), got {}",
        result
    );

    assert_eq!(
        ready_flag, 2,
        "Expected ready_flag = 2 after hypervisor completion, got {}",
        ready_flag
    );

    println!("\n✅ TEST PASSED: Spatial allocation with polling works!");
    println!("   - Response written to RAM correctly");
    println!("   - ready_flag set to 2");
    println!("   - Guest successfully polled for completion");

    println!("═══════════════════════════════════════════════════════════════");
    println!("E2E Spatial Allocation Test with Polling: PASSED");
    println!("═══════════════════════════════════════════════════════════════");
}