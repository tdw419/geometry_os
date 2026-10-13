//! Kernel Decoder - Parse and load RISC-V kernel images for boot
//!
//! Supports:
//! - ELF binary format (standard RISC-V kernel)
//! - Raw Image format (fallback)
//! - Segment loading at correct virtual addresses
//! - Entry point verification

use std::error::Error;
use std::fmt;

/// Kernel decoding errors
#[derive(Debug)]
pub enum KernelError {
    InvalidElfMagic,
    InvalidElfClass,
    InvalidElfData,
    InvalidElfType,
    NoLoadableSegments,
    InvalidEntryPoint,
    DecodeFailed,
    InvalidSegmentAlignment,
    SegmentLoadFailed(String),
}

impl fmt::Display for KernelError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> fmt::Result {
        match self {
            KernelError::InvalidElfMagic => write!(f, "Invalid ELF magic number"),
            KernelError::InvalidElfClass => write!(f, "Invalid ELF class (must be 64-bit)"),
            KernelError::InvalidElfData => write!(f, "Invalid ELF data encoding"),
            KernelError::InvalidElfType => write!(f, "Invalid ELF type"),
            KernelError::NoLoadableSegments => write!(f, "No loadable segments found"),
            KernelError::InvalidEntryPoint => write!(f, "Invalid kernel entry point"),
            KernelError::DecodeFailed => write!(f, "Kernel decode failed"),
            KernelError::InvalidSegmentAlignment => write!(f, "Invalid segment alignment"),
            KernelError::SegmentLoadFailed(msg) => write!(f, "Segment load failed: {}", msg),
        }
    }
}

impl Error for KernelError {}

/// ELF64 header structure
#[repr(C)]
#[derive(Debug, Clone)]
struct ElfHeader {
    e_ident: [u8; 16],
    e_type: u16,
    e_machine: u16,
    e_version: u32,
    e_entry: u64,
    e_phoff: u64,
    e_shoff: u64,
    e_flags: u32,
    e_ehsize: u16,
    e_phentsize: u16,
    e_phnum: u16,
    e_shentsize: u16,
    e_shnum: u16,
    e_shstrndx: u16,
}

/// ELF program header structure
#[repr(C)]
#[derive(Debug, Clone, Copy)]
struct ElfProgramHeader {
    p_type: u32,
    p_flags: u32,
    p_offset: u64,
    p_vaddr: u64,
    p_paddr: u64,
    p_filesz: u64,
    p_memsz: u64,
    p_align: u64,
}

/// ELF segment type constants
const PT_NULL: u32 = 0;
const PT_LOAD: u32 = 1;
const PT_DYNAMIC: u32 = 2;
const PT_INTERP: u32 = 3;
const PT_NOTE: u32 = 4;
const PT_SHLIB: u32 = 5;
const PT_PHDR: u32 = 6;
const PT_TLS: u32 = 7;

/// ELF magic bytes
const ELF_MAGIC: [u8; 4] = [0x7f, b'E', b'L', b'F'];

/// Decoded kernel information
#[derive(Debug, Clone)]
pub struct KernelInfo {
    pub entry_point: u64,
    pub segments: Vec<KernelSegment>,
    pub is_elf: bool,
    pub architecture: String,
}

/// Loaded kernel segment
#[derive(Debug, Clone)]
pub struct KernelSegment {
    pub vaddr: u64,
    pub paddr: u64,
    pub filesz: u64,
    pub memsz: u64,
    pub flags: u32,
    pub data: Vec<u8>,
}

