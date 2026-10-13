// Simple test to check if ECALL is being triggered at all

use std::path::Path;
use std::sync::Arc;

#[tokio::test]
async fn test_simple_ecall_trigger() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("Simple ECALL Trigger Test");
    println!("═══════════════════════════════════════════════════════════════");

    let binary_path = Path::new("tests/test_spatial_alloc_poll.bin");
    if !binary_path.exists() {
        eprintln!("test_spatial_alloc_poll.bin not found. Run: riscv64-unknown-elf-as tests/test_spatial_alloc_poll.S -o tests/test_spatial_alloc_poll.bin");
        panic!("Binary not found");
    }

    let binary_data = std::fs::read(binary_path).expect("Failed to read test binary");
    println!(
        "   ✓ Loaded binary from {}: {} bytes",
        binary_path.display(),
        binary_data.len()
    );

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

    // Load binary directly and set PC manually
    executor
        .load_binary(&binary_data, 0x1000)
        .expect("Failed to load binary");
    executor.set_pc(0x1000);

    println!("   ✓ Binary loaded at 0x1000, PC set to 0x1000");

    // Execute a few frames
    println!("\n[Step 1] Executing 5 frames...");
    for i in 0..5 {
        println!("\n--- Frame {} ---", i);
        executor.execute_frame();

        // Read the PC
        let pc_data = executor.read_ram(0, 4);
        let pc = u32::from_le_bytes([pc_data[0], pc_data[1], pc_data[2], pc_data[3]]);
        println!("   PC (from stats): 0x{:08x}", pc);

        // Read the ready_flag
        let flag_data = executor.read_ram(0x2024, 4);
        let ready_flag =
            u32::from_le_bytes([flag_data[0], flag_data[1], flag_data[2], flag_data[3]]);
        println!("   ready_flag = {}", ready_flag);

        if !executor.is_running() {
            println!("   VM halted!");
            break;
        }
    }

    println!("\n═══════════════════════════════════════════════════════════════");
}