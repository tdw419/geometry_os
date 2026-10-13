//! AMDGPU Compute Shader - SPIR-V shader loading for AMD GPUs.

use anyhow::{anyhow, Context, Result};

/// AMDGPU compute shader loaded from SPIR-V.
pub struct ComputeShader {
    /// SPIR-V binary words
    spirv_binary: Vec<u32>,
    /// Shader entry point name
    entry_point: String,
    /// Whether shader is ready for execution
    ready: bool,
}

impl ComputeShader {
    /// Create a compute shader from SPIR-V binary.
    pub fn from_spirv(spirv_binary: Vec<u32>, entry_point: &str) -> Result<Self> {
        // Validate SPIR-V magic
        if spirv_binary.is_empty() {
            anyhow::bail!("Empty SPIR-V binary");
        }

        if spirv_binary[0] != 0x07230203 {
            anyhow::bail!("Invalid SPIR-V magic number: 0x{:08x}", spirv_binary[0]);
        }

        log::info!(
            "Created AMDGPU shader: {} words, entry={}",
            spirv_binary.len(),
            entry_point
        );

        Ok(Self {
            spirv_binary,
            entry_point: entry_point.to_string(),
            ready: true,
        })
    }

    /// Get the SPIR-V binary.
    pub fn spirv(&self) -> &[u32] {
        &self.spirv_binary
    }

    /// Get the entry point name.
    pub fn entry_point(&self) -> &str {
        &self.entry_point
    }

    /// Check if shader is ready.
    pub fn is_ready(&self) -> bool {
        self.ready
    }
}
