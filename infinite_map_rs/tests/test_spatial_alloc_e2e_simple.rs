// Simplified E2E Test: Spatial Allocation Hypercall (Phase 5.2)
//
// This test validates the complete flow:
// RISC-V guest → hypercall 0x123 → SpatialAllocator → WALL placement → response
//
// Simplified version that writes result to RAM instead of console output.
// This works with RiscvExecutor's actual architecture.

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
async fn test_spatial_alloc_e2e_simple() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("Phase 5.2 Simplified E2E: RISC-V Guest → Hypercall → Region Allocation");
    println!("═══════════════════════════════════════════════════════════════");

    // Step 1: Verify test binary exists
    println!("\n[Step 1] Verifying test binary...");

    let binary_path = Path::new("tests/test_spatial_alloc_simple.bin");
    if !binary_path.exists() {
        panic!(
            "test_spatial_alloc_simple.bin not found. Run: \
             riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib \
             -Wl,-Ttext=0x1000 -o tests/test_spatial_alloc_simple.elf tests/test_spatial_alloc_simple.S && \
             riscv64-unknown-elf-objcopy -O binary tests/test_spatial_alloc_simple.elf tests/test_spatial_alloc_simple.bin"
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
        },
    };

    println!("   ✓ GPU device created");

    // Create RiscvExecutor with 128MB RAM to fit within GPU limits
    let mut executor = infinite_map_rs::RiscvExecutor::new_with_ram(
        device.clone(),
        queue.clone(),
        128 * 1024 * 1024,
    );
    println!("   ✓ RiscvExecutor created (128MB RAM)");

    // Step 3: Enable spatial hypervisor
    println!("\n[Step 3] Enabling spatial hypervisor (128x64 grid) with 128MB RAM...");

    executor.enable_spatial_hypervisor_with_ram(128, 64, 128 * 1024 * 1024);
    println!("   ✓ Spatial hypervisor enabled (128MB RAM)");

    // Step 4: Load test binary
    println!("\n[Step 4] Loading test binary into RISC-V RAM...");

    executor.load_binary(&binary_data, 0x1000).expect("Failed to load binary");
    executor.set_pc(0x1000); // Explicitly set entry point
    println!("   ✓ Binary loaded at 0x1000");

    // Step 5: Execute frames until halting
    println!("\n[Step 5] Executing RISC-V program...");

    let mut frame_count = 0;
    let max_frames = 200; // Safety limit

    while executor.is_running() && frame_count < max_frames {
        executor.execute_frame();

        // Read stats to track progress
        let ram_slice = executor.read_ram(0x1000, 4);
        let pc_from_ram = u32::from_le_bytes([ram_slice[0], ram_slice[1], ram_slice[2], ram_slice[3]]);

        if frame_count % 10 == 0 || pc_from_ram == 0x40 {
            println!("   Frame {}: PC=0x{:08x}", frame_count, pc_from_ram);
        }

        frame_count += 1;
    }

    println!("   ✓ Execution halted after {} frames", frame_count);

    // Step 6: Read result flag from RAM (0x3000)
    println!("\n[Step 6] Verifying result flag at 0x3000...");
    // Read the result flag from RAM
    let ram_slice = executor.read_ram(0x3000, 4);
    let result_flag = u32::from_le_bytes([ram_slice[0], ram_slice[1], ram_slice[2], ram_slice[3]]);

    println!("   Result flag: {}", result_flag);

    if result_flag == 1 {
        println!("\n═══════════════════════════════════════════════════════════════");
        println!("Phase 5.2 Simplified E2E Test: PASSED ✓");
        println!("═══════════════════════════════════════════════════════════════");
        println!("\nSpatial allocation hypercall (ID 0x123) works correctly.");
        println!("Guest RISC-V successfully allocated a 10x20 cell region.");
    } else {
        println!("\n═══════════════════════════════════════════════════════════════");
        println!("Phase 5.2 Simplified E2E Test: FAILED ✗");
        println!("═══════════════════════════════════════════════════════════════");
        println!("\nResult flag was 0 (fail), expected 1 (success).");

        // Try to read more info from the response buffer
        println!("\nDebug info - Reading response buffer at 0x2010:");
        let resp_slice = executor.read_ram(0x2010, 20); // 8 + 4 + 4 + 4 = 20 bytes

        if resp_slice.len() >= 8 {
            let region_id = u64::from_le_bytes([
                resp_slice[0],
                resp_slice[1],
                resp_slice[2],
                resp_slice[3],
                resp_slice[4],
                resp_slice[5],
                resp_slice[6],
                resp_slice[7],
            ]);
            println!("  region_id: {}", region_id);
        }

        if resp_slice.len() >= 12 {
            let result = i32::from_le_bytes([
                resp_slice[8],
                resp_slice[9],
                resp_slice[10],
                resp_slice[11],
            ]);
            println!("  result: {} (expected 0 for success)", result);
        }

        if resp_slice.len() >= 16 {
            let x = u32::from_le_bytes([
                resp_slice[12],
                resp_slice[13],
                resp_slice[14],
                resp_slice[15],
            ]);
            println!("  x: {}", x);
        }

        if resp_slice.len() >= 20 {
            let y = u32::from_le_bytes([
                resp_slice[16],
                resp_slice[17],
                resp_slice[18],
                resp_slice[19],
            ]);
            println!("  y: {}", y);
        }

        // Check if the program even reached the ECALL
        let ram = executor.read_ram(0x1048, 4);
        let ecall_instr = u32::from_le_bytes([ram[0], ram[1], ram[2], ram[3]]);
        println!("ECALL instruction at 0x1048: 0x{:08x}", ecall_instr);

        panic!("E2E test failed: result flag was 0");
    }
}