/// Parse ELF header from kernel data
fn parse_elf_header(data: &[u8]) -> Result<ElfHeader, KernelError> {
    if data.len() < 64 {
        return Err(KernelError::InvalidElfMagic);
    }

    // Check magic bytes
    if &data[0..4] != ELF_MAGIC {
        return Err(KernelError::InvalidElfMagic);
    }

    // Check class (must be 2 for 64-bit)
    if data[4] != 2 {
        return Err(KernelError::InvalidElfClass);
    }

    // Check data encoding (must be 1 for little-endian)
    if data[5] != 1 {
        return Err(KernelError::InvalidElfData);
    }

    // Parse header fields (little-endian)
    let e_type = u16::from_le_bytes([data[16], data[17]]);
    let e_machine = u16::from_le_bytes([data[18], data[19]]);
    let e_version = u32::from_le_bytes([data[20], data[21], data[22], data[23]]);
    let e_entry = u64::from_le_bytes([
        data[24], data[25], data[26], data[27],
        data[28], data[29], data[30], data[31],
    ]);
    let e_phoff = u64::from_le_bytes([
        data[32], data[33], data[34], data[35],
        data[36], data[37], data[38], data[39],
    ]);
    let e_shoff = u64::from_le_bytes([
        data[40], data[41], data[42], data[43],
        data[44], data[45], data[46], data[47],
    ]);
    let e_flags = u32::from_le_bytes([data[48], data[49], data[50], data[51]]);
    let e_ehsize = u16::from_le_bytes([data[52], data[53]]);
    let e_phentsize = u16::from_le_bytes([data[54], data[55]]);
    let e_phnum = u16::from_le_bytes([data[56], data[57]]);
    let e_shentsize = u16::from_le_bytes([data[58], data[59]]);
    let e_shnum = u16::from_le_bytes([data[60], data[61]]);
    let e_shstrndx = u16::from_le_bytes([data[62], data[63]]);

    // Must be executable (ET_EXEC = 2)
    if e_type != 2 && e_type != 3 {
        return Err(KernelError::InvalidElfType);
    }

    let mut e_ident = [0u8; 16];
    e_ident.copy_from_slice(&data[0..16]);

    Ok(ElfHeader {
        e_ident,
        e_type,
        e_machine,
        e_version,
        e_entry,
        e_phoff,
        e_shoff,
        e_flags,
        e_ehsize,
        e_phentsize,
        e_phnum,
        e_shentsize,
        e_shnum,
        e_shstrndx,
    })
}

/// Parse program headers from ELF data
fn parse_program_headers(data: &[u8], header: &ElfHeader) -> Result<Vec<ElfProgramHeader>, KernelError> {
    if header.e_phoff == 0 || header.e_phnum == 0 {
        return Err(KernelError::NoLoadableSegments);
    }

    let mut program_headers = Vec::new();
    let ph_size = std::mem::size_of::<ElfProgramHeader>() as u64;

    for i in 0..header.e_phnum {
        let offset = (header.e_phoff + (i as u64) * ph_size) as usize;
        
        if offset + std::mem::size_of::<ElfProgramHeader>() > data.len() {
            return Err(KernelError::NoLoadableSegments);
        }

        let p_type = u32::from_le_bytes([
            data[offset], data[offset + 1], data[offset + 2], data[offset + 3],
        ]);
        let p_flags = u32::from_le_bytes([
            data[offset + 4], data[offset + 5], data[offset + 6], data[offset + 7],
        ]);
        let p_offset = u64::from_le_bytes([
            data[offset + 8], data[offset + 9], data[offset + 10], data[offset + 11],
            data[offset + 12], data[offset + 13], data[offset + 14], data[offset + 15],
        ]);
        let p_vaddr = u64::from_le_bytes([
            data[offset + 16], data[offset + 17], data[offset + 18], data[offset + 19],
            data[offset + 20], data[offset + 21], data[offset + 22], data[offset + 23],
        ]);
        let p_paddr = u64::from_le_bytes([
            data[offset + 24], data[offset + 25], data[offset + 26], data[offset + 27],
            data[offset + 28], data[offset + 29], data[offset + 30], data[offset + 31],
        ]);
        let p_filesz = u64::from_le_bytes([
            data[offset + 32], data[offset + 33], data[offset + 34], data[offset + 35],
            data[offset + 36], data[offset + 37], data[offset + 38], data[offset + 39],
        ]);
        let p_memsz = u64::from_le_bytes([
            data[offset + 40], data[offset + 41], data[offset + 42], data[offset + 43],
            data[offset + 44], data[offset + 45], data[offset + 46], data[offset + 47],
        ]);
        let p_align = u64::from_le_bytes([
            data[offset + 48], data[offset + 49], data[offset + 50], data[offset + 51],
            data[offset + 52], data[offset + 53], data[offset + 54], data[offset + 55],
        ]);

        program_headers.push(ElfProgramHeader {
            p_type,
            p_flags,
            p_offset,
            p_vaddr,
            p_paddr,
            p_filesz,
            p_memsz,
            p_align,
        });
    }

    Ok(program_headers)
}

