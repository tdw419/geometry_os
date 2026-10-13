//! Linux Payload Loader - Path B.1
//!
//! Loads Linux RISC-V kernels into spatial memory regions for direct
//! execution on the spatial substrate (no QEMU hypervisor).
//!
//! Architecture:
//! 1. Parse Linux ELF64 kernel (different from xv6 ELF32)
//! 2. Handle Linux kernel command line (embedded in DTB)
//! 3. Extract initrd (initial RAM disk)
//! 4. Generate device tree blob (DTB) for RISC-V
//! 5. Emit spatial cells for kernel + DTB + initrd

use crate::geoasm_materializer::{CellState, TYPE_NOP, TYPE_WALL};
use crate::spatial::hypervisor_bridge::{SpatialAllocator, SpatialAllocReq, SpatialAllocResp, SPATIAL_ALLOC_OK};
use std::collections::HashMap;

/// Linux kernel region in spatial memory
#[derive(Debug, Clone)]
pub struct LinuxKernelRegion {
    /// Region ID from spatial allocator
    pub region_id: u64,
    /// Base X coordinate
    pub base_x: u32,
    /// Base Y coordinate
    pub base_y: u32,
    /// Width of kernel region (in cells)
    pub width: u32,
    /// Height of kernel region (typically 1 for linear memory)
    pub height: u32,
    /// Kernel entry point (64-bit Linux address)
    pub entry_point: u64,
    /// DTB address (passed to Linux in a1 register)
    pub dtb_addr: u64,
    /// Initrd address (if present)
    pub initrd_addr: Option<u64>,
}

/// Linux payload loader
pub struct LinuxPayloadLoader {
    /// Spatial allocator for region management
    allocator: SpatialAllocator,
    /// Loaded kernel regions
    regions: HashMap<u64, LinuxKernelRegion>,
    /// Next available base address
    next_base_x: u32,
    next_base_y: u32,
    /// Kernel command line
    cmdline: String,
    /// Initrd data
    initrd_data: Option<Vec<u8>>,
}

/// Load errors
#[derive(Debug, thiserror::Error)]
pub enum LinuxLoadError {
    #[error("Failed to parse ELF64: {0}")]
    ElfParseError(String),

    #[error("Not a Linux kernel (missing Linux signature)")]
    NotLinuxKernel,

    #[error("Kernel too large for spatial grid: {0} bytes")]
    KernelTooLarge(usize),

    #[error("Spatial allocation failed: {0}")]
    AllocationFailed(String),

    #[error("DTB generation failed: {0}")]
    DtbError(String),

    #[error("Invalid kernel image: {0}")]
    InvalidImage(String),
}

impl LinuxPayloadLoader {
    /// Create a new Linux payload loader
    pub fn new(grid_width: usize, grid_height: usize) -> Self {
        Self {
            allocator: SpatialAllocator::new(grid_width, grid_height),
            regions: HashMap::new(),
            next_base_x: 20,  // Leave space for bootloader at x=0-19
            next_base_y: 20,
            cmdline: "console=ttyS0 earlyprintk".to_string(),
            initrd_data: None,
        }
    }

    /// Set kernel command line
    pub fn set_command_line(&mut self, cmdline: &str) {
        self.cmdline = cmdline.to_string();
    }

    /// Set initrd data
    pub fn set_initrd(&mut self, initrd_data: Vec<u8>) {
        self.initrd_data = Some(initrd_data);
    }

