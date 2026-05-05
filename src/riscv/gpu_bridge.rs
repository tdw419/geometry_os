// riscv/gpu_bridge.rs -- GPU Compute Bridge for RISC-V Guest (Phase 214)
//
// Bridges the WGSL GPU compute pipeline (riscv/gpu.rs) into the main
// RISC-V interpreter loop. The guest can request GPU-accelerated compute
// via an SBI call (SBI_EXT_GEOMETRY, GEO_FN_GPU_COMPUTE = 5).
//
// Protocol:
//   a0 = guest_phys_addr  -- base address of the code to offload (in guest RAM)
//   a1 = num_words        -- number of u32 words of code (max RAM_WORDS=992)
//   a2 = max_steps        -- instruction step limit per tile
//   a3 = num_tiles        -- number of parallel GPU tiles (1..MAX_TILES)
//   a4 = result_addr      -- guest physical address to write results back
//
// The bridge:
//   1. Reads num_words from guest RAM at guest_phys_addr
//   2. Creates tile state buffers (one per tile, each gets a copy of the code)
//   3. Dispatches to GpuExecutor::run_tiles()
//   4. Writes result summary back to guest RAM at result_addr
//
// Result layout at result_addr (12 u32 words):
//   [0] = status (0=success, 1=GPU unavailable, 2=invalid params, 3=GPU error)
//   [1] = num_tiles dispatched
//   [2] = first tile's final PC
//   [3] = first tile's instruction count
//   [4] = first tile's status flags (STATUS_RUNNING/HALTED/ERROR)
//   [5..12] = first tile's registers x1..x7 (a0-a7 return values)
//
// This is a synchronous call -- the guest blocks until GPU execution completes.

#[cfg(feature = "gpu")]
use super::gpu::{extract_uart, init_tile_states, GpuExecutor, TILE_STATE_WORDS};

use super::gpu::RAM_WORDS;

/// Result buffer layout size in u32 words.
pub const GPU_RESULT_WORDS: usize = 12;

/// GPU compute status codes written to result buffer.
pub const GPU_OK: u32 = 0;
pub const GPU_ERR_UNAVAILABLE: u32 = 1;
pub const GPU_ERR_INVALID_PARAMS: u32 = 2;
pub const GPU_ERR_EXECUTION: u32 = 3;

/// Pending GPU compute request. Set by SBI handler, fulfilled by the step loop.
#[derive(Debug, Clone)]
pub struct GpuComputeRequest {
    /// Guest physical address of code to offload.
    pub code_addr: u64,
    /// Number of u32 words of code.
    pub num_words: u32,
    /// Max instruction steps per tile.
    pub max_steps: u32,
    /// Number of parallel GPU tiles.
    pub num_tiles: u32,
    /// Guest physical address to write results.
    pub result_addr: u64,
}

/// GPU compute bridge. Lazily initializes the GPU executor on first use.
/// When the `gpu` feature is not enabled, all operations return GPU_ERR_UNAVAILABLE.
pub struct GpuBridge {
    #[cfg(feature = "gpu")]
    executor: Option<GpuExecutor>,
    /// Whether GPU initialization was attempted (to avoid retrying failures).
    init_attempted: bool,
    /// Count of successful GPU dispatches (for stats).
    dispatch_count: u64,
    /// Total tiles executed across all dispatches.
    total_tiles: u64,
}

impl std::fmt::Debug for GpuBridge {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("GpuBridge")
            .field("init_attempted", &self.init_attempted)
            .field("dispatch_count", &self.dispatch_count)
            .field("total_tiles", &self.total_tiles)
            .finish()
    }
}

impl GpuBridge {
    /// Create a new GPU bridge. The GPU executor is initialized lazily on first use.
    pub fn new() -> Self {
        Self {
            #[cfg(feature = "gpu")]
            executor: None,
            init_attempted: false,
            dispatch_count: 0,
            total_tiles: 0,
        }
    }

    /// Check if GPU compute is available.
    pub fn is_available(&self) -> bool {
        #[cfg(feature = "gpu")]
        {
            self.executor.is_some()
        }
        #[cfg(not(feature = "gpu"))]
        {
            false
        }
    }

