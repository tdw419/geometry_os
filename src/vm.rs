// Glyph VM - GPU Compute Pipeline
//
// This is the bridge between CPU and GPU. It:
// 1. Creates the 4096x4096 RAM texture on the GPU
// 2. Uploads program pixels from the substrate
// 3. Spawns VMs at specific addresses
// 4. Dispatches the compute shader (glyph_vm_scheduler.wgsl)
// 5. Reads back results for verification
//
// The shader runs in parallel: 8 VMs, each executing up to 1024 cycles.
// Each VM reads instructions from the texture, executes them, writes results
// back to the same texture. The program IS the texture.

use crate::substrate::{Substrate, TEXTURE_SIZE};

/// VM state constants (must match WGSL)
pub mod vm_state {
    pub const INACTIVE: u32 = 0;
    pub const RUNNING: u32 = 1;
    pub const HALTED: u32 = 2;
}

/// Per-VM state matching the WGSL VmState struct.
/// 128 regs (512 bytes) + fields (64 bytes) + stack (256 bytes) = 832 bytes.
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VmState {
    pub regs: [u32; 128],    // 512 bytes
    pub pc: u32,             // offset 512
    pub halted: u32,         // offset 516
    pub stratum: u32,        // offset 520
    pub cycles: u32,         // offset 524
    pub stack_ptr: u32,      // offset 528
    pub vm_id: u32,          // offset 532
    pub state: u32,          // offset 536
    pub parent_id: u32,      // offset 540
    pub entry_point: u32,    // offset 544
    pub base_addr: u32,      // offset 548
    pub bound_addr: u32,     // offset 552
    pub eap_coord: u32,      // offset 556
    pub generation: u32,     // offset 560
    pub attention_mask: u32, // offset 564
    pub _pad: [u32; 2],      // offset 568-575
    pub stack: [u32; 64],    // offset 576-831
}
// Total: 832 bytes

impl Default for VmState {
    fn default() -> Self {
        Self {
            regs: [0; 128],
            pc: 0,
            halted: 0,
            stratum: 0,
            cycles: 0,
            stack_ptr: 0,
            vm_id: 0,
            state: vm_state::INACTIVE,
            parent_id: 0xFF,
            entry_point: 0,
            base_addr: 0,
            bound_addr: 0,
            eap_coord: 0,
            generation: 0,
            attention_mask: 0,
            _pad: [0; 2],
            stack: [0; 64],
        }
    }
}

/// Scheduler state matching WGSL
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct SchedulerState {
    pub active_count: u32,
    pub frame: u32,
    pub spawn_count: u32,
    pub padding: u32,
}

/// The Glyph VM - owns the GPU pipeline and RAM texture.
pub struct GlyphVm {
    device: wgpu::Device,
    queue: wgpu::Queue,
    pipeline: wgpu::ComputePipeline,
    bind_group: Option<wgpu::BindGroup>,
    ram_texture: wgpu::Texture,
    vm_buffer: wgpu::Buffer,
    scheduler_buffer: wgpu::Buffer,
    #[allow(dead_code)]
    message_buffer: wgpu::Buffer,
    vm_states: [VmState; 8],
    substrate: Substrate,
}

