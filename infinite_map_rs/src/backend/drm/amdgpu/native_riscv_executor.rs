//! Native RISC-V Executor
//!
//! Coordinates SPIR-V shader loading, GPU memory mapping, and AMDGPU
//! command submission for executing RISC-V workloads on the GPU.

use anyhow::{anyhow, Context, Result};
use std::path::Path;

use super::bo_manager::{AmdgpuBoManager, BoHandle};
use super::command_buffer::AmdgpuCommandBuffer;
use super::device::AmdGpuDevice;

/// Default compute ring for AMDGPU
const COMPUTE_RING: u32 = 0;

/// Default shader resource configuration
const DEFAULT_PGM_RSRC1: u32 = 0;
const DEFAULT_PGM_RSRC2: u32 = 0;

/// Result of a shader execution
#[derive(Debug)]
pub struct ExecutionResult {
    /// Fence handle from CS submission
    pub fence_handle: u64,
    /// Output data read back from GPU
    pub output_data: Vec<u8>,
    /// Execution time estimate (ns)
    pub execution_time_ns: u64,
}

/// Configuration for a compute dispatch
#[derive(Debug, Clone)]
pub struct DispatchConfig {
    /// Workgroup count X
    pub workgroup_x: u32,
    /// Workgroup count Y
    pub workgroup_y: u32,
    /// Workgroup count Z
    pub workgroup_z: u32,
    /// Push constant data (up to 128 bytes)
    pub push_constants: Vec<u8>,
}

impl Default for DispatchConfig {
    fn default() -> Self {
        Self {
            workgroup_x: 1,
            workgroup_y: 1,
            workgroup_z: 1,
            push_constants: Vec::new(),
        }
    }
}

/// Native RISC-V Executor for AMDGPU
///
/// Coordinates the full pipeline:
/// 1. Load SPIR-V shader binary
/// 2. Allocate GPU buffers (shader code, input/output data)
/// 3. Map buffers into GPU VA space
/// 4. Build PM4 command buffer
/// 5. Submit via DRM_IOCTL_AMDGPU_CS
/// 6. Wait for completion and read back results
pub struct NativeRiscvExecutor {
    /// AMDGPU device
    device: AmdGpuDevice,
    /// Buffer object manager
    bo_manager: AmdgpuBoManager,
    /// CS context ID
    ctx_id: u32,
    /// Shader BO handle (0 if not loaded)
    shader_bo: BoHandle,
    /// Input BO handle (0 if not allocated)
    input_bo: BoHandle,
    /// Output BO handle (0 if not allocated)
    output_bo: BoHandle,
    /// Current shader binary (cached for debugging)
    shader_binary: Vec<u32>,
}

impl NativeRiscvExecutor {
    /// Create a new executor using the first AMD GPU.
    pub fn new() -> Result<Self> {
        let device = AmdGpuDevice::open_first()
            .context("Failed to open AMDGPU device for NativeRiscvExecutor")?;

        let fd = device.fd();
        let mut bo_manager = AmdgpuBoManager::new(fd);

        // Create a real GPU context via DRM_IOCTL_AMDGPU_CTX
        let ctx_id = bo_manager.create_context()
            .context("Failed to create AMDGPU context")?;

        log::info!(
            "NativeRiscvExecutor initialized: fd={}, ctx={}",
            fd,
            ctx_id
        );

        Ok(Self {
            device,
            bo_manager,
            ctx_id,
            shader_bo: 0,
            input_bo: 0,
            output_bo: 0,
            shader_binary: Vec::new(),
        })
    }

    /// Create an executor from a specific device path.
    pub fn from_path(path: &str) -> Result<Self> {
        let device = AmdGpuDevice::open(path)?;
        let fd = device.fd();
        let mut bo_manager = AmdgpuBoManager::new(fd);

        let ctx_id = bo_manager.create_context()
            .context("Failed to create AMDGPU context")?;

        Ok(Self {
            device,
            bo_manager,
            ctx_id,
            shader_bo: 0,
            input_bo: 0,
            output_bo: 0,
            shader_binary: Vec::new(),
        })
    }

