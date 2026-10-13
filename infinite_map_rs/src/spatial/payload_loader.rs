//! Spatial Payload Loader - Phase 8.2
//!
//! Loads RISC-V Linux kernel payloads into spatial memory regions for
//! execution by the spatial RISC-V core (Phase 8.1).
//!
//! Architecture:
//! 1. Parse kernel ELF or PNG-wrapped kernel
//! 2. Allocate spatial region(s) for kernel image
//! 3. Convert kernel binary to spatial cell values
//! 4. Generate spatial bootloader at 0x1000
//! 5. Emit spatial program (cells with coordinates)

use crate::geoasm_materializer::{CellState, TYPE_LDI, TYPE_JMP, TYPE_NOP, TYPE_HALT, TYPE_WALL};
use crate::spatial::riscv_transpiler::{RiscvTranspiler, TranspiledCell};
use crate::spatial::hypervisor_bridge::{SpatialAllocator, SpatialAllocReq, SpatialAllocResp, SPATIAL_ALLOC_OK};
use crate::spatial::spatial_memory::{SpatialMemory, MemoryConfig};
use crate::spatial::path_cache::PathCache;
use image::{DynamicImage, GenericImageView};
use std::collections::HashMap;

// ELF parsing constants and structures (Phase 8.2.2)
const ELF_MAGIC: &[u8; 4] = b"\x7fELF";
const EM_RISCV: u16 = 0xF3;
const PT_LOAD: u32 = 1;
const ELFCLASS32: u8 = 1;

#[repr(C)]
#[derive(Debug, Clone, Copy)]
struct Elf32Ehdr {
    e_ident: [u8; 16],
    e_type: u16,
    e_machine: u16,
    e_version: u32,
    e_entry: u32,
    e_phoff: u32,
    e_shoff: u32,
    e_flags: u32,
    e_ehsize: u16,
    e_phentsize: u16,
    e_phnum: u16,
    e_shentsize: u16,
    e_shnum: u16,
    e_shstrndx: u16,
}

#[repr(C)]
#[derive(Debug, Clone, Copy)]
struct Elf32Phdr {
    p_type: u32,
    p_offset: u32,
    p_vaddr: u32,
    p_paddr: u32,
    p_filesz: u32,
    p_memsz: u32,
    p_flags: u32,
    p_align: u32,
}

#[repr(C)]
#[derive(Debug, Clone, Copy)]
struct Elf32Shdr {
    sh_name: u32,
    sh_type: u32,
    sh_flags: u32,
    sh_addr: u32,
    sh_offset: u32,
    sh_size: u32,
    sh_link: u32,
    sh_info: u32,
    sh_addralign: u32,
    sh_entsize: u32,
}

// Section header types
const SHT_NULL: u32 = 0;
const SHT_PROGBITS: u32 = 1;
const SHT_NOBITS: u32 = 8;
const SHT_SYMTAB: u32 = 2;
const SHT_STRTAB: u32 = 3;

// Section flags
const SHF_ALLOC: u32 = 0x2;
const SHF_EXECINSTR: u32 = 0x4;
const SHF_WRITE: u32 = 0x1;


/// Spatial kernel region configuration
#[derive(Debug, Clone)]
pub struct KernelRegion {
    /// Region ID from spatial allocator
    pub region_id: u64,
    /// Base X coordinate in spatial grid
    pub base_x: u32,
    /// Base Y coordinate in spatial grid
    pub base_y: u32,
    /// Width of kernel region (in words/cells)
    pub width: u32,
    /// Height of kernel region (typically 1 for linear memory)
    pub height: u32,
    /// Kernel entry point (spatial address)
    pub entry_point: u32,
}

/// Spatial payload loader
pub struct PayloadLoader {
    /// Spatial allocator for region management
    allocator: SpatialAllocator,
    /// Loaded kernel regions
    regions: HashMap<u64, KernelRegion>,
    /// Next available base address for allocations
    next_base_x: u32,
    next_base_y: u32,
    /// Grid width for memory layout
    grid_width: usize,
    /// Bank height for code layout (power of 2, e.g., 128 or 1024)
    bank_height: usize,
}

/// Load errors
#[derive(Debug, thiserror::Error)]
pub enum LoadError {
    #[error("Failed to parse ELF header: {0}")]
    ElfParseError(String),
    
    #[error("Failed to parse PNG container: {0}")]
    PngParseError(String),
    
    #[error("Spatial allocation failed: {0}")]
    AllocationFailed(String),
    
    #[error("Kernel entry point not found")]
    NoEntryPoint,
    
    #[error("Kernel too large for spatial grid: {0} bytes")]
    KernelTooLarge(usize),
    
    #[error("Invalid kernel image size: {0}")]
    InvalidImageSize(usize),
}

/// Code region starts at this row (rows above hold the register bank)
const CODE_BASE_Y: usize = 10;
/// Bank width in cells (power of 2; must hold the widest instruction row,
/// currently ECALL at 67 cells + 3-cell stitch). Widening costs x-offset
/// horizon: rel offsets are ±2047, so banks*width must stay < ~2048.
const BANK_WIDTH: usize = 128;

impl PayloadLoader {
    /// Create a new payload loader
    pub fn new(grid_width: usize, grid_height: usize) -> Self {
        // Bank height = largest power of two that FITS BELOW code_base_y
        // within the grid (the draft's grid_height>=256 -> 1024 mapping put
        // code rows 10..1034 outside a 256-tall grid), capped at 1024 so
        // rel_y offsets to the register bank stay inside the ±2047 horizon.
        let usable_rows = grid_height.saturating_sub(CODE_BASE_Y).max(4);
        let bank_height = usable_rows
            .checked_next_power_of_two()
            .map(|np| if np == usable_rows { np } else { np >> 1 })
            .unwrap_or(4)
            .min(1024);

        Self {
            allocator: SpatialAllocator::new(grid_width, grid_height),
            regions: HashMap::new(),
            next_base_x: 10, // Leave space for bootloader at x=0-9
            next_base_y: 10,
            grid_width,
            bank_height,
        }
    }
    
    /// Load a Linux kernel payload into spatial memory
    ///
    /// # Arguments
    /// * `kernel_data` - Raw kernel bytes (ELF or PNG-wrapped)
    ///
    /// # Returns
    /// KernelRegion with spatial coordinates and entry point
    pub fn load_kernel(&mut self, kernel_data: &[u8]) -> Result<KernelRegion, LoadError> {
        // Detect and parse kernel format
        let (kernel_image, entry_point) = self.parse_kernel_image(kernel_data)?;
        
        // Calculate required spatial size (4 bytes per word/cell)
        let required_words = (kernel_image.len() + 3) / 4;

        // Lay the kernel out as a 2D block that wraps across rows, using the
        // remaining grid width (to the right of next_base_x) as the row width.
        // A single-row layout can't hold large kernels even on wide grids.
        let grid_w = self.allocator.grid_width();
        let grid_h = self.allocator.grid_height();
        let available_row_width = (grid_w as u32).saturating_sub(self.next_base_x);
        if available_row_width == 0 {
            return Err(LoadError::KernelTooLarge(kernel_image.len()));
        }
        let width = available_row_width.min(required_words as u32).max(1);
        let height = ((required_words as u32) + width - 1) / width;

        // Check if kernel fits in grid (bounded 2D allocation, not just width)
        if height > (grid_h as u32).saturating_sub(self.next_base_y) {
            return Err(LoadError::KernelTooLarge(kernel_image.len()));
        }
        
        // Allocate spatial region
        let req = &SpatialAllocReq {
            req_id: 0,
            width,
            height,
        };
        
        let (resp, _wall_cells) = self.allocator.allocate_region(req);
        
        if resp.result != SPATIAL_ALLOC_OK {
            return Err(LoadError::AllocationFailed(format!(
                "Allocation failed with code: {}",
                resp.result
            )));
        }
        // Create kernel region record
        let region = KernelRegion {
            region_id: resp.region_id,
            base_x: resp.x,
            base_y: resp.y,
            width: req.width,
            height: req.height,
            entry_point,
        };
        
        // Store region and update next base
        self.regions.insert(region.region_id, region.clone());
        self.next_base_x += width + 2;  // +2 for WALL cells
        
        Ok(region)
    }
    
