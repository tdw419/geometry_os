//! Phase 99: Sound Mixer Opcode Tests
//!
//! Tests custom RISC-V opcodes for sound mixer daemon:
//! - SPAWN (0x7B) - Spawn child VMs
//! - BEEP (0x7C) - Queue audio tones
//! - CALL (0x7D) - Subroutine calls
//! - PUSH (0x7F) - Push to stack
//! - POP (0x80) - Pop from stack

use std::sync::Arc;
use infinite_map_rs::riscv_executor::RiscvExecutor;

/// Helper function to encode Phase 99 opcodes
///
/// # Opcode Encodings
/// - SPAWN: funct7=0, rs1, funct3=0, rd=0, opcode=0x7B
/// - BEEP: funct7=0, rs2, rs1, funct3=0, rd=0, opcode=0x7C
/// - CALL: funct7=0, rs2=0, rs1, funct3=0, rd=0, opcode=0x7D
/// - RET: funct7=0, rs2=0, rs1=0, funct3=0, rd=0, opcode=0x7E
/// - PUSH: funct7=0, rs2=0, rs1, funct3=0, rd=0, opcode=0x7F
/// - POP: funct7=0, rs2=0, rs1=0, funct3=0, rd, opcode=0x80
fn encode_phase99_opcode(opcode: u32, rs1: u32, rs2: u32, rd: u32) -> u32 {
    match opcode {
        0x7B => 0x00000000 | (rs2 << 20) | (rs1 << 15) | (rd << 7) | opcode, // SPAWN
        0x7C => 0x00000000 | (rs2 << 20) | (rs1 << 15) | (rd << 7) | opcode, // BEEP
        0x7D => 0x00000000 | (rs2 << 20) | (rs1 << 15) | (rd << 7) | opcode, // CALL
        0x7E => 0x00000000 | (rs2 << 20) | (rs1 << 15) | (rd << 7) | opcode, // RET
        0x7F => 0x00000000 | (rs2 << 20) | (rs1 << 15) | (rd << 7) | opcode, // PUSH
        0x80 => 0x00000000 | (rs2 << 20) | (rs1 << 15) | (rd << 7) | opcode, // POP
        _ => panic!("Invalid Phase 99 opcode: 0x{:02X}", opcode),
    }
}

#[tokio::test]
async fn test_phase99_push_pop_stack_operations() {
    // Initialize GPU
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter = match instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
    {
        Some(a) => a,
        None => {
            println!("Skipping test_phase99_push_pop_stack_operations - no GPU available");
            return;
        }
    };

    let (device, queue) = adapter
        .request_device(&wgpu::DeviceDescriptor::default(), None)
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(Arc::new(device), Arc::new(queue))
        .expect("Failed to create executor");

    // Create test program:
    // 1. Initialize SP = 0xF000
    // 2. PUSH x1 (x1 = 100)
    // 3. PUSH x2 (x2 = 200)
    // 4. POP x3 (should get 200 - LIFO)
    // 5. POP x4 (should get 100)
    // 6. HALT

    let mut code: Vec<u32> = vec![];

    // Initialize SP = 0xF000
    code.push(0x0F000097); // auipc x1, 0x0F000
    code.push(0x00010113); // addi x2, x2, 0
    code.push(0xF0000F37); // lui x30, 0x0
    code.push(0x000F8F13); // addi x30, x30, 0

    // Set x1 = 100
    code.push(0x00000093); // addi x1, x0, 100 (wait, this is wrong)
    code.push(0x06400093); // addi x1, x0, 100

    // PUSH x1
    code.push(encode_phase99_opcode(0x7F, 1, 0, 0)); // PUSH x1

    // Set x2 = 200
    code.push(0x0C800113); // addi x2, x0, 200

    // PUSH x2
    code.push(encode_phase99_opcode(0x7F, 2, 0, 0)); // PUSH x2

    // POP x3
    code.push(encode_phase99_opcode(0x80, 0, 0, 3)); // POP x3

    // POP x4
    code.push(encode_phase99_opcode(0x80, 0, 0, 4)); // POP x4

    // HALT (ebreak = 0x00100073)
    code.push(0x00100073);

    executor
        .load_code(&code, 0x1000)
        .expect("Failed to load code");

    executor.set_pc(0x1000);
    executor.set_max_instructions(1000);

    let result = executor.run().await.expect("Failed to run");

    // Verify stack operations
    let regs = executor.read_registers().await.expect("Failed to read registers");

    // x3 should be 200 (last pushed, first popped)
    assert_eq!(regs[3], 200, "x3 should contain 200 (LIFO)");

    // x4 should be 100 (first pushed, second popped)
    assert_eq!(regs[4], 100, "x4 should contain 100 (LIFO)");

    // SP should be 0xF008 (started at 0xF000, pushed 2x4=8, popped 2x4=8)
    assert_eq!(regs[30], 0xF008, "SP should be 0xF008");

    println!("test_phase99_push_pop_stack_operations PASSED");
}

