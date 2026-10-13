// Simple ecall detection test - uses sys_write (syscall 64)

use std::path::Path;

#[tokio::test]
async fn test_simple_ecall_detection() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("Simple Ecall Detection Test (sys_write)");
    println!("═══════════════════════════════════════════════════════════════");

    let binary_path = Path::new("tests/test_simple_ecall.bin");
    if !binary_path.exists() {
        panic!("test_simple_ecall.bin not found. Run the build script.");
    }

    let binary_data = std::fs::read(binary_path).expect("Failed to read test binary");
    println!("   ✓ Binary loaded: {} bytes", binary_data.len());

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

    let device = std::sync::Arc::new(device);
    let queue = std::sync::Arc::new(queue);

    // Create RISC-V executor with capabilities
    let caps = infinite_map_rs::gpu_capabilities::GpuCapabilities {
        supports_i64: false,
        vendor_name: "Test".to_string(),
        device_name: "TestDevice".to_string(),
    };
    let mut executor = infinite_map_rs::RiscvExecutor::new_with_caps(
        device.clone(),
        queue.clone(),
        &caps,
    );

    executor
        .load_program(&binary_data, 0x1000)
        .expect("Failed to load program");

    println!("   ✓ Program loaded at 0x1000");

    // Execute frames
    for i in 0..10 {
        executor.execute_frame();
        if !executor.is_running() {
            println!("   ✓ Execution halted after {} frames", i + 1);
            break;
        }
    }

    // Check if success flag was written
    let ram_slice = executor.read_ram(0x3000, 4);
    let success_flag = u32::from_le_bytes([ram_slice[0], ram_slice[1], ram_slice[2], ram_slice[3]]);

    println!("   Success flag at 0x3000: {}", success_flag);

    if success_flag == 1 {
        println!("═══════════════════════════════════════════════════════════════");
        println!("Simple Ecall Detection Test: PASSED ✓");
        println!("═══════════════════════════════════════════════════════════════");
    } else {
        println!("═══════════════════════════════════════════════════════════════");
        println!("Simple Ecall Detection Test: FAILED ✗");
        println!("═══════════════════════════════════════════════════════════════");
        panic!("Ecall did not execute correctly (success flag was 0)");
    }
}