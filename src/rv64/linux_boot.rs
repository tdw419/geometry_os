//! Linux Boot Bundle for RV64
//!
//! Handles loading LNX-format boot bundles into the RV64 CPU.

/// Linux boot bundle header (must match pixel_bundler.py and linux_boot_test.rs)
pub struct LinuxBootBundle {
    pub entry_point: u64,
    pub kernel_offset: u64,
    pub initrd_offset: u64,
    pub dtb_offset: u64,
}

impl LinuxBootBundle {
    pub const HEADER_SIZE: u64 = 20;
    pub const KERNEL_OFFSET: u64 = 0x1000;
    pub const INITRD_OFFSET: u64 = 0x0100_0000;
    pub const DTB_OFFSET: u64 = 0x0200_0000;

    /// Parse LNX header from bytes
    pub fn from_bytes(data: &[u8]) -> Option<Self> {
        if data.len() < 20 {
            return None;
        }
        if &data[0..3] != b"LNX" {
            return None;
        }
        Some(Self {
            entry_point: u32::from_le_bytes(data[4..8].try_into().ok()?) as u64,
            kernel_offset: Self::KERNEL_OFFSET,
            initrd_offset: Self::INITRD_OFFSET,
            dtb_offset: Self::DTB_OFFSET,
        })
    }

    /// Load a boot bundle into the CPU
    pub fn load_into(&self, cpu: &mut crate::rv64::executor::Rv64Cpu, data: &[u8]) {
        cpu.pc = self.entry_point;
        cpu.load_binary(0, data);
    }
}