/// Load loadable segments from program headers
fn load_segments(
    data: &[u8],
    program_headers: &[ElfProgramHeader]
) -> Result<(u64, Vec<KernelSegment>), KernelError> {
    let mut segments = Vec::new();
    let mut entry_point = 0u64;

    for ph in program_headers {
        if ph.p_type != PT_LOAD {
            continue;
        }

        // Validate alignment
        if ph.p_align != 0 && (ph.p_vaddr % ph.p_align) != 0 {
            return Err(KernelError::InvalidSegmentAlignment);
        }

        // Extract segment data
        let offset = ph.p_offset as usize;
        let filesz = ph.p_filesz as usize;

        if offset + filesz > data.len() {
            return Err(KernelError::SegmentLoadFailed(
                format!("Segment extends beyond data: offset={}, size={}, data_len={}",
                       offset, filesz, data.len())
            ));
        }

        let segment_data = data[offset..offset + filesz].to_vec();

        segments.push(KernelSegment {
            vaddr: ph.p_vaddr,
            paddr: ph.p_paddr,
            filesz: ph.p_filesz,
            memsz: ph.p_memsz,
            flags: ph.p_flags,
            data: segment_data,
        });

        // Entry point is typically in the first loadable segment
        if entry_point == 0 {
            entry_point = ph.p_vaddr;
        }
    }

    if segments.is_empty() {
        return Err(KernelError::NoLoadableSegments);
    }

    Ok((entry_point, segments))
}

/// Decode kernel from ELF binary format
fn decode_elf_kernel(data: &[u8]) -> Result<KernelInfo, KernelError> {
    let header = parse_elf_header(data)?;
    let program_headers = parse_program_headers(data, &header)?;
    
    let (entry_point, segments) = load_segments(data, &program_headers)?;

    // Determine architecture
    let architecture = match header.e_machine {
        0xf3 => "RISC-V".to_string(),
        0x3e => "x86-64".to_string(),
        0xb7 => "AArch64".to_string(),
        _ => format!("Unknown ({})", header.e_machine),
    };

    Ok(KernelInfo {
        entry_point,
        segments,
        is_elf: true,
        architecture,
    })
}

/// Decode kernel from raw Image format
fn decode_raw_kernel(data: &[u8], default_entry: u64) -> Result<KernelInfo, KernelError> {
    if data.is_empty() {
        return Err(KernelError::DecodeFailed);
    }

    // Treat entire data as one segment
    let segment = KernelSegment {
        vaddr: default_entry,
        paddr: default_entry,
        filesz: data.len() as u64,
        memsz: data.len() as u64,
        flags: 0x7, // R|W|X
        data: data.to_vec(),
    };

    Ok(KernelInfo {
        entry_point: default_entry,
        segments: vec![segment],
        is_elf: false,
        architecture: "RISC-V (raw)".to_string(),
    })
}

/// Main kernel decode function - auto-detects format
pub fn decode_kernel(data: &[u8], default_entry: Option<u64>) -> Result<KernelInfo, KernelError> {
    if data.len() < 4 {
        return Err(KernelError::DecodeFailed);
    }

    // Try ELF format first
    if &data[0..4] == ELF_MAGIC {
        return decode_elf_kernel(data);
    }

    // Fall back to raw image format
    let entry = default_entry.unwrap_or(0x80000000u64);
    decode_raw_kernel(data, entry)
}

/// Validate kernel entry point is reasonable
pub fn validate_entry_point(entry: u64) -> bool {
    // Entry point should be in reasonable RISC-V memory range
    // 0x80000000-0x100000000 is typical kernel space
    entry >= 0x80000000 && entry < 0x100000000
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_invalid_elf_magic() {
        let data = vec![0; 64];
        let result = decode_kernel(&data, None);
        assert!(result.is_err());
    }

    #[test]
    fn test_too_short() {
        let data = vec![0; 3];
        let result = decode_kernel(&data, None);
        assert!(result.is_err());
    }

    #[test]
    fn test_entry_validation() {
        assert!(validate_entry_point(0x80000000));
        assert!(validate_entry_point(0xffffffff));
        assert!(!validate_entry_point(0x1000));
        assert!(!validate_entry_point(0x200000000));
    }

    #[test]
    fn test_raw_kernel_decode() {
        let data = vec![0x01, 0x02, 0x03, 0x04, 0x05];
        let result = decode_kernel(&data, Some(0x80000000));
        assert!(result.is_ok());
        
        let info = result.unwrap();
        assert_eq!(info.entry_point, 0x80000000);
        assert!(!info.is_elf);
        assert_eq!(info.segments.len(), 1);
    }

    #[test]
    fn test_elf_magic_detection() {
        // Valid ELF magic
        let mut data = vec![0x7f, b'E', b'L', b'F', 2, 1, 1, 0];
        data.resize(64, 0);
        data[16] = 2; // ET_EXEC
        let result = parse_elf_header(&data);
        // Will fail on program headers, but magic detection works
        assert!(matches!(result, Err(KernelError::NoLoadableSegments) | Ok(_)));
    }
}