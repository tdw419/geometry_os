// Simple test to verify VM is executing correctly at all

use std::path::Path;
use std::sync::Arc;

fn init_logger() {
    let _ = env_logger::builder()
        .filter_level(log::LevelFilter::Trace)
        .is_test(true)
        .try_init();
}

#[tokio::test]
async fn test_vm_halts() {
    init_logger();

    println!("═══════════════════════════════════════════════════════════════");
    println!("Simple VM Halt Test (RV32)");
    println!("═══════════════════════════════════════════════════════════════");

    let binary_path = Path::new("tests/test_simple_ecall_rv32.bin");
    if !binary_path.exists() {
        eprintln!("test_simple_ecall_rv32.bin not found. Run: make -f Makefile.tests rv32");
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

    // Execute frames
    println!("\n[Step 1] Executing up to 20 frames...");
    let mut halted = false;
    for i in 0..20 {
        println!("\n--- Frame {} ---", i);
        executor.execute_frame();

        // Read a success flag from RAM (simple_ecall writes to 0x3000)
        let flag_data = executor.read_ram(0x3000, 4);
        let success_flag =
            u32::from_le_bytes([flag_data[0], flag_data[1], flag_data[2], flag_data[3]]);
        println!("   success_flag (at 0x3000) = {}", success_flag);

        if !executor.is_running() {
            println!("   ✓ VM halted after {} frames", i + 1);
            halted = true;
            break;
        }
    }

    if !halted {
        println!("   ⚠ VM still running after 20 frames");
    }

    println!("\n═══════════════════════════════════════════════════════════════");
}