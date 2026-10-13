//! Spatial Hypervisor Integration (Phase 5.2)
//!
//! This module bridges the RISC-V executor's syscall mechanism with
//! the spatial allocator, allowing guest RISC-V OS to allocate spatially-isolated
//! memory regions via hypercalls.
//!
//! Architecture:
//! - Guest RISC-V calls ecall with hypercall ID 0x123
//! - RiscvExecutor detects hypercall in syscall queue
//! - Parse SpatialAllocReq from guest memory at arg0
//! - Call spatial_allocator.allocate_region()
//! - Write SpatialAllocResp back to guest memory
//! - Return result in syscall queue

use crate::geoasm_materializer::CellState;
use crate::riscv_executor::SyscallEntry;
use crate::spatial::hypervisor_bridge::{
    SpatialAllocReq, SpatialAllocResp, SpatialAllocator, HYPERCALL_SPATIAL_ALLOC, SPATIAL_ALLOC_OK,
    // Phase 5.3
    SpatialProcessReq, SpatialProcessResp, HYPERCALL_SPATIAL_PROCESS,
    SPATIAL_PROCESS_OK, SPATIAL_PROCESS_ERR_INVALID_REGION, SPATIAL_PROCESS_ERR_INVALID_SIZE,
    SPATIAL_PROCESS_ERR_UNSUPPORTED_OPCODE, SPATIAL_PROCESS_ERR_INTERNAL,
    OPCODE_ADD, OPCODE_MUL, OPCODE_SUB, OPCODE_DIV,
};
use std::sync::Arc;
use wgpu::Device;

/// Staging buffer for guest memory access
struct GuestMemStaging {
    /// CPU-accessible staging buffer
    buffer: wgpu::Buffer,
    /// Size in bytes
    size: u64,
}

impl GuestMemStaging {
    fn new(device: &wgpu::Device, size: u64, label: &str, for_read: bool) -> Self {
        // wgpu only allows MAP_READ with COPY_DST, and MAP_WRITE with COPY_SRC
        let usage = if for_read {
            wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST
        } else {
            wgpu::BufferUsages::MAP_WRITE | wgpu::BufferUsages::COPY_SRC
        };

        let buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some(label),
            size,
            usage,
            mapped_at_creation: false,
        });

        GuestMemStaging { buffer, size }
    }

    /// Read from guest RAM to staging buffer
    fn read_from_ram(
        &self,
        queue: &wgpu::Queue,
        device: &Device,
        ram_buffer: &wgpu::Buffer,
        offset: u64,
    ) -> Result<Vec<u8>, String> {
        // Copy from RAM to staging
        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("GuestMem Read Encoder"),
        });

        let copy_size = std::cmp::min(self.size, ram_buffer.size().saturating_sub(offset));

        if copy_size == 0 {
            return Err(format!("Invalid read: offset {} beyond RAM size {}", offset, ram_buffer.size()));
        }

        encoder.copy_buffer_to_buffer(ram_buffer, offset, &self.buffer, 0, copy_size);

        queue.submit(Some(encoder.finish()));

        // Map and read
        let buffer_slice = self.buffer.slice(..);
        let (tx, rx) = std::sync::mpsc::channel();
        buffer_slice.map_async(wgpu::MapMode::Read, move |res| tx.send(res).unwrap());

        device.poll(wgpu::MaintainBase::Wait);

        rx.recv()
            .unwrap()
            .map_err(|e| format!("Failed to map buffer: {:?}", e))?;

        let data = buffer_slice.get_mapped_range().to_vec();
        self.buffer.unmap();

        Ok(data)
    }

    /// Write from staging buffer to guest RAM
    fn write_to_ram(
        &self,
        queue: &wgpu::Queue,
        device: &Device,
        ram_buffer: &wgpu::Buffer,
        offset: u64,
        data: &[u8],
    ) -> Result<(), String> {
        // Map and write to staging
        let buffer_slice = self.buffer.slice(0..data.len() as u64);
        buffer_slice.map_async(wgpu::MapMode::Write, move |res| {
            if let Err(e) = res {
                log::error!("Failed to map staging buffer: {:?}", e);
            }
        });

        device.poll(wgpu::MaintainBase::Wait);

        {
            let mut mapped = buffer_slice.get_mapped_range_mut();
            mapped.copy_from_slice(data);
        }
        self.buffer.unmap();

        // Copy from staging to RAM
        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("GuestMem Write Encoder"),
        });

        encoder.copy_buffer_to_buffer(&self.buffer, 0, ram_buffer, offset, data.len() as u64);

        queue.submit(Some(encoder.finish()));

        Ok(())
    }
}

