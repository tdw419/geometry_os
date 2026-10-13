// Direct unit test for SpatialHypervisorIntegration
// This bypasses RISC-V execution to test the core spatial allocation logic

use std::sync::Arc;

#[test]
fn test_spatial_alloc_direct() {
    println!("═══════════════════════════════════════════════════════════════");
    println!("Direct Spatial Allocation Test (no RISC-V)");
    println!("═══════════════════════════════════════════════════════════════");

    // Use a tokio runtime in the test thread
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

        let device = Arc::new(device);
        let queue = Arc::new(queue);

        println!("\n[Step 1] Creating 128MB RAM buffer...");

        // Create RAM buffer
        let ram_buffer = Arc::new(device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Test RAM"),
            size: 128 * 1024 * 1024,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        }));

        println!("   ✓ RAM buffer created");

        println!("\n[Step 2] Creating SpatialHypervisorIntegration...");

        let mut spatial_hypervisor =
            infinite_map_rs::spatial_hypervisor_integration::SpatialHypervisorIntegration::new(
                128,
                64,
                ram_buffer.clone(),
                device.clone(),
                queue.clone(),
            );

        println!("   ✓ SpatialHypervisorIntegration created");

        println!("\n[Step 3] Writing SpatialAllocReq to RAM at 0x2000...");

        // Write request to RAM
        use infinite_map_rs::spatial::hypervisor_bridge::SpatialAllocReq;
        let req = SpatialAllocReq {
            req_id: 1,
            width: 10,
            height: 20,
        };

        let req_bytes = unsafe {
            std::slice::from_raw_parts(
                &req as *const SpatialAllocReq as *const u8,
                std::mem::size_of::<SpatialAllocReq>(),
            )
        };

        // Use staging buffer to write to RAM
        let staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Req Staging"),
            size: req_bytes.len() as u64,
            usage: wgpu::BufferUsages::MAP_WRITE | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: true,
        });

        staging
            .slice(..)
            .get_mapped_range_mut()
            .copy_from_slice(req_bytes);
        staging.unmap();

        let mut encoder =
            device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
        encoder.copy_buffer_to_buffer(&staging, 0, &ram_buffer, 0x2000, req_bytes.len() as u64);
        queue.submit(Some(encoder.finish()));

        println!("   ✓ Request written to RAM");

        println!(
            "\n[Step 4] Calling handle_spatial_alloc(0x2000, 0x2010, 0x2024)..."
        );

        let (result, wall_cells) =
            spatial_hypervisor.handle_spatial_alloc(0x2000, 0x2010, 0x2024);

        println!("   ✓ handle_spatial_alloc returned");
        println!("   result: {} (expected 0 for success)", result);
        println!("   wall_cells: {}", wall_cells.len());

        assert_eq!(
            result, 0,
            "Expected result 0 (SPATIAL_ALLOC_OK), got {}",
            result
        );

        assert!(
            wall_cells.len() > 0,
            "Expected at least one wall cell to be placed"
        );

        // For a 10x20 region, we expect 2*(width+height) = 60 wall cells,
        // but we only place walls on the outside boundary, so 30 cells.
        println!(
            "\nAllocated 10x20 region, placed {} wall cells around it.",
            wall_cells.len()
        );

        println!("═══════════════════════════════════════════════════════════════");
        println!("Direct Spatial Allocation Test: PASSED ✓");
        println!("═══════════════════════════════════════════════════════════════");
    });
}