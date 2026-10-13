// Test Phase 99: CALL/RET opcodes
// Uses stack at 0xF000-0xFFFF, stack pointer = x30

use infinite_map_rs::RiscvExecutor;

#[tokio::test]
async fn test_call_ret_basic() {
    println!("=== Phase 99 Test: CALL/RET Basic ===");

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
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(
        std::sync::Arc::new(device),
        std::sync::Arc::new(queue),
    );

    // Hand-encoded program:
    // li x1, 42: 0x02A00593
    // li x2, 100: 0x06400613
    // li x3, 0x1014 (subroutine address): 0x01400693
    // CALL x3 (rs1=3, opcode=0x7D): 0x00187DFB
    // sw x5, 0x2000(x0): 0x00A02023
    // halt: j halt: 0xFE00006F
    // subroutine at 0x1014:
    //   PUSH x1 (rs1=1, opcode=0x7F): 0x00007F7B
    //   PUSH x2 (rs1=2, opcode=0x7F): 0x00107F7B
    //   add x5, x1, x2: 0x006082B3
    //   POP x2 (rd=2, opcode=0x80): 0x0020807B
    //   POP x1 (rd=1, opcode=0x80): 0x0018807B
    //   RET (opcode=0x7E): 0x0000707B

    let program: Vec<u8> = vec![
        0x93, 0x05, 0xA0, 0x02, // li x1, 42
        0x13, 0x06, 0x40, 0x06, // li x2, 100
        0x93, 0x06, 0x40, 0x01, // li x3, 0x1014 (subroutine address - 0x1000 base + 0x14 offset)
        0xFB, 0x7D, 0x18, 0x00, // CALL x3
        0x23, 0x20, 0xA0, 0x00, // sw x5, 0x2000(x0)
        0x6F, 0x00, 0x00, 0xFE, // halt: j halt
        0x00, 0x00, 0x00, 0x00, // padding
        0x7B, 0x7F, 0x00, 0x00, // subroutine: PUSH x1
        0x7B, 0x7F, 0x10, 0x00, // PUSH x2
        0xB3, 0x82, 0x60, 0x00, // add x5, x1, x2
        0x7B, 0x80, 0x20, 0x00, // POP x2
        0x7B, 0x80, 0x18, 0x00, // POP x1
        0x7B, 0x70, 0x00, 0x00, // RET
    ];

    println!("Loading binary: {} bytes", program.len());
    executor.load_binary(&program, 0x1000).expect("Failed to load binary");
    executor.set_pc(0x1000);

    // Initialize stack pointer (x30 = 0x10000)
    let sp_bytes = 0x10000u32.to_le_bytes();
    executor.load_binary(&sp_bytes, 30 * 4).expect("Failed to set SP");

    // Execute
    println!("Executing for 100 frames...");
    for frame in 0..100 {
        executor.execute_frame();
        if frame % 10 == 0 {
            println!("Frame {}", frame);
        }
    }

    // Verify result
    let ram = executor.read_ram(0x2000, 4);
    println!("RAM at 0x2000: {:?}", ram);

    let result = u32::from_le_bytes(ram[0..4].try_into().unwrap());
    println!("Result from subroutine = {} (expected 142 = 42 + 100)", result);

    // Check that x1 and x2 were preserved
    let x1_ram = executor.read_ram(1 * 4, 4);
    let x2_ram = executor.read_ram(2 * 4, 4);
    let x1 = u32::from_le_bytes(x1_ram.try_into().unwrap());
    let x2 = u32::from_le_bytes(x2_ram.try_into().unwrap());
    println!("x1 = {} (expected 42)", x1);
    println!("x2 = {} (expected 100)", x2);

    // Check stack pointer
    let sp_ram = executor.read_ram(30 * 4, 4);
    let sp = u32::from_le_bytes(sp_ram.try_into().unwrap());
    println!("Final stack pointer: 0x{:08X} (expected 0x10000)", sp);

    // Verify
    assert_eq!(result, 142, "Subroutine should return 42 + 100 = 142");
    assert_eq!(x1, 42, "x1 should be preserved");
    assert_eq!(x2, 100, "x2 should be preserved");
    assert_eq!(sp, 0x10000, "Stack pointer should be back to initial value");

    println!("✓ CALL/RET test PASSED");
}