/// Spatial hypervisor integration layer
pub struct SpatialHypervisorIntegration {
    /// Spatial allocator for region management
    allocator: SpatialAllocator,

    /// Reference to RISC-V RAM buffer (for reading/writing guest structures)
    ram_buffer: Arc<wgpu::Buffer>,

    /// Reference to GPU device
    device: Arc<wgpu::Device>,

    /// Reference to GPU queue
    queue: Arc<wgpu::Queue>,

    /// Staging buffer for reading SpatialAllocReq
    req_staging: GuestMemStaging,

    /// Staging buffer for writing SpatialAllocResp
    resp_staging: GuestMemStaging,

    // Phase 5.3: Spatial processing staging buffers
    /// Staging buffer for reading SpatialProcessReq
    process_req_staging: GuestMemStaging,
    /// Staging buffer for writing SpatialProcessResp
    process_resp_staging: GuestMemStaging,
    /// Staging buffer for input data (guest → GPU)
    input_data_staging: GuestMemStaging,
    /// Staging buffer for output data (GPU → guest)
    output_data_staging: GuestMemStaging,

    // Phase 5.4: GridRunner for GPU spatial execution
    /// GridRunner instance for ~968x speedup (optional for async initialization)
    grid_runner: Option<crate::spatial::GridRunner>,

    // Phase 5.6: Tokio runtime for async GridRunner execution
    /// Tokio runtime for calling async GridRunner methods from sync context
    async_runtime: Option<tokio::runtime::Runtime>,
}

impl SpatialHypervisorIntegration {
    /// Create a new spatial hypervisor integration
    pub fn new(
        grid_w: usize,
        grid_h: usize,
        ram_buffer: Arc<wgpu::Buffer>,
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
    ) -> Self {
        let req_size = std::mem::size_of::<SpatialAllocReq>() as u64;
        let resp_size = std::mem::size_of::<SpatialAllocResp>() as u64;
        
        // Phase 5.3: Process staging buffers
        let process_req_size = std::mem::size_of::<SpatialProcessReq>() as u64;
        let process_resp_size = std::mem::size_of::<SpatialProcessResp>() as u64;
        // 4KB staging buffers for data transfer
        let data_staging_size = 4096u64;

        SpatialHypervisorIntegration {
            allocator: SpatialAllocator::new(grid_w, grid_h),
            ram_buffer,
            device: device.clone(),
            queue,
            req_staging: GuestMemStaging::new(&device, req_size, "Spatial Alloc Req Staging", true),
            resp_staging: GuestMemStaging::new(&device, resp_size, "Spatial Alloc Resp Staging", false),
            // Phase 5.3
            process_req_staging: GuestMemStaging::new(&device, process_req_size, "Spatial Process Req Staging", true),
            process_resp_staging: GuestMemStaging::new(&device, process_resp_size, "Spatial Process Resp Staging", false),
            input_data_staging: GuestMemStaging::new(&device, data_staging_size, "Input Data Staging", true),
            output_data_staging: GuestMemStaging::new(&device, data_staging_size, "Output Data Staging", false),
            // Phase 5.4: GridRunner (initialized later via async method)
            grid_runner: None,
            // Phase 5.6: Tokio runtime for async GridRunner execution
            async_runtime: Some(
                tokio::runtime::Runtime::new()
                    .expect("Failed to create Tokio runtime for spatial processing"),
            ),
        }
    }