    /// Get dispatch statistics.
    pub fn stats(&self) -> (u64, u64) {
        (self.dispatch_count, self.total_tiles)
    }

    /// Execute a GPU compute request.
    ///
    /// Reads code from guest memory via `read_fn`, dispatches to GPU,
    /// writes results back via `write_fn`.
    ///
    /// `read_fn(phys_addr) -> u32` -- read a u32 from guest physical memory.
    /// `write_fn(phys_addr, val)` -- write a u32 to guest physical memory.
    #[allow(unused_variables)]
    pub fn execute<R, W>(
        &mut self,
        req: &GpuComputeRequest,
        read_fn: R,
        write_fn: W,
    ) -> u32
    where
        R: Fn(u64) -> u32,
        W: Fn(u64, u32),
    {
        // Validate parameters (always checked, even without GPU)
        if req.num_words == 0 || req.num_words as usize > RAM_WORDS {
            return GPU_ERR_INVALID_PARAMS;
        }
        if req.num_tiles == 0 || req.num_tiles > 256 {
            return GPU_ERR_INVALID_PARAMS;
        }

        // Non-GPU builds always return unavailable
        #[cfg(not(feature = "gpu"))]
        {
            let _ = (&read_fn, &write_fn);
            return GPU_ERR_UNAVAILABLE;
        }

        // --- GPU path (only compiled with --features gpu) ---
        #[cfg(feature = "gpu")]
        {
            self.execute_gpu(req, read_fn, write_fn)
        }
    }

    /// Get or lazily initialize the GPU executor.
    #[cfg(feature = "gpu")]
    fn get_or_init_executor(&mut self) -> Option<&GpuExecutor> {
        if self.executor.is_some() {
            return self.executor.as_ref();
        }
        if self.init_attempted {
            return None; // Already tried and failed
        }
        self.init_attempted = true;
        match pollster::block_on(GpuExecutor::new()) {
            Ok(exec) => {
                eprintln!("[gpu-bridge] GPU executor initialized successfully");
                self.executor = Some(exec);
                self.executor.as_ref()
            }
            Err(e) => {
                eprintln!("[gpu-bridge] GPU executor initialization failed: {}", e);
                None
            }
        }
    }

    /// Actual GPU execution path (only compiled with --features gpu).
    #[cfg(feature = "gpu")]
    fn execute_gpu<R, W>(
        &mut self,
        req: &GpuComputeRequest,
        read_fn: R,
        write_fn: W,
    ) -> u32
    where
        R: Fn(u64) -> u32,
        W: Fn(u64, u32),
    {
        // Get or initialize GPU executor
        let executor = match self.get_or_init_executor() {
            Some(e) => e,
            None => return GPU_ERR_UNAVAILABLE,
        };

        // Read code from guest memory
        let mut cartridge = Vec::with_capacity(req.num_words as usize);
        for i in 0..req.num_words as u64 {
            cartridge.push(read_fn(req.code_addr + i * 4));
        }

        // Initialize tile states
        let num_tiles = req.num_tiles as usize;
        let tile_data = init_tile_states(num_tiles, &cartridge, req.max_steps);

        // Dispatch to GPU
        let mut tile_data = tile_data;
        if let Err(e) = executor.run_tiles(&mut tile_data, req.num_tiles) {
            eprintln!("[gpu-bridge] GPU execution failed: {}", e);
            return GPU_ERR_EXECUTION;
        }

        // Extract results from first tile and write back to guest memory
        let status = tile_data[33]; // first tile status
        let pc = tile_data[32];
        let inst_count = tile_data[34];
        let uart_output = extract_uart(&tile_data[..TILE_STATE_WORDS]);

        // Write result buffer
        write_fn(req.result_addr, GPU_OK); // [0] status
        write_fn(req.result_addr + 4, req.num_tiles); // [1] num_tiles
        write_fn(req.result_addr + 8, pc); // [2] final PC
        write_fn(req.result_addr + 12, inst_count); // [3] instruction count
        write_fn(req.result_addr + 16, status); // [4] status flags
        // [5..12] first tile's registers x1..x7
        for i in 0..7 {
            write_fn(req.result_addr + 20 + (i as u64) * 4, tile_data[i + 1]);
        }

        // Log for diagnostics
        self.dispatch_count += 1;
        self.total_tiles += num_tiles as u64;
        eprintln!(
            "[gpu-bridge] dispatch #{}: {} tiles, {} steps/tile, {} insts, status=0x{:x}, uart=\"{}\"",
            self.dispatch_count,
            num_tiles,
            req.max_steps,
            inst_count,
            status,
            &uart_output[..uart_output.len().min(64)]
        );

        GPU_OK
    }
}

