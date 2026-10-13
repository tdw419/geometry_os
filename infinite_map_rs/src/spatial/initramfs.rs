//! Initial RAM disk (initramfs) setup for boot
//!
//! Handles:
//! - Loading initramfs from PNG-extracted data
//! - Validating CPIO format
//! - Optional decompression (gzip)
//! - Placement at guest memory address with alignment

use std::error::Error;
use std::fmt;

/// Initramfs errors
#[derive(Debug)]
pub enum InitramfsError {
    InvalidCpioFormat(String),
    InvalidChecksum,
    DecompressionFailed(String),
    MemoryAllocationFailed(String),
    InvalidAlignment,
    EmptyData,
    TruncatedArchive,
}

impl fmt::Display for InitramfsError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> fmt::Result {
        match self {
            InitramfsError::InvalidCpioFormat(msg) => write!(f, "Invalid CPIO format: {}", msg),
            InitramfsError::InvalidChecksum => write!(f, "Initramfs checksum invalid"),
            InitramfsError::DecompressionFailed(msg) => write!(f, "Decompression failed: {}", msg),
            InitramfsError::MemoryAllocationFailed(msg) => write!(f, "Memory allocation failed: {}", msg),
            InitramfsError::InvalidAlignment => write!(f, "Invalid alignment"),
            InitramfsError::EmptyData => write!(f, "Initramfs data is empty"),
            InitramfsError::TruncatedArchive => write!(f, "Initramfs archive is truncated"),
        }
    }
}

impl Error for InitramfsError {}

/// CPIO format magic numbers
const CPIO_NEWC_MAGIC: &[u8; 6] = b"070701";
const CPIO_ODC_MAGIC: &[u8; 6] = b"070707";
const GZIP_MAGIC: [u8; 2] = [0x1f, 0x8b];

/// Initramfs configuration
#[derive(Debug, Clone)]
pub struct InitramfsConfig {
    pub base_address: u64,
    pub alignment: u64,
    pub decompress: bool,
    pub validate_checksum: bool,
}

impl Default for InitramfsConfig {
    fn default() -> Self {
        InitramfsConfig {
            base_address: 0x84000000u64, // Standard initramfs address
            alignment: 4096,
            decompress: true,
            validate_checksum: true,
        }
    }
}

/// Initialized initramfs with memory layout
#[derive(Debug, Clone)]
pub struct Initramfs {
    pub base_address: u64,
    pub size: u64,
    pub is_compressed: bool,
    pub entry_point: Option<String>, // init script path
    pub cpio_format: String,
}

/// CPIO file entry header (newc format)
#[repr(C)]
#[derive(Debug, Clone, Copy)]
struct CpioHeader {
    magic: [u8; 6],
    inode: [u8; 8],
    mode: [u8; 8],
    uid: [u8; 8],
    gid: [u8; 8],
    nlink: [u8; 8],
    mtime: [u8; 8],
    filesize: [u8; 8],
    devmajor: [u8; 8],
    devminor: [u8; 8],
    rdevmajor: [u8; 8],
    rdevminor: [u8; 8],
    namesize: [u8; 8],
    check: [u8; 8],
}

/// Parse hexadecimal string to u64
fn parse_hex_u8(hex: &[u8]) -> Result<u8, InitramfsError> {
    let s = std::str::from_utf8(hex)
        .map_err(|e| InitramfsError::InvalidCpioFormat(format!("Invalid UTF-8: {}", e)))?;
    u8::from_str_radix(s, 16)
        .map_err(|e| InitramfsError::InvalidCpioFormat(format!("Invalid hex: {}", e)))
}

/// Parse hex value from CPIO header field (little-endian hex ASCII)
fn parse_cpio_hex(field: &[u8]) -> Result<u64, InitramfsError> {
    let mut value = 0u64;
    for &byte in field.iter().rev() {
        let digit = parse_hex_u8(&[byte])? as u64;
        value = (value << 4) | digit;
    }
    Ok(value)
}

