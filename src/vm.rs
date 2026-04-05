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
use std::collections::HashSet;

/// VM state constants (must match WGSL)
pub mod vm_state {
    pub const INACTIVE: u32 = 0;
    pub const RUNNING: u32 = 1;
    pub const HALTED: u32 = 2;
    pub const WAITING: u32 = 3;
    pub const FAULT: u32 = 0xFF;
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
    pub attention_mask: u32, // offset 564 -- legacy name kept for ABI compat, semantically: frame_ptr (current frame index in film strip)
    pub frame_count: u32,    // offset 568 -- total frames in film strip (0 = no film strip, normal program)
    pub _pad: [u32; 1],      // offset 572
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
            attention_mask: 0, // frame_ptr
            frame_count: 0,
            _pad: [0; 1],
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

/// A single frame transition recorded by the GPU shader's trace buffer.
#[derive(Debug, Clone, Copy)]
pub struct GpuFrameTrace {
    pub vm_id: u32,
    pub from_frame: u32,
    pub to_frame: u32,
    pub pc_at_transition: u32,
    /// 0 = auto_advance (HALT-driven), 1 = frame_opcode (explicit FRAME)
    pub cause: u32,
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
    frame_trace_buffer: wgpu::Buffer,
    frame_trace_cursor_buffer: wgpu::Buffer,
    vm_states: [VmState; 8],
    substrate: Substrate,
}

impl GlyphVm {
    /// Initialize the GPU, create the texture and pipeline (headless, no surface).
    pub fn new() -> Self {
        let instance = wgpu::Instance::default();
        let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        }))
        .expect("No GPU adapter found. Need a GPU for pixels to move pixels.");

        let desc = wgpu::DeviceDescriptor {
            label: Some("Pixels Move Pixels"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            required_limits: wgpu::Limits::default(),
        };
        let (device, queue) = Self::request_device_with_retry(&adapter, &desc);

        Self::init_gpu(device, queue)
    }

    /// Initialize with a pre-created device and queue (for windowed rendering).
    /// The caller creates the wgpu Instance, Surface, Adapter, Device, and Queue
    /// externally (typically from a winit window), then passes them in here.
    pub fn from_device_queue(device: wgpu::Device, queue: wgpu::Queue) -> Self {
        Self::init_gpu(device, queue)
    }

    /// Access the GPU device (for creating render pipelines in windowed mode).
    pub fn device(&self) -> &wgpu::Device {
        &self.device
    }

    /// Access the GPU queue (for submitting render commands in windowed mode).
    pub fn queue(&self) -> &wgpu::Queue {
        &self.queue
    }

    /// Access the RAM texture (for creating a texture view to render in windowed mode).
    pub fn ram_texture(&self) -> &wgpu::Texture {
        &self.ram_texture
    }

    /// Common GPU initialization: create compute pipeline, textures, buffers.
    fn init_gpu(device: wgpu::Device, queue: wgpu::Queue) -> Self {
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
                // Binding 6: Frame trace buffer (read_write)
                wgpu::BindGroupLayoutEntry {
                    binding: 6,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 7: Frame trace cursor (read_write, atomic)
                wgpu::BindGroupLayoutEntry {
                    binding: 7,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
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

        // Frame trace buffer: 256 entries * 5 u32s = 5120 bytes
        let frame_trace_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Frame Trace Buffer"),
            size: 256 * 5 * 4,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Frame trace cursor: single atomic u32
        let frame_trace_cursor_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Frame Trace Cursor"),
            size: 4,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
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
                wgpu::BindGroupEntry {
                    binding: 6,
                    resource: frame_trace_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 7,
                    resource: frame_trace_cursor_buffer.as_entire_binding(),
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
            frame_trace_buffer,
            frame_trace_cursor_buffer,
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

        // Reset frame trace cursor to 0 (clear previous dispatch traces)
        self.queue.write_buffer(&self.frame_trace_cursor_buffer, 0, &[0u8; 4]);

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

        // Read back VM states from GPU
        self.sync_vm_states();
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

    /// Read back VM states from the GPU buffer into self.vm_states.
    fn sync_vm_states(&mut self) {
        let vm_buffer_size = std::mem::size_of::<VmState>() * 8;
        let staging = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("VM Readback Staging"),
            size: vm_buffer_size as u64,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("VM→CPU Sync"),
            });

        encoder.copy_buffer_to_buffer(&self.vm_buffer, 0, &staging, 0, vm_buffer_size as u64);
        self.queue.submit(std::iter::once(encoder.finish()));

        let slice = staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |res| {
            tx.send(res).ok();
        });
        self.device.poll(wgpu::Maintain::Wait);

        if let Ok(Ok(())) = rx.recv() {
            let data = slice.get_mapped_range();
            let vm_size = std::mem::size_of::<VmState>();
            for i in 0..8 {
                let offset = i * vm_size;
                let vm_bytes: Vec<u8> = data[offset..offset + vm_size].to_vec();
                let vm_state: VmState = unsafe { std::ptr::read(vm_bytes.as_ptr() as *const VmState) };
                self.vm_states[i] = vm_state;
            }
        }
    }

    /// Read back frame traces from the GPU trace buffer.
    /// Returns traces recorded during the last dispatch, in order.
    pub fn read_frame_traces(&mut self) -> Vec<GpuFrameTrace> {
        // Read the cursor first to know how many entries were written
        let cursor_staging = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Trace Cursor Readback"),
            size: 4,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Trace Cursor Sync"),
            });

        encoder.copy_buffer_to_buffer(
            &self.frame_trace_cursor_buffer, 0,
            &cursor_staging, 0, 4,
        );
        self.queue.submit(std::iter::once(encoder.finish()));

        let slice = cursor_staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |res| { tx.send(res).ok(); });
        self.device.poll(wgpu::Maintain::Wait);

        let count = if let Ok(Ok(())) = rx.recv() {
            let data = slice.get_mapped_range();
            let bytes: [u8; 4] = data[..4].try_into().unwrap_or([0; 4]);
            u32::from_le_bytes(bytes).min(256)
        } else {
            0
        };

        if count == 0 {
            return Vec::new();
        }

        // Read the trace buffer
        let trace_size = (count * 5 * 4) as u64;
        let trace_staging = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Trace Buffer Readback"),
            size: trace_size,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Trace Buffer Sync"),
            });

        encoder.copy_buffer_to_buffer(
            &self.frame_trace_buffer, 0,
            &trace_staging, 0, trace_size,
        );
        self.queue.submit(std::iter::once(encoder.finish()));

        let slice = trace_staging.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        slice.map_async(wgpu::MapMode::Read, move |res| { tx.send(res).ok(); });
        self.device.poll(wgpu::Maintain::Wait);

        if let Ok(Ok(())) = rx.recv() {
            let data = slice.get_mapped_range();
            let mut traces = Vec::with_capacity(count as usize);
            for i in 0..count as usize {
                let base = i * 5 * 4;
                let read_u32 = |offset: usize| -> u32 {
                    let b: [u8; 4] = data[base + offset..base + offset + 4].try_into().unwrap_or([0; 4]);
                    u32::from_le_bytes(b)
                };
                traces.push(GpuFrameTrace {
                    vm_id: read_u32(0),
                    from_frame: read_u32(4),
                    to_frame: read_u32(8),
                    pc_at_transition: read_u32(12),
                    cause: read_u32(16),
                });
            }
            return traces;
        }

        Vec::new()
    }

    /// Get the current VM states (after execute_frame).
    pub fn vm_states(&self) -> &[VmState; 8] {
        &self.vm_states
    }

    /// Get a single VM's state.
    pub fn vm_state(&self, id: usize) -> &VmState {
        &self.vm_states[id]
    }

    /// Get a mutable reference to a single VM's state.
    pub fn vm_state_mut(&mut self, id: usize) -> &mut VmState {
        &mut self.vm_states[id]
    }

    /// Reset all VMs and substrate to initial state.
    pub fn reset(&mut self) {
        self.vm_states = [VmState::default(); 8];
        self.substrate = Substrate::new();
    }

    /// Request a GPU device with retry logic for robustness under load.
    pub fn request_device_with_retry(
        adapter: &wgpu::Adapter,
        desc: &wgpu::DeviceDescriptor<'_>,
    ) -> (wgpu::Device, wgpu::Queue) {
        const MAX_ATTEMPTS: u32 = 5;
        for attempt in 0..MAX_ATTEMPTS {
            match pollster::block_on(adapter.request_device(desc, None)) {
                Ok(pair) => return pair,
                Err(e) => {
                    eprintln!(
                        "[PMP] GPU device request attempt {}/{} failed: {:?}",
                        attempt + 1,
                        MAX_ATTEMPTS,
                        e
                    );
                    if attempt + 1 < MAX_ATTEMPTS {
                        let delay = std::time::Duration::from_millis(500 * (attempt as u64 + 1));
                        eprintln!("[PMP] Retrying in {:?}...", delay);
                        std::thread::sleep(delay);
                    }
                }
            }
        }
        panic!("Failed to get GPU device after {MAX_ATTEMPTS} attempts");
    }
}

