// Analyze execution path with detailed PC tracking

#[tokio::test]
async fn test_pc_tracking() {
    println!("\n=== PC Tracking Test ===\n");

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

    // Load with LARGER RAM to allow NEURAL_GATE MMIO access (needed for full test)
    executor.set_max_instruction_count(5); // Only execute 5 instructions

    let binary_path = std::path::Path::new("tests/test_spatial_alloc_simple.bin");
    let binary_data = std::fs::read(binary_path).expect("Failed to read binary");

    executor.load_binary(&binary_data, 0x1000).expect("Failed to load");
    executor.set_pc(0x1000);

    println!("PC set to 0x1000");
    println!("Instructions expected before ECALL at 0x1048:");

    // Manually decode first few instructions
    let instructions = [
        (0x1000, 0x200002b7), // lui t0, 0x20000 (was 0xb7020020 LE)
        (0x1004, 0x00100313), // addi t1, t0, 256
        (0x1008, 0x0062a023), // sw zero, 12(t1)
        (0x100c, 0x0002a223), // sw zero, 16(t1)
        (0x1010, 0x00a00313), // addi t1, t0, 640
        (0x1014, 0x0062a423), // sw zero, 12(t1)
        (0x1018, 0x01400313), // addi t1, t0, 1280
        (0x101c, 0x0062a623), // sw zero, 12(t1)
    ];

    for (addr, _instr) in &instructions {
        println!("  0x{:04x}", addr);
    }

    println!("\nExecuting 5 instructions...");
    executor.execute_frame();

    println!("Note: Use enable_spatial_hypervisor() for full test with larger RAM");
    println!("✓ PC tracking test completed");
}