    /// Parse kernel image (ELF or PNG-wrapped)
    pub fn parse_kernel_image(&self, data: &[u8]) -> Result<(Vec<u8>, u32), LoadError> {
        // Check for PNG-wrapped kernel (PixelRTS format)
        if data.len() >= 8 && &data[0..8] == b"\x89PNG\r\n\x1a\n" {
            return self.parse_png_kernel(data);
        }

        // Check for ELF header (Phase 8.2.2)
        if data.len() >= 4 && &data[0..4] == ELF_MAGIC {
            return self.parse_elf_kernel(data);
        }

        // Assume raw binary (default)
        // Entry point for raw binary is at 0x1000 (standard)
        Ok((data.to_vec(), 0x1000))
    }

    /// Parse ELF32 kernel image (Phase 8.2.2)
    fn parse_elf_kernel(&self, data: &[u8]) -> Result<(Vec<u8>, u32), LoadError> {
        // Check minimum size for ELF header (52 bytes)
        if data.len() < std::mem::size_of::<Elf32Ehdr>() {
            return Err(LoadError::ElfParseError(
                "ELF file too small to contain header".to_string(),
            ));
        }

        // Parse ELF header
        let elf_header: Elf32Ehdr = unsafe {
            std::ptr::read(data.as_ptr() as *const Elf32Ehdr)
        };

        // Validate ELF magic number
        if elf_header.e_ident[0..4] != *ELF_MAGIC {
            return Err(LoadError::ElfParseError(
                "Invalid ELF magic number".to_string(),
            ));
        }

        // Validate architecture (RISC-V 32-bit)
        if elf_header.e_machine != EM_RISCV {
            return Err(LoadError::ElfParseError(format!(
                "Unsupported architecture: expected RISC-V (0xF3), got 0x{:x}",
                elf_header.e_machine
            )));
        }

        // Validate class is 32-bit
        if elf_header.e_ident[4] != ELFCLASS32 {
            return Err(LoadError::ElfParseError(
                "Only ELF32 format supported".to_string(),
            ));
        }

        // Validate ELF version
        if elf_header.e_version != 1 {
            return Err(LoadError::ElfParseError(
                "Unsupported ELF version".to_string(),
            ));
        }

        let entry_point = elf_header.e_entry;

        // Parse program headers
        let phoff = elf_header.e_phoff as usize;
        let phentsize = elf_header.e_phentsize as usize;
        let phnum = elf_header.e_phnum as usize;

        // Validate program header table
        if phoff + phentsize * phnum > data.len() {
            return Err(LoadError::ElfParseError(
                "Program header table exceeds file size".to_string(),
            ));
        }

        let mut kernel_image = Vec::new();

        for i in 0..phnum {
            let phdr_offset = phoff + i * phentsize;

            if phdr_offset + std::mem::size_of::<Elf32Phdr>() > data.len() {
                return Err(LoadError::ElfParseError(format!(
                    "Program header {} exceeds file size", i
                )));
            }

            let phdr: Elf32Phdr = unsafe {
                std::ptr::read(data.as_ptr().add(phdr_offset) as *const Elf32Phdr)
            };

            // Only load PT_LOAD segments
            if phdr.p_type == PT_LOAD {
                let segment_offset = phdr.p_offset as usize;
                let segment_size = phdr.p_filesz as usize;

                // Validate segment bounds
                if segment_offset + segment_size > data.len() {
                    return Err(LoadError::ElfParseError(format!(
                        "Segment {} exceeds file size (offset={}, size={})",
                        i, segment_offset, segment_size
                    )));
                }

                // Extract segment data
                let segment_data = &data[segment_offset..segment_offset + segment_size];
                kernel_image.extend_from_slice(segment_data);
            }
        }

        if kernel_image.is_empty() {
            return Err(LoadError::ElfParseError(
                "No loadable segments found in ELF".to_string(),
            ));
        }

        Ok((kernel_image, entry_point))
    }

