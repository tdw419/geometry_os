// Check if binary loaded correctly

#[tokio::test]
async fn test_binary_loading() {
    println!("\n=== Binary Loading Test ===\n");

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
        .expect("No adapter found");

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
        .expect("Failed to create device");

    let caps = infinite_map_rs::GpuCapabilities {
        max_grid_x: 512,
        max_grid_y: 256,
        max_compute_workgroups_per_dimension: 65535,
    };

    let mut executor = infinite_map_rs::RiscvExecutor::new_with_caps(
        std::sync::Arc::new(device),
        std::sync::Arc::new(queue),
        &caps,
    );

    // Load test binary
    let binary_path = std::path::Path::new("tests/test_spatial_alloc_simple.bin");
    let binary_data = std::fs::read(binary_path).expect("Failed to read binary");

    println!("Binary size: {} bytes", binary_data.len());

    executor.load_binary(&binary_data, 0x1000).expect("Failed to load");
    executor.set_pc(0x1000);

    // Check what's at 0x1000 in RAM
    let ram = executor.read_ram(0x1000, 32);
    println!("\nFirst 32 bytes at 0x1000:");
    for (i, chunk) in ram.chunks(4).enumerate() {
        let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
        println!("  0x{:04x}: 0x{:08x}", 0x1000 + (i * 4), word);
    }

    // Check what's at 0x1040 (where ECALL should be)
    let ram = executor.read_ram(0x1040, 8);
    let ecall_word = u32::from_le_bytes([ram[0], ram[1], ram[2], ram[3]]);
    println!("\nAt 0x1040 (expected ECALL 0x00000073): 0x{:08x}", ecall_word);

    // Compare with original binary
    println!("\nOriginal binary first 32 bytes:");
    for (i, chunk) in binary_data[..32].chunks(4).enumerate() {
        let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
        println!("  0x{:04x}: 0x{:08x}", i * 4, word);
    }

    println!("\nOriginal binary at 0x40:");
    if binary_data.len() > 0x42 {
        let ecall_bytes = &binary_data[0x40..0x44];
        let ecall_orig = u32::from_le_bytes([ecall_bytes[0], ecall_bytes[1], ecall_bytes[2], ecall_bytes[3]]);
        println!("  0x{:04x}: 0x{:08x}", 0x40, ecall_orig);
    }

    // Execute one frame and see where PC goes
    println!("\nExecuting 1 frame...");
    executor.execute_frame();

    // The problem is PC isn't in RAM - it's in GPU uniform buffers
    // We can't read PC directly from RAM
    println!("Note: PC is stored in GPU uniform buffers, not RAM");
    println!("✓ Binary loading test completed");
}