#[tokio::test]
async fn test_phase99_call_ret_subroutine() {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter = match instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
    {
        Some(a) => a,
        None => {
            println!("Skipping test_phase99_call_ret_subroutine - no GPU available");
            return;
        }
    };

    let (device, queue) = adapter
        .request_device(&wgpu::DeviceDescriptor::default(), None)
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(Arc::new(device), Arc::new(queue))
        .expect("Failed to create executor");

    // Create test program:
    // 0x1000: Initialize SP = 0xF000
    // 0x1004: CALL subroutine at 0x2000 (address in x3)
    // 0x1008: HALT
    // 0x2000: Subroutine: x1 = 100, RET

    let mut code: Vec<u32> = vec![0; 0x1000]; // Zero-fill to 0x1000

    // Set up main program at 0x1000
    code[0x400] = 0x0000F097; // auipc x1, 0x0 (get current PC)
    code[0x401] = 0x00008093; // addi x1, x1, 0 (keep as is)
    code[0x402] = 0x0000F037; // lui x30, 0x0
    code[0x403] = 0xF0000F13; // addi x30, x30, 0xF000 (SP = 0xF000)

    // Store subroutine address in x3
    code[0x404] = 0x00020E13; // addi x3, x0, 0x2000

    // CALL subroutine
    code[0x405] = encode_phase99_opcode(0x7D, 3, 0, 0); // CALL x3

    // HALT
    code[0x406] = 0x00100073; // ebreak

    // Subroutine at 0x2000
    code[0x800] = 0x06400093; // addi x1, x0, 100 (x1 = 100)
    code[0x801] = encode_phase99_opcode(0x7E, 0, 0, 0); // RET

    executor
        .load_code(&code, 0x1000)
        .expect("Failed to load code");

    executor.set_pc(0x1000);
    executor.set_max_instructions(1000);

    let result = executor.run().await.expect("Failed to run");

    // Verify subroutine was called
    let regs = executor.read_registers().await.expect("Failed to read registers");

    // x1 should be 100 (set by subroutine)
    assert_eq!(regs[1], 100, "x1 should be 100 (set by subroutine)");

    println!("test_phase99_call_ret_subroutine PASSED");
}

