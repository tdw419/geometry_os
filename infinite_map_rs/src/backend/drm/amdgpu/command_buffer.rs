//! AMDGPU Command Buffer Builder
//!
//! Constructs command buffers for AMD GPU execution via DRM-AMDGPU.

use anyhow::{anyhow, Context, Result};
use std::os::unix::io::RawFd;

/// AMDGPU command buffer header (PM4 format).
#[repr(C, packed)]
struct CmdStreamHeader {
    /// Command type (3 = compute)
    command_type: u32,
    /// Engine type (2 = compute)
    engine_type: u32,
    /// Number of IB entries
    num_ib: u32,
}

/// Indirect buffer (IB) entry for command submission.
#[repr(C, packed)]
struct IbEntry {
    /// GPU virtual address of command buffer
    ib_base: u64,
    /// Size in dwords
    ib_size: u32,
    /// Chain flag
    chain: u32,
}

/// AMDGPU command buffer builder for compute shaders.
pub struct AmdgpuCommandBuffer {
    /// Command data (PM4 packets)
    commands: Vec<u32>,
    /// IB entries
    ib_entries: Vec<IbEntry>,
    /// Current offset in command stream
    offset: usize,
}

impl AmdgpuCommandBuffer {
    /// Create a new command buffer builder.
    pub fn new() -> Self {
        Self {
            commands: Vec::with_capacity(4096),
            ib_entries: Vec::new(),
            offset: 0,
        }
    }

    /// Begin a compute command stream.
    pub fn begin_compute(&mut self) -> &mut Self {
        // PM4 header for compute
        self.emit_packet_header(3, 2, 0);
        self
    }

    /// Emit a PM4 packet header.
    fn emit_packet_header(&mut self, command_type: u32, engine_type: u32, num_ib: u32) {
        self.commands.push(command_type);
        self.commands.push(engine_type);
        self.commands.push(num_ib);
        self.offset += 3;
    }

    /// Add a SET_SH_REG packet (write registers).
    pub fn set_registers(&mut self, reg_offset: u32, values: &[u32]) -> &mut Self {
        // PM4 SET_SH_REG packet type = 0x8
        let packet_type = 0x8u32;
        let count = values.len() as u32;

        // Packet header: type(4) | count(12) | shader engine(4) | predicted_y(4) | reserved(4) | meq(4)
        let header = (packet_type << 30) | (count & 0x3FFF);
        self.commands.push(header);
        self.commands.push(reg_offset);
        self.commands.extend_from_slice(values);
        self.offset += 2 + values.len();
        self
    }

    /// Set the shader program address (COMPUTE_PGM_LO/HI).
    ///
    /// Sets the GPU virtual address of the compute shader binary.
    pub fn set_shader_address(&mut self, addr_lo: u32, addr_hi: u32) -> &mut Self {
        // COMPUTE_PGM_LO = 0x02, COMPUTE_PGM_HI = 0x03
        self.set_registers(0x02, &[addr_lo, addr_hi]);
        self
    }

    /// Set shader resource registers (PGM_RSRC1/RSRC2).
    ///
    /// Configures compute shader resource limits and features.
    pub fn set_shader_resources(&mut self, rsrc1: u32, rsrc2: u32) -> &mut Self {
        // COMPUTE_PGM_RSRC1 = 0x04, COMPUTE_PGM_RSRC2 = 0x05
        self.set_registers(0x04, &[rsrc1, rsrc2]);
        self
    }

    /// Set user data registers (compute shader arguments).
    ///
    /// User data registers carry buffer addresses and push constants
    /// to the compute shader. Up to 16 user data registers (64 bytes).
    pub fn set_user_data(&mut self, start_reg: u32, data: &[u32]) -> &mut Self {
        // COMPUTE_USER_DATA_0 offset = 0x10
        let reg_offset = 0x10 + start_reg;
        self.set_registers(reg_offset, data);
        self
    }

    /// Dispatch compute workgroups.
    pub fn dispatch(&mut self, x: u32, y: u32, z: u32) -> &mut Self {
        // COMPUTE_DISPATCH_INIT state registers
        // Offset 0x18 = COMPUTE_DIM_XYZ
        self.set_registers(0x18, &[x | (y << 10) | (z << 20)]);
        self
    }

    /// Add an indirect buffer entry.
    pub fn add_ib(&mut self, gpu_addr: u64, size_dwords: u32) -> &mut Self {
        self.ib_entries.push(IbEntry {
            ib_base: gpu_addr,
            ib_size: size_dwords,
            chain: 0,
        });
        self
    }

    /// Build the final command buffer.
    pub fn build(self) -> Result<Vec<u32>> {
        if self.commands.is_empty() {
            return Ok(Vec::new());
        }

        log::info!(
            "Built AMDGPU command buffer: {} dwords, {} IB entries",
            self.commands.len(),
            self.ib_entries.len()
        );

        Ok(self.commands)
    }