    /// Load Linux kernel into spatial memory
    ///
    /// # Arguments
    /// * `kernel_data` - Raw Linux ELF64 kernel bytes
    ///
    /// # Returns
    /// LinuxKernelRegion with spatial coordinates and entry point
    pub fn load_kernel(&mut self, kernel_data: &[u8]) -> Result<LinuxKernelRegion, LinuxLoadError> {
        // Parse ELF64 kernel
        let (kernel_image, entry_point) = self.parse_elf64_kernel(kernel_data)?;

        // Calculate required spatial size (8 bytes per 64-bit word, stored as 2 cells)
        let required_cells = (kernel_image.len() + 7) / 4;  // 4 bytes per cell

        // Calculate 2D layout
        let grid_w = self.allocator.grid_width();
        let grid_h = self.allocator.grid_height();
        let available_row_width = (grid_w as u32).saturating_sub(self.next_base_x);

        if available_row_width == 0 {
            return Err(LinuxLoadError::KernelTooLarge(kernel_image.len()));
        }

        let width = available_row_width.min(required_cells as u32).max(1);
        let height = ((required_cells as u32) + width - 1) / width;

        // Check if kernel fits in grid
        if height > (grid_h as u32).saturating_sub(self.next_base_y) {
            return Err(LinuxLoadError::KernelTooLarge(kernel_image.len()));
        }

        // Allocate spatial region
        let req = SpatialAllocReq {
            req_id: 0,
            width,
            height,
        };

        let (resp, _wall_cells) = self.allocator.allocate_region(&req);

        if resp.result != SPATIAL_ALLOC_OK {
            return Err(LinuxLoadError::AllocationFailed(format!(
                "Allocation failed with code: {}",
                resp.result
            )));
        }

        // Calculate DTB address (after kernel in memory)
        let dtb_addr = 0x88000000u64;  // Standard Linux DTB address
        let initrd_addr = if let Some(ref initrd) = self.initrd_data {
            Some(0x84000000u64)  // Standard initrd address
        } else {
            None
        };

        // Create kernel region record
        let region = LinuxKernelRegion {
            region_id: resp.region_id,
            base_x: resp.x,
            base_y: resp.y,
            width: req.width,
            height: req.height,
            entry_point,
            dtb_addr,
            initrd_addr,
        };

        // Store region and update next base
        self.regions.insert(region.region_id, region.clone());
        self.next_base_x += width + 2;  // +2 for WALL cells

        Ok(region)
    }

    /// Parse Linux ELF64 kernel
    ///
    /// Validates that the binary is a valid Linux ELF64 kernel and extracts
    /// the loadable segments and entry point.
    fn parse_elf64_kernel(&self, data: &[u8]) -> Result<(Vec<u8>, u64), LinuxLoadError> {
        use goblin::elf::{Elf, header::EM_RISCV, program_header::PT_LOAD};

        // Parse ELF64
        let elf = match Elf::parse(data) {
            Ok(elf) => elf,
            Err(e) => return Err(LinuxLoadError::ElfParseError(format!("{}", e))),
        };

        // Validate architecture (RISC-V)
        if elf.header.e_machine != EM_RISCV {
            return Err(LinuxLoadError::ElfParseError(format!(
                "Expected RISC-V architecture, got 0x{:x}",
                elf.header.e_machine
            )));
        }

        // Validate it's 64-bit
        if elf.header.e_ident[4] != 2 {  // 2 = ELFCLASS64
            return Err(LinuxLoadError::ElfParseError(
                "Expected ELF64, got ELF32".to_string(),
            ));
        }

        // Check for Linux kernel signature (optional, but good for validation)
        let is_linux = data.windows(4).any(|w| w == b"Linux") ||
                       data.windows(4).any(|w| w == b"LNXI");

        if !is_linux {
            // Not a hard error - some kernels may not have this signature
            // Just log a warning in production
        }

        // Extract loadable segments
        let mut kernel_image = Vec::new();

        for ph in &elf.program_headers {
            if ph.p_type == PT_LOAD {
                let segment_offset = ph.p_offset as usize;
                let segment_size = ph.p_filesz as usize;

                if segment_offset + segment_size > data.len() {
                    return Err(LinuxLoadError::ElfParseError(format!(
                        "Segment exceeds file bounds: offset={}, size={}, file_size={}",
                        segment_offset, segment_size, data.len()
                    )));
                }

                let segment_data = &data[segment_offset..segment_offset + segment_size];
                kernel_image.extend_from_slice(segment_data);
            }
        }

        if kernel_image.is_empty() {
            return Err(LinuxLoadError::ElfParseError(
                "No loadable segments found in kernel".to_string(),
            ));
        }

        let entry_point = elf.header.e_entry;

        // Linux entry point is typically 0x80200000
        if entry_point < 0x80000000 {
            // Warning: unusual entry point
        }

        Ok((kernel_image, entry_point))
    }

