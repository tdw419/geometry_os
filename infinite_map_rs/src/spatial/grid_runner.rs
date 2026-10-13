//! Grid runner for spatial routing simulation
//!
//! Manages GPU execution of spatial routing programs with double-buffering
//! for ping-pong rendering.

use std::fs;

use bytemuck::cast_slice;
use flume::bounded;
use wgpu::{self, *};

// Use CellState from geoasm_materializer (single source of truth)
use crate::geoasm_materializer::CellState;
use super::types::WriteRequest;
use super::path_cache::{PathCache, DEFAULT_GRID_W, DEFAULT_GRID_H};
use super::tile_state::TileState;

/// Errors that can occur during grid execution
#[derive(Debug, thiserror::Error)]
pub enum GridError {
    #[error("IO error: {0}")]
    Io(#[from] std::io::Error),

    #[error("Binary file too short")]
    BinaryTooShort,

    #[error("Grid size mismatch: expected {expected}x{expected}, got {got}x{got}")]
    GridSizeMismatch { expected: usize, got: usize },

    #[error("Grid size exceeds maximum: {w}x{h} exceeds max {max_w}x{max_h}")]
    GridSizeTooLarge { w: usize, h: usize, max_w: usize, max_h: usize },

    #[error("Cell {index} has invalid coordinates ({x}, {y})")]
    InvalidCellCoords { index: usize, x: usize, y: usize },

    #[error("Binary truncated at cell {index}")]
    BinaryTruncated { index: usize },

    #[error("WGPU error: {0}")]
    Wgpu(#[from] wgpu::Error),

    #[error("Poll timeout")]
    PollTimeout,

    #[error("Shader compilation error: {0}")]
    ShaderError(String),

    #[error("Invalid overlay path")]
    InvalidOverlay,

    #[error("GPU adapter not found")]
    AdapterNotFound,

    #[error("WGPU request device error: {0}")]
    RequestDeviceError(String),

    #[error("Channel send error")]
    ChannelSendError,

    #[error("Buffer map error: {0}")]
    BufferMapError(String),
}

/// Result type for grid operations
pub type Result<T> = std::result::Result<T, GridError>;

/// Parsed binary format for spatial programs
#[derive(Debug, Clone)]
pub struct ParsedBinary {
    pub grid_w: usize,
    pub grid_h: usize,
    pub cell_count: usize,
    pub first_code_x: usize,
    pub first_code_y: usize,
    pub cells: Vec<CellState>,
}

/// Main grid runner for spatial routing simulation
pub struct GridRunner {
    device: Device,
    queue: Queue,

    // Dynamic grid dimensions (from binary header)
    grid_w: usize,
    grid_h: usize,
    total_cells: usize,

    // GPU buffers
    buffer_a: Buffer,
    buffer_b: Buffer,
    overlay_buffer: Buffer,
    write_buffer: Buffer,
    staging_buffer: Buffer,

    // Path cache buffers (GPU)
    horiz_segments_buffer: Buffer,
    vert_segments_buffer: Buffer,
    horiz_counts_buffer: Buffer,
    vert_counts_buffer: Buffer,

    // RISC-V Phase 9.2 buffers
    tile_state_buffer: Buffer,

    // Pipelines
    post_pipeline: ComputePipeline,
    step_pipeline: ComputePipeline,
    riscv_pipeline: ComputePipeline, // Phase 9.2: RISC-V execution pipeline

    // Bind groups (double-buffered)
    bind_group_a: BindGroup,
    bind_group_b: BindGroup,

    // State tracking
    bind_group_a_current: bool,

    // Parsed program state
    first_code_x: usize,
    first_code_y: usize,

    // SBI console state
    console_last_head: u32,
}

impl GridRunner {
    /// Create a new grid runner with default grid dimensions
    pub async fn new() -> Result<Self> {
        Self::new_with_grid(DEFAULT_GRID_W, DEFAULT_GRID_H).await
    }

    /// Create a new grid runner with specified grid dimensions
    pub async fn new_with_grid(grid_w: usize, grid_h: usize) -> Result<Self> {
        // Enforce maximum grid size limits
        const MAX_GRID_W: usize = 512;
        const MAX_GRID_H: usize = 256;
        if grid_w > MAX_GRID_W || grid_h > MAX_GRID_H {
            return Err(GridError::GridSizeTooLarge {
                w: grid_w,
                h: grid_h,
                max_w: MAX_GRID_W,
                max_h: MAX_GRID_H,
            });
        }

        let total_cells = grid_w * grid_h;

        // Initialize WGPU
        let instance = Instance::new(InstanceDescriptor {
            backends: Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&RequestAdapterOptions {
                power_preference: PowerPreference::HighPerformance,
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await
            .ok_or(GridError::AdapterNotFound)?;

        let (device, queue) = adapter
            .request_device(
                &DeviceDescriptor {
                    label: Some("Spatial Device"),
                    required_features: Features::empty(),
                    required_limits: Limits::default(),
                },
                None,
            )
            .await
            .map_err(|e| GridError::RequestDeviceError(e.to_string()))?;

        println!("GPU: {:?}", adapter.get_info());

        // Load shader (path relative to Cargo.toml location)
        let shader_code =
            fs::read_to_string("../../tests/spatial_runner/src/spatial_compute_v6.wgsl")?;
        let shader = device.create_shader_module(ShaderModuleDescriptor {
            label: Some("Spatial Compute Shader"),
            source: ShaderSource::Wgsl(shader_code.into()),
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&BindGroupLayoutDescriptor {
            label: Some("Spatial Bind Group Layout"),
            entries: &[
                BindGroupLayoutEntry {
                    binding: 0,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                BindGroupLayoutEntry {
                    binding: 1,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                BindGroupLayoutEntry {
                    binding: 2,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                BindGroupLayoutEntry {
                    binding: 3,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                BindGroupLayoutEntry {
                    binding: 4,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                BindGroupLayoutEntry {
                    binding: 5,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                BindGroupLayoutEntry {
                    binding: 6,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                BindGroupLayoutEntry {
                    binding: 7,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create pipeline layout
        let pipeline_layout = device.create_pipeline_layout(&PipelineLayoutDescriptor {
            label: Some("Spatial Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Create pipelines
        let post_pipeline = device.create_compute_pipeline(&ComputePipelineDescriptor {
            label: Some("Post Writes Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "post_writes",
        });

        let step_pipeline = device.create_compute_pipeline(&ComputePipelineDescriptor {
            label: Some("Apply & Step Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "apply_and_step",
        });

        // Phase 9.2: Load RISC-V shader and create pipeline
        // Path relative to infinite_map_rs/src/spatial/ (where this code is)
        let riscv_shader_code =
            fs::read_to_string("../../tests/spatial_runner/src/riscv_spatial_execute.wgsl")?;
        let riscv_shader = device.create_shader_module(ShaderModuleDescriptor {
            label: Some("RISC-V Spatial Execute Shader"),
            source: ShaderSource::Wgsl(riscv_shader_code.into()),
        });

        let riscv_pipeline = device.create_compute_pipeline(&ComputePipelineDescriptor {
            label: Some("RISC-V Execute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &riscv_shader,
            entry_point: "main",
        });

        // Create buffers with dynamic sizing
        let buffer_a =
            Self::create_grid_buffer(&device, "Grid A", total_cells);
        let buffer_b =
            Self::create_grid_buffer(&device, "Grid B", total_cells);
        let overlay_buffer =
            Self::create_grid_buffer(&device, "Overlay", total_cells);
        let write_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Write Request Buffer"),
            size: (total_cells * std::mem::size_of::<WriteRequest>()) as u64,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let staging_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Staging Buffer"),
            size: buffer_a.size(),
            usage: BufferUsages::MAP_READ | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Phase 9.2: Create TileState buffer (1160 u32s = 4640 bytes)
        // TileState layout: regs[32] + pc + status + instruction_count + max_steps + tile_id + uart_len + _reserved[2] + uart_buf[128] + ram[992] = 1160 total
        let tile_state_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Tile State Buffer"),
            size: (1160 * std::mem::size_of::<u32>()) as u64,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST | BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Create path cache buffers with dynamic sizing
        const MAX_SEGMENTS_PER_ROW: usize = 64;
        let horiz_segments_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Horizontal Segments Buffer"),
            size: (grid_h * MAX_SEGMENTS_PER_ROW * 2 * std::mem::size_of::<u32>()) as u64,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        let vert_segments_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Vertical Segments Buffer"),
            size: (grid_w * MAX_SEGMENTS_PER_ROW * 2 * std::mem::size_of::<u32>()) as u64,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        let horiz_counts_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Horizontal Counts Buffer"),
            size: (grid_h * std::mem::size_of::<u32>()) as u64,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        let vert_counts_buffer = device.create_buffer(&BufferDescriptor {
            label: Some("Vertical Counts Buffer"),
            size: (grid_w * std::mem::size_of::<u32>()) as u64,
            usage: BufferUsages::STORAGE | BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Initialize with empty bind groups (will be updated when loading binary)
        let bind_group_a = Self::create_bind_group(
            &device,
            &bind_group_layout,
            &buffer_a,
            &buffer_b,
            &write_buffer,
            &tile_state_buffer,
            &overlay_buffer,
            &horiz_segments_buffer,
            &vert_segments_buffer,
            &horiz_counts_buffer,
            &vert_counts_buffer,
        );

        let bind_group_b = Self::create_bind_group(
            &device,
            &bind_group_layout,
            &buffer_b,
            &buffer_a,
            &write_buffer,
            &tile_state_buffer,
            &overlay_buffer,
            &horiz_segments_buffer,
            &vert_segments_buffer,
            &horiz_counts_buffer,
            &vert_counts_buffer,
        );

        // Initialize write buffer with zeros
        let zero_requests: Vec<WriteRequest> = vec![WriteRequest::invalid(); total_cells];
        queue.write_buffer(&write_buffer, 0, cast_slice(&zero_requests));

        Ok(Self {
            device,
            queue,
            grid_w,
            grid_h,
            total_cells,
            buffer_a,
            buffer_b,
            overlay_buffer,
            write_buffer,
            staging_buffer,
            horiz_segments_buffer,
            vert_segments_buffer,
            horiz_counts_buffer,
            vert_counts_buffer,
            tile_state_buffer, // Phase 9.2
            post_pipeline,
            step_pipeline,
            riscv_pipeline, // Phase 9.2
            bind_group_a,
            bind_group_b,
            bind_group_a_current: true,
            first_code_x: 0,
            first_code_y: 0,
            console_last_head: 0,
        })
    }

    fn create_grid_buffer(device: &Device, label: &str, total_cells: usize) -> Buffer {
        device.create_buffer(&BufferDescriptor {
            label: Some(label),
            size: (total_cells * std::mem::size_of::<CellState>()) as u64,
            usage: BufferUsages::STORAGE
                | BufferUsages::COPY_DST
                | BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        })
    }

    fn create_bind_group(
        device: &Device,
        layout: &BindGroupLayout,
        read_buffer: &Buffer,
        write_buffer: &Buffer,
        write_req_buffer: &Buffer,
        tile_state_buffer: &Buffer, // Phase 9.2: TileState binding
        overlay_buffer: &Buffer,
        horiz_segments_buffer: &Buffer,
        vert_segments_buffer: &Buffer,
        horiz_counts_buffer: &Buffer,
        vert_counts_buffer: &Buffer,
    ) -> BindGroup {
        device.create_bind_group(&BindGroupDescriptor {
            label: Some("Spatial Bind Group"),
            layout,
            entries: &[
                BindGroupEntry {
                    binding: 0,
                    resource: read_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 1,
                    resource: write_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 2,
                    resource: write_req_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 3,
                    resource: overlay_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 4,
                    resource: horiz_segments_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 5,
                    resource: horiz_counts_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 6,
                    resource: vert_segments_buffer.as_entire_binding(),
                },
                BindGroupEntry {
                    binding: 7,
                    resource: vert_counts_buffer.as_entire_binding(),
                },
            ],
        })
    }

    /// Parse a binary file - validates against the runner's configured grid dimensions
    pub fn parse_binary(&self, bin_data: &[u8]) -> Result<ParsedBinary> {
        if bin_data.len() < 20 {
            return Err(GridError::BinaryTooShort);
        }

        let grid_w =
            u32::from_le_bytes([bin_data[0], bin_data[1], bin_data[2], bin_data[3]]) as usize;
        let grid_h =
            u32::from_le_bytes([bin_data[4], bin_data[5], bin_data[6], bin_data[7]]) as usize;
        let cell_count =
            u32::from_le_bytes([bin_data[8], bin_data[9], bin_data[10], bin_data[11]]) as usize;
        let first_code_x =
            u32::from_le_bytes([bin_data[12], bin_data[13], bin_data[14], bin_data[15]]) as usize;
        let first_code_y =
            u32::from_le_bytes([bin_data[16], bin_data[17], bin_data[18], bin_data[19]]) as usize;

        // Validate grid dimensions match this runner's configuration
        if grid_w != self.grid_w || grid_h != self.grid_h {
            return Err(GridError::GridSizeMismatch {
                expected: self.grid_w,
                got: grid_w,
            });
        }

        let mut cells = vec![
            CellState {
                opcode_or_type: 0,
                is_active: 0,
                data_buffer: 0,
                executing: 0,
            };
            self.total_cells
        ];
        let mut offset = 20;

        for i in 0..cell_count {
            if offset + 16 > bin_data.len() {
                return Err(GridError::BinaryTruncated { index: i });
            }

            let x = u32::from_le_bytes([
                bin_data[offset],
                bin_data[offset + 1],
                bin_data[offset + 2],
                bin_data[offset + 3],
            ]) as usize;
            let y = u32::from_le_bytes([
                bin_data[offset + 4],
                bin_data[offset + 5],
                bin_data[offset + 6],
                bin_data[offset + 7],
            ]) as usize;
            let opcode_or_type = u32::from_le_bytes([
                bin_data[offset + 8],
                bin_data[offset + 9],
                bin_data[offset + 10],
                bin_data[offset + 11],
            ]);
            let data_buffer = u32::from_le_bytes([
                bin_data[offset + 12],
                bin_data[offset + 13],
                bin_data[offset + 14],
                bin_data[offset + 15],
            ]);

            if x >= self.grid_w || y >= self.grid_h {
                // Debug: dump the 16-byte cell data when invalid
                if i < 5 {
                    eprintln!("DEBUG Invalid cell [{}]:", i);
                    eprintln!("  Raw bytes (16):");
                    for j in 0..16 {
                        if offset + j < bin_data.len() {
                            eprintln!("    [{}]: 0x{:02x}", j, bin_data[offset + j]);
                        }
                    }
                    eprintln!(
                        "  Decoded: x={}, y={}, opcode={:08x}, data={:08x}",
                        x, y, opcode_or_type, data_buffer
                    );
                }
                return Err(GridError::InvalidCellCoords { index: i, x, y });
            }

            let idx = y * self.grid_w + x;
            cells[idx] = CellState {
                opcode_or_type,
                is_active: 0,
                data_buffer,
                executing: 0,
            };

            offset += 16;
        }

        Ok(ParsedBinary {
            grid_w,
            grid_h,
            cell_count,
            first_code_x,
            first_code_y,
            cells,
        })
    }

    /// Load a binary program into the grid
    pub fn load_binary(&mut self, bin_data: &[u8]) -> Result<()> {
        let parsed = self.parse_binary(bin_data)?;
        self.first_code_x = parsed.first_code_x;
        self.first_code_y = parsed.first_code_y;

        // Activate first code cell
        let mut cells = parsed.cells;
        let first_code_idx = self.first_code_y * self.grid_w + self.first_code_x;
        cells[first_code_idx].is_active = 1;

        // Build path cache and upload to GPU
        let path_cache = PathCache::from_cells(&cells);
        self.queue
            .write_buffer(
                &self.horiz_segments_buffer,
                0,
                cast_slice(&path_cache.get_horiz_segments_gpu()),
            );
        self.queue
            .write_buffer(
                &self.vert_segments_buffer,
                0,
                cast_slice(&path_cache.get_vert_segments_gpu()),
            );
        self.queue
            .write_buffer(
                &self.horiz_counts_buffer,
                0,
                cast_slice(&path_cache.get_horiz_counts()),
            );
        self.queue
            .write_buffer(
                &self.vert_counts_buffer,
                0,
                cast_slice(&path_cache.get_vert_counts()),
            );

        println!(
            "Loaded {} cells, activated at ({},{})",
            parsed.cell_count, self.first_code_x, self.first_code_y
        );

        // Upload main grid to GPU after path cache buffers
        self.queue
            .write_buffer(&self.buffer_a, 0, cast_slice(&cells));

        // Phase 9.1.1: Initialize TileState with real kernel entry point (not grid index)
        // For xv6: PC = 0x80000000, converted to RAM address by dividing by 4
        // For transpiled GeoASM: PC = kernel entry point in RAM words (0x80000000 / 4 = 0x20000000)
        let kernel_entry_ram = 0x20000000u32; // 0x80000000 / 4 (word address)
        let tile_state = TileState::new(kernel_entry_ram, 1000, 0); // PC, max_steps=1000, tile_id=0
        let tile_state_u32: Vec<u32> = tile_state.to_u32_vec();
        self.queue
            .write_buffer(&self.tile_state_buffer, 0, cast_slice(&tile_state_u32));

        println!(
            "Initialized TileState: PC=0x{:08x} (kernel entry), max_steps={}, status={}",
            kernel_entry_ram, 1000, tile_state.status
        );

        Ok(())
    }

    /// Load an overlay program
    pub fn load_overlay(&mut self, overlay_data: &[u8]) -> Result<()> {
        if overlay_data.len() < 20 {
            return Err(GridError::BinaryTooShort);
        }

        let grid_w = u32::from_le_bytes([
            overlay_data[0],
            overlay_data[1],
            overlay_data[2],
            overlay_data[3],
        ]) as usize;
        let grid_h = u32::from_le_bytes([
            overlay_data[4],
            overlay_data[5],
            overlay_data[6],
            overlay_data[7],
        ]) as usize;
        let overlay_cell_count = u32::from_le_bytes([
            overlay_data[8],
            overlay_data[9],
            overlay_data[10],
            overlay_data[11],
        ]) as usize;

        // Validate grid dimensions match this runner's configuration
        if grid_w != self.grid_w || grid_h != self.grid_h {
            return Err(GridError::GridSizeMismatch {
                expected: self.grid_w,
                got: grid_w,
            });
        }

        let mut overlay = vec![
            CellState {
                opcode_or_type: 0,
                is_active: 0,
                data_buffer: 0,
                executing: 0,
            };
            self.total_cells
        ];
        let mut offset = 20;

        for i in 0..overlay_cell_count {
            if offset + 16 > overlay_data.len() {
                return Err(GridError::BinaryTruncated { index: i });
            }

            let x = u32::from_le_bytes([
                overlay_data[offset],
                overlay_data[offset + 1],
                overlay_data[offset + 2],
                overlay_data[offset + 3],
            ]) as usize;
            let y = u32::from_le_bytes([
                overlay_data[offset + 4],
                overlay_data[offset + 5],
                overlay_data[offset + 6],
                overlay_data[offset + 7],
            ]) as usize;
            let opcode_or_type = u32::from_le_bytes([
                overlay_data[offset + 8],
                overlay_data[offset + 9],
                overlay_data[offset + 10],
                overlay_data[offset + 11],
            ]);
            let data_buffer = u32::from_le_bytes([
                overlay_data[offset + 12],
                overlay_data[offset + 13],
                overlay_data[offset + 14],
                overlay_data[offset + 15],
            ]);

            if x >= self.grid_w || y >= self.grid_h {
                return Err(GridError::InvalidCellCoords { index: i, x, y });
            }

            let idx = y * self.grid_w + x;
            overlay[idx] = CellState {
                opcode_or_type,
                is_active: 0,
                data_buffer,
                executing: 0,
            };

            offset += 16;
        }

        self.queue
            .write_buffer(&self.overlay_buffer, 0, cast_slice(&overlay));

        // IMPORTANT: After uploading overlay, also update grid buffers with initial overlay state
        // This ensures overlay cells are immediately visible before first tick
        self.queue
            .write_buffer(&self.buffer_a, 0, cast_slice(&overlay));
        self.queue
            .write_buffer(&self.buffer_b, 0, cast_slice(&overlay));

        println!(
            "Loaded overlay with {} structural cells (grid: {}x{}, buffer: {} cells)",
            overlay_cell_count,
            self.grid_w,
            self.grid_h,
            overlay.len()
        );

        Ok(())
    }

    /// Execute one tick of the simulation
    pub async fn tick(&mut self) -> Result<Vec<CellState>> {
        let bind_group = if self.bind_group_a_current {
            &self.bind_group_a
        } else {
            &self.bind_group_b
        };

        let read_buffer = if self.bind_group_a_current {
            &self.buffer_a
        } else {
            &self.buffer_b
        };
        let write_buffer = if self.bind_group_a_current {
            &self.buffer_b
        } else {
            &self.buffer_a
        };

        let mut encoder = self
            .device
            .create_command_encoder(&CommandEncoderDescriptor {
                label: Some("Tick"),
            });

        // Pass 1: post writes
        {
            let mut cpass = encoder.begin_compute_pass(&ComputePassDescriptor {
                label: Some("Post Writes"),
                timestamp_writes: None,
            });

            cpass.set_pipeline(&self.post_pipeline);
            cpass.set_bind_group(0, bind_group, &[]);
            cpass.dispatch_workgroups(self.grid_w as u32 / 8, self.grid_h as u32 / 8, 1);
        }

        // Pass 2: apply writes and step tokens
        {
            let mut cpass = encoder.begin_compute_pass(&ComputePassDescriptor {
                label: Some("Apply & Step"),
                timestamp_writes: None,
            });

            cpass.set_pipeline(&self.step_pipeline);
            cpass.set_bind_group(0, bind_group, &[]);
            cpass.dispatch_workgroups(self.grid_w as u32 / 8, self.grid_h as u32 / 8, 1);
        }

        // Pass 3: Phase 9.2 - RISC-V execution
        {
            let mut cpass = encoder.begin_compute_pass(&ComputePassDescriptor {
                label: Some("RISC-V Execute"),
                timestamp_writes: None,
            });

            cpass.set_pipeline(&self.riscv_pipeline);
            cpass.set_bind_group(0, bind_group, &[]);
            cpass.dispatch_workgroups(1, 1, 1); // Single workgroup for TileState
        }

        encoder.copy_buffer_to_buffer(write_buffer, 0, &self.staging_buffer, 0, write_buffer.size());
        self.queue.submit(Some(encoder.finish()));

        // Map and read
        let buffer_slice = self.staging_buffer.slice(..);
        let (tx, rx) = bounded(1);
        buffer_slice.map_async(MapMode::Read, move |res| {
            let _ = tx.send(res);
        });
        self.device.poll(MaintainBase::Wait);

        rx.recv_async()
            .await
            .map_err(|_| GridError::ChannelSendError)?
            .map_err(|e| GridError::BufferMapError(e.to_string()))?;

        let mapped = buffer_slice.get_mapped_range();
        let cells: Vec<CellState> = cast_slice(&mapped).to_vec();

        drop(mapped);
        self.staging_buffer.unmap();

        self.bind_group_a_current = !self.bind_group_a_current;

        Ok(cells)
    }

    /// Read the current grid state
    pub async fn read_grid(&self) -> Result<Vec<CellState>> {
        let read_buffer = if self.bind_group_a_current {
            &self.buffer_a
        } else {
            &self.buffer_b
        };

        let mut encoder = self
            .device
            .create_command_encoder(&CommandEncoderDescriptor {
                label: Some("Final Readback"),
            });
        encoder.copy_buffer_to_buffer(read_buffer, 0, &self.staging_buffer, 0, read_buffer.size());
        self.queue.submit(Some(encoder.finish()));

        // Map and read
        let buffer_slice = self.staging_buffer.slice(..);
        let (tx, rx) = bounded(1);
        buffer_slice.map_async(MapMode::Read, move |res| {
            let _ = tx.send(res);
        });
        self.device.poll(MaintainBase::Wait);

        rx.recv_async()
            .await
            .map_err(|_| GridError::ChannelSendError)?
            .map_err(|e| GridError::BufferMapError(e.to_string()))?;

        let mapped = buffer_slice.get_mapped_range();
        let cells: Vec<CellState> = cast_slice(&mapped).to_vec();

        drop(mapped);
        self.staging_buffer.unmap();

        Ok(cells)
    }

    /// Read the current TileState from GPU (Phase 9.2-B)
    pub async fn read_tile_state(&self) -> Result<TileState> {
        // Create staging buffer for TileState readback (1160 u32s = 4640 bytes)
        let staging_buffer = self.device.create_buffer(&BufferDescriptor {
            label: Some("TileState Staging Buffer"),
            size: 4640,
            usage: BufferUsages::COPY_DST | BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });

        // Create command encoder
        let mut encoder = self
            .device
            .create_command_encoder(&CommandEncoderDescriptor {
                label: Some("TileState Readback"),
            });

        // Copy tile_state_buffer to staging buffer
        encoder.copy_buffer_to_buffer(&self.tile_state_buffer, 0, &staging_buffer, 0, 4640);

        // Submit commands
        self.queue.submit(Some(encoder.finish()));

        // Map and read
        let buffer_slice = staging_buffer.slice(..);
        let (tx, rx) = bounded(1);
        buffer_slice.map_async(MapMode::Read, move |res| {
            let _ = tx.send(res);
        });
        self.device.poll(MaintainBase::Wait);

        rx.recv_async()
            .await
            .map_err(|_| GridError::ChannelSendError)?
            .map_err(|e| GridError::BufferMapError(e.to_string()))?;

        let mapped = buffer_slice.get_mapped_range();
        let tile_state_u32: Vec<u32> = cast_slice(&mapped).to_vec();

        drop(mapped);
        staging_buffer.unmap();
        // Reconstruct TileState from u32 array
        let tile_state = TileState::from_u32_vec(&tile_state_u32)
            .map_err(|e| GridError::BufferMapError(e.to_string()))?;

        Ok(tile_state)
    }

    /// Poll SBI console ring buffer on row 9 for new output
    ///
    /// MMIO layout:
    ///   (0, 9)          producer_head (monotonic u32)
    ///   (10..73, 9)     64-char ring buffer
    ///
    /// Returns any new characters since last poll (empty string if no new data)
    pub async fn poll_sbi_console(&mut self) -> Result<String> {
        // Read only row 9 to minimize transfer overhead
        let row_offset = 9 * self.grid_w;
        let row_size = (self.grid_w * 16) as u64; // CellState is 16 bytes

        // Create staging buffer for just row 9
        let staging_buffer = self.device.create_buffer(&BufferDescriptor {
            label: Some("Console Row Staging"),
            size: row_size,
            usage: BufferUsages::COPY_DST | BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });

        // Create command encoder
        let mut encoder = self
            .device
            .create_command_encoder(&CommandEncoderDescriptor {
                label: Some("Console Row Readback"),
            });

        let read_buffer = if self.bind_group_a_current {
            &self.buffer_a
        } else {
            &self.buffer_b
        };

        // Copy only row 9
        encoder.copy_buffer_to_buffer(
            read_buffer,
            (row_offset * 16) as u64,
            &staging_buffer,
            0,
            row_size,
        );

        self.queue.submit(Some(encoder.finish()));

        // Map and read
        let buffer_slice = staging_buffer.slice(..);
        let (tx, rx) = bounded(1);
        buffer_slice.map_async(MapMode::Read, move |res| {
            let _ = tx.send(res);
        });
        self.device.poll(MaintainBase::Wait);

        rx.recv_async()
            .await
            .map_err(|_| GridError::ChannelSendError)?
            .map_err(|e| GridError::BufferMapError(e.to_string()))?;

        let mapped = buffer_slice.get_mapped_range();
        let row_cells: Vec<CellState> = cast_slice(&mapped).to_vec();

        drop(mapped);
        staging_buffer.unmap();

        // Read producer_head at (0, 9)
        let producer_head = row_cells[0].data_buffer;

        // Read ring buffer at (10..73, 9)
        let mut output = String::new();
        for i in 10..74.min(row_cells.len()) {
            let data = row_cells[i].data_buffer;
            if data != 0 {
                let byte = (data & 0xFF) as u8;
                if byte.is_ascii_graphic() || byte == b'\n' || byte == b'\r' {
                    output.push(byte as char);
                }
            }
        }

        // Track last seen head to avoid re-reading
        let new_output = if producer_head > self.console_last_head {
            self.console_last_head = producer_head;
            output
        } else {
            String::new()
        };

        Ok(new_output)
    }
}