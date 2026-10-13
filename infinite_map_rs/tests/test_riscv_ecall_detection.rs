// Minimal RISC-V test to verify ecall detection
// Just does a simple store then ecall, then halt

#[test]
fn test_riscv_ecall_detection() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("RISC-V Ecall Detection Test");
    println!("═══════════════════════════════════════════════════════════════");

    let rt = tokio::runtime::Runtime::new().expect("Failed to create runtime");

    rt.block_on(async {
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

        // Create a minimal RISC-V program that does ecall 0x123
        // LUI t0, 0x20000   # t0 = 0x2000
        // SW t1, 0(t0)      # Store to test area
        // LI a7, 0x123      # Set syscall number
        // ECALL             # Make hypercall
        // HALT: J HALT      # Loop forever

        let mut program = vec
            ![0xb7, 0x02, 0x00, 0x02]; // lui t0, 0x20000 (0x2000 in upper 20 bits)
                                        // sw t1, 0(t0) - t1 should be 1, store at t0
    });
}