//! AMDGPU Backend - Direct AMD GPU command submission via DRM.
//!
//! This module implements direct command buffer submission to AMD GPUs
//! via the amdgpu DRM driver, bypassing Vulkan for Phase 2.

pub mod bo_manager;
pub mod command_buffer;
pub mod device;
pub mod drm_ioctl;
pub mod mmio;
pub mod native_riscv_executor;
pub mod shader;

pub use bo_manager::{AmdgpuBoManager, BoHandle};
pub use command_buffer::AmdgpuCommandBuffer;
pub use device::AmdGpuDevice;
pub use mmio::AmdGpuDevice as AmdGpuMmioDevice;
pub use native_riscv_executor::{
    DispatchConfig, ExecutionResult, NativeRiscvExecutor, NativeRiscvExecutorBuilder,
};
pub use shader::ComputeShader;
