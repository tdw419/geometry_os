use bytemuck::{Pod, Zeroable};
use wgpu::util::DeviceExt;

#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct SubstrateParams {
    pub width: u32,
    pub height: u32,
    pub time: u32,
    pub clock: u32, // Global clock signal (bit 0 = clock state)
    pub mutation_rate: f32,
}

pub struct ActiveSubstrate {
    pub device: wgpu::Device,
    pub queue: wgpu::Queue,
    pub substrate_a_buffer: wgpu::Buffer,
    pub substrate_b_buffer: wgpu::Buffer,
    pub params_uniform: wgpu::Buffer,
    pub staging_buffer: wgpu::Buffer, // Reusable staging buffer for single/batch reads
    pub compute_pipeline: wgpu::ComputePipeline,
    pub bind_group_a: wgpu::BindGroup,
    pub bind_group_b: wgpu::BindGroup,
    pub width: u32,
    pub height: u32,
    pub current_is_a: bool,
    pub substrate: Vec<u32>, // Host-side mirror for fast fetch
}

impl ActiveSubstrate {
    pub fn new(device: &wgpu::Device, queue: &wgpu::Queue, width: u32, height: u32) -> Self {
        let size = (width * height * 4) as wgpu::BufferAddress;
        let substrate = vec![0u32; (width * height) as usize];

        let substrate_a_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Substrate A"),
            size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_SRC
                | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let substrate_b_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Substrate B"),
            size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_SRC
                | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let params_uniform = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Substrate Params"),
            contents: bytemuck::cast_slice(&[SubstrateParams {
                width,
                height,
                time: 0,
                clock: 0,
                mutation_rate: 1.0,
            }]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Pre-allocate a 16KB staging buffer for readbacks (covers up to 4096 pixel batch)
        let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Substrate Readback Staging"),
            size: 16384,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Active Substrate Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("active_substrate.wgsl").into()),
        });

        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Substrate Pipeline"),
            layout: None,
            module: &shader_module,
            entry_point: Some("main"),
            compilation_options: Default::default(),
            cache: None,
        });

        let bind_group_layout = compute_pipeline.get_bind_group_layout(0);

        let bind_group_a = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Bind Group A (A->B)"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: substrate_a_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: substrate_b_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: params_uniform.as_entire_binding(),
                },
            ],
        });

        let bind_group_b = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Bind Group B (B->A)"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: substrate_b_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: substrate_a_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: params_uniform.as_entire_binding(),
                },
            ],
        });

        Self {
            device: device.clone(),
            queue: queue.clone(),
            substrate_a_buffer,
            substrate_b_buffer,
            params_uniform,
            staging_buffer,
            compute_pipeline,
            bind_group_a,
            bind_group_b,
            width,
            height,
            current_is_a: true,
            substrate,
        }
    }

    pub fn update(&mut self, time: u32, mutation_rate: f32) {
        self.queue.write_buffer(
            &self.params_uniform,
            0,
            bytemuck::cast_slice(&[SubstrateParams {
                width: self.width,
                height: self.height,
                time,
                clock: time % 2,
                mutation_rate,
            }]),
        );

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
        {
            let mut cpass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: None,
                timestamp_writes: None,
            });
            cpass.set_pipeline(&self.compute_pipeline);
            if self.current_is_a {
                cpass.set_bind_group(0, &self.bind_group_a, &[]);
            } else {
                cpass.set_bind_group(0, &self.bind_group_b, &[]);
            }
            cpass.dispatch_workgroups((self.width + 7) / 8, (self.height + 7) / 8, 1);
        }
        self.queue.submit(std::iter::once(encoder.finish()));
        self.current_is_a = !self.current_is_a;
    }

    pub fn set_substrate(&mut self, pixels: &[u32]) {
        self.substrate = pixels.to_vec();
        let buffer = if self.current_is_a {
            &self.substrate_a_buffer
        } else {
            &self.substrate_b_buffer
        };
        self.queue
            .write_buffer(buffer, 0, bytemuck::cast_slice(pixels));
    }

    pub async fn get_substrate(&mut self) -> Vec<u32> {
        let buffer = if self.current_is_a {
            &self.substrate_a_buffer
        } else {
            &self.substrate_b_buffer
        };
        let size = (self.width * self.height * 4) as wgpu::BufferAddress;
        let staging_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Substrate Full Staging"),
            size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
        encoder.copy_buffer_to_buffer(buffer, 0, &staging_buffer, 0, size);
        self.queue.submit(std::iter::once(encoder.finish()));
        let buffer_slice = staging_buffer.slice(..);
        let (sender, receiver) = futures_intrusive::channel::shared::oneshot_channel();
        buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());
        let _ = self.device.poll(wgpu::PollType::Wait {
            submission_index: None,
            timeout: None,
        });
        if let Some(Ok(())) = receiver.receive().await {
            let data = buffer_slice.get_mapped_range();
            let result = bytemuck::cast_slice(&data).to_vec();
            drop(data);
            staging_buffer.unmap();
            self.substrate = result.clone();
            result
        } else {
            vec![0; (self.width * self.height) as usize]
        }
    }

    pub fn get_pixel(&mut self, x: u32, y: u32) -> u32 {
        let results = self.get_pixels(&[(x, y)]);
        if results.is_empty() {
            0
        } else {
            results[0]
        }
    }

    pub fn get_pixels(&mut self, coords: &[(u32, u32)]) -> Vec<u32> {
        let mut results = vec![0u32; coords.len()];
        if coords.is_empty() {
            return results;
        }
        let batch_len = (16384 / 4) as usize;
        let buffer = if self.current_is_a {
            &self.substrate_a_buffer
        } else {
            &self.substrate_b_buffer
        };
        for (batch_idx, chunk) in coords.chunks(batch_len).enumerate() {
            let mut encoder = self.device.create_command_encoder(&Default::default());
            for (i, &(x, y)) in chunk.iter().enumerate() {
                if x >= self.width || y >= self.height {
                    continue;
                }
                let offset = (y * self.width + x) * 4;
                encoder.copy_buffer_to_buffer(
                    buffer,
                    offset as u64,
                    &self.staging_buffer,
                    (i * 4) as u64,
                    4,
                );
            }
            self.queue.submit(std::iter::once(encoder.finish()));
            let slice_size = (chunk.len() * 4) as u64;
            let buffer_slice = self.staging_buffer.slice(..slice_size);
            let (sender, receiver) = futures_intrusive::channel::shared::oneshot_channel();
            buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());
            let _ = self.device.poll(wgpu::PollType::Wait {
                submission_index: None,
                timeout: None,
            });
            pollster::block_on(async {
                if let Some(Ok(())) = receiver.receive().await {
                    let data = buffer_slice.get_mapped_range();
                    let pixels: &[u32] = bytemuck::cast_slice(&data);
                    for (i, &p) in pixels.iter().enumerate() {
                        results[batch_idx * batch_len + i] = p;
                    }
                    drop(data);
                    self.staging_buffer.unmap();
                }
            });
        }
        results
    }

    pub fn inject_signal(&mut self, x: u32, y: u32, taxonomy: u32, dir: u32, color: u32) {
        let pixel = (taxonomy << 28) | (dir << 24) | (color & 0x00FFFFFF);
        self.set_pixel(x, y, pixel);
    }

    /// Directly write a raw u32 pixel to the substrate.
    pub fn set_pixel(&mut self, x: u32, y: u32, pixel: u32) {
        if x >= self.width || y >= self.height {
            return;
        }
        let offset = (y * self.width + x) * 4;
        let buffer = if self.current_is_a {
            &self.substrate_a_buffer
        } else {
            &self.substrate_b_buffer
        };
        self.queue
            .write_buffer(buffer, offset as u64, bytemuck::cast_slice(&[pixel]));
    }

    /// Get coordinates for a new element based on its usage 'heat'.
    /// Hot: Near center (128, 128)
    /// Warm: Middle ring
    /// Cold: Edges
    pub fn get_spatial_coords(&self, usage: &str, index: u32) -> (u32, u32) {
        match usage {
            "hot" => {
                let r = 20;
                let cx = 128;
                let cy = 128;
                let x = cx + (index % (2 * r)) as i32 - r as i32;
                let y = cy + (index / (2 * r)) as i32 - r as i32;
                (x as u32, y as u32)
            },
            "warm" => {
                let r_inner = 30;
                let r_outer = 60;
                // Simple ring distribution
                let angle = (index as f32 * 0.1) % (2.0 * std::f32::consts::PI);
                let radius = r_inner as f32 + (index % (r_outer - r_inner)) as f32;
                let x = 128.0 + radius * angle.cos();
                let y = 128.0 + radius * angle.sin();
                (x as u32, y as u32)
            },
            "cold" | _ => {
                let x = (index % self.width) as u32;
                let y = (index / self.width) as u32;
                // Flip to edges if possible
                if index % 2 == 0 {
                    (x % 20, y)
                } else {
                    (self.width - 1 - (x % 20), y)
                }
            },
        }
    }

    /// Phase Q: Apply Hebbian learning with synaptic decay.
    /// Scans for TAXONOMY_WIRE_ACTIVE (15u) and increments weight (red channel).
    /// All wires (TAXONOMY_WIRE and TAXONOMY_WIRE_ACTIVE) are decayed by a factor.
    pub fn apply_hebbian_learning_with_decay(&mut self, decay_rate: f32, bump_size: u8) {
        let mut pixels = pollster::block_on(self.get_substrate());
        let mut changed = false;

        for y in 0..self.height {
            for x in 0..self.width {
                let idx = (y * self.width + x) as usize;
                let p = pixels[idx];
                let tax = p >> 28;

                // If it's a wire (14) or active wire (15), it has a weight
                if tax == 14 || tax == 15 {
                    let old_weight = ((p >> 16) & 0xFF) as f32;

                    // 1. Apply Decay: w = w * (1 - decay_rate)
                    let mut new_weight_f = old_weight * (1.0 - decay_rate);

                    // 2. Apply Hebbian Bump if active
                    if tax == 15 {
                        new_weight_f += bump_size as f32;
                    }

                    let new_weight = (new_weight_f.clamp(0.0, 255.0)) as u32;

                    if new_weight != old_weight as u32 {
                        let new_p = (p & 0xFF00FFFF) | (new_weight << 16);
                        pixels[idx] = new_p;
                        changed = true;
                    }
                }
            }
        }

        if changed {
            self.set_substrate(&pixels);
        }
    }
}
