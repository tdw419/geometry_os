// Simple test that just checks if any instructions execute at all

use std::path::Path;
use std::sync::Arc;

#[tokio::test]
async fn test_instruction_trace() {
    let binary_path = Path::new("tests/test_simple_ecall_rv32.bin");
    if !binary_path.exists() {
        eprintln!("test_simple_ecall_rv32.bin not found");
        return;
    }

    let binary_data = std::fs::read(binary_path).expect("Failed to read test binary");

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
        .expect("No GPU adapter available");

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
        .expect("Failed to create GPU device");

    let device = Arc::new(device);
    let queue = Arc::new(queue);

    let mut executor = infinite_map_rs::RiscvExecutor::new_with_ram(
        device.clone(),
        queue.clone(),
        128 * 1024 * 1024,
    );

    executor.enable_spatial_hypervisor_with_ram(128, 64, 128 * 1024 * 1024);

    executor
        .load_binary(&binary_data, 0x1000)
        .expect("Failed to load binary");
    executor.set_pc(0x1000);

    // Execute one frame and check instruction trace
    executor.execute_frame();

    // Read PC trace at 0x2000
    let pc_trace = executor.read_ram(0x2000, 4);
    let pc_val = u32::from_le_bytes([pc_trace[0], pc_trace[1], pc_trace[2], pc_trace[3]]);

    // Read instruction trace at 0x2004
    let instr_trace = executor.read_ram(0x2004, 4);
    let instr_val = u32::from_le_bytes([instr_trace[0], instr_trace[1], instr_trace[2], instr_trace[3]]);

    println!("   PC trace at 0x2000: 0x{:08x}", pc_val);
    println!("   Instruction trace at 0x2004: 0x{:08x}", instr_val);

    // Expected: PC = 0x1000, Instruction = 0x04000893 (li a7, 64)
    if pc_val == 0x1000 && instr_val == 0x04000893 {
        println!("   ✓ Instruction trace correct");
    } else {
        println!("   ✗ Instruction trace incorrect");
        panic!("Expected PC=0x1000, instr=0x04000893, got PC=0x{:08x}, instr=0x{:08x}",
               pc_val, instr_val);
    }
}