impl Default for GpuBridge {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_gpu_bridge_new() {
        let mut bridge = GpuBridge::new();
        assert!(!bridge.init_attempted);
        assert_eq!(bridge.stats(), (0, 0));
    }

    #[test]
    fn test_gpu_bridge_validate_params_zero_words() {
        let mut bridge = GpuBridge::new();
        let req = GpuComputeRequest {
            code_addr: 0,
            num_words: 0,
            max_steps: 100,
            num_tiles: 1,
            result_addr: 0x1000,
        };
        let read = |_addr: u64| 0u32;
        let write = |_addr: u64, _val: u32| {};
        assert_eq!(bridge.execute(&req, read, write), GPU_ERR_INVALID_PARAMS);
    }

    #[test]
    fn test_gpu_bridge_validate_params_too_many_words() {
        let mut bridge = GpuBridge::new();
        let req = GpuComputeRequest {
            code_addr: 0,
            num_words: (RAM_WORDS + 1) as u32,
            max_steps: 100,
            num_tiles: 1,
            result_addr: 0x1000,
        };
        let read = |_addr: u64| 0u32;
        let write = |_addr: u64, _val: u32| {};
        assert_eq!(bridge.execute(&req, read, write), GPU_ERR_INVALID_PARAMS);
    }

    #[test]
    fn test_gpu_bridge_validate_params_zero_tiles() {
        let mut bridge = GpuBridge::new();
        let req = GpuComputeRequest {
            code_addr: 0,
            num_words: 4,
            max_steps: 100,
            num_tiles: 0,
            result_addr: 0x1000,
        };
        let read = |_addr: u64| 0u32;
        let write = |_addr: u64, _val: u32| {};
        assert_eq!(bridge.execute(&req, read, write), GPU_ERR_INVALID_PARAMS);
    }

    #[test]
    fn test_gpu_bridge_validate_params_too_many_tiles() {
        let mut bridge = GpuBridge::new();
        let req = GpuComputeRequest {
            code_addr: 0,
            num_words: 4,
            max_steps: 100,
            num_tiles: 257,
            result_addr: 0x1000,
        };
        let read = |_addr: u64| 0u32;
        let write = |_addr: u64, _val: u32| {};
        assert_eq!(bridge.execute(&req, read, write), GPU_ERR_INVALID_PARAMS);
    }

    #[test]
    fn test_result_buffer_layout() {
        // Verify the result buffer fits in 12 words
        assert_eq!(GPU_RESULT_WORDS, 12);
        // Status at offset 0, num_tiles at offset 1, PC at offset 2, etc.
        // Total: 5 header words + 7 register words = 12
    }

    #[test]
    fn test_gpu_request_debug() {
        let req = GpuComputeRequest {
            code_addr: 0x80001000,
            num_words: 16,
            max_steps: 500,
            num_tiles: 4,
            result_addr: 0x80002000,
        };
        let debug_str = format!("{:?}", req);
        assert!(debug_str.contains("2147487744"));
        assert!(debug_str.contains("2147491840"));
    }

    #[test]
    fn test_gpu_bridge_not_available_without_feature() {
        let mut bridge = GpuBridge::new();
        assert!(!bridge.is_available());
        // Execute should return UNAVAILABLE for valid params
        let req = GpuComputeRequest {
            code_addr: 0,
            num_words: 4,
            max_steps: 100,
            num_tiles: 1,
            result_addr: 0x1000,
        };
        let read = |_addr: u64| 0u32;
        let write = |_addr: u64, _val: u32| {};
        assert_eq!(bridge.execute(&req, read, write), GPU_ERR_UNAVAILABLE);
    }
}