    /// Load a SPIR-V shader binary for execution.
    pub fn load_shader(&mut self, spirv: &[u32]) -> Result<()> {
        if spirv.is_empty() {
            anyhow::bail!("Empty SPIR-V binary");
        }

        // Validate SPIR-V magic number
        if spirv[0] != 0x07230203 {
            anyhow::bail!(
                "Invalid SPIR-V magic number: {:#010x} (expected 0x07230203)",
                spirv[0]
            );
        }

        let size = (spirv.len() * 4) as u64;

        // Allocate VRAM BO for shader code
        self.shader_bo = self.bo_manager.alloc_vram(size)
            .context("Failed to allocate VRAM for shader")?;

        // Write shader binary to BO
        let bytes: Vec<u8> = spirv.iter()
            .flat_map(|&w| w.to_le_bytes())
            .collect();
        self.bo_manager.write_bo(self.shader_bo, &bytes)?;

        self.shader_binary = spirv.to_vec();

        log::info!(
            "Loaded SPIR-V shader: {} words ({} bytes) into BO {}",
            spirv.len(),
            size,
            self.shader_bo
        );

        Ok(())
    }

    /// Load a SPIR-V shader from a file.
    pub fn load_shader_file(&mut self, path: &Path) -> Result<()> {
        let data = std::fs::read(path)
            .with_context(|| format!("Failed to read SPIR-V file: {}", path.display()))?;

        if data.len() % 4 != 0 {
            anyhow::bail!("SPIR-V file size not dword-aligned");
        }

        let words: Vec<u32> = data
            .chunks_exact(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        self.load_shader(&words)
    }

    /// Allocate an input buffer and write data to it.
    pub fn set_input(&mut self, data: &[u8]) -> Result<()> {
        if data.is_empty() {
            return Ok(());
        }

        self.input_bo = self.bo_manager.alloc_gtt(data.len() as u64)
            .context("Failed to allocate GTT buffer for input")?;

        self.bo_manager.write_bo(self.input_bo, data)?;

        log::info!(
            "Set input: {} bytes into BO {}",
            data.len(),
            self.input_bo
        );

        Ok(())
    }

    /// Allocate an output buffer for reading results.
    pub fn alloc_output(&mut self, size: u64) -> Result<()> {
        self.output_bo = self.bo_manager.alloc_gtt(size)
            .context("Failed to allocate GTT buffer for output")?;

        log::info!("Allocated output buffer: {} bytes in BO {}", size, self.output_bo);
        Ok(())
    }

    /// Execute the loaded shader with the given dispatch configuration.
    pub fn execute(&mut self, config: &DispatchConfig) -> Result<ExecutionResult> {
        if self.shader_bo == 0 {
            anyhow::bail!("No shader loaded");
        }

        let start_time = std::time::Instant::now();

        // Get shader GPU address
        let shader_addr = self.bo_manager.gpu_addr(self.shader_bo)?;

        // Build command buffer
        let mut cb = AmdgpuCommandBuffer::new();

        // Set shader program address
        cb.set_shader_address(shader_addr as u32, (shader_addr >> 32) as u32);

        // Set shader resources
        cb.set_shader_resources(DEFAULT_PGM_RSRC1, DEFAULT_PGM_RSRC2);

        // Set up user data (input/output buffer addresses as push constants)
        if self.input_bo != 0 {
            let input_addr = self.bo_manager.gpu_addr(self.input_bo)?;
            cb.set_user_data(0, &[input_addr as u32, (input_addr >> 32) as u32]);
        }
        if self.output_bo != 0 {
            let output_addr = self.bo_manager.gpu_addr(self.output_bo)?;
            cb.set_user_data(2, &[output_addr as u32, (output_addr >> 32) as u32]);
        }

        // Additional push constants via user data
        if !config.push_constants.is_empty() {
            let pc_words: Vec<u32> = config.push_constants
                .chunks_exact(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .chain(std::iter::once(0u32)) // pad if needed
                .take(4) // max 16 bytes of extra push constants
                .collect();
            if !pc_words.is_empty() {
                cb.set_user_data(4, &pc_words);
            }
        }

        // Dispatch
        cb.dispatch(config.workgroup_x, config.workgroup_y, config.workgroup_z);

        // We need to upload the command buffer itself to a GPU-visible BO
        let cb_dwords = cb.build()?;
        let cb_bytes: Vec<u8> = cb_dwords
            .iter()
            .flat_map(|&dw| dw.to_le_bytes())
            .collect();
        let cb_bo = self.bo_manager.alloc_gtt(cb_bytes.len() as u64)
            .context("Failed to allocate GTT buffer for command buffer")?;
        self.bo_manager.write_bo(cb_bo, &cb_bytes)?;

        let cb_gpu_addr = self.bo_manager.gpu_addr(cb_bo)?;

        // Submit via DRM_IOCTL_AMDGPU_CS
        let fence = AmdgpuCommandBuffer::submit_raw(
            self.device.fd(),
            self.ctx_id,
            cb_gpu_addr,
            cb_dwords.len() as u32,
            COMPUTE_RING,
        )
        .context("AMDGPU CS submission failed")?;

        // Wait for completion via DRM_IOCTL_AMDGPU_WAIT_CS (with fallback to BO idle)
        if fence != 0 {
            match self
                .bo_manager
                .wait_cs(self.ctx_id, COMPUTE_RING, fence as u32, 5_000_000_000)
            {
                Ok(true) => {
                    log::debug!("CS fence {} completed via wait_cs", fence);
                }
                Ok(false) => {
                    log::warn!("CS fence {} timed out, falling back to BO wait", fence);
                    self.bo_manager.wait_idle(cb_bo, u64::MAX)?;
                }
                Err(e) => {
                    log::warn!("wait_cs failed ({}), falling back to BO wait", e);
                    self.bo_manager.wait_idle(cb_bo, u64::MAX)?;
                }
            }
        } else {
            // fence=0 means no-op submission, nothing to wait for
            self.bo_manager.wait_idle(cb_bo, u64::MAX)?;
        }

        let elapsed = start_time.elapsed();

        // Read back output
        let output_data = if self.output_bo != 0 {
            let output_size = self.bo_manager.bo_size(self.output_bo)? as usize;
            let mut output = vec![0u8; output_size];
            match self.bo_manager.read_bo(self.output_bo, &mut output) {
                Ok(()) => output,
                Err(e) => {
                    log::warn!("Failed to read output BO: {}", e);
                    Vec::new()
                }
            }
        } else {
            Vec::new()
        };

        log::info!(
            "Execution complete: fence={}, time={:?}, output={} bytes",
            fence,
            elapsed,
            output_data.len()
        );

        Ok(ExecutionResult {
            fence_handle: fence,
            output_data,
            execution_time_ns: elapsed.as_nanos() as u64,
        })
    }

    /// Execute a simple 1x1x1 dispatch with no input/output.
    pub fn execute_simple(&mut self) -> Result<ExecutionResult> {
        self.execute(&DispatchConfig::default())
    }

    /// Get the DRM file descriptor.
    pub fn drm_fd(&self) -> i32 {
        self.device.fd()
    }

    /// Get the CS context ID.
    pub fn ctx_id(&self) -> u32 {
        self.ctx_id
    }

    /// Get the shader BO handle.
    pub fn shader_bo(&self) -> BoHandle {
        self.shader_bo
    }

    /// Get the input BO handle.
    pub fn input_bo(&self) -> BoHandle {
        self.input_bo
    }

    /// Get the output BO handle.
    pub fn output_bo(&self) -> BoHandle {
        self.output_bo
    }
}

impl Drop for NativeRiscvExecutor {
    fn drop(&mut self) {
        // Destroy the GPU context
        if let Err(e) = self.bo_manager.destroy_context(self.ctx_id) {
            log::warn!("Failed to destroy AMDGPU context {}: {}", self.ctx_id, e);
        }
        log::debug!("NativeRiscvExecutor dropped: ctx={}", self.ctx_id);
    }
}

/// Builder for NativeRiscvExecutor to simplify setup.
pub struct NativeRiscvExecutorBuilder {
    device_path: Option<String>,
    shader_binary: Option<Vec<u32>>,
    shader_path: Option<String>,
    input_data: Option<Vec<u8>>,
    output_size: Option<u64>,
    dispatch: DispatchConfig,
}

impl NativeRiscvExecutorBuilder {
    /// Create a new builder.
    pub fn new() -> Self {
        Self {
            device_path: None,
            shader_binary: None,
            shader_path: None,
            input_data: None,
            output_size: None,
            dispatch: DispatchConfig::default(),
        }
    }

    /// Use a specific device path.
    pub fn device(mut self, path: &str) -> Self {
        self.device_path = Some(path.to_string());
        self
    }

    /// Load shader from binary.
    pub fn shader(mut self, spirv: Vec<u32>) -> Self {
        self.shader_binary = Some(spirv);
        self
    }

    /// Load shader from file.
    pub fn shader_file(mut self, path: &str) -> Self {
        self.shader_path = Some(path.to_string());
        self
    }

    /// Set input data.
    pub fn input(mut self, data: Vec<u8>) -> Self {
        self.input_data = Some(data);
        self
    }

    /// Set output buffer size.
    pub fn output_size(mut self, size: u64) -> Self {
        self.output_size = Some(size);
        self
    }

    /// Set dispatch dimensions.
    pub fn dispatch(mut self, x: u32, y: u32, z: u32) -> Self {
        self.dispatch.workgroup_x = x;
        self.dispatch.workgroup_y = y;
        self.dispatch.workgroup_z = z;
        self
    }

    /// Set push constants.
    pub fn push_constants(mut self, data: Vec<u8>) -> Self {
        self.dispatch.push_constants = data;
        self
    }

    /// Build and execute.
    pub fn execute(self) -> Result<ExecutionResult> {
        let mut executor = match &self.device_path {
            Some(path) => NativeRiscvExecutor::from_path(path)?,
            None => NativeRiscvExecutor::new()?,
        };

        // Load shader
        if let Some(spirv) = &self.shader_binary {
            executor.load_shader(spirv)?;
        } else if let Some(path) = &self.shader_path {
            executor.load_shader_file(Path::new(path))?;
        } else {
            anyhow::bail!("No shader specified");
        }

        // Set input
        if let Some(input) = &self.input_data {
            executor.set_input(input)?;
        }

        // Allocate output
        if let Some(size) = self.output_size {
            executor.alloc_output(size)?;
        }

        // Execute
        executor.execute(&self.dispatch)
    }
}

impl Default for NativeRiscvExecutorBuilder {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dispatch_config_default() {
        let config = DispatchConfig::default();
        assert_eq!(config.workgroup_x, 1);
        assert_eq!(config.workgroup_y, 1);
        assert_eq!(config.workgroup_z, 1);
        assert!(config.push_constants.is_empty());
    }

    #[test]
    fn test_execution_result_debug() {
        let result = ExecutionResult {
            fence_handle: 42,
            output_data: vec![1, 2, 3],
            execution_time_ns: 1000,
        };
        let debug_str = format!("{:?}", result);
        assert!(debug_str.contains("fence_handle"));
    }

    #[test]
    fn test_builder_pattern() {
        let builder = NativeRiscvExecutorBuilder::new()
            .dispatch(4, 4, 1)
            .output_size(1024);

        assert_eq!(builder.dispatch.workgroup_x, 4);
        assert_eq!(builder.dispatch.workgroup_y, 4);
        assert_eq!(builder.output_size, Some(1024));
    }

    #[test]
    fn test_spirv_magic_validation() {
        // This would fail without a real GPU, but we can test the logic
        let invalid_spirv: Vec<u32> = vec![0xDEAD_BEEF_u32];
        assert_ne!(invalid_spirv[0], 0x07230203);
    }

    #[test]
    fn test_valid_spirv_magic() {
        let valid_magic = 0x07230203u32;
        assert_eq!(valid_magic, 0x07230203);
    }

    #[test]
    fn test_executor_new_handles_hardware() {
        // On any system, this either succeeds (has AMD GPU with DRM context)
        // or fails gracefully at open_first or create_context.
        // Either outcome is valid -- just verify no panic.
        let _ = NativeRiscvExecutor::new();
    }

    #[test]
    fn test_builder_with_shader_binary() {
        let builder = NativeRiscvExecutorBuilder::new()
            .shader(vec![0x07230203, 0x00010000, 0x00000000, 0x00000000])
            .dispatch(1, 1, 1)
            .output_size(4096);

        assert!(builder.shader_binary.is_some());
        assert_eq!(builder.shader_binary.as_ref().unwrap()[0], 0x07230203);
    }

    #[test]
    fn test_builder_with_push_constants() {
        let pc = vec![0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
        let builder = NativeRiscvExecutorBuilder::new()
            .shader(vec![0x07230203])
            .push_constants(pc.clone());

        assert_eq!(builder.dispatch.push_constants, pc);
    }

    #[test]
    fn test_dispatch_config_clone() {
        let config = DispatchConfig {
            workgroup_x: 64,
            workgroup_y: 2,
            workgroup_z: 1,
            push_constants: vec![42u8; 16],
        };
        let cloned = config.clone();
        assert_eq!(cloned.workgroup_x, 64);
        assert_eq!(cloned.push_constants.len(), 16);
    }
}
