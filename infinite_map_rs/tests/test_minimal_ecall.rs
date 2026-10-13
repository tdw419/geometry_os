// Minimal ECALL test using debug counters
// Tests if ECALL reaches handle_syscall()

use infinite_map_rs::riscv_executor::RiscvExecutor;
use infinite_map_rs::gpu_capabilities::GpuCapabilities;

#[test]
fn test_minimal_ecall_with_debug_counters() {
    println!("\n=== Minimal ECALL Test with Debug Counters ===\n");

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

    // Get adapter limits and request higher storage buffer limit
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

    // Create RISC-V executor
    let caps = GpuCapabilities {
        supports_i64: false,
        vendor_name: "Test".to_string(),
        device_name: "TestDevice".to_string(),
    };
    let mut executor = RiscvExecutor::new_with_caps(device.clone(), queue.clone(), &caps);

    // Load minimal ECALL test binary
    let binary_bytes =
        std::fs::read("tests/test_minimal_ecall.bin").expect("Failed to load test binary");

    executor.load_binary(&binary_bytes, 0x1000);
    executor.set_pc(0x1000);

    // Execute frames
    println!("Running 10 frames...");
    for i in 0..10 {
        executor.execute_frame();
        println!("  Frame {} complete", i + 1);
    }

    // Read debug counters
    let counters = executor.read_debug_counters();

    println!("\n=== Debug Counter Results ===");
    println!("Counter 0 (ECALL PC fetch at 0x1040): {}", counters[0]);
    println!("Counter 1 (OP_SYSTEM case entry): {}", counters[1]);
    println!("Counter 2 (handle_syscall call): {}", counters[2]);
    println!("Counter 3 (syscall 291 detection): {}", counters[3]);
    println!("Counter 4 (vm_status set): {}", counters[4]);

    println!("\n=== Analysis ===");
    if counters[0] > 0 {
        println!("✓ PC fetched instruction at ECALL address");
        if counters[1] > 0 {
            println!("✓ Decoded as OP_SYSTEM instruction");
            if counters[2] > 0 {
                println!("✓ handle_syscall() was called");
                if counters[3] > 0 {
                    println!("✓ syscall 291 detected");
                    if counters[4] > 0 {
                        println!("✓ vm_status was set - ECALL COMPLETE!");
                    } else {
                        println!("✗ vm_status NOT set - handle_syscall didn't complete");
                    }
                } else {
                    println!("✗ syscall 291 NOT detected - wrong syscall number in a7?");
                }
            } else {
                println!("✗ handle_syscall NOT called - OP_SYSTEM case failed?");
            }
        } else {
            println!("✗ NOT decoded as OP_SYSTEM - instruction decode failed?");
        }
    } else {
        println!("✗ PC never reached ECALL address - didn't execute?");
    }

    println!("\n");
}