// Phase 99: Sound Mixer Daemon - Integration Tests
//
// Tests for the new opcodes:
// - OP_PUSH (0x7F): Push register to stack
// - OP_POP (0x80): Pop register from stack
// - OP_CALL (0x7D): Subroutine call
// - OP_RET (0x7E): Return from subroutine
// - OP_BEEP (0x7C): Queue audio tone
// - OP_SPAWN (0x7B): Spawn child VM

use infinite_map_rs::riscv_executor::RiscvExecutor;
use wgpu::InstanceDescriptor;

#[test]
fn test_phase99_push_pop() {
    pollster::block_on(async {
        // Test PUSH/POP stack operations
        // PUSH x1, x2, x3; POP x4, x5, x6 should preserve values

        let instance = wgpu::Instance::new(InstanceDescriptor::default());
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await
            .expect("Failed to find GPU");

        let (device, queue) = adapter
            .request_device(
                &wgpu::DeviceDescriptor {
                    label: Some("RISC-V Test Device"),
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

        let device = std::sync::Arc::new(device);
        let queue = std::sync::Arc::new(queue);

        let mut executor = RiscvExecutor::new(device, queue);

        // Hand-encoded program:
        // li x1, 100 (addi x1, x0, 100): 0x06400593
        // li x2, 200 (addi x2, x0, 200): 0x0C800613
        // li x3, 300 (addi x3, x0, 300): 0x12C00693
        // PUSH x1 (rs1=1, opcode=0x7F): 0x00007F7B
        // PUSH x2 (rs1=2, opcode=0x7F): 0x00107F7B
        // PUSH x3 (rs1=3, opcode=0x7F): 0x00187F7B
        // POP x4 (rd=4, opcode=0x80): 0x0020807B
        // POP x5 (rd=5, opcode=0x80): 0x0028807B
        // POP x6 (rd=6, opcode=0x80): 0x0030807B
        // sw x4, 0x2000(x0): 0x00802023
        // sw x5, 0x2004(x0): 0x00902223
        // sw x6, 0x2008(x0): 0x00A02423
        // halt: j halt: 0xFE00006F

        let program: Vec<u32> = vec![
            0x06400593, // addi x1, x0, 100
            0x0C800613, // addi x2, x0, 200
            0x12C00693, // addi x3, x0, 300
            0x00007F7B, // OP_PUSH x1
            0x00107F7B, // OP_PUSH x2
            0x00187F7B, // OP_PUSH x3
            0x0020807B, // OP_POP x4
            0x0028807B, // OP_POP x5
            0x0030807B, // OP_POP x6
            0x00802023, // sw x4, 0x2000(x0)
            0x00902223, // sw x5, 0x2004(x0)
            0x00A02423, // sw x6, 0x2008(x0)
            0xFE00006F, // j halt
        ];

        // Convert Vec<u32> to Vec<u8>
        let program_bytes: Vec<u8> = program.iter().flat_map(|&v| v.to_le_bytes()).collect();

        println!("Loading binary: {} bytes", program_bytes.len());
        executor
            .load_binary(&program_bytes, 0x1000)
            .expect("Failed to load binary");
        executor.set_pc(0x1000);

        // Initialize stack pointer (x30 = 0x10000) by writing to RAM at offset 30*4=120
        let sp_bytes = 0x10000u32.to_le_bytes();
        executor
            .load_binary(&sp_bytes, 30 * 4)
            .expect("Failed to set SP");

        // Execute
        println!("Executing for 100 frames...");
        for i in 0..100 {
            executor.execute_frame();
            if i % 10 == 0 {
                println!("  Frame {} complete", i);
            }
        }

        // Read results from RAM at 0x2000, 0x2004, 0x2008
        let result_bytes = executor.read_ram(0x2000, 12);
        let x4_val = u32::from_le_bytes([
            result_bytes[0],
            result_bytes[1],
            result_bytes[2],
            result_bytes[3],
        ]);
        let x5_val = u32::from_le_bytes([
            result_bytes[4],
            result_bytes[5],
            result_bytes[6],
            result_bytes[7],
        ]);
        let x6_val = u32::from_le_bytes([
            result_bytes[8],
            result_bytes[9],
            result_bytes[10],
            result_bytes[11],
        ]);

        println!("Results:");
        println!("  x4 = {} (expected 300 - last pushed)", x4_val);
        println!("  x5 = {} (expected 200 - middle pushed)", x5_val);
        println!("  x6 = {} (expected 100 - first pushed)", x6_val);

        // Stack is LIFO: last pushed (300) should be first popped
        assert_eq!(x4_val, 300, "x4 should be 300 (last pushed)");
        assert_eq!(x5_val, 200, "x5 should be 200 (middle pushed)");
        assert_eq!(x6_val, 100, "x6 should be 100 (first pushed)");

        println!("✓ PUSH/POP test PASSED");
    })
}