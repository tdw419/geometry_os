use wgpu::*;

/// Spatial cell state for GPU physics simulation
#[derive(Debug, Clone, Copy)]
pub struct CellState {
    /// Opcode or cell type identifier
    pub opcode_or_type: f32,
    /// Initial fluid level (m³) - pressure will be computed from this
    pub fluid_level: f32,
}

impl Default for CellState {
    fn default() -> Self {
        Self {
            opcode_or_type: 0.0,
            fluid_level: 0.0,
        }
    }
}

/// Simulation parameters for physics GPU compute
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct PhysicsParams {
    pub dt: f32,              // Time step (seconds)
    pub mu: f32,              // Dynamic viscosity (Pa·s)
    pub gravity: f32,         // Gravity (m/s²)
    pub density: f32,         // Fluid density (kg/m³)
    pub grid_dim_x: u32,      // Grid width in cells
    pub grid_dim_y: u32,      // Grid height in cells
    pub grid_dim_z: u32,      // Grid depth (layers) in cells
    pub num_cells: u32,       // Total number of cells
    pub max_fluid_level: f32, // Maximum fluid per cell (m³)
}

impl Default for PhysicsParams {
    fn default() -> Self {
        Self {
            dt: 0.016,           // 60 FPS
            mu: 0.001,           // Water at 20°C
            gravity: 9.81,       // Standard gravity
            density: 1000.0,     // Water density
            grid_dim_x: 128,
            grid_dim_y: 64,
            grid_dim_z: 1,       // 2D simulation (single layer)
            num_cells: 128 * 64,
            max_fluid_level: 100.0,
        }
    }
}

/// GPU-based physics engine for refinery simulation
pub struct PhysicsGPU {
    device: Device,
    queue: Queue,

    // Compute pipeline
    compute_pipeline: ComputePipeline,
    bind_group_layout: BindGroupLayout,
    
    // Buffers
    grid_buffer: Buffer,
    params_buffer: Buffer,
    
    // Configuration
    grid_w: usize,
    grid_h: usize,
}

