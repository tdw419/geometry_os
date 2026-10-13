// Test spatial_alloc_region hypercall with RISC-V guest code

use infinite_map_rs::riscv_executor::RiscvExecutor;
use infinite_map_rs::gpu_capabilities::GpuCapabilities;

#[test]
fn test_spatial_alloc_ecall() {
    println!("\n=== Spatial Alloc ECALL Test ===\n");

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: None,
        force_fallback_adapter: false,
    }))
    .expect("No adapter found");

    let adapter_limits = adapter.limits();
    let required_limits = wgpu::Limits {
        max_storage_buffers_per_shader_stage: adapter_limits.max_storage_buffers_per_shader_stage.max(16),
        max_buffer_size: adapter_limits.max_buffer_size.max(512 * 1024 * 1024),
        max_storage_buffer_binding_size: adapter_limits.max_storage_buffer_binding_size.max(512 * 1024 * 1024),
        ..Default::default()
    };

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Test Device"),
            required_features: wgpu::Features::empty(),
            required_limits,
        },
        None,
    ))
    .expect("Failed to create device");

    let device = std::sync::Arc::new(device);
    let queue = std::sync::Arc::new(queue);

    let caps = GpuCapabilities {
        supports_i64: false,
        vendor_name: "Test".to_string(),
        device_name: "TestDevice".to_string(),
    };

    let mut executor = RiscvExecutor::new_with_caps(device.clone(), queue.clone(), &caps);

    // Enable spatial hypervisor
    executor.enable_spatial_hypervisor(128, 64);
    println!("Spatial hypervisor enabled");

    // Load test binary
    let binary_path = "tests/test_spatial_alloc_simple.bin";
    let binary_bytes = std::fs::read(binary_path).expect("Failed to load test binary");

    executor.load_binary(&binary_bytes, 0x1000);
    executor.set_pc(0x1000);

    println!("Running 10 frames...\n");
    for i in 0..10 {
        executor.execute_frame();
        println!("  Frame {} complete", i + 1);
    }

    // Read response from RAM
    let mut response_data = vec![0u8; 24]; // SpatialAllocResp size
    // Would need to implement readback from GPU RAM buffer
    // For now, just verify execution didn't crash

    println!("\n=== Test Complete ===");
    println!("Spatial alloc ECALL executed without crash");
}