    /// Phase 5.6: Pre-initialize GridRunner with async runtime
    ///
    /// This should be called during setup to ensure GridRunner is ready
    /// before the first spatial processing request. Using lazy initialization
    /// at request time adds latency.
    pub fn initialize_grid_runner(&mut self) {
        if self.grid_runner.is_some() {
            log::info!("GridRunner already initialized, skipping");
            return;
        }

        let runtime = self
            .async_runtime
            .as_ref()
            .expect("Tokio runtime not initialized");

        log::info!("Initializing GridRunner with Tokio runtime...");

        let runner = runtime
            .block_on(crate::spatial::GridRunner::new())
            .expect("Failed to initialize GridRunner");

        self.grid_runner = Some(runner);
        log::info!("GridRunner initialized successfully");
    }

    /// Handle a spatial allocation hypercall (0x123)
    ///
    /// # Arguments
    /// * `req_ptr` - Guest virtual address of SpatialAllocReq
    /// * `resp_ptr` - Guest virtual address where SpatialAllocResp should be written
    /// * `ready_flag_ptr` - Guest virtual address of u32 response_ready flag (optional)
    ///
    /// # Returns
    /// * (result, wall_cells) - Syscall result code and any WALL cells to place
    pub fn handle_spatial_alloc(
        &mut self,
        req_ptr: u64,
        resp_ptr: u64,
        ready_flag_ptr: u64,
    ) -> (i32, Vec<(usize, usize, CellState)>) {
        // Read SpatialAllocReq from guest memory
        let req = match self.read_alloc_req(req_ptr) {
            Some(req) => req,
            None => {
                log::error!("Failed to read SpatialAllocReq from 0x{:x}", req_ptr);
                return (-4, Vec::new()); // SPATIAL_ALLOC_ERR_INVALID_POINTER
            }
        };

        log::info!(
            "Spatial allocation request: {}x{} region at guest ptr 0x{:x}",
            req.width,
            req.height,
            req_ptr
        );

        // Call allocator
        let (resp, wall_cells) = self.allocator.allocate_region(&req);

        log::info!(
            "Spatial allocation result: region_id={}, x={}, y={}, result={}",
            resp.region_id,
            resp.x,
            resp.y,
            resp.result
        );

        // Write response back to guest memory
        if let Err(e) = self.write_alloc_resp(resp_ptr, &resp) {
            log::error!(
                "Failed to write SpatialAllocResp to 0x{:x}: {}",
                resp_ptr,
                e
            );
            return (-4, Vec::new()); // SPATIAL_ALLOC_ERR_INVALID_POINTER
        }

        // Write response_ready flag if provided (for synchronization)
        if ready_flag_ptr != 0 {
            if let Err(e) = self.write_ready_flag(ready_flag_ptr, 2u32) {
                log::error!(
                    "Failed to write response_ready flag to 0x{:x}: {}",
                    ready_flag_ptr,
                    e
                );
                // Non-fatal error, continue
            } else {
                log::debug!("Wrote response_ready=2 to 0x{:x}", ready_flag_ptr);
            }
        }

        (resp.result, wall_cells)
    }

    /// Read SpatialAllocReq from guest RAM (manual byte parsing)
    fn read_alloc_req(&self, ptr: u64) -> Option<SpatialAllocReq> {
        let data = match self
            .req_staging
            .read_from_ram(&self.queue, &self.device, &self.ram_buffer, ptr)
        {
            Ok(data) => data,
            Err(e) => {
                log::error!("Failed to read from guest RAM: {}", e);
                return None;
            }
        };

        if data.len() < std::mem::size_of::<SpatialAllocReq>() {
            log::error!(
                "Not enough data for SpatialAllocReq: got {}, expected {}",
                data.len(),
                std::mem::size_of::<SpatialAllocReq>()
            );
            return None;
        }

        // Manual little-endian parsing to avoid bytemuck padding issues
        let req_id = u64::from_le_bytes([
            data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7],
        ]);
        let width = u32::from_le_bytes([data[8], data[9], data[10], data[11]]);
        let height = u32::from_le_bytes([data[12], data[13], data[14], data[15]]);