/// Detect CPIO format from magic
fn detect_cpio_format(data: &[u8]) -> Result<&'static str, InitramfsError> {
    if data.len() < 6 {
        return Err(InitramfsError::InvalidCpioFormat("Data too short".to_string()));
    }

    if &data[0..6] == CPIO_NEWC_MAGIC {
        Ok("newc")
    } else if &data[0..6] == CPIO_ODC_MAGIC {
        Ok("odc")
    } else {
        Err(InitramfsError::InvalidCpioFormat(
            format!("Invalid magic: {:02x?}", &data[0..6])
        ))
    }
}

/// Validate CPIO archive structure
fn validate_cpio_structure(data: &[u8]) -> Result<String, InitramfsError> {
    let format = detect_cpio_format(data)?;
    
    if format != "newc" {
        return Err(InitramfsError::InvalidCpioFormat(
            format!("Unsupported CPIO format: {}", format)
        ));
    }

    // Walk through archive to check it's not truncated
    let mut offset = 0;
    let mut entries = 0;
    
    while offset + std::mem::size_of::<CpioHeader>() <= data.len() {
        let header_bytes = &data[offset..offset + std::mem::size_of::<CpioHeader>()];
        let header = unsafe { &*(header_bytes.as_ptr() as *const CpioHeader) };
        
        // Parse header fields
        let filesize = parse_cpio_hex(&header.filesize)? as usize;
        let namesize = parse_cpio_hex(&header.namesize)? as usize;

        // Calculate entry size
        let header_size = std::mem::size_of::<CpioHeader>();
        let name_offset = offset + header_size;
        let data_offset = name_offset + ((namesize + 3) & !3); // Name is padded to 4 bytes
        let entry_size = data_offset + ((filesize + 3) & !3); // Data is padded to 4 bytes

        if entry_size > data.len() {
            return Err(InitramfsError::TruncatedArchive);
        }

        // Check for end marker (TRAILER!!!)
        let name = &data[name_offset..name_offset + namesize];
        if name == b"TRAILER!!!" {
            break;
        }
        
        offset = entry_size;
        entries += 1;
        
        if entries > 10000 {
            return Err(InitramfsError::InvalidCpioFormat("Too many entries".to_string()));
        }
    }
    
    if entries == 0 {
        return Err(InitramfsError::InvalidCpioFormat("No entries found".to_string()));
    }
    
    Ok(format.to_string())
}

/// Decompress gzip data
fn decompress_gzip(compressed: &[u8]) -> Result<Vec<u8>, InitramfsError> {
    // Simple decompression placeholder
    // In production, use flate2 or similar crate
    if compressed.len() < 2 {
        return Err(InitramfsError::DecompressionFailed("Data too short".to_string()));
    }
    
    if &compressed[0..2] != &GZIP_MAGIC {
        return Err(InitramfsError::DecompressionFailed("Not gzip format".to_string()));
    }
    
    // For now, return uncompressed data as-is (decompression to be implemented)
    Ok(compressed.to_vec())
}

/// Align address up to boundary
fn align_up(addr: u64, align: u64) -> Result<u64, InitramfsError> {
    if align == 0 || !align.is_power_of_two() {
        return Err(InitramfsError::InvalidAlignment);
    }
    
    Ok((addr + align - 1) & !(align - 1))
}

/// Main initramfs setup function
pub fn setup_initramfs(
    data: &[u8],
    config: &InitramfsConfig
) -> Result<Initramfs, Box<dyn Error>> {
    if data.is_empty() {
        return Err(Box::new(InitramfsError::EmptyData));
    }

    // Detect if data is compressed
    let is_compressed = data.len() >= 2 && &data[0..2] == &GZIP_MAGIC;
    
    // Decompress if needed and enabled
    let initramfs_data = if config.decompress && is_compressed {
        decompress_gzip(data)?
    } else {
        data.to_vec()
    };

    // Validate CPIO structure
    let cpio_format = validate_cpio_structure(&initramfs_data)?;
    
    // Align base address
    let aligned_address = align_up(config.base_address, config.alignment)?;
    
    // In a real implementation, this would copy data to guest memory
    // For now, we just return the metadata
    let size = initramfs_data.len() as u64;

    // Find entry point (look for init, /init, or /sbin/init)
    let entry_point = find_init_entry(&initramfs_data)?;

    Ok(Initramfs {
        base_address: aligned_address,
        size,
        is_compressed,
        entry_point,
        cpio_format,
    })
}