/// Result of running a program on the GPU substrate with fitness metrics.
#[derive(Debug, Clone)]
pub struct ExecutionResult {
    /// Did the VM halt cleanly?
    pub halted: bool,
    /// How many GPU cycles were executed.
    pub cycles: u32,
    /// Final program counter value.
    pub final_pc: u32,
    /// Number of non-zero registers after execution.
    pub nonzero_regs: usize,
    /// Number of unique addresses written to (non-zero pixels near program).
    pub unique_writes: usize,
    /// Number of pixels in the loaded program.
    pub program_length: usize,
    /// Load address of the program.
    pub load_address: u32,
    /// Opcodes seen in the program (byte values).
    pub opcodes_used: Vec<u8>,
    /// Memory efficiency: fraction of written bytes that are meaningful (0.0-1.0).
    pub memory_efficiency: f64,
    /// Spatial locality: average Hilbert distance between consecutive ops (lower = better).
    pub spatial_locality: f64,
    /// Aggregate fitness score (0.0 - 1.0).
    pub fitness: f64,
    /// Snapshot of VM state after execution.
    pub vm: VmState,
}

impl ExecutionResult {
    /// Compute fitness from execution metrics.
    ///
    /// Scoring:
    ///   +0.20  halts cleanly
    ///   +0.15  uses multiple registers (>= 3)
    ///   +0.15  writes to memory (>= 1 unique writes)
    ///   +0.10  uses diverse opcodes (>= 3 unique)
    ///   +0.10  executes some cycles (>= 4, <= 800)
    ///   +0.15  memory efficiency (writes relative to program size)
    ///   +0.15  spatial locality (instructions are Hilbert-coherent)
    pub fn compute_fitness(&mut self) {
        let mut score = 0.0f64;

        // Halting is fundamental
        if self.halted {
            score += 0.20;
        }

        // Register usage (max at 3+)
        let reg_score = (self.nonzero_regs as f64 / 3.0).min(1.0);
        score += 0.15 * reg_score;

        // Memory writes (max at 5+)
        let write_score = (self.unique_writes as f64 / 5.0).min(1.0);
        score += 0.15 * write_score;

        // Opcode diversity (max at 3+)
        let op_score = (self.opcodes_used.len() as f64 / 3.0).min(1.0);
        score += 0.10 * op_score;

        // Cycle count -- sweet spot around 4-800
        if self.cycles >= 4 && self.cycles <= 800 {
            score += 0.10;
        } else if self.cycles > 0 {
            score += 0.03;
        }

        // Memory efficiency: ratio of unique writes to program length.
        // A program that does more with less scores higher.
        if self.program_length > 0 {
            let efficiency = (self.unique_writes as f64 / self.program_length as f64).min(1.0);
            self.memory_efficiency = efficiency;
            score += 0.15 * efficiency;
        }

        // Spatial locality: programs where consecutive instructions are
        // Hilbert-adjacent score higher. Average distance of 1.0 = perfect.
        let locality = (1.0 / (1.0 + self.spatial_locality)).min(1.0);
        score += 0.15 * locality;

        self.fitness = score.min(1.0);
    }
}

