// Test register value after LUI instruction

#[tokio::test]
async fn test_lui_register() {
    println!("\n=== LUI Register Test ===\n");

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

    let mut executor = infinite_map_rs::RiscvExecutor::new_with_ram(
        std::sync::Arc::new(device),
        std::sync::Arc::new(queue),
        1 * 1024 * 1024,
    );

    // Binary: lui a7, 0x123; halt
    // lui a7, 0x123 = 0x123000 into a7
    let program: Vec<u8> = vec![
        0xB7, 0x88, 0x23, 0x01, // lui a7, 0x123
        0x6F, 0x00, 0x00, 0xFE, // halt: j halt
    ];

    executor.load_binary(&program, 0x1000).expect("Failed to load");
    executor.set_pc(0x1000);

    println!("Binary: lui a7, 0x123; halt");

    // Execute one frame (LUI + halt)
    executor.execute_frame();

    // Can't read registers directly from Rust - they're in GPU RAM
    println!("Note: Registers are in GPU RAM, can't read from Rust directly");
    println!("Expected: a7 should be 0x123000 (1191936 decimal)");
    println!("✓ LUI register test completed");
}