    /// Generate device tree blob (DTB)
    ///
    /// Creates a simplified DTB for Linux boot on RISC-V.
    /// Includes:
    /// - Chosen node with bootargs
    /// - Memory node
    /// - CPU node
    /// - UART node (console)
    /// - Initrd info (if present)
    pub fn generate_dtb(&self) -> Result<Vec<u8>, LinuxLoadError> {
        let mut dtb = Vec::new();

        // DTB header (simplified - in production, use proper FDT format)
        // This is a minimal DTB for demonstration
        // Real implementation should use libfdt or similar

        // Header: magic (0xd00dfeed), totalsize, off_dt_struct, etc.
        dtb.extend_from_slice(&0xd00dfeed_u32.to_be_bytes());  // magic

        let struct_offset = 40u32;  // Header size
        dtb.extend_from_slice(&0u32.to_be_bytes());  // totalsize (placeholder)
        dtb.extend_from_slice(&struct_offset.to_be_bytes());  // off_dt_struct
        dtb.extend_from_slice(&0u32.to_be_bytes());  // off_dt_strings (placeholder)
        dtb.extend_from_slice(&0u32.to_be_bytes());  // off_mem_rsvmap
        dtb.extend_from_slice(&0x11u32.to_be_bytes());  // version
        dtb.extend_from_slice(&0x10u32.to_be_bytes());  // last_comp_version
        dtb.extend_from_slice(&0u32.to_be_bytes());  // boot_cpuid_phys
        dtb.extend_from_slice(&0u32.to_be_bytes());  // size_dt_strings
        dtb.extend_from_slice(&0u32.to_be_bytes());  // size_dt_struct

        // DTB structure (simplified)
        // Start of chosen node
        dtb.extend_from_slice(&0x00000001u32.to_be_bytes());  // FDT_BEGIN_NODE
        dtb.extend_from_slice(b"chosen\0");  // node name

        // bootargs property
        dtb.extend_from_slice(&0x00000003u32.to_be_bytes());  // FDT_PROP
        dtb.extend_from_slice(&0x00000009u32.to_be_bytes());  // len (value length)
        dtb.extend_from_slice(&0x00000000u32.to_be_bytes());  // nameoff (bootargs string offset)
        dtb.extend_from_slice(b"bootargs\0");  // property name
        dtb.extend_from_slice(self.cmdline.as_bytes());
        dtb.push(0);  // null terminator

        // linux,initrd-start (if initrd present)
        if self.initrd_data.is_some() {
            let initrd_addr = 0x84000000u64;
            dtb.extend_from_slice(&0x00000003u32.to_be_bytes());  // FDT_PROP
            dtb.extend_from_slice(&0x00000008u32.to_be_bytes());  // len (8 bytes)
            dtb.extend_from_slice(&0x0000001cu32.to_be_bytes());  // nameoff (offset to "linux,initrd-start")
            dtb.extend_from_slice(b"linux,initrd-start\0");
            dtb.extend_from_slice(&initrd_addr.to_be_bytes());

            // linux,initrd-end
            if let Some(ref initrd_data) = self.initrd_data {
                let initrd_end = initrd_addr + initrd_data.len() as u64;
                dtb.extend_from_slice(&0x00000003u32.to_be_bytes());  // FDT_PROP
                dtb.extend_from_slice(&0x00000008u32.to_be_bytes());  // len
                dtb.extend_from_slice(&0x0000002eu32.to_be_bytes());  // nameoff
                dtb.extend_from_slice(b"linux,initrd-end\0");
                dtb.extend_from_slice(&initrd_end.to_be_bytes());
            }
        }

        // End chosen node
        dtb.extend_from_slice(&0x00000002u32.to_be_bytes());  // FDT_END_NODE

        // Memory node (simplified)
        dtb.extend_from_slice(&0x00000001u32.to_be_bytes());  // FDT_BEGIN_NODE
        dtb.extend_from_slice(b"memory@80000000\0");
        dtb.extend_from_slice(&0x00000003u32.to_be_bytes());  // FDT_PROP
        dtb.extend_from_slice(&0x00000008u32.to_be_bytes());  // len (reg: 2 cells)
        dtb.extend_from_slice(&0x00000000u32.to_be_bytes());  // nameoff (reg)
        dtb.extend_from_slice(b"reg\0");
        dtb.extend_from_slice(&0x80000000u64.to_be_bytes());  // base address
        dtb.extend_from_slice(&0x10000000u64.to_be_bytes());  // size (256MB)
        dtb.extend_from_slice(&0x00000002u32.to_be_bytes());  // FDT_END_NODE

        // CPU node (simplified)
        dtb.extend_from_slice(&0x00000001u32.to_be_bytes());  // FDT_BEGIN_NODE
        dtb.extend_from_slice(b"cpus\0");
        dtb.extend_from_slice(&0x00000001u32.to_be_bytes());  // FDT_BEGIN_NODE
        dtb.extend_from_slice(b"cpu@0\0");
        dtb.extend_from_slice(&0x00000002u32.to_be_bytes());  // FDT_END_NODE
        dtb.extend_from_slice(&0x00000002u32.to_be_bytes());  // FDT_END_NODE

        // End of structure
        dtb.extend_from_slice(&0x00000009u32.to_be_bytes());  // FDT_END

        // Update totalsize in header
        let totalsize = dtb.len() as u32;
        dtb[4..8].copy_from_slice(&totalsize.to_be_bytes());

        Ok(dtb)
    }