/// Run a single program on a fresh VM and return execution results with fitness.
///
/// This creates a new GlyphVm, loads the program at the given address,
/// spawns VM 0, executes one frame, and reads back results.
/// Compute the average Hilbert distance between consecutive program pixels.
/// A program loaded at sequential Hilbert addresses has locality ~1.0.
/// Scattered programs have higher locality values (worse).
fn compute_spatial_locality(pixels: &[u32], load_address: u32) -> f64 {
    use crate::hilbert;
    if pixels.len() < 2 {
        return 1.0; // perfect locality for single-instruction programs
    }
    let mut total_distance: f64 = 0.0;
    for i in 0..pixels.len() - 1 {
        let d1 = load_address + i as u32;
        let d2 = load_address + i as u32 + 1;
        let (x1, y1) = hilbert::d2xy(d1);
        let (x2, y2) = hilbert::d2xy(d2);
        // Euclidean distance in pixel space
        let dx = (x1 as f64 - x2 as f64).abs();
        let dy = (y1 as f64 - y2 as f64).abs();
        total_distance += (dx * dx + dy * dy).sqrt();
    }
    total_distance / (pixels.len() - 1) as f64
}

pub fn run_program(pixels: &[u32], load_address: u32) -> ExecutionResult {
    let mut vm = GlyphVm::new();
    let program_length = pixels.len();

    // Track opcodes from the program pixels
    let mut opcodes: HashSet<u8> = HashSet::new();
    for &pixel in pixels {
        opcodes.insert((pixel & 0xFF) as u8);
    }

    // Snapshot substrate before execution (all zeros except our program)
    vm.substrate().load_program(load_address, pixels);
    vm.spawn_vm(0, load_address);
    vm.execute_frame();

    // Read back VM state
    let vm_state = vm.vm_state(0).clone();

    // Count non-zero registers
    let nonzero_regs = vm_state.regs.iter().filter(|&&r| r != 0).count();

    // Count unique addresses written near the program region
    // Scan a window around the program for non-zero pixels that weren't in the original
    let scan_start = load_address;
    let scan_end = load_address + (program_length as u32) * 4; // 4x program size
    let mut unique_writes = 0;
    for addr in scan_start..scan_end {
        let val = vm.substrate().peek(addr);
        if val != 0 {
            // Check if this was part of the original program
            let offset = addr - load_address;
            let is_original = (offset as usize) < program_length && pixels[offset as usize] == val;
            if !is_original {
                unique_writes += 1;
            }
        }
    }

    let halted = vm_state.state == vm_state::HALTED || vm_state.halted != 0;

    let mut result = ExecutionResult {
        halted,
        cycles: vm_state.cycles,
        final_pc: vm_state.pc,
        nonzero_regs,
        unique_writes,
        program_length,
        load_address,
        opcodes_used: opcodes.into_iter().collect(),
        memory_efficiency: 0.0,
        spatial_locality: compute_spatial_locality(pixels, load_address),
        fitness: 0.0,
        vm: vm_state,
    };
    result.compute_fitness();
    result
}