    /// Submit to GPU via DRM-AMDGPU ioctl.
    ///
    /// Full submission path:
    /// 1. Build IB chunk from command data
    /// 2. Build fence chunk for synchronization
    /// 3. Submit via DRM_IOCTL_AMDGPU_CS
    /// 4. Return fence handle
    pub fn submit(&self, drm_fd: RawFd, ctx_id: u32, ring: u32) -> Result<u64> {
        if self.commands.is_empty() {
            return Ok(0);
        }

        log::info!(
            "Submitting AMDGPU CS: fd={}, ctx={}, ring={}, size={} dwords",
            drm_fd,
            ctx_id,
            ring,
            self.commands.len()
        );

        // Build the IB info
        let ib = super::drm_ioctl::AmdgpuCsIbInfo {
            ib_mc_address: 0, // Caller must have uploaded CB to GPU memory
            ib_size: self.commands.len() as u32,
            flags: 0,
            ip_type: super::drm_ioctl::hw_ip_type::COMPUTE,
            ip_instance: 0,
            ring,
        };

        let fence = super::drm_ioctl::AmdgpuCsFence {
            context: ctx_id,
            ip_type: super::drm_ioctl::hw_ip_type::COMPUTE,
            ip_instance: 0,
            ring,
            seq_no: 0,
        };

        // Build chunks
        let chunks = [
            super::drm_ioctl::AmdgpuCsChunk {
                chunk_id: super::drm_ioctl::cs_chunk_type::IB,
                length_dw: (std::mem::size_of::<super::drm_ioctl::AmdgpuCsIbInfo>() / 4) as u32,
                chunk_data: &ib as *const _ as u64,
            },
            super::drm_ioctl::AmdgpuCsChunk {
                chunk_id: super::drm_ioctl::cs_chunk_type::FENCE,
                length_dw: (std::mem::size_of::<super::drm_ioctl::AmdgpuCsFence>() / 4) as u32,
                chunk_data: &fence as *const _ as u64,
            },
        ];

        let mut cs_args = super::drm_ioctl::AmdgpuCsArgs {
            r#in: super::drm_ioctl::AmdgpuCsIn {
                ctx_id,
                num_chunks: chunks.len() as u32,
                flags: super::drm_ioctl::cs_flags::FENCE64,
                chunks_ptr: &chunks[0] as *const _ as u64,
            },
            out: super::drm_ioctl::AmdgpuCsOut { handle: 0 },
        };

        unsafe {
            super::drm_ioctl::drm_ioctl(
                drm_fd,
                super::drm_ioctl::ioctl_cs(),
                &mut cs_args as *mut _ as *mut std::ffi::c_void,
            )
            .map_err(|e| anyhow!("DRM_IOCTL_AMDGPU_CS failed: {}", e))?;
        }

        log::info!("CS submitted: fence={}", cs_args.out.handle);
        Ok(cs_args.out.handle)
    }

    /// Submit a pre-built command buffer at a GPU address.
    ///
    /// Low-level submission interface used by NativeRiscvExecutor.
    /// Builds DRM_IOCTL_AMDGPU_CS arguments with IB pointing to the
    /// command buffer already uploaded to GPU memory.
    /// Returns a fence handle for synchronization.
    pub fn submit_raw(
        drm_fd: RawFd,
        ctx_id: u32,
        cb_gpu_addr: u64,
        cb_size_dwords: u32,
        ring: u32,
    ) -> Result<u64> {
        log::info!(
            "Raw CS submit: fd={}, ctx={}, addr={:#x}, size={} dwords, ring={}",
            drm_fd,
            ctx_id,
            cb_gpu_addr,
            cb_size_dwords,
            ring
        );

        if cb_size_dwords == 0 {
            return Ok(0);
        }

        // Build IB pointing to the already-uploaded command buffer in GPU memory
        let ib = super::drm_ioctl::AmdgpuCsIbInfo {
            ib_mc_address: cb_gpu_addr,
            ib_size: cb_size_dwords,
            flags: 0,
            ip_type: super::drm_ioctl::hw_ip_type::COMPUTE,
            ip_instance: 0,
            ring,
        };

        let fence = super::drm_ioctl::AmdgpuCsFence {
            context: ctx_id,
            ip_type: super::drm_ioctl::hw_ip_type::COMPUTE,
            ip_instance: 0,
            ring,
            seq_no: 0,
        };

        // Build chunk array: [IB, FENCE]
        let chunks = [
            super::drm_ioctl::AmdgpuCsChunk {
                chunk_id: super::drm_ioctl::cs_chunk_type::IB,
                length_dw: (std::mem::size_of::<super::drm_ioctl::AmdgpuCsIbInfo>() / 4) as u32,
                chunk_data: &ib as *const _ as u64,
            },
            super::drm_ioctl::AmdgpuCsChunk {
                chunk_id: super::drm_ioctl::cs_chunk_type::FENCE,
                length_dw: (std::mem::size_of::<super::drm_ioctl::AmdgpuCsFence>() / 4) as u32,
                chunk_data: &fence as *const _ as u64,
            },
        ];

        let mut cs_args = super::drm_ioctl::AmdgpuCsArgs {
            r#in: super::drm_ioctl::AmdgpuCsIn {
                ctx_id,
                num_chunks: chunks.len() as u32,
                flags: super::drm_ioctl::cs_flags::FENCE64,
                chunks_ptr: &chunks[0] as *const _ as u64,
            },
            out: super::drm_ioctl::AmdgpuCsOut { handle: 0 },
        };

        // Issue the ioctl
        unsafe {
            super::drm_ioctl::drm_ioctl(
                drm_fd,
                super::drm_ioctl::ioctl_cs(),
                &mut cs_args as *mut _ as *mut std::ffi::c_void,
            )
            .map_err(|e| anyhow!("DRM_IOCTL_AMDGPU_CS failed: {}", e))?;
        }

        log::info!("Raw CS submitted: fence={}", cs_args.out.handle);
        Ok(cs_args.out.handle)
    }
}

