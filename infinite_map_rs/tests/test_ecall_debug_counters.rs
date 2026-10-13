// Test Phase 5.2: ECALL Debug Counter Infrastructure
//
// This test verifies that the debug counters properly trace ECALL execution
// through the pipeline. It helps identify where ECALL processing fails.

use infinite_map_rs::riscv_executor::RiscvExecutor;
use infinite_map_rs::gpu_capabilities::{GpuCapabilities, I64Strategy};

#[test]
fn test_ecall_debug_counters_work() {
    println!("\n=== ECALL Debug Counters Test ===\n");

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = pollster::block_on(instance.request_adapter(
        &wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
    )
    .expect("No adapter found");

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Test Device"),
            required_features: wgpu::Features::empty(),
            required_limits: wgpu::Limits::default(),
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

    // Load minimal test binary with ECALL
    let binary_bytes =
        std::fs::read("tests/test_minimal_ecall.bin").expect("Failed to load test binary");

    executor.load_binary(&binary_bytes, 0x1000);
    executor.set_pc(0x1000);

    // Execute a few frames to reach ECALL
    for _ in 0..10 {
        executor.execute_frame();
    }

    // Read debug counters
    let counters = executor.read_debug_counters();

    println!("=== ECALL Debug Counters ===");
    println!("Counter 0 (ECALL PC fetch at 0x1040): {}", counters[0]);
    println!("Counter 1 (OP_SYSTEM case entry): {}", counters[1]);
    println!("Counter 2 (handle_syscall call): {}", counters[2]);
    println!("Counter 3 (syscall 291 seen): {}", counters[3]);
    println!("Counter 4 (vm_status set): {}", counters[4]);

    // Verify counter infrastructure works (all should be accessible)
    // We don't assert specific values yet - we just check that the
    // infrastructure is functioning and we can read the counters.
    assert!(counters.len() == 5, "Should have 5 debug counters");

    // If the ECALL is working, counter 0 should be >0 (we fetched PC=0x1040)
    // and counter 2 should be >0 (handle_syscall was called)
    if counters[0] > 0 {
        println!("✓ ECALL at 0x1040 was fetched");
        if counters[1] > 0 {
            println!("✓ OP_SYSTEM case was entered");
            if counters[2] > 0 {
                println!("✓ handle_syscall was called");
                if counters[3] > 0 {
                    println!("✓ syscall 291 was detected");
                    if counters[4] > 0 {
                        println!("✓ vm_status was set (ECALL fully processed!)");
                    } else {
                        println!("✗ vm_status NOT set (handle_syscall didn't complete)");
                    }
                } else {
                    println!("✗ syscall 291 NOT detected (wrong syscall number in a7?)");
                }
            } else {
                println!("✗ handle_syscall NOT called (OP_SYSTEM case failed)");
            }
        } else {
            println!("✗ OP_SYSTEM case NOT entered (opcode decode failed)");
        }
    } else {
        println!("✗ ECALL at 0x1040 was NOT fetched (PC didn't reach 0x1040)");
    }
}