impl GlyphVm {
    /// Initialize the GPU, create the texture and pipeline.
    pub fn new() -> Self {
        let instance = wgpu::Instance::default();
        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        }))
        .expect("No GPU adapter found. Need a GPU for pixels to move pixels.");

        let (device, queue) = pollster::block_on(adapter.request_device(
            &wgpu::DeviceDescriptor {
                label: Some("Pixels Move Pixels"),
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                required_limits: wgpu::Limits::default(),
            },
            None,
        ))
        .expect("Failed to get GPU device");

        // Load the compute shader
        let shader_source = include_str!("../shaders/glyph_vm_scheduler.wgsl");
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph VM Scheduler"),
            source: wgpu::ShaderSource::Wgsl(shader_source.into()),
        });

        // Create the 4096x4096 RAM texture
        let ram_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("RAM Texture"),
            size: wgpu::Extent3d {
                width: TEXTURE_SIZE,
                height: TEXTURE_SIZE,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::TEXTURE_BINDING
                | wgpu::TextureUsages::STORAGE_BINDING
                | wgpu::TextureUsages::COPY_DST
                | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        });

        // Bind group layout: must match WGSL bindings
        // 0: RAM texture (storage, read_write)
        // 1: VM states (storage, read_write)
        // 2: Scheduler state (storage, read_write)
        // 3: Message queue (storage, read_write)
        // 4: Event queue header (storage, read_only)
        // 5: Event queue (storage, read_only)
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph VM Bind Layout"),
            entries: &[
                // Binding 0: RAM Texture
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::ReadWrite,
                        format: wgpu::TextureFormat::Rgba8Uint,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
                // Binding 1: VM States
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 2: Scheduler State
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 3: Message Queue
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 4: Event Header (read only)
                wgpu::BindGroupLayoutEntry {
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 5: Event Queue (read only)
                wgpu::BindGroupLayoutEntry {
                    binding: 5,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph VM Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph VM Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // Create GPU buffers
        let vm_buffer_size = (std::mem::size_of::<VmState>() * 8) as u64;
        let vm_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("VM States"),
            size: vm_buffer_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let scheduler_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Scheduler State"),
            size: std::mem::size_of::<SchedulerState>() as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let message_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Message Queue"),
            size: 576,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Placeholder buffers for event queue (bindings 4 & 5)
        let event_header_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Event Header"),
            size: 16,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let event_queue_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Event Queue"),
            size: 1024 * 32,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create bind group
        let ram_view = ram_texture.create_view(&wgpu::TextureViewDescriptor::default());
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph VM Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&ram_view),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: vm_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: scheduler_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: message_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 4,
                    resource: event_header_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 5,
                    resource: event_queue_buffer.as_entire_binding(),
                },
            ],
        });

        let _vm_states = {
            let states = vec![VmState::default(); 8];
            states
        };

        eprintln!(
            "[PMP] GPU initialized: {} RAM texture ({}MB)",
            TEXTURE_SIZE,
            (TEXTURE_SIZE * TEXTURE_SIZE * 4) / (1024 * 1024)
        );

        Self {
            device,
            queue,
            pipeline,
            bind_group: Some(bind_group),
            ram_texture,
            vm_buffer,
            scheduler_buffer,
            message_buffer,
            vm_states: [
                VmState::default(),
                VmState::default(),
                VmState::default(),
                VmState::default(),
                VmState::default(),
                VmState::default(),
                VmState::default(),
                VmState::default(),
            ],
            substrate: Substrate::new(),
        }
    }

    /// Access the substrate for loading programs
    pub fn substrate(&self) -> &Substrate {
        &self.substrate
    }

    /// Spawn a VM at the given Hilbert address
    pub fn spawn_vm(&mut self, vm_id: u32, entry_point: u32) {
        assert!(vm_id < 8, "VM id must be 0-7");
        let vm = &mut self.vm_states[vm_id as usize];
        vm.vm_id = vm_id;
        vm.pc = entry_point;
        vm.entry_point = entry_point;
        vm.state = vm_state::RUNNING;
        vm.halted = 0;
        eprintln!("[PMP] Spawned VM {} at address {}", vm_id, entry_point);
    }

    /// Upload substrate to GPU texture and VM states to buffers,
    /// then dispatch one frame of compute.
    pub fn execute_frame(&mut self) {
        // Upload substrate shadow to GPU texture
        let shadow = self.substrate.shadow_clone();
        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &shadow,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(TEXTURE_SIZE * 4),
                rows_per_image: Some(TEXTURE_SIZE),
            },
            wgpu::Extent3d {
                width: TEXTURE_SIZE,
                height: TEXTURE_SIZE,
                depth_or_array_layers: 1,
            },
        );

        // Upload VM states
        let vm_bytes: Vec<u8> = self
            .vm_states
            .iter()
            .flat_map(|vm| unsafe {
                let ptr = vm as *const VmState as *const u8;
                std::slice::from_raw_parts(ptr, std::mem::size_of::<VmState>())
            })
            .copied()
            .collect();
        self.queue.write_buffer(&self.vm_buffer, 0, &vm_bytes);

        // Upload scheduler state
        let scheduler = SchedulerState {
            active_count: self
                .vm_states
                .iter()
                .filter(|vm| vm.state == vm_state::RUNNING)
                .count() as u32,
            frame: 0,
            spawn_count: 1,
            padding: 0,
        };
        let sched_bytes = unsafe {
            let ptr = &scheduler as *const SchedulerState as *const u8;
            std::slice::from_raw_parts(ptr, std::mem::size_of::<SchedulerState>())
        };
        self.queue
            .write_buffer(&self.scheduler_buffer, 0, sched_bytes);

        // Dispatch compute shader
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("PMP Execute Frame"),
            });

        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("PMP Compute"),
                timestamp_writes: None,
            });
            pass.set_pipeline(&self.pipeline);
            pass.set_bind_group(0, self.bind_group.as_ref().unwrap(), &[]);
            pass.dispatch_workgroups(1, 1, 1); // 8 VMs in one workgroup
        }

        self.queue.submit(std::iter::once(encoder.finish()));

        // Read back GPU texture to substrate
        self.sync_gpu_to_shadow();
    }

    /// Read the GPU texture back to the CPU shadow
    fn sync_gpu_to_shadow(&self) {
        let bytes_per_row: u32 = TEXTURE_SIZE * 4;
        let staging_size = (bytes_per_row as u64) * (TEXTURE_SIZE as u64);

        let staging = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("GPU Readback Staging"),
            size: staging_size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("GPU→CPU Sync"),
            });

        encoder.copy_texture_to_buffer(
            wgpu::ImageCopyTexture {
                texture: &self.ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            wgpu::ImageCopyBuffer {
                buffer: &staging,
                layout: wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(bytes_per_row),
                    rows_per_image: Some(TEXTURE_SIZE),
                },
            },
            wgpu::Extent3d {
                width: TEXTURE_SIZE,
                height: TEXTURE_SIZE,
                depth_or_array_layers: 1,
            },
        );

        self.queue.submit(std::iter::once(encoder.finish()));

        // Map and copy
        let slice = staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |res| {
            tx.send(res).ok();
        });
        self.device.poll(wgpu::Maintain::Wait);

        if let Ok(Ok(())) = rx.recv() {
            let data = slice.get_mapped_range();
            self.substrate.update_from_gpu(&data);
        }
    }
}
