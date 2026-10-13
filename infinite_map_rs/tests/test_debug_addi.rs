// Test Phase 99: Simple ADDI test to debug base executor

use infinite_map_rs::RiscvExecutor;

#[tokio::test]
async fn test_debug_addi() {
    println!("=== DEBUG: Base RISC-V Executor ADDI Test ===");

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
        .expect("Failed to find adapter");

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("RiscvExecutor Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits {
                    max_storage_buffer_binding_size: 512 * 1024 * 1024,
                    ..Default::default()
                },
            },
            None,
        )
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(std::sync::Arc::new(device), std::sync::Arc::new(queue));

    // Simple test: addi x1, x0, 100
    // Encoding: imm=100, rs1=0, funct3=0, rd=1, opcode=0x13
    // Value: (100 << 20) | (0 << 15) | (0 << 12) | (1 << 7) | 0x13
    //      = 0x06400093
    let program: Vec<u8> = vec![
        0x93, 0x00, 0x40, 0x06, // addi x1, x0, 100
        0x6F, 0x00, 0x00, 0xFE, // halt: j -4 (infinite loop at PC 0x1004)
    ];

    println!("Loading binary: {} bytes", program.len());
    executor
        .load_binary(&program, 0x1000)
        .expect("Failed to load binary");
    executor.set_pc(0x1000);

    // Check initial state
    let ram_before = executor.read_ram(0x1000, 8);
    println!("RAM at 0x1000 (before): {:?}", ram_before);

    let x1_before = executor.read_ram(4, 4);
    println!("x1 before: {:?} (expected: [0, 0, 0, 0])", x1_before);

    // Execute for 1 frame (should execute 1 instruction)
    println!("Executing 1 frame...");
    executor.execute_frame();

    // Check after execution
    let x1_after = executor.read_ram(4, 4);
    println!("x1 after: {:?} (expected: [100, 0, 0, 0])", x1_after);

    // Check PC
    let pc_ram = executor.read_ram(0, 4);
    println!("PC RAM at 0: {:?}", pc_ram);

    // Try multiple frames
    println!("Executing 10 more frames...");
    for _ in 0..10 {
        executor.execute_frame();
    }

    let x1_final = executor.read_ram(4, 4);
    println!("x1 after 11 frames: {:?}", x1_final);

    let val = u32::from_le_bytes(x1_final.try_into().unwrap());
    println!("x1 value = {} (expected: 100)", val);

    assert_eq!(val, 100, "ADDI should have set x1 to 100");
    println!("✓ ADDI test PASSED");
}