/// Find init script in CPIO archive
fn find_init_entry(data: &[u8]) -> Result<Option<String>, InitramfsError> {
    let mut offset = 0;
    
    while offset + std::mem::size_of::<CpioHeader>() <= data.len() {
        let header_bytes = &data[offset..offset + std::mem::size_of::<CpioHeader>()];
        let header = unsafe { &*(header_bytes.as_ptr() as *const CpioHeader) };

        let namesize = parse_cpio_hex(&header.namesize)? as usize;
        let header_size = std::mem::size_of::<CpioHeader>();
        let name_offset = offset + header_size;

        if name_offset + namesize > data.len() {
            break;
        }

        let name = std::str::from_utf8(&data[name_offset..name_offset + namesize])
            .map_err(|e| InitramfsError::InvalidCpioFormat(format!("Invalid UTF-8: {}", e)))?
            .trim_end_matches('\0');

        // Check for init script
        if name == "init" || name == "/init" || name == "/sbin/init" {
            return Ok(Some(name.to_string()));
        }

        // Check for end marker
        if name == "TRAILER!!!" {
            break;
        }

        // Move to next entry
        let filesize = parse_cpio_hex(&header.filesize)? as usize;
        let data_offset = name_offset + ((namesize + 3) & !3);
        let entry_size = data_offset + ((filesize + 3) & !3);

        offset = entry_size;

        if offset > data.len() {
            break;
        }
    }
    
    Ok(None)
}

/// Calculate memory needed for initramfs
pub fn calculate_required_memory(data: &[u8], config: &InitramfsConfig) -> Result<u64, Box<dyn Error>> {
    if data.is_empty() {
        return Err(Box::new(InitramfsError::EmptyData));
    }
    
    let aligned_size = align_up(data.len() as u64, config.alignment)?;
    Ok(aligned_size)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_align_up() {
        assert_eq!(align_up(0, 4096).unwrap(), 0);
        assert_eq!(align_up(1, 4096).unwrap(), 4096);
        assert_eq!(align_up(4095, 4096).unwrap(), 4096);
        assert_eq!(align_up(4096, 4096).unwrap(), 4096);
        assert_eq!(align_up(4097, 4096).unwrap(), 8192);
    }

    #[test]
    fn test_invalid_alignment() {
        assert!(align_up(0, 0).is_err());
        assert!(align_up(0, 3).is_err());
    }

    #[test]
    fn test_cpio_magic_detection() {
        let newc_data = b"070701";
        let odc_data = b"070707";
        let invalid_data = b"000000";
        
        assert_eq!(detect_cpio_format(newc_data).unwrap(), "newc");
        assert_eq!(detect_cpio_format(odc_data).unwrap(), "odc");
        assert!(detect_cpio_format(invalid_data).is_err());
    }

    #[test]
    fn test_empty_data() {
        let config = InitramfsConfig::default();
        let result = setup_initramfs(&[], &config);
        assert!(result.is_err());
    }

    #[test]
    fn test_config_default() {
        let config = InitramfsConfig::default();
        assert_eq!(config.base_address, 0x84000000);
        assert_eq!(config.alignment, 4096);
        assert!(config.decompress);
        assert!(config.validate_checksum);
    }

    #[test]
    fn test_gzip_magic() {
        let gzip_data = [0x1f, 0x8b, 0x08, 0x00];
        let non_gzip_data = [0x00, 0x00, 0x00, 0x00];
        
        assert_eq!(&gzip_data[0..2], &GZIP_MAGIC);
        assert_ne!(&non_gzip_data[0..2], &GZIP_MAGIC);
    }

    #[test]
    fn test_initramfs_creation() {
        let initramfs = Initramfs {
            base_address: 0x84000000,
            size: 65536,
            is_compressed: false,
            entry_point: Some("/init".to_string()),
            cpio_format: "newc".to_string(),
        };
        
        assert_eq!(initramfs.base_address, 0x84000000);
        assert_eq!(initramfs.size, 65536);
        assert_eq!(initramfs.entry_point, Some("/init".to_string()));
    }
}