    /// Emit spatial program for Linux kernel
    ///
    /// Generates cells that:
    /// 1. Store kernel image in spatial memory
    /// 2. Store DTB in spatial memory
    /// 3. Store initrd (if present)
    /// 4. Emit bootloader that jumps to kernel entry point
    pub fn emit_linux_program(
        &mut self,
        kernel_data: &[u8],
        region: &LinuxKernelRegion,
    ) -> Result<Vec<(usize, usize, CellState)>, LinuxLoadError> {
        let mut cells = Vec::new();

        // 1. Emit kernel image as spatial memory cells
        let words: Vec<u32> = kernel_data
            .chunks_exact(4)
            .map(|chunk| {
                let mut bytes = [0u8; 4];
                bytes.copy_from_slice(chunk);
                u32::from_le_bytes(bytes)
            })
            .collect();

        for (i, &word) in words.iter().enumerate() {
            let cells_per_row = region.width as usize;
            let x = region.base_x as usize + (i % cells_per_row);
            let y = region.base_y as usize + (i / cells_per_row);

            cells.push((x, y, CellState::data(word)));
        }

        // 2. Emit DTB (after kernel in spatial grid)
        let dtb = self.generate_dtb()?;
        let dtb_base_y = (region.base_y + region.height + 1) as usize;

        let dtb_words: Vec<u32> = dtb
            .chunks_exact(4)
            .map(|chunk| {
                let mut bytes = [0u8; 4];
                bytes.copy_from_slice(chunk);
                u32::from_le_bytes(bytes)
            })
            .collect();

        for (i, &word) in dtb_words.iter().enumerate() {
            let cells_per_row = region.width as usize;
            let x = region.base_x as usize + (i % cells_per_row);
            let y = dtb_base_y + (i / cells_per_row);

            cells.push((x, y, CellState::data(word)));
        }

        // 3. Emit initrd (if present)
        if let Some(ref initrd) = self.initrd_data {
            let initrd_base_y = dtb_base_y + ((dtb_words.len() + region.width as usize - 1) / region.width as usize);

            let initrd_words: Vec<u32> = initrd
                .chunks_exact(4)
                .map(|chunk| {
                    let mut bytes = [0u8; 4];
                    bytes.copy_from_slice(chunk);
                    u32::from_le_bytes(bytes)
                })
                .collect();

            for (i, &word) in initrd_words.iter().enumerate() {
                let cells_per_row = region.width as usize;
                let x = region.base_x as usize + (i % cells_per_row);
                let y = initrd_base_y + (i / cells_per_row);

                cells.push((x, y, CellState::data(word)));
            }
        }

        // 4. Emit WALL cells around kernel region
        self.emit_wall_cells(&mut cells, region);

        // 5. Emit Linux bootloader at (0, 0)
        // Bootloader sets up registers and jumps to kernel entry point
        cells.extend(self.emit_linux_bootloader(region));

        Ok(cells)
    }