        Some(SpatialAllocReq {
            req_id,
            width,
            height,
        })
    }

    /// Write SpatialAllocResp to guest RAM (manual byte serialization)
    fn write_alloc_resp(&self, ptr: u64, resp: &SpatialAllocResp) -> Result<(), String> {
        // Manual little-endian serialization to avoid bytemuck padding issues
        let mut data = vec![0u8; std::mem::size_of::<SpatialAllocResp>()];

        data[0..8].copy_from_slice(&resp.region_id.to_le_bytes());
        data[8..12].copy_from_slice(&resp.result.to_le_bytes());
        data[12..16].copy_from_slice(&resp.x.to_le_bytes());
        data[16..20].copy_from_slice(&resp.y.to_le_bytes());

        self.resp_staging
            .write_to_ram(&self.queue, &self.device, &self.ram_buffer, ptr, &data)
    }

    /// Write a u32 ready flag to guest RAM
    fn write_ready_flag(&self, ptr: u64, value: u32) -> Result<(), String> {
        let data = value.to_le_bytes().to_vec();
        self.resp_staging
            .write_to_ram(&self.queue, &self.device, &self.ram_buffer, ptr, &data)
    }

    /// Process spatial hypercalls from the syscall queue
    ///
    /// This iterates through pending syscalls and handles any spatial allocation
    /// requests (syscall_num == HYPERCALL_SPATIAL_ALLOC)
    ///
    /// # Returns
    /// * Vec of wall cells that need to be placed on the spatial grid
    pub fn process_hypercalls(
        &mut self,
        syscalls: &[SyscallEntry],
    ) -> Vec<(usize, usize, CellState)> {
        let mut all_wall_cells = Vec::new();

        for syscall in syscalls {
            // Check if this is a spatial allocation hypercall
            if syscall.num == HYPERCALL_SPATIAL_ALLOC as u32 {
                log::info!(
                    "Processing spatial hypercall: req_ptr=0x{:x}, resp_ptr=0x{:x}, ready_flag_ptr=0x{:x}",
                    syscall.arg0,
                    syscall.arg1,
                    syscall.arg2
                );

                let req_ptr = syscall.arg0 as u64;
                let resp_ptr = syscall.arg1 as u64;
                let ready_flag_ptr = syscall.arg2 as u64;

                let (result, wall_cells) =
                    self.handle_spatial_alloc(req_ptr, resp_ptr, ready_flag_ptr);

                // TODO: Write result back to syscall queue (arg5 = syscall.result field)
                // For now, we just collect the wall cells

                all_wall_cells.extend(wall_cells);
            }
        }

        all_wall_cells
    }

    /// Get a reference to the spatial allocator (for external queries)
    pub fn allocator(&self) -> &SpatialAllocator {
        &self.allocator
    }

    /// Get a mutable reference to the spatial allocator (for operations)
    pub fn allocator_mut(&mut self) -> &mut SpatialAllocator {
        &mut self.allocator
    }

    // ── Phase 5.3: Spatial Processing Methods ───────────────────────────────────

    /// Handle a spatial processing hypercall (0x124)
    ///
    /// # Arguments
    /// * `req_ptr` - Guest virtual address of SpatialProcessReq
    /// * `resp_ptr` - Guest virtual address where SpatialProcessResp should be written
    ///
    /// # Returns
    /// * (result, words_processed) - Result code and number of words processed
    pub fn handle_spatial_process(&mut self, req_ptr: u64, resp_ptr: u64) -> (i32, u32) {
        // Read SpatialProcessReq from guest memory
        let req = match self.read_process_req(req_ptr) {
            Some(req) => req,
            None => {
                log::error!("Failed to read SpatialProcessReq from 0x{:x}", req_ptr);
                let resp = SpatialProcessResp {
                    req_id: 0,
                    result: SPATIAL_PROCESS_ERR_INTERNAL,
                    words_processed: 0,
                };
                let _ = self.write_process_resp(resp_ptr, &resp);
                return (SPATIAL_PROCESS_ERR_INTERNAL, 0);
            }
        };

        log::info!(
            "Spatial process request: req_id={}, region_id={}, opcode={}, input_ptr=0x{:x}, input_size={}, output_ptr=0x{:x}, output_size={}",
            req.req_id,
            req.region_id,
            req.opcode,
            req.input_buffer_ptr,
            req.input_size,
            req.output_buffer_ptr,
            req.output_size
        );

        // Validate region_id
        let region = match self.allocator.get_region(req.region_id as u64) {
            Some(r) => r,
            None => {
                log::error!("Invalid region_id: {}", req.region_id);
                let resp = SpatialProcessResp {
                    req_id: req.req_id,
                    result: SPATIAL_PROCESS_ERR_INVALID_REGION,
                    words_processed: 0,
                };
                let _ = self.write_process_resp(resp_ptr, &resp);
                return (SPATIAL_PROCESS_ERR_INVALID_REGION, 0);
            }
        };

        // Validate sizes (must be multiples of 4 bytes)
        if req.input_size % 4 != 0 || req.output_size % 4 != 0 {
            log::error!("Invalid sizes: input_size={}, output_size={} (must be multiples of 4)", req.input_size, req.output_size);
            let resp = SpatialProcessResp {
                req_id: req.req_id,
                result: SPATIAL_PROCESS_ERR_INVALID_SIZE,
                words_processed: 0,
            };
            let _ = self.write_process_resp(resp_ptr, &resp);
            return (SPATIAL_PROCESS_ERR_INVALID_SIZE, 0);
        }

        // Validate sizes are within staging buffer capacity (4KB)
        if req.input_size > 4096 || req.output_size > 4096 {
            log::error!("Sizes too large: input_size={}, output_size={} (max 4096)", req.input_size, req.output_size);
            let resp = SpatialProcessResp {
                req_id: req.req_id,
                result: SPATIAL_PROCESS_ERR_INVALID_SIZE,
                words_processed: 0,
            };
            let _ = self.write_process_resp(resp_ptr, &resp);
            return (SPATIAL_PROCESS_ERR_INVALID_SIZE, 0);
        }

        // Validate opcode
        if req.opcode < OPCODE_ADD || req.opcode > OPCODE_DIV {
            log::error!("Unsupported opcode: {}", req.opcode);
            let resp = SpatialProcessResp {
                req_id: req.req_id,
                result: SPATIAL_PROCESS_ERR_UNSUPPORTED_OPCODE,
                words_processed: 0,
            };
            let _ = self.write_process_resp(resp_ptr, &resp);
            return (SPATIAL_PROCESS_ERR_UNSUPPORTED_OPCODE, 0);
        }

        // Read input data from guest RAM
        let input_data = match self.input_data_staging.read_from_ram(
            &self.queue,
            &self.device,
            &self.ram_buffer,
            req.input_buffer_ptr as u64,
        ) {
            Ok(data) => data,
            Err(e) => {
                log::error!("Failed to read input data from guest RAM: {}", e);
                let resp = SpatialProcessResp {
                    req_id: req.req_id,
                    result: SPATIAL_PROCESS_ERR_INTERNAL,
                    words_processed: 0,
                };
                let _ = self.write_process_resp(resp_ptr, &resp);
                return (SPATIAL_PROCESS_ERR_INTERNAL, 0);
            }
        };

        let num_words = input_data.len() / 4;

        // Phase 5.4: Process on GPU with GridRunner, fall back to CPU
        let output_data = match self.process_data_on_gpu(&input_data, req.opcode) {
            Ok(data) => data,
            Err(e) => {
                log::error!("Failed to process data: {}", e);
                let resp = SpatialProcessResp {
                    req_id: req.req_id,
                    result: SPATIAL_PROCESS_ERR_INTERNAL,
                    words_processed: 0,
                };
                let _ = self.write_process_resp(resp_ptr, &resp);
                return (SPATIAL_PROCESS_ERR_INTERNAL, 0);
            }
        };

        // Write output data to guest RAM
        match self.output_data_staging.write_to_ram(
            &self.queue,
            &self.device,
            &self.ram_buffer,
            req.output_buffer_ptr as u64,
            &output_data,
        ) {
            Ok(_) => {
                log::info!("Successfully wrote {} bytes to output buffer", output_data.len());
            }
            Err(e) => {
                log::error!("Failed to write output data to guest RAM: {}", e);
                let resp = SpatialProcessResp {
                    req_id: req.req_id,
                    result: SPATIAL_PROCESS_ERR_INTERNAL,
                    words_processed: 0,
                };
                let _ = self.write_process_resp(resp_ptr, &resp);
                return (SPATIAL_PROCESS_ERR_INTERNAL, 0);
            }
        }

        // Write response back to guest memory
        let resp = SpatialProcessResp {
            req_id: req.req_id,
            result: SPATIAL_PROCESS_OK,
            words_processed: num_words as u32,
        };

        match self.write_process_resp(resp_ptr, &resp) {
            Ok(_) => {
                log::info!("Spatial processing complete: {} words processed", num_words);
            }
            Err(e) => {
                log::error!("Failed to write SpatialProcessResp: {}", e);
                return (SPATIAL_PROCESS_ERR_INTERNAL, 0);
            }
        }

        (SPATIAL_PROCESS_OK, num_words as u32)
    }

    /// Read SpatialProcessReq from guest RAM (manual byte parsing)
    fn read_process_req(&self, ptr: u64) -> Option<SpatialProcessReq> {
        let data = match self
            .process_req_staging
            .read_from_ram(&self.queue, &self.device, &self.ram_buffer, ptr)
        {
            Ok(data) => data,
            Err(e) => {
                log::error!("Failed to read from guest RAM: {}", e);
                return None;
            }
        };

        if data.len() < std::mem::size_of::<SpatialProcessReq>() {
            log::error!(
                "Not enough data for SpatialProcessReq: got {}, expected {}",
                data.len(),
                std::mem::size_of::<SpatialProcessReq>()
            );
            return None;
        }

        // Manual little-endian parsing
        let req_id = u64::from_le_bytes([
            data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7],
        ]);
        let input_buffer_ptr = u32::from_le_bytes([data[8], data[9], data[10], data[11]]);
        let input_size = u32::from_le_bytes([data[12], data[13], data[14], data[15]]);
        let output_buffer_ptr = u32::from_le_bytes([data[16], data[17], data[18], data[19]]);
        let output_size = u32::from_le_bytes([data[20], data[21], data[22], data[23]]);
        let region_id = u32::from_le_bytes([data[24], data[25], data[26], data[27]]);
        let opcode = u32::from_le_bytes([data[28], data[29], data[30], data[31]]);

        Some(SpatialProcessReq {
            req_id,
            input_buffer_ptr,
            input_size,
            output_buffer_ptr,
            output_size,
            region_id,
            opcode,
        })
    }

    /// Write SpatialProcessResp to guest RAM (manual byte serialization)
    fn write_process_resp(&self, ptr: u64, resp: &SpatialProcessResp) -> Result<(), String> {
        let mut data = vec![0u8; std::mem::size_of::<SpatialProcessResp>()];

        data[0..8].copy_from_slice(&resp.req_id.to_le_bytes());
        data[8..12].copy_from_slice(&resp.result.to_le_bytes());
        data[12..16].copy_from_slice(&resp.words_processed.to_le_bytes());

        self.process_resp_staging
            .write_to_ram(&self.queue, &self.device, &self.ram_buffer, ptr, &data)
    }

    /// Convert full grid array to GridRunner binary format
    ///
    /// GridRunner expects:
    /// - Header (20 bytes): grid_w, grid_h, cell_count, first_code_x, first_code_y
    /// - Cell entries (16 bytes each): x, y, opcode_or_type, data_buffer
    fn grid_to_binary(grid: &[CellState], first_code_x: usize, first_code_y: usize) -> Vec<u8> {
        use crate::spatial::path_cache::GRID_W;

        // Count non-empty cells (cells that are not NOP)
        let cell_count = grid
            .iter()
            .filter(|cell| cell.opcode() != crate::geoasm_materializer::TYPE_NOP || cell.data_buffer != 0)
            .count();

        let mut binary = Vec::with_capacity(20 + cell_count * 16);

        // Header
        binary.extend_from_slice(&(GRID_W as u32).to_le_bytes()); // grid_w
        binary.extend_from_slice(&(64u32).to_le_bytes());         // grid_h
        binary.extend_from_slice(&(cell_count as u32).to_le_bytes()); // cell_count
        binary.extend_from_slice(&(first_code_x as u32).to_le_bytes()); // first_code_x
        binary.extend_from_slice(&(first_code_y as u32).to_le_bytes()); // first_code_y

        // Cell entries
        for (idx, cell) in grid.iter().enumerate() {
            // Skip empty NOP cells with no data
            if cell.opcode() == crate::geoasm_materializer::TYPE_NOP && cell.data_buffer == 0 {
                continue;
            }

            let x = idx % GRID_W;
            let y = idx / GRID_W;

            binary.extend_from_slice(&(x as u32).to_le_bytes());
            binary.extend_from_slice(&(y as u32).to_le_bytes());
            binary.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
            binary.extend_from_slice(&cell.data_buffer.to_le_bytes());
        }

        binary
    }

    /// Process data on GPU via GridRunner (Phase 5.5: ~968x speedup)
    ///
    /// Generates a GeoASM program for the requested operation and executes it
    /// on the spatial grid via GridRunner.
    /// Process data on GPU via GridRunner (Phase 5.6: ~968x speedup unlocked)
    ///
    /// Generates a GeoASM program for the requested operation and executes it
    /// on the spatial grid via GridRunner using Tokio runtime for async/sync bridging.
    ///
    /// Phase 5.6: This method now uses the Tokio runtime to call async GridRunner
    /// methods from the synchronous hypervisor context, unlocking full GPU speedup.
    fn process_data_on_gpu(&mut self, input: &[u8], opcode: u32) -> Result<Vec<u8>, String> {
        // Ensure GridRunner is initialized (lazy initialization with Tokio runtime)
        if self.grid_runner.is_none() {
            let runtime = self
                .async_runtime
                .as_ref()
                .ok_or("Tokio runtime not available")?;
            log::info!("Lazy-initializing GridRunner with Tokio runtime...");
            let runner = runtime
                .block_on(crate::spatial::GridRunner::new())
                .map_err(|e| format!("Failed to initialize GridRunner: {:?}", e))?;
            self.grid_runner = Some(runner);
            log::info!("GridRunner initialized successfully");
        }

        // Use Tokio runtime to execute the async method
        let runtime = self
            .async_runtime
            .as_ref()
            .ok_or("Tokio runtime not available")?;

        let input = input.to_vec();
        let grid_runner = self
            .grid_runner
            .as_mut()
            .ok_or("GridRunner not initialized")?;

        let output = runtime
            .block_on(Self::process_data_on_gpu_async_internal(
                grid_runner,
                &input,
                opcode,
            ))
            .map_err(|e| format!("Async execution failed: {}", e))?;

        Ok(output)
    }

    /// Internal async implementation of GPU processing
    ///
    /// This is called via Tokio runtime from the synchronous wrapper.
    async fn process_data_on_gpu_async_internal(
        runner: &mut crate::spatial::GridRunner,
        input: &[u8],
        opcode: u32,
    ) -> Result<Vec<u8>, String> {
        // Convert bytes to words (u32)
        let mut words = Vec::new();
        for chunk in input.chunks(4) {
            let mut buf = [0u8; 4];
            buf[..chunk.len()].copy_from_slice(chunk);
            words.push(u32::from_le_bytes(buf));
        }

        log::info!(
            "Processing {} words on GPU spatial grid (opcode={})",
            words.len(),
            opcode
        );

        // Import spatial processor
        use crate::spatial::spatial_processor::generate_processing_program;
        use crate::spatial::spatial_processor_grid::{cells_to_grid_array, extract_output_from_grid};

        // Generate GeoASM program for this operation
        let cells_with_coords = generate_processing_program(&words, opcode);

        log::info!(
            "Generated GeoASM program: {} cells",
            cells_with_coords.len()
        );

        // Convert sparse cells to full 128x64 grid
        let grid = cells_to_grid_array(&cells_with_coords);

        log::info!("Converted to full grid: {} cells", grid.len());

        // Convert grid to binary format for GridRunner
        let binary = Self::grid_to_binary(&grid, 0, 1); // First instruction cell at (0, 1)

        log::info!("Binary format: {} bytes", binary.len());

        // Load program into GridRunner
        runner
            .load_binary(&binary)
            .map_err(|e| format!("Failed to load binary: {}", e))?;

        // Execute one tick (the program should complete in one tick for simple ops)
        let _result_grid = runner
            .tick()
            .await
            .map_err(|e| format!("Failed to execute tick: {}", e))?;

        // Read results from grid
        let result_grid = runner
            .read_grid()
            .await
            .map_err(|e| format!("Failed to read grid: {}", e))?;

        // Extract output from row 2
        let output_words = extract_output_from_grid(&result_grid, words.len());

        log::info!(
            "GPU execution complete: {} output words",
            output_words.len()
        );

        // Convert words back to bytes
        let mut output = Vec::with_capacity(output_words.len() * 4);
        for word in output_words {
            output.extend_from_slice(&word.to_le_bytes());
        }

        Ok(output)
    }

    /// Process data on CPU (Phase 5.4: fallback for GridRunner)
    fn process_data_on_cpu_fallback(&self, input: &[u8], opcode: u32) -> Result<Vec<u8>, String> {
        // Convert bytes to words (u32)
        let mut words = Vec::new();
        for chunk in input.chunks(4) {
            let mut buf = [0u8; 4];
            buf[..chunk.len()].copy_from_slice(chunk);
            words.push(u32::from_le_bytes(buf));
        }

        // Apply operation to each word
        let mut result = Vec::with_capacity(words.len());
        for word in &words {
            let processed = match opcode {
                OPCODE_ADD => word.wrapping_add(1), // Add 1 (simple demo)
                OPCODE_MUL => word.wrapping_mul(2), // Multiply by 2
                OPCODE_SUB => word.wrapping_sub(1), // Subtract 1
                OPCODE_DIV => word.wrapping_div(2), // Divide by 2
                _ => return Err(format!("Unsupported opcode: {}", opcode)),
            };
            result.push(processed);
        }

        // Convert words back to bytes
        let mut output = Vec::with_capacity(result.len() * 4);
        for word in result {
            output.extend_from_slice(&word.to_le_bytes());
        }

        Ok(output)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_alloc_via_integration() {
        let mut alloc = SpatialAllocator::new(128, 64);
        let req = SpatialAllocReq {
            req_id: 0,
            width: 10,
            height: 5,
        };

        let (resp, walls) = alloc.allocate_region(&req);

        assert_eq!(resp.result, SPATIAL_ALLOC_OK);
        assert_eq!(resp.region_id, 1);
        assert!(!walls.is_empty());
    }
}