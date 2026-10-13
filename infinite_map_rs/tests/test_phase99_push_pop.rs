// Test Phase 99: PUSH/POP opcodes - CORRECTED ENCODINGS
// Stack pointer = x30, grows downward (pre-decrement, post-increment)

use infinite_map_rs::RiscvExecutor;

#[tokio::test]
async fn test_push_pop_basic() {
    println!("=== Phase 99 Test: PUSH/POP Basic ===");

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

    // RISC-V instruction encoding (little-endian byte order)
    // Format: [31:25][24:20][19:15][14:12][11:7][6:0] = funct7 rs2 rs1 funct3 rd opcode
    //
    // I-type: imm[11:0] rs1 funct3 rd opcode
    // addi x1, x0, 100: imm=0x0064, rs1=0, rd=1, opcode=0x13 => 0x06400093
    //                  little-endian bytes: [0x93, 0x00, 0x40, 0x06]
    //
    // addi x10, x0, 200: imm=0x00C8, rs1=0, rd=10, opcode=0x13 => 0x0C800513
    //                    little-endian bytes: [0x13, 0x05, 0x80, 0x0C]
    //
    // addi x3, x0, 300: imm=0x012C, rs1=0, rd=3, opcode=0x13 => 0x12C00193
    //                   little-endian bytes: [0x93, 0x01, 0xC0, 0x12]
    //
    // Custom PUSH/POP opcodes:
    // PUSH: rs1 in bits [19:15], opcode 0x74
    // POP:  rd  in bits [11:7],  opcode 0x75
    //
    // PUSH x1: rs1=1 => 0x00008074
    //          little-endian bytes: [0x74, 0x80, 0x00, 0x00]
    //
    // PUSH x10: rs1=10 => 0x00050074
    //           little-endian bytes: [0x74, 0x00, 0x05, 0x00]
    //
    // PUSH x3: rs1=3 => 0x00018074
    //          little-endian bytes: [0x74, 0x80, 0x01, 0x00]
    //
    // POP x4: rd=4 => 0x00000275
    //         little-endian bytes: [0x75, 0x02, 0x00, 0x00]
    //
    // POP x5: rd=5 => 0x000002F5
    //         little-endian bytes: [0xF5, 0x02, 0x00, 0x00]
    //
    // POP x6: rd=6 => 0x00000375
    //         little-endian bytes: [0x75, 0x03, 0x00, 0x00]
    //
    // S-type: imm[11:5] rs2 rs1 funct3=010 imm[4:0] opcode=0x23
    // sw x4, 256(x0): imm=256=0x100, rs2=4, rs1=0 => 0x10002023
    //                little-endian bytes: [0x23, 0x20, 0x00, 0x10]
    //
    // sw x5, 260(x0): imm=260=0x104, rs2=5, rs1=0 => 0x10402023
    //                little-endian bytes: [0x23, 0x20, 0x40, 0x10]
    //
    // sw x6, 264(x0): imm=264=0x108, rs2=6, rs1=0 => 0x10802023
    //                little-endian bytes: [0x23, 0x20, 0x80, 0x10]
    //
    // EBREAK: 0x00100073
    // little-endian bytes: [0x73, 0x00, 0x10, 0x00]

    let program: Vec<u8> = vec![
        0x93, 0x00, 0x40, 0x06, // addi x1, x0, 100
        0x13, 0x05, 0x80, 0x0C, // addi x10, x0, 200
        0x93, 0x01, 0xC0, 0x12, // addi x3, x0, 300
        0x74, 0x80, 0x00, 0x00, // PUSH x1
        0x74, 0x00, 0x05, 0x00, // PUSH x10
        0x74, 0x80, 0x01, 0x00, // PUSH x3
        0x75, 0x02, 0x00, 0x00, // POP x4
        0xF5, 0x02, 0x00, 0x00, // POP x5
        0x75, 0x03, 0x00, 0x00, // POP x6
        0x23, 0x20, 0x40, 0x10, // sw x4, 256(x0)
        0x23, 0x22, 0x50, 0x10, // sw x5, 260(x0)
        0x23, 0x24, 0x60, 0x10, // sw x6, 264(x0)
        0x73, 0x00, 0x10, 0x00, // EBREAK - halt
    ];

    println!("Loading binary: {} bytes", program.len());
    executor
        .load_binary(&program, 0x1000)
        .expect("Failed to load binary");
    executor.set_pc(0x1000);

    // Initialize stack pointer (x30 = 0x10000)
    let sp_bytes = 0x10000u32.to_le_bytes();
    executor
        .load_binary(&sp_bytes, 30 * 4)
        .expect("Failed to set SP");

    // Execute
    println!("Executing for 100 frames...");
    for frame in 0..100 {
        executor.execute_frame();
        if frame % 10 == 0 {
            println!("Frame {}", frame);
            // Check if halted
            if !executor.is_running() {
                println!("Program halted at frame {}", frame);
                break;
            }
        }
    }

    // Check register values (REGISTER_BASE=0)
    let x1_ram = executor.read_ram(0 + 1 * 4, 4);
    let x2_ram = executor.read_ram(0 + 2 * 4, 4);
    let x3_ram = executor.read_ram(0 + 3 * 4, 4);
    println!("x1 = {}", u32::from_le_bytes(x1_ram.try_into().unwrap()));
    println!("x2 = {}", u32::from_le_bytes(x2_ram.try_into().unwrap()));
    println!("x3 = {}", u32::from_le_bytes(x3_ram.try_into().unwrap()));

    // Verify results (at offset 256 = 0x100)
    let ram = executor.read_ram(0x100, 12);
    println!("RAM at 0x100: {:?}", ram);

    let x4 = u32::from_le_bytes(ram[0..4].try_into().unwrap());
    let x5 = u32::from_le_bytes(ram[4..8].try_into().unwrap());
    let x6 = u32::from_le_bytes(ram[8..12].try_into().unwrap());

    println!("x4 (first POP) = {} (expected 300)", x4);
    println!("x5 (second POP) = {} (expected 200)", x5);
    println!("x6 (third POP) = {} (expected 100)", x6);

    // Check stack state (SP is x30, stored at REGISTER_BASE=0 + 30*4)
    let sp_ram = executor.read_ram(0 + 30 * 4, 4);
    let sp = u32::from_le_bytes(sp_ram.try_into().unwrap());
    println!("Final stack pointer: 0x{:08X} (expected 0x10000)", sp);

    // Check stack memory (0x10000 - 12 should have our 3 values)
    let stack_ram = executor.read_ram(0xFFF4, 12);
    println!("Stack at 0xFFF4 (bottom of stack): {:?}", stack_ram);
    let v1 = u32::from_le_bytes(stack_ram[0..4].try_into().unwrap());
    let v2 = u32::from_le_bytes(stack_ram[4..8].try_into().unwrap());
    let v3 = u32::from_le_bytes(stack_ram[8..12].try_into().unwrap());
    println!("Stack values (should be 300, 200, 100): {}, {}, {}", v1, v2, v3);

    // Check registers directly (REGISTER_BASE=0)
    let x4_direct = executor.read_ram(0 + 4 * 4, 4);
    let x5_direct = executor.read_ram(0 + 5 * 4, 4);
    let x6_direct = executor.read_ram(0 + 6 * 4, 4);
    println!("Direct register reads: x4={}, x5={}, x6={}",
             u32::from_le_bytes(x4_direct.try_into().unwrap()),
             u32::from_le_bytes(x5_direct.try_into().unwrap()),
             u32::from_le_bytes(x6_direct.try_into().unwrap()));
    assert_eq!(x5, 200, "Second POP should return 200");
    assert_eq!(x6, 100, "Third POP should return 100");
    assert_eq!(sp, 0x10000, "Stack pointer should be back to initial value");

    println!("✓ PUSH/POP test PASSED");
}