    /// Emit WALL cells around a region
    fn emit_wall_cells(&self, cells: &mut Vec<(usize, usize, CellState)>, region: &LinuxKernelRegion) {
        // Top WALL
        if region.base_y > 0 {
            for x in (region.base_x as usize - 1)..=(region.base_x + region.width) as usize {
                cells.push((x, region.base_y as usize - 1, CellState::new(TYPE_WALL, 0, 0)));
            }
        }

        // Bottom WALL
        for x in (region.base_x as usize - 1)..=(region.base_x + region.width) as usize {
            cells.push((x, (region.base_y + region.height) as usize, CellState::new(TYPE_WALL, 0, 0)));
        }

        // Left WALL
        if region.base_x > 0 {
            for y in region.base_y as usize..(region.base_y + region.height) as usize {
                cells.push((region.base_x as usize - 1, y, CellState::new(TYPE_WALL, 0, 0)));
            }
        }

        // Right WALL
        for y in region.base_y as usize..(region.base_y + region.height) as usize {
            cells.push(((region.base_x + region.width) as usize, y, CellState::new(TYPE_WALL, 0, 0)));
        }
    }

    /// Emit Linux bootloader
    ///
    /// Linux boot protocol (RISC-V):
    /// - a0 = hartid (boot hart ID)
    /// - a1 = DTB address
    /// - Jump to kernel entry point
    ///
    /// For spatial execution, we emit a minimal bootloader that:
    /// 1. Sets up a0=0 (boot hart)
    /// 2. Sets up a1=dtb_addr
    /// 3. Jumps to entry_point
    fn emit_linux_bootloader(&self, region: &LinuxKernelRegion) -> Vec<(usize, usize, CellState)> {
        let mut cells = Vec::new();

        let bootloader_x = 0;
        let bootloader_y = 0;

        // For now, emit a simple HALT - the actual bootloader will be
        // implemented using the RISC-V transpiler in a future phase
        //
        // The RISC-V spatial executor (Phase 9) will handle:
        // - a0 (x10) = 0 (hartid)
        // - a1 (x11) = region.dtb_addr
        // - Jump to region.entry_point

        // Emit HALT instruction as placeholder
        // When the spatial RISC-V executor is ready, this will be replaced
        // with actual RISC-V instructions
        cells.push((bootloader_x, bootloader_y, CellState::data(0x73)));  // ECALL
        cells.push((bootloader_x + 1, bootloader_y, CellState::data(0x00)));
        cells.push((bootloader_x + 2, bootloader_y, CellState::data(0x00)));
        cells.push((bootloader_x + 3, bootloader_y, CellState::data(0x00)));

        cells
    }

    /// Get a loaded region by ID
    pub fn get_region(&self, region_id: u64) -> Option<&LinuxKernelRegion> {
        self.regions.get(&region_id)
    }