impl PhysicsGPU {
    /// Create a new GPU physics engine
    pub async fn new(device: Device, queue: Queue, grid_w: usize, grid_h: usize) -> Result<Self, String> {
        // Load WGSL compute shader
        let shader_source = include_str!("physics_gpu.wgsl");
        let shader_module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Refinery Physics Shader"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Physics Bind Group Layout"),
            entries: &[
                // Grid buffer (binding 0)
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Params buffer (binding 1)
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create compute pipeline
        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Refinery Physics Pipeline"),
            layout: Some(&device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
                label: Some("Physics Pipeline Layout"),
                bind_group_layouts: &[&bind_group_layout],
                push_constant_ranges: &[],
            })),
            module: &shader_module,
            entry_point: "main",
        });

        // Create grid buffer (one vec4<f32> per cell)
        let num_cells = grid_w * grid_h;
        let grid_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Physics Grid Buffer"),
            size: (num_cells * std::mem::size_of::<[f32; 4]>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create params buffer
        let params = PhysicsParams {
            grid_dim_x: grid_w as u32,
            grid_dim_y: grid_h as u32,
            grid_dim_z: 1,
            num_cells: num_cells as u32,
            ..Default::default()
        };
        
        let params_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Physics Params Buffer"),
            contents: bytemuck::bytes_of(&params),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        Ok(Self {
            device,
            queue,
            compute_pipeline,
            bind_group_layout,
            grid_buffer,
            params_buffer,
            grid_w,
            grid_h,
        })
    }

    /// Convert CellState grid to GPU format
    pub fn upload_cells(&self, cells: &[CellState]) -> Result<(), String> {
        let num_cells = self.grid_w * self.grid_h;
        if cells.len() != num_cells {
            return Err(format!("Cell count mismatch: expected {}, got {}", num_cells, cells.len()));
        }

        // Convert CellState to vec4<f32> format: [pressure, flow_rate, fluid_level, cell_type]
        let gpu_data: Vec<[f32; 4]> = cells.iter().map(|cell| {
            // Preserve the actual opcode value (1.0=TANK, 2.0=PIPE, 3.0=WALL, 0.0=EMPTY)
            let cell_type = cell.opcode_or_type;
            // Initialize with fluid_level from cell, pressure will be computed by GPU
            [0.0, 0.0, cell.fluid_level, cell_type]
        }).collect();

        self.queue.write_buffer(&self.grid_buffer, 0, bytemuck::cast_slice(&gpu_data));
        Ok(())
    }

    /// Run one physics simulation tick on GPU
    pub fn step(&self, params: &PhysicsParams) -> Result<(), String> {
        // Update params
        self.queue.write_buffer(&self.params_buffer, 0, bytemuck::bytes_of(params));

        // Create bind group
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Physics Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: self.grid_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: self.params_buffer.as_entire_binding(),
                },
            ],
        });

        // Create command encoder
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Physics Encoder"),
        });

        // Compute pass
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Physics Compute Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.compute_pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);

            // Dispatch work groups (8x8 workgroup size)
            let workgroups_x = (self.grid_w + 7) / 8;
            let workgroups_y = (self.grid_h + 7) / 8;
            compute_pass.dispatch_workgroups(workgroups_x as u32, workgroups_y as u32, 1);
        }

        // Submit commands
        self.queue.submit(Some(encoder.finish()));

        // Wait for completion
        self.device.poll(wgpu::MaintainBase::Wait);

        Ok(())
    }

    /// Read results back from GPU
    pub fn read_results(&self) -> Result<Vec<[f32; 4]>, String> {
        let num_cells = self.grid_w * self.grid_h;
        let buffer_size = (num_cells * std::mem::size_of::<[f32; 4]>()) as u64;

        // Create staging buffer for readback
        let staging_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Physics Staging Buffer"),
            size: buffer_size,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });

        // Copy GPU buffer to staging buffer
        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Readback Encoder"),
        });
        encoder.copy_buffer_to_buffer(&self.grid_buffer, 0, &staging_buffer, 0, buffer_size);
        self.queue.submit(Some(encoder.finish()));

        // Map staging buffer and read
        let buffer_slice = staging_buffer.slice(..);
        let (tx, rx) = flume::bounded(1);
        buffer_slice.map_async(wgpu::MapMode::Read, move |result| {
            tx.send(result).unwrap();
        });
        self.device.poll(wgpu::MaintainBase::Wait);
        rx.recv().unwrap().map_err(|e| format!("Buffer map error: {}", e))?;

        // Read data
        let data = buffer_slice.get_mapped_range();
        let results: Vec<[f32; 4]> = bytemuck::cast_slice(&data).to_vec();
        drop(data); // Unmap

        Ok(results)
    }
}

// Trait for buffer initialization (needed for create_buffer_init)
trait BufferInit {
    fn create_buffer_init(&self, descriptor: &wgpu::util::BufferInitDescriptor) -> wgpu::Buffer;
}

impl BufferInit for wgpu::Device {
    fn create_buffer_init(&self, descriptor: &wgpu::util::BufferInitDescriptor) -> wgpu::Buffer {
        let buffer = self.create_buffer(&wgpu::BufferDescriptor {
            label: descriptor.label,
            size: descriptor.contents.len() as u64,
            usage: descriptor.usage,
            mapped_at_creation: true,
        });

        // Write data to mapped buffer
        let data = unsafe {
            std::slice::from_raw_parts_mut(
                buffer.slice(..).get_mapped_range_mut().as_mut_ptr() as *mut u8,
                descriptor.contents.len(),
            )
        };
        data.copy_from_slice(descriptor.contents);
        buffer.unmap();
        buffer
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_physics_gpu_creation() {
        // This test requires GPU - skip in headless environments
        if std::env::var("CI").is_ok() {
            return;
        }

        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::PRIMARY,
            dx12_shader_compiler: Default::default(),
            flags: wgpu::InstanceFlags::default(),
            gles_minor_version: Default::default(),
        });
        let adapter = instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        }).await.unwrap();

        let (device, queue) = adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Test Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        ).await.unwrap();

        let physics = PhysicsGPU::new(device, queue, 64, 32).await.unwrap();
        assert_eq!(physics.grid_w, 64);
        assert_eq!(physics.grid_h, 32);
    }

    #[test]
    fn test_physics_params_default() {
        let params = PhysicsParams::default();
        assert_eq!(params.dt, 0.016);
        assert_eq!(params.mu, 0.001);
        assert_eq!(params.gravity, 9.81);
        assert_eq!(params.density, 1000.0);
    }
}