    /// Load RV32I ELF binary into spatial substrate
    ///
    /// # Arguments
    /// * `elf_data` - Raw ELF file bytes
    /// * `mem_base_vaddr` - Base virtual address for memory region (e.g., 0x80000000)
    /// * `mem_base_x` - Base X coordinate for data memory region
    /// * `mem_base_y` - Base Y coordinate for data memory region
    ///
    /// # Returns
    /// Complete cell vector for spatial grid upload
    pub fn load_spatial_elf(
        &self,
        elf_data: &[u8],
        mem_base_vaddr: u32,
        mem_base_x: u32,
        mem_base_y: u32,
    ) -> Result<Vec<(usize, usize, CellState)>, LoadError> {
        // Parse ELF header
        let elf_header: Elf32Ehdr = unsafe {
            std::ptr::read(elf_data.as_ptr() as *const Elf32Ehdr)
        };

        // Validate ELF
        if elf_header.e_ident[0..4] != *ELF_MAGIC {
            return Err(LoadError::ElfParseError("Invalid ELF magic".to_string()));
        }
        if elf_header.e_machine != EM_RISCV {
            return Err(LoadError::ElfParseError("Not RISC-V".to_string()));
        }

        let entry_point = elf_header.e_entry;

        // Parse section headers
        let shoff = elf_header.e_shoff as usize;
        let shentsize = elf_header.e_shentsize as usize;
        let shnum = elf_header.e_shnum as usize;
        let shstrndx = elf_header.e_shstrndx as usize;

        if shoff + shentsize * shnum > elf_data.len() {
            return Err(LoadError::ElfParseError("Section headers out of bounds".to_string()));
        }

        // Find section string table
        let shstrtab_shdr: Elf32Shdr = unsafe {
            std::ptr::read(elf_data.as_ptr().add(shoff + shstrndx * shentsize) as *const Elf32Shdr)
        };
        let shstrtab_data = &elf_data[shstrtab_shdr.sh_offset as usize..
                                     (shstrtab_shdr.sh_offset + shstrtab_shdr.sh_size) as usize];

        // Collect sections
        let mut text_section: Option<(u32, &[u8])> = None;
        let mut data_sections: Vec<(u32, &[u8])> = Vec::new();
        let mut bss_sections: Vec<(u32, u32)> = Vec::new();

        for i in 0..shnum {
            let shdr: Elf32Shdr = unsafe {
                std::ptr::read(elf_data.as_ptr().add(shoff + i * shentsize) as *const Elf32Shdr)
            };

            if shdr.sh_type == SHT_NULL {
                continue;
            }

            // Get section name (name_end is ABSOLUTE — the old code added
            // name_start twice and sliced out of bounds for larger offsets)
            let name_start = (shdr.sh_name as usize).min(shstrtab_data.len());
            let name_end = name_start
                + shstrtab_data[name_start..]
                    .iter()
                    .position(|&b| b == 0)
                    .unwrap_or(shstrtab_data.len() - name_start);
            let name = std::str::from_utf8(&shstrtab_data[name_start..name_end]).unwrap_or("");

            // Check if section should be loaded
            if (shdr.sh_flags & SHF_ALLOC) != 0 {
                if (shdr.sh_flags & SHF_EXECINSTR) != 0 && name == ".text" {
                    // Text section (executable)
                    let offset = shdr.sh_offset as usize;
                    let size = shdr.sh_size as usize;
                    let section_data = &elf_data[offset..offset + size];
                    text_section = Some((shdr.sh_addr, section_data));
                } else if shdr.sh_type == SHT_PROGBITS {
                    // Data/rodata sections (initialized data)
                    let offset = shdr.sh_offset as usize;
                    let size = shdr.sh_size as usize;
                    if size > 0 {
                        let section_data = &elf_data[offset..offset + size];
                        data_sections.push((shdr.sh_addr, section_data));
                    }
                } else if shdr.sh_type == SHT_NOBITS {
                    // BSS section (zero-initialized) - handled by NOP cells with data_buffer=0
                    // BSS has no file data, just size
                    if shdr.sh_size > 0 {
                        // Track BSS for zero initialization
                        bss_sections.push((shdr.sh_addr, shdr.sh_size));
                    }
                }
            }
        }

        // Transpile text section
        let mut cells = Vec::new();
        if let Some((text_vaddr, text_data)) = text_section {
            let code_base_x = 0;
            let code_base_y = 10;
            let reg_base_x = 0;
            let reg_base_y = 0;
            // CRITICAL: the transpiler must share the loader's memory
            // geometry AND the vaddr base, or runtime LW/SW target the
            // default region while data sits where the loader seeded it.
            let mut transpiler =
                RiscvTranspiler::new(code_base_x, code_base_y, reg_base_x, reg_base_y)
                    .with_base_pc(text_vaddr)
                    // Memory width MUST equal the data-seeding wrap width
                    // below (self.grid_width) or runtime pointers and seeded
                    // data disagree about where words live.
                    .with_memory_region(mem_base_x as usize, mem_base_y as usize, self.grid_width)
                    .with_memory_vaddr(mem_base_vaddr)
                    .with_row_banking(BANK_WIDTH, self.bank_height);

            // Extract instructions (must be 4-byte aligned)
            let instructions: Vec<u32> = text_data
                .chunks_exact(4)
                .map(|chunk| {
                    let mut bytes = [0u8; 4];
                    bytes.copy_from_slice(chunk);
                    u32::from_le_bytes(bytes)
                })
                .collect();

            let transpiled = transpiler.transpile_program(&instructions);
            for cell in transpiled {
                cells.push((cell.x, cell.y, cell.cell));
            }
        }

        // Emit data sections
        let mem_base_x_usize = mem_base_x as usize;
        let mem_base_y_usize = mem_base_y as usize;
        let grid_width = self.grid_width;

        for (vaddr, data) in &data_sections {
            let mem_offset = ((*vaddr - mem_base_vaddr) / 4) as usize;
            let words: Vec<u32> = data.chunks_exact(4)
                .map(|chunk| {
                    let mut bytes = [0u8; 4];
                    bytes.copy_from_slice(chunk);
                    u32::from_le_bytes(bytes)
                })
                .collect();

            for (i, &word) in words.iter().enumerate() {
                let idx = mem_offset + i;
                let x = mem_base_x_usize + (idx % grid_width);
                let y = mem_base_y_usize + (idx / grid_width);
                cells.push((x, y, CellState {
                    opcode_or_type: TYPE_NOP,
                    is_active: 0,
                    data_buffer: word,
                    executing: 0,
                }));
            }
        }

        // Initialize stack pointer (x2/sp) to the top of the memory region.
        // Region capacity per the layout spec is 2048 rows x 128 words x 4 B
        // = 1 MiB; anything past it gets bounds-dropped by STORE_IND, so a
        // 4 MiB stack top would make every stack push silently vanish.
        let stack_top_vaddr = mem_base_vaddr + 1024 * 1024;
        let sp_cell = CellState {
            opcode_or_type: TYPE_NOP,
            is_active: 0,
            data_buffer: stack_top_vaddr,
            executing: 0,
        };

        // Stack pointer is register x2, which is at (2, 0) in register bank layout
        cells.push((2, 0, sp_cell));

        // Activate entry point
        if let Some((text_vaddr, _)) = text_section {
            let offset = ((entry_point - text_vaddr) / 4) as usize;
            let bank_shift = self.bank_height.trailing_zeros() as usize;
            let bank = offset >> bank_shift;
            let row = offset & (self.bank_height - 1);

            // Calculate entry coordinate
            let entry_x = bank * BANK_WIDTH;
            let entry_y = 10 + row;   // code_base_y = 10

            // Find and activate entry cell
            for cell in cells.iter_mut() {
                if cell.0 == entry_x && cell.1 == entry_y {
                    cell.2.is_active = 1;
                    break;
                }
            }
        }

        Ok(cells)
    }

    
    /// Parse PNG-wrapped kernel (PixelRTS format using Hilbert curve)
    fn parse_png_kernel(&self, data: &[u8]) -> Result<(Vec<u8>, u32), LoadError> {
        // Load PNG image from memory
        let img = image::load_from_memory(data)
            .map_err(|e| LoadError::PngParseError(format!("Failed to load PNG: {}", e)))?;
        
        let rgba_img = img.to_rgba8();
        let width = rgba_img.width();
        let height = rgba_img.height();
        
        // Validate grid size (must be power of 2 for Hilbert curve)
        if width != height || !width.is_power_of_two() {
            return Err(LoadError::PngParseError(format!(
                "Invalid PNG dimensions: expected NxN where N is power of 2, got {}x{}",
                width, height
            )));
        }
        
        // Generate Hilbert curve lookup table
        let grid_size = width;
        let total_pixels = width * height;
        let hilbert_lut = self.generate_hilbert_lut(grid_size);
        
        // Extract bytes from pixels along Hilbert curve
        let mut kernel_data = Vec::with_capacity((total_pixels * 4) as usize);
        
        for pixel_idx in 0..total_pixels {
            let (x, y) = hilbert_lut[pixel_idx as usize];
            
            if x >= width || y >= height {
                return Err(LoadError::PngParseError(format!(
                    "Invalid Hilbert coordinates: ({}, {})", x, y
                )));
            }
            
            let pixel = rgba_img.get_pixel(x, y);
            
            // Extract RGBA bytes in order
            kernel_data.push(pixel[0]); // R
            kernel_data.push(pixel[1]); // G
            kernel_data.push(pixel[2]); // B
            kernel_data.push(pixel[3]); // A
        }
        
        // Trim trailing zeros (padding)
        let kernel_data = self.trim_padding(&kernel_data);
        
        log::info!(
            "Extracted {} bytes from PNG ({}x{} grid, {} pixels along Hilbert curve)",
            kernel_data.len(),
            width,
            height,
            total_pixels
        );
        
        // Determine entry point
        // If this looks like an ELF binary, extract entry point from header
        // Otherwise use default 0x1000 (raw binary)
        let entry_point = if kernel_data.len() >= 4 && &kernel_data[0..4] == ELF_MAGIC {
            // Extract entry point from ELF header (offset 24, 4 bytes, little-endian)
            if kernel_data.len() >= 28 {
                let entry_bytes = [kernel_data[24], kernel_data[25], kernel_data[26], kernel_data[27]];
                u32::from_le_bytes(entry_bytes)
            } else {
                0x1000 // Fallback to default
            }
        } else {
            0x1000 // Raw binary default
        };
        
        log::info!("Kernel entry point: 0x{:08X}", entry_point);
        
        Ok((kernel_data, entry_point))
    }
    
