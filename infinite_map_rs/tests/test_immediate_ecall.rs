// Hand-encoded minimal ECALL test
// Bytes: [B7 02 00 20, 97 01 23 00, 73 00 00 00]
// = lui a7, 291; ecall

#[tokio::test]
async fn test_immediate_ecall() {
    println!("\n=== Immediate ECALL Test ===\n");

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

    // Minimal binary: lui a7, 291; ecall; halt
    // lui a7, 291:
    //   opcode LUI (0x37)
    //   rd = a7 = 17
    //   imm = (291 >> 12) << 12 = 0x123000
    //   Encoding: (imm | rd << 7 | 0x37)
    //   = 0x123000 | 17 << 7 | 0x37 = 0x1230880 | 0x37 = 0x12308B7
    // Little-endian: B7 88 23 01
    // 
    // ECALL: 0x73 00 00 00
    // 
    // halt (j zero, -4):
    //   opcode JAL (0x6F)
    //   rd = zero = 0
    //   imm = -4 = 0xFF8
    //   = 0xFE00006F
    // Little-endian: 6F 00 00 FE

    let program: Vec<u8> = vec![
        // lui a7, 291 (0x123)
        0xB7, 0x88, 0x23, 0x01,
        // ecall
        0x73, 0x00, 0x00, 0x00,
        // halt: j halt
        0x6F, 0x00, 0x00, 0xFE,
    ];

    executor.load_binary(&program, 0x1000).expect("Failed to load");
    executor.set_pc(0x1000);

    println!("Program: lui a7, 291; ecall; halt");
    println!("Instructions at 0x1000:");
    for i in 0..3 {
        let ram = executor.read_ram(0x1000 + (i * 4), 4);
        let instr = u32::from_le_bytes([ram[0], ram[1], ram[2], ram[3]]);
        println!("  0x{:04x}: 0x{:08x}", 0x1000 + (i * 4), instr);
    }

    // Execute one frame
    println!("\nExecuting 1 frame...");
    executor.execute_frame();

    // Check if we wrote to result flag at 0x3000 (should still be 0 - we didn't write)
    let ram = executor.read_ram(0x3000, 4);
    let result = u32::from_le_bytes([ram[0], ram[1], ram[2], ram[3]]);
    println!("Result flag at 0x3000: {}", result);

    // Check if ECALL instruction is still at 0x1004
    let ram = executor.read_ram(0x1004, 4);
    let ecall_at_pc = u32::from_le_bytes([ram[0], ram[1], ram[2], ram[3]]);
    println!("ECALL instruction at 0x1004: 0x{:08x} (expected 0x00000073)", ecall_at_pc);

    println!("\n✓ Immediate ECALL test completed");
}