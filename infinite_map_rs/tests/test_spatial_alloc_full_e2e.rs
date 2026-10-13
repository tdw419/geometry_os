// Full E2E Test: Spatial Allocation Hypercall (Phase 5.2)
//
// This test validates the complete flow:
// RISC-V guest → hypercall 0x123 → SpatialAllocator → WALL placement → response
//
// What it tests:
// 1. RISC-V guest code calls ecall with hypercall ID 0x123
// 2. RiscvExecutor's spatial_hypervisor integration detects and handles it
// 3. SpatialAllocator.allocate_region() reserves space
// 4. WALL cells are returned
// 5. Response is written back to guest memory
// 6. Guest reads result and prints SUCCESS/FAIL

use std::path::Path;

/// Helper to create a test device and queue
async fn create_test_device() -> Option<(std::sync::Arc<wgpu::Device>, std::sync::Arc<wgpu::Queue>)> {
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
        .await?;

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
        .ok()?;

    Some((std::sync::Arc::new(device), std::sync::Arc::new(queue)))
}

#[tokio::test]
async fn test_spatial_alloc_full_e2e() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("Phase 5.2 Full E2E: RISC-V Guest → Hypercall → Region Allocation");
    println!("═══════════════════════════════════════════════════════════════");

    // Step 1: Verify test binary exists
    println!("\n[Step 1] Verifying test binary...");

    let binary_path = Path::new("tests/test_spatial_alloc.bin");
    if !binary_path.exists() {
        panic!(
            "test_spatial_alloc.bin not found. Run: \
             riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib \
             -Wl,-Ttext=0x1000 -o tests/test_spatial_alloc.elf tests/test_spatial_alloc.S && \
             riscv64-unknown-elf-objcopy -O binary tests/test_spatial_alloc.elf tests/test_spatial_alloc.bin"
        );
    }

    let binary_data = std::fs::read(binary_path).expect("Failed to read test binary");
    println!("   ✓ Binary loaded: {} bytes", binary_data.len());

    // Step 2: Create RiscvExecutor
    println!("\n[Step 2] Creating RiscvExecutor...");

    let (device, queue) = match create_test_device().await {
        Some(dq) => dq,
        None => {
            println!("Skipping test - no GPU available");
            return;
        }
    };

    println!("   ✓ GPU device created");

    // Create RiscvExecutor with 128MB RAM to fit within GPU limits
    let mut executor =
        infinite_map_rs::RiscvExecutor::new_with_ram(device.clone(), queue.clone(), 128 * 1024 * 1024);
    println!("   ✓ RiscvExecutor created (128MB RAM)");

    // Step 3: Enable spatial hypervisor
    println!("\n[Step 3] Enabling spatial hypervisor (128x64 grid) with 128MB RAM...");

    // Use 128MB RAM to fit within wgpu's max_buffer_binding_size limit
    executor.enable_spatial_hypervisor_with_ram(128, 64, 128 * 1024 * 1024);
    println!("   ✓ Spatial hypervisor enabled (128MB RAM)");

    // Step 4: Load test binary
    println!("\n[Step 4] Loading test binary into RISC-V RAM...");

    executor.load_program(&binary_data, 0x1000).expect("Failed to load program");
    println!("   ✓ Binary loaded at 0x1000");

    // Step 5: Execute frames until halting
    println!("\n[Step 5] Executing RISC-V program...");

    let mut frame_count = 0;
    let max_frames = 100; // Safety limit

    while executor.is_running() && frame_count < max_frames {
        executor.execute_frame();
        frame_count += 1;

        // Check for console output
        let output = executor.get_console_output();
        if !output.is_empty() {
            print!("Console: {}", output);
        }
    }

    println!("   ✓ Execution halted after {} frames", frame_count);

    // Step 6: Verify output
    println!("\n[Step 6] Verifying console output...");

    let output = executor.get_console_output();

    // The test should print "SUCCESS" and "Region: 1"
    if output.contains("SUCCESS") {
        println!("   ✓ Test PASSED: SUCCESS detected in output");

        if output.contains("Region: 1") {
            println!("   ✓ Region ID 1 confirmed in output");
        } else {
            println!("   ⚠ Warning: Region ID 1 not found in output");
        }

        println!("\n═══════════════════════════════════════════════════════════════");
        println!("Phase 5.2 Full E2E Test: PASSED ✓");
        println!("═══════════════════════════════════════════════════════════════");
        println!("\nFull console output:\n{}", output);
    } else {
        println!("   ✗ Test FAILED: SUCCESS not found in output");
        println!("\n═══════════════════════════════════════════════════════════════");
        println!("Phase 5.2 Full E2E Test: FAILED ✗");
        println!("═══════════════════════════════════════════════════════════════");
        println!("\nFull console output:\n{}", output);

        if output.contains("FAIL") {
            panic!("Test explicitly reported FAIL");
        } else {
            panic!("SUCCESS not found in output");
        }
    }
}