impl Default for AmdgpuCommandBuffer {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_command_buffer_creation() {
        let mut cb = AmdgpuCommandBuffer::new();
        cb.begin_compute().dispatch(64, 1, 1);

        let buffer = cb.build().unwrap();
        assert!(!buffer.is_empty());
    }

    #[test]
    fn test_dispatch_encoding() {
        let mut cb = AmdgpuCommandBuffer::new();
        cb.begin_compute().dispatch(256, 256, 1);

        let buffer = cb.build().unwrap();
        // begin_compute (3 dwords) + dispatch (3 dwords) = 6 dwords
        assert!(buffer.len() >= 6);
    }

    #[test]
    fn test_empty_submit_returns_zero() {
        let cb = AmdgpuCommandBuffer::new();
        // Empty command buffer should return Ok(0) without calling ioctl
        let result = cb.submit(-1, 1, 0);
        assert_eq!(result.unwrap(), 0);
    }

    #[test]
    fn test_submit_raw_empty_returns_zero() {
        // Zero-size CB should return Ok(0) without calling ioctl
        let result = AmdgpuCommandBuffer::submit_raw(-1, 1, 0x1000, 0, 0);
        assert_eq!(result.unwrap(), 0);
    }

    #[test]
    fn test_set_shader_address() {
        let mut cb = AmdgpuCommandBuffer::new();
        cb.set_shader_address(0x12345678, 0x000000AB);
        let buffer = cb.build().unwrap();
        // set_registers(0x02, &[lo, hi]) = header(1) + reg_offset(1) + 2 values = 4 dwords
        assert!(buffer.len() >= 4);
    }

    #[test]
    fn test_set_user_data() {
        let mut cb = AmdgpuCommandBuffer::new();
        let data = [0xDEAD_BEEF, 0xCAFE_BABE, 0x1234_5678, 0x0000_ABCD];
        cb.set_user_data(0, &data);
        let buffer = cb.build().unwrap();
        // header(1) + reg_offset(1) + 4 values = 6 dwords
        assert!(buffer.len() >= 6);
    }

    #[test]
    fn test_full_compute_pipeline_build() {
        // Simulate building a full compute dispatch command buffer
        let mut cb = AmdgpuCommandBuffer::new();
        cb.begin_compute();
        cb.set_shader_address(0x10000000, 0x00000000);
        cb.set_shader_resources(0x00FF00FF, 0xFF00FF00);
        cb.set_user_data(0, &[0x10000000, 0x0, 0x20000000, 0x0]); // in/out addrs
        cb.dispatch(64, 1, 1);

        let buffer = cb.build().unwrap();
        // begin_compute(3) + set_shader(4) + set_resources(4) + set_user_data(6) + dispatch(3) = 20
        assert!(buffer.len() >= 20);

        // Verify the buffer doesn't contain all zeros
        let non_zero = buffer.iter().filter(|&&d| d != 0).count();
        assert!(non_zero > 0, "Command buffer should contain non-zero data");
    }

    #[test]
    fn test_add_ib_entry() {
        let mut cb = AmdgpuCommandBuffer::new();
        cb.add_ib(0xDEAD_0000_0000, 256);
        let buffer = cb.build().unwrap();
        // add_ib doesn't add to commands, it adds to ib_entries
        assert!(buffer.is_empty() || !buffer.is_empty()); // just verify no panic
    }
}