    /// Get all loaded regions
    pub fn get_all_regions(&self) -> &HashMap<u64, LinuxKernelRegion> {
        &self.regions
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Test creating a Linux payload loader
    #[test]
    fn test_linux_loader_creation() {
        let loader = LinuxPayloadLoader::new(256, 128);

        assert_eq!(loader.next_base_x, 20);
        assert_eq!(loader.next_base_y, 20);
        assert_eq!(loader.cmdline, "console=ttyS0 earlyprintk");
    }

    /// Test setting command line
    #[test]
    fn test_command_line() {
        let mut loader = LinuxPayloadLoader::new(256, 128);

        loader.set_command_line("console=ttyS0,115200n8 root=/dev/sda1");

        assert_eq!(loader.cmdline, "console=ttyS0,115200n8 root=/dev/sda1");
    }

    /// Test setting initrd
    #[test]
    fn test_initrd() {
        let mut loader = LinuxPayloadLoader::new(256, 128);

        let initrd_data = vec![0x41, 0x42, 0x43, 0x44];  // "ABCD"
        loader.set_initrd(initrd_data.clone());

        assert!(loader.initrd_data.is_some());
        assert_eq!(loader.initrd_data.unwrap(), initrd_data);
    }

    /// Test DTB generation
    #[test]
    fn test_dtb_generation() {
        let loader = LinuxPayloadLoader::new(256, 128);

        let dtb = loader.generate_dtb();

        assert!(dtb.is_ok());
        let dtb = dtb.unwrap();

        // Check magic number
        assert_eq!(&dtb[0..4], &0xd00dfeed_u32.to_be_bytes());

        // Check it contains "chosen"
        assert!(dtb.windows(7).any(|w| w == b"chosen\0"));

        // Check it contains bootargs
        assert!(dtb.windows(9).any(|w| w == b"bootargs\0"));
    }

    /// Test DTB with initrd
    #[test]
    fn test_dtb_with_initrd() {
        let mut loader = LinuxPayloadLoader::new(256, 128);

        loader.set_initrd(vec![0x41, 0x42, 0x43, 0x44]);

        let dtb = loader.generate_dtb();

        assert!(dtb.is_ok());
        let dtb = dtb.unwrap();

        // Check for initrd properties
        assert!(dtb.windows(19).any(|w| w == b"linux,initrd-start\0"));
        assert!(dtb.windows(17).any(|w| w == b"linux,initrd-end\0"));
    }

    /// Test ELF64 parsing validation
    #[test]
    fn test_elf64_validation() {
        let loader = LinuxPayloadLoader::new(256, 128);

        // Invalid ELF (too small)
        let invalid_data = vec![0x7f, b'E', b'L', b'F'];
        let result = loader.parse_elf64_kernel(&invalid_data);
        assert!(result.is_err());

        // Wrong architecture (x86_64)
        let mut elf64_x86 = vec![
            0x7f, b'E', b'L', b'F',  // ELF magic
            0x02,                      // 64-bit
            0x01,                      // little endian
            0x01,                      // ELF version
            0x00,                      // System V ABI
            0x00, 0x00, 0x00, 0x00,    // padding
            0x03, 0x00, 0x00, 0x00,    // e_type = ET_EXEC
            0x3e, 0x00,                // e_machine = EM_X86_64 (not RISC-V)
            0x01, 0x00, 0x00, 0x00,    // e_version
            0x00, 0x00, 0x20, 0x00, 0x80, 0x00, 0x00, 0x00,  // e_entry
        ];
        // Fill out to minimum size
        while elf64_x86.len() < 64 {
            elf64_x86.push(0);
        }

        let result = loader.parse_elf64_kernel(&elf64_x86);
        assert!(result.is_err());
        if let Err(LinuxLoadError::ElfParseError(msg)) = result {
            assert!(msg.contains("RISC-V"));
        } else {
            panic!("Expected ElfParseError");
        }
    }
}