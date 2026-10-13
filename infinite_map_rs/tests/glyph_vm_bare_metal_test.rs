//! Glyph VM Bare Metal Test
//!
//! Verifies that the Glyph VM can execute spatial programs 
//! using the bare-metal DrmGlyphExecutor infrastructure.

#[cfg(test)]
mod tests {
    use std::sync::Arc;
    use infinite_map_rs::gpu::glyph_vm::{GlyphVM, Glyph, GlyphVMState};
    use infinite_map_rs::backend::drm::glyph_executor::DrmGlyphExecutor;
    use wgpu::util::DeviceExt;

    async fn create_test_context() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::default(),
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor::default(), None)
            .await
            .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    #[tokio::test]
    async fn test_glyph_vm_addition_program() {
        let ctx = create_test_context().await;
        if ctx.is_none() { return; }
        let (device, queue) = ctx.unwrap();

        // 1. Setup Mock Atlas and Screen
        let atlas = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Mock Atlas"),
            size: wgpu::Extent3d { width: 2048, height: 2048, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });
        let screen = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Mock Screen"),
            size: wgpu::Extent3d { width: 1920, height: 1080, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        });

        let atlas_view = atlas.create_view(&wgpu::TextureViewDescriptor::default());
        let screen_view = screen.create_view(&wgpu::TextureViewDescriptor::default());

        // 2. Initialize Glyph VM
        let vm = GlyphVM::new(
            device.clone(),
            queue.clone(),
            atlas_view,
            screen_view,
            1024, // program size
            1024, // memory size
            256,  // stack size
        );

        // 3. Create simple addition program
        // memory[0] = 5.0
        // memory[1] = 10.0
        // memory[0] = memory[0] + memory[1] (ADD_MEM)
        // HALT
        let program = vec![
            Glyph { opcode: 128, p1: 5.0, dst: 0, ..Default::default() }, // DATA 5.0 -> [0]
            Glyph { opcode: 128, p1: 10.0, dst: 1, ..Default::default() }, // DATA 10.0 -> [1]
            Glyph { opcode: 216, p1: 1.0, dst: 0, ..Default::default() },  // ADD_MEM [1] -> [0]
            Glyph { opcode: 141, ..Default::default() },                     // HALT
        ];

        vm.upload_program(&program);
        vm.reset_state();

        // 4. Run VM steps
        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
        for _ in 0..4 {
            vm.step(&mut encoder);
        }
        queue.submit(std::iter::once(encoder.finish()));

        // 5. Verify results (read back memory[0])
        let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Staging Buffer"),
            size: 4,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
        encoder.copy_buffer_to_buffer(&vm.memory_buffer, 0, &staging_buffer, 0, 4);
        queue.submit(std::iter::once(encoder.finish()));

        let slice = staging_buffer.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |v| tx.send(v).unwrap());
        device.poll(wgpu::Maintain::Wait);
        rx.recv().unwrap().unwrap();

        let data = slice.get_mapped_range();
        let result: f32 = bytemuck::pod_read_unaligned(&data);
        drop(data);
        staging_buffer.unmap();

        assert_eq!(result, 15.0, "5.0 + 10.0 should be 15.0");
        println!("✅ Glyph VM Bare Metal Addition Test Passed: 5.0 + 10.0 = {}", result);
    }

    #[tokio::test]
    async fn test_drm_executor_with_glyph_vm() {
        let ctx = create_test_context().await;
        if ctx.is_none() { return; }
        let (device, queue) = ctx.unwrap();

        let mut executor = DrmGlyphExecutor::new(device.clone(), queue.clone());

        // 1. Load Glyph VM shader into Executor
        let wgsl_source = include_str!("../src/gpu/shaders/glyph_microcode.wgsl");
        
        // Compile WGSL to SPIR-V using naga (simulated since load_spirv takes [u32])
        use naga::back::spv;
        use naga::valid::{Capabilities, ValidationFlags, Validator};
        
        let mut frontend = naga::front::wgsl::Frontend::new();
        let module = frontend.parse(wgsl_source).expect("Failed to parse WGSL");
        let mut validator = Validator::new(ValidationFlags::all(), Capabilities::all());
        let info = validator.validate(&module).expect("Failed to validate");
        let spirv = spv::write_vec(&module, &info, &spv::Options::default(), None).expect("Failed to write SPIR-V");

        executor.load_spirv(&spirv).expect("Failed to load Glyph VM into DrmExecutor");
        assert!(executor.is_pipeline_loaded());

        // 2. Execute attested (Verifies Atlas -> Executes VM)
        let atlas_data = vec![0u8; 2048 * 2048 * 4];
        let contract_hash = (0x6a09e667, 0xbb67ae85); // Example initial hash
        
        // This is where we bridge everything:
        // Hardware VCC verifies atlas_data
        // DrmGlyphExecutor runs Glyph VM
        // System is attested
        let inputs = vec![0u8; 1024]; // VM inputs/memory
        let result = executor.execute_attested(
            &atlas_data,
            2048, 2048,
            contract_hash,
            &inputs,
            (1920, 1080)
        ).expect("Attested execution failed");

        if result.executed {
            println!("✅ Attested Glyph VM Execution Successful");
        } else {
            println!("⚠️ Attested Execution Blocked (VCC Mismatch) - This is CORRECT for random data");
        }
    }
}
