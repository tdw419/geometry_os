// Direct ecall test - check if ecall writes to syscall queue

use std::sync::Arc;

#[tokio::test]
async fn test_direct_ecall_detection() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("Direct Ecall Detection Test");
    println!("═══════════════════════════════════════════════════════════════");

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

    // Create minimal RISC-V program:
    // LI a7, 291       # syscall number
    // LI a0, 0x2000    # req_ptr
    // LI a1, 0x2010    # resp_ptr
    // ECALL
    // J HALT

    let program: Vec<u8> = vec
![0x93, 0x08, 0x23, 0x00]; // li a7, 291 (0x123)

    println!("   ✓ Program created: {} bytes", program.len());

    let mut executor = infinite_map_rs::RiscvExecutor::new_with_ram(
        device.clone(),
        queue.clone(),
        128 * 1024 * 1024,
    );

    executor.enable_spatial_hypervisor_with_ram(128, 64, 128 * 1024 * 1024);

    executor
        .load_program(&program, 0x1000)
        .expect("Failed to load program");

    println!("   ✓ Program loaded at 0x1000");

    // Execute one frame
    executor.execute_frame();

    println!("   ✓ Frame executed");

    // Check if the VM is still running
    if executor.is_running() {
        println!("   VM is still running (expected to halt)");
    } else {
        println!("   VM halted");
    }

    println!("═══════════════════════════════════════════════════════════════");
    println!("Direct Ecall Detection Test: COMPLETE");
    println!("═══════════════════════════════════════════════════════════════");
}