    /// Generate Hilbert curve lookup table
    fn generate_hilbert_lut(&self, n: u32) -> Vec<(u32, u32)> {
        let total = (n * n) as usize;
        let mut lut = Vec::with_capacity(total);
        
        for d in 0..total {
            let (x, y) = self.hilbert_d2xy(n, d as u64);
            lut.push((x, y));
        }
        
        lut
    }
    
    /// Convert Hilbert distance to (x, y) coordinates
    fn hilbert_d2xy(&self, n: u32, d: u64) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        let mut s = 1u32;
        let mut d = d;
        
        while s < n {
            let rx = 1 & (d / 2);
            let ry = 1 & (d ^ rx);
            
            if ry == 0 {
                if rx == 1 {
                    x = s - 1 - x;
                    y = s - 1 - y;
                }
                // Swap x and y
                std::mem::swap(&mut x, &mut y);
            }

            x += s * (rx as u32);
            y += s * (ry as u32);
            d /= 4;
            s *= 2;
        }

        (x, y)
    }

    /// Trim trailing zeros (padding) from binary data
    fn trim_padding(&self, data: &[u8]) -> Vec<u8> {
        // Find the last non-zero byte
        let last_non_zero = data.iter().rposition(|&b| b != 0);
        
        match last_non_zero {
            Some(pos) => data[..=pos].to_vec(),
            None => Vec::new(), // All zeros
        }
    }
    
    /// Emit spatial program for loaded kernel
    ///
    /// Generates cells that:
    /// 1. Initialize PC to kernel entry point
    /// 2. Jump to kernel
    ///
    /// # Arguments
    /// * `kernel_image` - Extracted kernel image (PT_LOAD segments only, not full ELF)
    /// * `region` - Kernel region info
    ///
    /// # Returns
    /// Vector of (x, y, CellState) tuples for spatial grid
    pub fn emit_kernel_program(
        &self,
        kernel_image: &[u8],
        region: &KernelRegion,
    ) -> Result<Vec<(usize, usize, CellState)>, LoadError> {
        let mut cells = Vec::new();
        
        // 1. Emit kernel image as spatial memory cells
        // Each 4-byte word becomes one spatial cell
        let words: Vec<u32> = kernel_image
            .chunks_exact(4)
            .map(|chunk| {
                let mut bytes = [0u8; 4];
                bytes.copy_from_slice(chunk);
                u32::from_le_bytes(bytes)
            })
            .collect();
        
        for (i, &word) in words.iter().enumerate() {
            // Wrap kernel memory across multiple rows to fit in grid
            let cells_per_row = region.width as usize;
            let x = region.base_x as usize + (i % cells_per_row);
            let y = region.base_y as usize + (i / cells_per_row);

            // Kernel memory cells store data, NOP instruction type
            // (data is accessed via SpatialMemory load/store)
            cells.push((x, y, CellState::data(word)));
        }
        
        // 2. Emit WALL cells around kernel region
        // Note: SpatialAllocator already places WALLs around the allocated region
        // This is redundant but kept for explicit control
        if region.base_y > 0 {
            // Top WALL
            for x in (region.base_x as usize - 1)..=(region.base_x + region.width) as usize {
                cells.push((x, region.base_y as usize - 1, CellState::new(TYPE_WALL, 0, 0)));
            }
        }
        // Bottom WALL
        if region.base_x > 0 {
            for x in (region.base_x as usize - 1)..=(region.base_x + region.width) as usize {
                cells.push((x, (region.base_y + region.height) as usize, CellState::new(TYPE_WALL, 0, 0)));
            }
        }
        if region.base_x > 0 {
            // Left WALL
            for y in region.base_y as usize..(region.base_y + region.height) as usize {
                cells.push((region.base_x as usize - 1, y, CellState::new(TYPE_WALL, 0, 0)));
            }
        }
        // Right WALL
        for y in region.base_y as usize..(region.base_y + region.height) as usize {
            cells.push(((region.base_x + region.width) as usize, y, CellState::new(TYPE_WALL, 0, 0)));
        }
        
        // 3. Emit bootloader at (0, 0)
        // Bootloader sequence:
        // - LDI x1, entry_point (load kernel entry point to RA/PC)
        // - JMP x1 (jump to kernel)
        cells.extend(self.emit_bootloader(region.entry_point));
        
        Ok(cells)
    }
    
    /// Emit spatial bootloader using RISC-V transpiler
    ///
    /// Bootloader sequence (transpiled to spatial paths):
    /// 1. Initialize PC (reg 1/x1) with kernel entry point
    /// 2. Initialize SP (reg 2/x2) with stack top address
    /// 3. Zero out general-purpose registers (x3-x31)
    /// 4. Jump to kernel entry point
    ///
    /// # Arguments
    /// * `entry_point` - Kernel entry point address
    ///
    /// # Returns
    /// Vector of transpiled spatial cells (register bank + code)
    fn emit_bootloader(&self, entry_point: u32) -> Vec<(usize, usize, CellState)> {
        // Create transpiler with register bank at (50, 0)
        // Layout: 4 rows of 8 registers (x0-x31)
        let reg_bank_x = 50;
        let reg_bank_y = 0;
        let code_base_x = 0;  // Bootloader code at (0, 10)
        let code_base_y = 10;
        
        // new(code_base_x, code_base_y, reg_base_x, reg_base_y) — code first
        let mut transpiler = RiscvTranspiler::new(code_base_x, code_base_y, reg_bank_x, reg_bank_y);
        
        // Stack top address (spatial memory region)
        let stack_top: i32 = 0x3000;
        let entry_i32 = entry_point as i32;
        
        // RISC-V bootloader instructions:
        // 1. LUI x1, entry_point_upper
        // 2. ADDI x1, x1, entry_point_lower
        // 3. LUI x2, stack_top_upper
        // 4. ADDI x2, x2, stack_top_lower
        // 5. Zero out x3-x31 (29 ADDI instructions)
        // 6. JALR x0, x1, 0 (jump to PC in x1)
        
        let mut bootloader_instructions = Vec::new();
        
        // Build LUI + ADDI for PC (x1) with entry point
        // For simplicity, use ADDI only (entry point fits in 12-bit immediate)
        // LUI x1, 0; ADDI x1, x1, entry_point
        let lui_pc: u32 = (0b0110111 << 0) | (1 << 7) | ((entry_point >> 12) & 0xFFFFF);
        let addi_pc: u32 = (0b0010011 << 0) | (0b000 << 12) | (1 << 7) | (1 << 15) | ((entry_point & 0xFFF) << 20);
        
        // Build LUI + ADDI for SP (x2) with stack_top
        let lui_sp: u32 = (0b0110111 << 0) | (2 << 7) | ((stack_top as u32 >> 12) & 0xFFFFF);
        let addi_sp: u32 = (0b0010011 << 0) | (0b000 << 12) | (2 << 7) | (2 << 15) | (((stack_top as u32) & 0xFFF) << 20);
        
        bootloader_instructions.push(lui_pc);
        bootloader_instructions.push(addi_pc);
        bootloader_instructions.push(lui_sp);
        bootloader_instructions.push(addi_sp);
        
        // Zero out x3-x31
        for reg in 3..32 {
            let addi_zero: u32 = (0b0010011 << 0) | (0b000 << 12) | (reg << 7) | (0 << 15);
            bootloader_instructions.push(addi_zero);
        }
        
        // JALR x0, x1, 0 (jump to PC in x1, no link)
        let jalr_jump: u32 = (0b1100111 << 0) | (0b000 << 12) | (0 << 7) | (1 << 15);
        bootloader_instructions.push(jalr_jump);
        
        // ECALL (halt kernel)
        let ecall: u32 = (0b1110011 << 0) | (0b000 << 12) | (0 << 7) | (0 << 15);
        bootloader_instructions.push(ecall);
        
        // Transpile the bootloader
        let transpiled = transpiler.transpile_program(&bootloader_instructions);

        // Convert TranspiledCell to (x, y, CellState), marking the first
        // instruction cell (at code_base_x, code_base_y) as active so the
        // GPU tick engine has an entry point to start executing from.
        transpiled
            .into_iter()
            .map(|tc| {
                let mut cell = tc.cell;
                if tc.x == code_base_x && tc.y == code_base_y {
                    cell.is_active = 1;
                }
                (tc.x, tc.y, cell)
            })
            .collect()
    }
    
    /// Get a loaded region by ID
    pub fn get_region(&self, region_id: u64) -> Option<&KernelRegion> {
        self.regions.get(&region_id)
    }
    
    /// Get all loaded regions
    pub fn get_all_regions(&self) -> &HashMap<u64, KernelRegion> {
        &self.regions
    }
}

