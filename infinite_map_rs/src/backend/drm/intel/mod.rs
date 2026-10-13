//! Intel GPU Backend - Direct i915 command submission via DRM.
//!
//! This module implements direct command buffer submission to Intel GPUs
//! via the i915 DRM driver, bypassing Vulkan for Phase 2.

pub mod batch;
pub mod command_buffer;
pub mod device;
pub mod mmio;
pub mod shader;

pub use batch::{mi, xy, BatchBuffer, BatchExecutor, GpuBuffer};
pub use command_buffer::IntelCommandBuffer;
pub use device::IntelGpuDevice;
pub use mmio::IntelGpuMmioDevice;
pub use shader::ComputeShader;