#[tokio::test]
async fn test_phase99_beep_queue_tones() {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter = match instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
    {
        Some(a) => a,
        None => {
            println!("Skipping test_phase99_beep_queue_tones - no GPU available");
            return;
        }
    };

    let (device, queue) = adapter
        .request_device(&wgpu::DeviceDescriptor::default(), None)
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(Arc::new(device), Arc::new(queue))
        .expect("Failed to create executor");

    // Create test program:
    // 1. Initialize BEEP_QUEUE (head=0, tail=0 at 0x3080, 0x3084)
    // 2. BEEP 440Hz, 500ms
    // 3. BEEP 880Hz, 250ms
    // 4. HALT

    let mut code: Vec<u32> = vec![];

    // Initialize BEEP_QUEUE base address in x5 = 0x3000
    code.push(0x000300B7); // lui x6, 0x30
    code.push(0x00030313); // addi x6, x6, 0
    code.push(0x00030B37); // lui x7, 0x0
    code.push(0x00038393); // addi x7, x7, 0

    // Set head = 0 at 0x3080 (relative to 0x3000)
    code.push(0x000080A3); // sw x0, 0x80(x5)

    // Set tail = 0 at 0x3084
    code.push(0x000084A3); // sw x0, 0x84(x5)

    // BEEP 440Hz, 500ms
    code.push(0x1B800093); // addi x1, x0, 440 (freq)
    code.push(0x1F400113); // addi x2, x0, 500 (dur)
    code.push(encode_phase99_opcode(0x7C, 1, 2, 0)); // BEEP x1, x2

    // BEEP 880Hz, 250ms
    code.push(0x37000093); // addi x1, x0, 880 (freq)
    code.push(0x0FA00113); // addi x2, x0, 250 (dur)
    code.push(encode_phase99_opcode(0x7C, 1, 2, 0)); // BEEP x1, x2

    // HALT
    code.push(0x00100073);

    executor
        .load_code(&code, 0x1000)
        .expect("Failed to load code");

    executor.set_pc(0x1000);
    executor.set_max_instructions(1000);

    let result = executor.run().await.expect("Failed to run");

    // Read back BEEP_QUEUE state
    let ram = executor.read_ram().await.expect("Failed to read RAM");

    // Entry 0: freq=440, dur=500
    assert_eq!(ram[0x3000 / 4], 440, "Entry 0 freq should be 440");
    assert_eq!(ram[(0x3000 + 4) / 4], 500, "Entry 0 dur should be 500");

    // Entry 1: freq=880, dur=250
    assert_eq!(ram[0x3008 / 4], 880, "Entry 1 freq should be 880");
    assert_eq!(ram[(0x3008 + 4) / 4], 250, "Entry 1 dur should be 250");

    // Head pointer should be 2
    assert_eq!(ram[0x3080 / 4], 2, "Head pointer should be 2");

    // Tail pointer should be 0
    assert_eq!(ram[0x3084 / 4], 0, "Tail pointer should be 0");

    // Audio ready flag should be 1
    assert_eq!(ram[0x3108 / 4], 1, "Audio ready flag should be 1");

    println!("test_phase99_beep_queue_tones PASSED");
}

#[tokio::test]
async fn test_phase99_spawn_child_vms() {
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter = match instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
    {
        Some(a) => a,
        None => {
            println!("Skipping test_phase99_spawn_child_vms - no GPU available");
            return;
        }
    };

    let (device, queue) = adapter
        .request_device(&wgpu::DeviceDescriptor::default(), None)
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(Arc::new(device), Arc::new(queue))
        .expect("Failed to create executor");

    // Create test program:
    // 1. SPAWN child VM at 0x2000
    // 2. SPAWN another child VM at 0x3000
    // 3. HALT

    let mut code: Vec<u32> = vec![];

    // Set x1 = 0x2000 (first child entry point)
    code.push(0x00020E93); // addi x4, x0, 0x2000

    // SPAWN child VM
    code.push(encode_phase99_opcode(0x7B, 4, 0, 0)); // SPAWN x4

    // Set x2 = 0x3000 (second child entry point)
    code.push(0x00030113); // addi x2, x0, 0x3000

    // SPAWN another child VM
    code.push(encode_phase99_opcode(0x7B, 2, 0, 0)); // SPAWN x2

    // HALT
    code.push(0x00100073);

    executor
        .load_code(&code, 0x1000)
        .expect("Failed to load code");

    executor.set_pc(0x1000);
    executor.set_max_instructions(1000);

    let result = executor.run().await.expect("Failed to run");

    // Read back SPAWN_TABLE state
    let ram = executor.read_ram().await.expect("Failed to read RAM");

    // Slot 0 (0x3200): status should be 1 (running)
    assert_eq!(ram[0x3200 / 4], 1, "Slot 0 status should be 1 (running)");

    // Slot 0 entry_point should be 0x2000
    assert_eq!(ram[(0x3200 + 4) / 4], 0x2000, "Slot 0 entry_point should be 0x2000");

    // Slot 1 (0x3210): status should be 1 (running)
    assert_eq!(ram[0x3210 / 4], 1, "Slot 1 status should be 1 (running)");

    // Slot 1 entry_point should be 0x3000
    assert_eq!(ram[(0x3210 + 4) / 4], 0x3000, "Slot 1 entry_point should be 0x3000");

    println!("test_phase99_spawn_child_vms PASSED");
}