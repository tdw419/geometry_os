use crate::kernel::world::FileParticle;
use std::fs::File;
use std::io::BufWriter;

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
struct GpuParticle {
    pos: [f32; 2],
    _padding: [f32; 2],
    color: [f32; 4],
}

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct SubstrateConfig {
    pub atlas_width_chunks: u32,
    pub chunk_size: u32,
    pub screen_width: u32,
    pub screen_height: u32,
    pub camera_x: i32,
    pub camera_y: i32,
    // WGSL uniform structs require 16-byte alignment; pad 24 -> 32 bytes
    pub _padding: [u32; 2],
}

pub struct VisualCortex {
    device: wgpu::Device,
    queue: wgpu::Queue,
    particle_pipeline: wgpu::ComputePipeline,
    substrate_pipeline: wgpu::ComputePipeline,
    width: u32,
    height: u32,
}

impl VisualCortex {
    pub async fn new(width: u32, height: u32) -> Result<Self, String> {
        let instance = wgpu::Instance::new(&wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                ..Default::default()
            })
            .await
            .map_err(|e| format!("Failed to find a suitable GPU adapter: {}", e))?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor {
                label: Some("Visual Cortex Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
                ..Default::default()
            })
            .await
            .map_err(|e| format!("Failed to create device: {}", e))?;

        let particle_shader_src = include_str!("render.wgsl");
        let particle_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Particle Shader"),
            source: wgpu::ShaderSource::Wgsl(particle_shader_src.into()),
        });

        let substrate_shader_src = include_str!("substrate.wgsl");
        let substrate_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Substrate Shader"),
            source: wgpu::ShaderSource::Wgsl(substrate_shader_src.into()),
        });

        let particle_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Particle Pipeline"),
            layout: None,
            module: &particle_shader,
            entry_point: Some("main"),
            compilation_options: Default::default(),
            cache: None,
        });

        let substrate_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Substrate Pipeline"),
            layout: None,
            module: &substrate_shader,
            entry_point: Some("main"),
            compilation_options: Default::default(),
            cache: None,
        });

        Ok(Self {
            device,
            queue,
            particle_pipeline,
            substrate_pipeline,
            width,
            height,
        })
    }

    pub async fn render_to_file(
        &self,
        particles: &[FileParticle],
        atlas_data: Option<(&[u32], SubstrateConfig)>,
        path: &str,
    ) -> Result<(), String> {
        let gpu_particles: Vec<GpuParticle> = particles
            .iter()
            .map(|p| {
                let color = match p.file_type {
                    1 => [0.0, 1.0, 1.0, 1.0], // Cyan: Dev
                    2 => [0.5, 0.0, 0.5, 1.0], // Purple: Creative
                    3 => [0.0, 1.0, 0.0, 1.0], // Green: System
                    _ => [0.5, 0.5, 0.5, 1.0], // Gray: Default
                };
                GpuParticle {
                    pos: [p.x as f32, p.y as f32],
                    _padding: [0.0, 0.0],
                    color,
                }
            })
            .collect();

        let particle_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Particle Buffer"),
            size: (gpu_particles.len().max(1) * std::mem::size_of::<GpuParticle>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        if !gpu_particles.is_empty() {
            self.queue
                .write_buffer(&particle_buffer, 0, bytemuck::cast_slice(&gpu_particles));
        }

        let output_buffer_size = (self.width * self.height * 4) as u64;
        let output_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Output Buffer"),
            size: output_buffer_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_SRC
                | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Initialize output buffer with dark background
        let bg_color: [u8; 4] = [0x05, 0x05, 0x08, 0xff]; // Geometry OS dark background
        let bg_data = vec![bg_color; (self.width * self.height) as usize];
        self.queue
            .write_buffer(&output_buffer, 0, bytemuck::cast_slice(&bg_data));

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Visual Cortex Encoder"),
            });

        // ── Substrate Pass ─────────────────────────────────────────
        if let Some((atlas, config)) = atlas_data {
            let atlas_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Atlas Buffer"),
                size: (atlas.len() * 4) as u64,
                usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });
            self.queue
                .write_buffer(&atlas_buffer, 0, bytemuck::cast_slice(atlas));

            let config_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Substrate Config Buffer"),
                size: std::mem::size_of::<SubstrateConfig>() as u64,
                usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });
            self.queue
                .write_buffer(&config_buffer, 0, bytemuck::cast_slice(&[config]));

            let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
                label: Some("Substrate Bind Group"),
                layout: &self.substrate_pipeline.get_bind_group_layout(0),
                entries: &[
                    wgpu::BindGroupEntry {
                        binding: 0,
                        resource: config_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 1,
                        resource: atlas_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 2,
                        resource: output_buffer.as_entire_binding(),
                    },
                ],
            });

            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Substrate Compute Pass"),
                ..Default::default()
            });
            compute_pass.set_pipeline(&self.substrate_pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);
            compute_pass.dispatch_workgroups((self.width + 15) / 16, (self.height + 15) / 16, 1);
        }

        // ── Particle Pass ──────────────────────────────────────────
        {
            let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
                label: Some("Visual Cortex Bind Group"),
                layout: &self.particle_pipeline.get_bind_group_layout(0),
                entries: &[
                    wgpu::BindGroupEntry {
                        binding: 0,
                        resource: particle_buffer.as_entire_binding(),
                    },
                    wgpu::BindGroupEntry {
                        binding: 1,
                        resource: output_buffer.as_entire_binding(),
                    },
                ],
            });

            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Particle Compute Pass"),
                ..Default::default()
            });
            compute_pass.set_pipeline(&self.particle_pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);
            let workgroup_count = (gpu_particles.len() as u32 + 63) / 64;
            if workgroup_count > 0 {
                compute_pass.dispatch_workgroups(workgroup_count, 1, 1);
            }
        }

        let read_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Read Buffer"),
            size: output_buffer_size,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });

        encoder.copy_buffer_to_buffer(&output_buffer, 0, &read_buffer, 0, output_buffer_size);

        self.queue.submit(Some(encoder.finish()));

        let buffer_slice = read_buffer.slice(..);
        let (sender, receiver) = futures_intrusive::channel::shared::oneshot_channel();
        buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());

        let _ = self.device.poll(wgpu::PollType::Wait {
            submission_index: None,
            timeout: None,
        });

        if let Some(Ok(())) = receiver.receive().await {
            let data = buffer_slice.get_mapped_range();
            let mut png_data = Vec::with_capacity(data.len());
            png_data.extend_from_slice(&data);
            drop(data);
            read_buffer.unmap();

            let file = File::create(path).map_err(|e| format!("Failed to create file: {}", e))?;
            let ref mut w = BufWriter::new(file);
            let mut encoder = png::Encoder::new(w, self.width, self.height);
            encoder.set_color(png::ColorType::Rgba);
            encoder.set_depth(png::BitDepth::Eight);
            let mut writer = encoder
                .write_header()
                .map_err(|e| format!("PNG header error: {}", e))?;
            writer
                .write_image_data(&png_data)
                .map_err(|e| format!("PNG write error: {}", e))?;
            Ok(())
        } else {
            Err("Failed to map read buffer".to_string())
        }
    }
}