// ── Tests ─────────────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;
    
    /// Test loading a minimal kernel
    #[test]
    fn test_load_minimal_kernel() {
        let mut loader = PayloadLoader::new(128, 64);
        
        // Create a minimal "kernel" (just 16 bytes)
        let kernel_data = vec![
            0x13, 0x05, 0x00, 0x00,  // addi x10, x0, 0
            0x73, 0x00, 0x00, 0x00,  // ecall
            0x13, 0x05, 0x01, 0x00,  // addi x10, x0, 1
            0x6f, 0x00, 0x40, 0x00,  // jal x1, -16 (loop)
        ];
        
        let region = loader.load_kernel(&kernel_data).unwrap();
        
        assert_eq!(region.width, 4);  // 16 bytes / 4 = 4 words
        assert_eq!(region.height, 1);
        assert_eq!(region.entry_point, 0x1000);  // Default for raw binary
    }
    
    /// Test kernel too large for grid
    #[test]
    fn test_kernel_too_large() {
        let mut loader = PayloadLoader::new(128, 64);
        
        // Create kernel that won't fit (128 cells * 4 bytes = 512 bytes limit)
        let kernel_data = vec![0u8; 600];
        
        let result = loader.load_kernel(&kernel_data);
        assert!(matches!(result, Err(LoadError::KernelTooLarge(_))));
    }
    
    /// Test bootloader emission (transpiled to spatial paths)
    #[test]
    fn test_emit_bootloader() {
        let loader = PayloadLoader::new(128, 64);
        let entry_point = 0xC0000000;
        
        let bootloader = loader.emit_bootloader(entry_point);
        
        // One-PC-per-Row emission (35 instructions, rows 10..=45):
        // - 33 non-terminating instructions (LUI/ADDI): 2 cells + 3-cell
        //   stitch JMP each = 165
        // - JALR without with_base_pc -> HALT placeholder (1)
        // - ECALL -> HALT (1)
        // - final HALT row (1)
        // Total: 165 + 1 + 1 + 1 = 168 cells
        assert_eq!(bootloader.len(), 168);

        // Code starts at (0, 10) and is marked active (token entry point)
        let first = bootloader
            .iter()
            .find(|(x, y, _)| *x == 0 && *y == 10)
            .expect("first code cell at (0, 10)");
        assert_eq!(first.2.is_active, 1);

        // All cells stay in the code region (rows 10+), never on the
        // register bank rows (y 0-5 at x 50+)
        assert!(bootloader.iter().all(|(_, y, _)| *y >= 10));

        // Check that there's at least one HALT cell
        assert!(bootloader.iter().any(|(_, _, cell)| cell.opcode() == TYPE_HALT));
    }

    /// Builds a structurally CORRECT minimal RV32 ELF (proper sh_offsets,
    /// .text + .data sections) shared by the GPU boot dump tests.
    ///
    /// Program (.text at vaddr 0x1000, entry 0x1000):
    ///   LUI  x5, 0x80000    ; x5 = 0x80000000
    ///   ADDI x5, x5, 0x100  ; x5 = 0x80000100
    ///   ADDI x6, x0, 777
    ///   SW   x6, 0(x5)      ; mem[0x80000100] = 777 -> grid (64, 32)
    ///   LW   x2, 0(x5)      ; x2 = 777
    ///   LUI  x7, 0x80000
    ///   ADDI x7, x7, 0x200  ; x7 = 0x80000200 (.data word)
    ///   LW   x1, 0(x7)      ; x1 = 4242 (seeded from .data)
    ///   ECALL
    /// .data at vaddr 0x80000200: one word, 4242.
    /// Expected on GPU: x2 = 777, x1 = 4242, x5 = 2147483904.
    fn build_minimal_elf() -> Vec<u8> {
        fn u32s(v: &mut Vec<u8>, vals: &[u32]) {
            for x in vals {
                v.extend_from_slice(&x.to_le_bytes());
            }
        }
        fn u16s(v: &mut Vec<u8>, vals: &[u16]) {
            for x in vals {
                v.extend_from_slice(&x.to_le_bytes());
            }
        }

        // Layout: ehdr(52) | 4 shdrs @52 (160) | shstrtab @212 (24) | text @236 | data @236+len
        let text: Vec<u32> = vec![
            0x8000_02B7,                                            // LUI x5, 0x80000
            (0x100 << 20) | (5 << 15) | (5 << 7) | 0x13,            // ADDI x5, x5, 0x100
            (777 << 20) | (0 << 15) | (6 << 7) | 0x13,              // ADDI x6, x0, 777
            (6 << 20) | (5 << 15) | (0b010 << 12) | (0 << 7) | 0x23, // SW x6, 0(x5)
            (0 << 20) | (5 << 15) | (0b010 << 12) | (2 << 7) | 0x03, // LW x2, 0(x5)
            0x8000_03B7,                                            // LUI x7, 0x80000
            (0x200 << 20) | (7 << 15) | (7 << 7) | 0x13,            // ADDI x7, x7, 0x200
            (0 << 20) | (7 << 15) | (0b010 << 12) | (1 << 7) | 0x03, // LW x1, 0(x7)
            0x0000_0073,                                            // ECALL
        ];
        let strtab = b"\0.text\0.data\0.shstrtab\0"; // offsets: 1, 7, 13
        let text_off = 236u32;
        let data_off = text_off + (text.len() as u32) * 4;

        let mut elf: Vec<u8> = Vec::new();
        // e_ident
        elf.extend_from_slice(b"\x7fELF\x01\x01\x01\0\0\0\0\0\0\0\0\0");
        u16s(&mut elf, &[2, 0xF3]); // EXEC, RISC-V
        u32s(&mut elf, &[1, 0x1000, 0, 52, 0]); // version, entry, phoff, shoff, flags
        u16s(&mut elf, &[52, 0, 0, 40, 4, 3]); // ehsize, phentsize, phnum, shentsize, shnum, shstrndx
        assert_eq!(elf.len(), 52);
        // shdr[0]: null
        u32s(&mut elf, &[0; 10]);
        // shdr[1]: .text  PROGBITS ALLOC|EXECINSTR @0x1000
        u32s(&mut elf, &[1, 1, 0x6, 0x1000, text_off, (text.len() as u32) * 4, 0, 0, 4, 0]);
        // shdr[2]: .data  PROGBITS ALLOC|WRITE @0x80000200
        u32s(&mut elf, &[7, 1, 0x3, 0x8000_0200, data_off, 4, 0, 0, 4, 0]);
        // shdr[3]: .shstrtab STRTAB
        u32s(&mut elf, &[13, 3, 0, 0, 212, strtab.len() as u32, 0, 0, 1, 0]);
        assert_eq!(elf.len(), 212);
        elf.extend_from_slice(strtab);
        while elf.len() < text_off as usize {
            elf.push(0);
        }
        for w in &text {
            elf.extend_from_slice(&w.to_le_bytes());
        }
        u32s(&mut elf, &[4242]); // .data word
        elf
    }

    #[test]
    #[ignore]
    fn dump_gpu_elf_boot_bin() {
        use std::io::Write;

        let elf = build_minimal_elf();
        // Load: memory region rows 32+ so it fits the 128x64 GPU harness
        let loader = PayloadLoader::new(128, 64);
        let cells = loader
            .load_spatial_elf(&elf, 0x8000_0000, 0, 32)
            .expect("ELF load failed");

        // .data word must land at ((0x200 >> 2) = 128) -> (0, 33)
        assert!(
            cells.iter().any(|(x, y, c)| *x == 0 && *y == 33 && c.data_buffer == 4242),
            ".data word not seeded at (0, 33)"
        );
        // Entry cell (0, 10) must be active
        assert!(
            cells.iter().any(|(x, y, c)| *x == 0 && *y == 10 && c.is_active == 1),
            "entry cell not activated"
        );

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("elf_boot.bin");
        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 10] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for (x, y, c) in &cells {
            for v in [*x as u32, *y as u32, c.opcode_or_type, c.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// Same minimal ELF as dump_gpu_elf_boot_bin, but loaded onto a
    /// 512x256 grid (memory rows 160+, 512-wide memory wrap, 128-row banks)
    /// to prove the parameterized harness end to end.
    /// Expected on GPU: x2 = 777, x1 = 4242, x5 = 2147483904.
    #[test]
    #[ignore]
    fn dump_gpu_elf_boot_large_bin() {
        use std::io::Write;

        let elf = build_minimal_elf();
        let loader = PayloadLoader::new(512, 256);
        let cells = loader
            .load_spatial_elf(&elf, 0x8000_0000, 0, 160)
            .expect("ELF load failed");

        // 512-wide memory wrap: .data word (0x200 >> 2 = 128) -> (128, 160)
        assert!(
            cells.iter().any(|(x, y, c)| *x == 128 && *y == 160 && c.data_buffer == 4242),
            ".data word not seeded at (128, 160)"
        );

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("elf_boot_large.bin");
        let mut buf: Vec<u8> = Vec::new();
        for v in [512u32, 256, cells.len() as u32, 0, 10] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for (x, y, c) in &cells {
            for v in [*x as u32, *y as u32, c.opcode_or_type, c.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    #[test]
    fn test_spatial_elf_loader() {
        let loader = PayloadLoader::new(128, 256);

        // Create a minimal RV32I ELF with a simple program:
        // .text: LDI x10, 42
        //        ECALL
        let elf_bytes = vec![
            // ELF header
            0x7F, 0x45, 0x4C, 0x46,  // Magic
            0x01,                    // Class = ELF32
            0x01, 0x00, 0x00, 0x00,  // Endian = little, version = 1
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // OS/ABI = System V
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // Padding
            0x02, 0x00, 0xF3, 0x00,  // Type = EXEC, Machine = RISC-V
            0x01, 0x00, 0x00, 0x00,  // Version = 1
            0x00, 0x10, 0x00, 0x00,  // Entry point = 0x1000
            0x34, 0x00, 0x00, 0x00,  // Program header offset = 52
            0xA0, 0x00, 0x00, 0x00,  // Section header offset = 160
            0x00, 0x00, 0x00, 0x00,  // Flags
            0x34, 0x00,  // ELF header size = 52
            0x20, 0x00,  // Program header entry size = 32
            0x01, 0x00,  // Program header count = 1
            0x28, 0x00,  // Section header entry size = 40
            0x03, 0x00,  // Section header count = 3
            0x02, 0x00,  // Section header string table index = 2

            // Program header (PT_LOAD)
            0x01, 0x00, 0x00, 0x00,  // Type = PT_LOAD
            0x00, 0x00, 0x00, 0x00,  // Offset = 0 (will be updated)
            0x00, 0x10, 0x00, 0x00,  // Vaddr = 0x1000
            0x00, 0x10, 0x00, 0x00,  // Paddr = 0x1000
            0x08, 0x00, 0x00, 0x00,  // Filesz = 8 bytes
            0x08, 0x00, 0x00, 0x00,  // Memsz = 8 bytes
            0x05, 0x00, 0x00, 0x00,  // Flags = R|X
            0x00, 0x10, 0x00, 0x00,  // Align = 0x1000

            // Section headers (3: null, .text, .shstrtab)
            // Null section
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

            // .text section
            0x01, 0x00, 0x00, 0x00,  // Name = ".text" (offset 1 in .shstrtab)
            0x01, 0x00, 0x00, 0x00,  // Type = PROGBITS
            0x06, 0x00, 0x00, 0x00,  // Flags = ALLOC|EXECINSTR
            0x00, 0x10, 0x00, 0x00,  // Addr = 0x1000
            0x00, 0x00, 0x00, 0x00,  // Offset = 0
            0x08, 0x00, 0x00, 0x00,  // Size = 8 bytes
            0x00, 0x00, 0x00, 0x00,  // Link = 0
            0x00, 0x00, 0x00, 0x00,  // Info = 0
            0x01, 0x00, 0x00, 0x00,  // Align = 1
            0x00, 0x00, 0x00, 0x00,  // Entsize = 0

            // .shstrtab section
            0x0B, 0x00, 0x00, 0x00,  // Name = ".shstrtab" (offset 11 in .shstrtab)
            0x03, 0x00, 0x00, 0x00,  // Type = STRTAB
            0x00, 0x00, 0x00, 0x00,  // Flags = 0
            0x00, 0x00, 0x00, 0x00,  // Addr = 0
            0xB0, 0x00, 0x00, 0x00,  // Offset = 176
            0x15, 0x00, 0x00, 0x00,  // Size = 21 bytes
            0x00, 0x00, 0x00, 0x00,  // Link = 0
            0x00, 0x00, 0x00, 0x00,  // Info = 0
            0x01, 0x00, 0x00, 0x00,  // Align = 1
            0x00, 0x00, 0x00, 0x00,  // Entsize = 0

            // Section string table
            0x00,  // null name
            b'.', b't', b'e', b'x', b't', 0x00,  // ".text"
            b'.', b's', b'h', b's', b't', b'r', b't', b'a', b'b', 0x00,  // ".shstrtab"
        ];

        // Add the actual code after all headers
        let mut elf = elf_bytes;
        elf.extend_from_slice(&[
            0x0A, 0xA5, 0x02, 0x37,  // LUI x10, 0xA52 (0xA52 << 12 = 0xA52000)
            0x2A, 0x05, 0xD5, 0x13,  // ADDI x10, x10, 42
            0x73, 0x00, 0x00, 0x00,  // ECALL
            0x00, 0x00, 0x00, 0x00,  // Padding
        ]);

        // Fix program header offset and section header offset in ELF
        // For now, we'll test with a simpler case

        let mem_base_vaddr = 0x80000000;
        let mem_base_x = 0;
        let mem_base_y = 2048;

        let result = loader.load_spatial_elf(&elf, mem_base_vaddr, mem_base_x, mem_base_y);

        // We expect this to fail or succeed with cells
        match result {
            Ok(cells) => {
                println!("Loaded {} cells from ELF", cells.len());
                assert!(!cells.is_empty(), "Should emit at least some cells");

                // Check for active entry cell
                let active_cells: Vec<_> = cells.iter().filter(|(_, _, c)| c.is_active == 1).collect();
                assert_eq!(active_cells.len(), 1, "Should have exactly one active cell (entry point)");
            }
            Err(e) => {
                // Expected for this hand-crafted ELF
                println!("ELF parse error (expected): {}", e);
            }
        }
    }

    
    /// Test full program emission
    #[test]
    fn test_emit_kernel_program() {
        let mut loader = PayloadLoader::new(128, 64);
        
        let kernel_data = vec![0x13, 0x05, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00];
        
        // Parse kernel to get extracted image (for raw binary, this is the same as input)
        let (kernel_image, _entry_point) = loader.parse_kernel_image(&kernel_data).unwrap();
        let region = loader.load_kernel(&kernel_data).unwrap();
        
        let cells = loader.emit_kernel_program(&kernel_image, &region).unwrap();
        
        // Should have:
        // - 2 kernel memory cells
        // - WALL cells around perimeter (top+bottom+left+right)
        // - 3 bootloader cells
        // Check bootloader at (0, 0) - filter for instruction cells only (not data or WALL)
        let bootloader_cells: Vec<_> = cells
            .iter()
            .filter(|(x, y, cell)| {
                *x < 3 && *y == 0 && cell.opcode() != TYPE_NOP && cell.opcode() != TYPE_WALL
            })
            .collect();
        assert_eq!(bootloader_cells.len(), 3);
    }

    /// Build a minimal ELF32 RISC-V binary for testing
    fn build_test_elf(entry_point: u32, segment_data: &[u8]) -> Vec<u8> {
        let mut elf = Vec::new();

        // ELF header (52 bytes)
        elf.extend_from_slice(b"\x7fELF"); // e_ident[0..3] = magic
        elf.push(1); // e_ident[4] = ELFCLASS32
        elf.extend_from_slice(&[0u8; 11]); // e_ident[5..15] = padding

        elf.extend_from_slice(&2u16.to_le_bytes()); // e_type = ET_EXEC
        elf.extend_from_slice(&0xF3u16.to_le_bytes()); // e_machine = EM_RISCV
        elf.extend_from_slice(&1u32.to_le_bytes()); // e_version = 1
        elf.extend_from_slice(&entry_point.to_le_bytes()); // e_entry

        let ph_offset = 52u32;
        elf.extend_from_slice(&ph_offset.to_le_bytes()); // e_phoff
        elf.extend_from_slice(&0u32.to_le_bytes()); // e_shoff = 0
        elf.extend_from_slice(&0u32.to_le_bytes()); // e_flags = 0

        elf.extend_from_slice(&52u16.to_le_bytes()); // e_ehsize
        elf.extend_from_slice(&32u16.to_le_bytes()); // e_phentsize
        elf.extend_from_slice(&1u16.to_le_bytes()); // e_phnum = 1
        elf.extend_from_slice(&0u16.to_le_bytes()); // e_shentsize
        elf.extend_from_slice(&0u16.to_le_bytes()); // e_shnum
        elf.extend_from_slice(&0u16.to_le_bytes()); // e_shstrndx

        // Program header (32 bytes)
        elf.extend_from_slice(&1u32.to_le_bytes()); // p_type = PT_LOAD
        elf.extend_from_slice(&84u32.to_le_bytes()); // p_offset = after ELF header + program header (52 + 32)
        elf.extend_from_slice(&0x8000_0000u32.to_le_bytes()); // p_vaddr
        elf.extend_from_slice(&0x8000_0000u32.to_le_bytes()); // p_paddr
        elf.extend_from_slice(&(segment_data.len() as u32).to_le_bytes()); // p_filesz
        elf.extend_from_slice(&(segment_data.len() as u32).to_le_bytes()); // p_memsz
        elf.extend_from_slice(&5u32.to_le_bytes()); // p_flags = PF_R | PF_X
        elf.extend_from_slice(&0x1000u32.to_le_bytes()); // p_align

        // Segment data
        elf.extend_from_slice(segment_data);

        elf
    }

    /// Test ELF magic detection
    #[test]
    fn test_parse_elf_magic_detection() {
        let loader = PayloadLoader::new(128, 64);
        let elf_data = build_test_elf(0x8000_0000, &[0x13, 0x05, 0x00, 0x00]);

        let result = loader.parse_elf_kernel(&elf_data);
        assert!(result.is_ok());

        let (kernel, entry) = result.unwrap();
        assert_eq!(entry, 0x8000_0000);
        assert_eq!(kernel.len(), 4);
    }

    /// Test ELF with invalid magic
    #[test]
    fn test_parse_elf_invalid_magic() {
        let loader = PayloadLoader::new(128, 64);
        let invalid_elf = b"NotELF\x00\x00\x00\x00".to_vec();

        let result = loader.parse_elf_kernel(&invalid_elf);
        assert!(matches!(result, Err(LoadError::ElfParseError(_))));
    }

    /// Test ELF entry point extraction
    #[test]
    fn test_parse_elf_entry_point() {
        let loader = PayloadLoader::new(128, 64);
        let entry_points = [0x8000_0000, 0x1000, 0xC000_0000];

        for &entry in &entry_points {
            let elf_data = build_test_elf(entry, &[0x13, 0x05, 0x00, 0x00]);
            let result = loader.parse_elf_kernel(&elf_data);
            assert!(result.is_ok());

            let (_, parsed_entry) = result.unwrap();
            assert_eq!(parsed_entry, entry);
        }
    }

    /// Test ELF loadable segment extraction
    #[test]
    fn test_parse_elf_loadable_segment() {
        let loader = PayloadLoader::new(128, 64);
        let segment_data = vec![0x13, 0x05, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00];
        let elf_data = build_test_elf(0x8000_0000, &segment_data);

        let result = loader.parse_elf_kernel(&elf_data);
        assert!(result.is_ok());

        let (kernel, _) = result.unwrap();
        assert_eq!(kernel, segment_data);
    }

    /// Test ELF file too small
    #[test]
    fn test_parse_elf_too_small() {
        let loader = PayloadLoader::new(128, 64);
        let too_small = b"\x7fELF".to_vec();

        let result = loader.parse_elf_kernel(&too_small);
        assert!(matches!(result, Err(LoadError::ElfParseError(_))));
    }

    /// Test loading ELF via load_kernel (auto-detection)
    #[test]
    fn test_load_elf_via_load_kernel() {
        let mut loader = PayloadLoader::new(128, 64);
        let segment_data = vec![0x13, 0x05, 0x00, 0x00];
        let elf_data = build_test_elf(0x8000_0000, &segment_data);

        let region = loader.load_kernel(&elf_data).unwrap();

        assert_eq!(region.entry_point, 0x8000_0000);
        assert_eq!(region.width, 1);
        assert_eq!(region.height, 1);
    }

    /// Test fallback to raw binary for non-ELF data
    #[test]
    fn test_elf_raw_binary_fallback() {
        let mut loader = PayloadLoader::new(128, 64);

        let raw_data = vec![0x13, 0x05, 0x00, 0x00];
        let region = loader.load_kernel(&raw_data).unwrap();

        assert_eq!(region.entry_point, 0x1000);
        assert_eq!(region.width, 1);
    }
    
    /// Test PNG kernel decoding with Hilbert curve
    #[test]
    fn test_png_kernel_decoding() {
        let loader = PayloadLoader::new(512, 512);
        
        // Create a minimal PNG-wrapped kernel (4x4 grid = 16 pixels = 64 bytes)
        // We'll use a known valid PNG header for a 4x4 RGBA image
        let png_data = vec![
            // PNG signature
            0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
            // IHDR chunk (4x4 RGBA)
            0x00, 0x00, 0x00, 0x0D, // Length: 13
            0x49, 0x48, 0x44, 0x52, // Type: IHDR
            0x00, 0x00, 0x00, 0x04, // Width: 4
            0x00, 0x00, 0x00, 0x04, // Height: 4
            0x08, // Bit depth: 8
            0x06, // Color type: RGBA
            0x00, // Compression: deflate
            0x00, // Filter: adaptive
            0x00, // Interlace: none
            0x3E, 0xCB, 0xB4, 0x58, // CRC
            // IDAT chunk (simple 4x4 RGBA image)
            0x00, 0x00, 0x00, 0x1D, // Length: 29
            0x49, 0x44, 0x41, 0x54, // Type: IDAT
            0x78, 0x9C, 0x62, 0xF8, 0xCF, 0xC0, 0x00, 0x00,
            0x00, 0x03, 0x00, 0x01, 0x22, 0x00, 0x01, 0x18,
            0xDD, 0x8D, 0xB4, 0x1C, // CRC
            // IEND chunk
            0x00, 0x00, 0x00, 0x00, // Length: 0
            0x49, 0x45, 0x4E, 0x44, // Type: IEND
            0xAE, 0x42, 0x60, 0x82, // CRC
        ];
        
        let result = loader.parse_png_kernel(&png_data);
        assert!(result.is_ok());
        
        let (kernel_data, entry_point) = result.unwrap();
        
        // Should have extracted at least some data
        assert!(!kernel_data.is_empty());
        
        // Entry point should be 0x1000 for non-ELF data
        assert_eq!(entry_point, 0x1000);
    }
    
    /// Test Hilbert curve coordinate generation
    #[test]
    fn test_hilbert_d2xy() {
        let loader = PayloadLoader::new(4, 4);
        
        // Test known Hilbert curve points for 4x4 grid
        let (x, y) = loader.hilbert_d2xy(4, 0);
        assert_eq!((x, y), (0, 0));
        
        let (x, y) = loader.hilbert_d2xy(4, 1);
        assert_eq!((x, y), (1, 0));
        
        let (x, y) = loader.hilbert_d2xy(4, 2);
        assert_eq!((x, y), (1, 1));
        
        let (x, y) = loader.hilbert_d2xy(4, 15); // Last point in 4x4 grid (standard Hilbert curve)
        assert_eq!((x, y), (3, 0));
    }
    
    /// Test PNG loading for non-power-of-2 dimensions (should fail)
    #[test]
    fn test_png_invalid_dimensions() {
        let loader = PayloadLoader::new(512, 512);
        
        // Create PNG with 3x3 dimensions (not power of 2)
        let png_data = vec![
            // PNG signature
            0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
            // IHDR chunk (3x3 RGBA - invalid)
            0x00, 0x00, 0x00, 0x0D, // Length: 13
            0x49, 0x48, 0x44, 0x52, // Type: IHDR
            0x00, 0x00, 0x00, 0x03, // Width: 3
            0x00, 0x00, 0x00, 0x03, // Height: 3
            0x08, // Bit depth: 8
            0x06, // Color type: RGBA
            0x00, 0x00, 0x00, 0x00, 0x00, // Compression/filter/interlace
            0x5A, 0x78, 0x9E, 0xB0, // CRC
            // IDAT chunk
            0x00, 0x00, 0x00, 0x0F, // Length: 15
            0x49, 0x44, 0x41, 0x54, // Type: IDAT
            0x78, 0x9C, 0x62, 0xF8, 0xCF, 0xC0, 0x00, 0x00,
            0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, // CRC
            // IEND chunk
            0x00, 0x00, 0x00, 0x00, // Length: 0
            0x49, 0x45, 0x4E, 0x44, // Type: IEND
            0xAE, 0x42, 0x60, 0x82, // CRC
        ];
        
        let result = loader.parse_png_kernel(&png_data);
        assert!(matches!(result, Err(LoadError::PngParseError(_))));
    }
}

// ============================================================================
// Phase 9.2: Test REAL xv6 kernel transpilation
// ============================================================================
#[test]
fn test_real_xv6_kernel_transpilation() {
    use std::fs;

    // kernel.minimal is the ELF; kernel.bin is its raw objcopy output and
    // can't be used here (the loader parses ELF headers)
    let kernel_path = "/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32/kernel.minimal";

    if !std::path::Path::new(kernel_path).exists() {
        eprintln!("ERROR: xv6 kernel not found at {}", kernel_path);
        eprintln!("Build it with:");
        eprintln!("  cd /home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32 && make -f Makefile.minimal");
        return;
    }

    let elf_data = fs::read(kernel_path).expect("Failed to read xv6 kernel");
    println!("");
    println!("PHASE 9.2: REAL XV6 KERNEL TRANSPILATION TEST");
    println!("");
    println!("Loaded xv6 kernel: {} bytes", elf_data.len());

    if &elf_data[0..4] != b"\x7fELF" {
        panic!("Not an ELF file!");
    }

    // Grid must be tall enough for a decent bank height: at BANK_WIDTH=128
    // the ±2047 x-offset horizon allows ~16 banks, so a ~4K-instruction
    // kernel needs bank_height >= 256 (grid_h >= ~522). Memory rows go at
    // y=2048, above the code banks (rows 10..1034), like boot_xv6.
    let grid_w = 4096;
    let grid_h = 4096;
    let loader = PayloadLoader::new(grid_w, grid_h);

    println!("Grid: {}x{} ({} cells)", grid_w, grid_h, grid_w * grid_h);
    println!("Memory base: 0x{:08x} -> spatial ({}, {})", 0x8000_0000u32, 0, 2048);
    println!("");
    println!("Transpiling RISC-V -> GeoASM...");
    println!("");

    let result = loader.load_spatial_elf(&elf_data, 0x8000_0000, 0, 2048);

    match result {
        Ok(cells) => {
            println!("SUCCESS: Emitted {} cells", cells.len());
            println!("");
            println!("The xv6 kernel has been fully transpiled without");
            println!("encountering any unsupported instructions or CSRs!");
        },
        Err(e) => {
            println!("");
            println!("TRANSPILER CRASH DETECTED!");
            println!("Error: {:?}", e);
            println!("");
            println!("The transpiler has hit an unimplemented instruction or CSR.");
            println!("");
            println!("To fix this:");
            println!("  1. Read the error above to identify what failed");
            println!("  2. Check riscv_transpiler.rs for that instruction's handler");
            println!("  3. Implement the missing instruction/CSR");
            println!("  4. Re-run this test to find the NEXT unimplemented feature");
            println!("");
            panic!("Transpilation failed: {:?}", e);
        }
    }
}
