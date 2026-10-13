//! PNG Boot Loader - Boot Geometry OS systems from self-contained PNG files
//!
//! PNG files serve as self-contained boot packages containing:
//! - Kernel image (RISC-V ELF binary or raw Image)
//! - Initial RAM disk (initramfs)
//! - Boot parameters (kernel command line, device tree)
//! - System configuration (spatial grid layout, hypervisor settings)

use std::fs::File;
use std::io::{self, Read};
use std::path::Path;
use std::error::Error;

/// PNG boot configuration
#[derive(Debug, Clone)]
pub struct PngBootConfig {
    pub png_path: String,
    pub validate_checksum: bool,
    pub verbose: bool,
}

impl Default for PngBootConfig {
    fn default() -> Self {
        PngBootConfig {
            png_path: String::from("system.png"),
            validate_checksum: true,
            verbose: false,
        }
    }
}

/// Extracted boot components from PNG
#[derive(Debug, Clone)]
pub struct PngBootPayload {
    pub kernel: Vec<u8>,
    pub initramfs: Vec<u8>,
    pub boot_params: Vec<u8>,
    pub metadata: PngMetadata,
    pub checksum_valid: bool,
}

/// PNG metadata extracted from image
#[derive(Debug, Clone)]
pub struct PngMetadata {
    pub width: u32,
    pub height: u32,
    pub grid_layout: String,
    pub hypervisor_settings: String,
}

/// PNG boot error types
#[derive(Debug)]
pub enum PngBootError {
    InvalidPngFile(String),
    ChecksumFailed,
    PayloadExtractionFailed(String),
    KernelInvalid,
    InitramfsInvalid,
    InvalidMetadata(String),
}

impl std::fmt::Display for PngBootError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            PngBootError::InvalidPngFile(msg) => write!(f, "Invalid PNG file: {}", msg),
            PngBootError::ChecksumFailed => write!(f, "PNG checksum validation failed"),
            PngBootError::PayloadExtractionFailed(msg) => write!(f, "Payload extraction failed: {}", msg),
            PngBootError::KernelInvalid => write!(f, "Kernel image is invalid"),
            PngBootError::InitramfsInvalid => write!(f, "Initramfs is invalid"),
            PngBootError::InvalidMetadata(msg) => write!(f, "Invalid metadata: {}", msg),
        }
    }
}

impl Error for PngBootError {}

/// Main PNG boot loader - loads and extracts boot components from PNG file
pub fn load_png_boot<P: AsRef<Path>>(config: &PngBootConfig) -> Result<PngBootPayload, Box<dyn Error>> {
    let path = config.png_path.as_str();
    
    if config.verbose {
        println!("Loading PNG boot image: {}", path);
    }

    // Load PNG file
    let png_data = load_png_file(path)?;
    
    // Validate PNG structure
    validate_png_structure(&png_data)?;
    
    // Extract metadata from alpha channel
    let metadata = extract_metadata(&png_data, config.verbose)?;
    
    // Extract hidden payloads from pixel data
    let (kernel, initramfs, boot_params) = extract_payloads(&png_data, &metadata, config.verbose)?;
    
    // Validate checksum if enabled
    let checksum_valid = if config.validate_checksum {
        validate_checksum(&png_data, &kernel, &initramfs, &boot_params)?
    } else {
        true
    };
    
    if !checksum_valid {
        return Err(Box::new(PngBootError::ChecksumFailed));
    }

    // Validate kernel
    if kernel.is_empty() {
        return Err(Box::new(PngBootError::KernelInvalid));
    }

    // Validate initramfs
    if initramfs.is_empty() {
        return Err(Box::new(PngBootError::InitramfsInvalid));
    }
    
    if config.verbose {
        println!("✓ PNG boot loaded successfully");
        println!("  Kernel: {} bytes", kernel.len());
        println!("  Initramfs: {} bytes", initramfs.len());
        println!("  Boot params: {} bytes", boot_params.len());
        println!("  Grid layout: {}", metadata.grid_layout);
    }

    Ok(PngBootPayload {
        kernel,
        initramfs,
        boot_params,
        metadata,
        checksum_valid,
    })
}

/// Load PNG file and decode pixel data
fn load_png_file<P: AsRef<Path>>(path: P) -> Result<PngData, Box<dyn Error>> {
    let mut file = File::open(path)?;
    let mut buffer = Vec::new();
    file.read_to_end(&mut buffer)?;
    
    // Decode PNG using png crate
    let decoder = png::Decoder::new(buffer.as_slice());
    let mut reader = decoder.read_info()?;
    
    let mut pixels = vec![0; reader.output_buffer_size()];
    reader.next_frame(&mut pixels)?;
    
    let info = reader.info();
    
    Ok(PngData {
        width: info.width,
        height: info.height,
        pixels,
        bit_depth: info.bit_depth,
        color_type: info.color_type,
    })
}

/// PNG pixel data structure
#[derive(Debug)]
struct PngData {
    width: u32,
    height: u32,
    pixels: Vec<u8>,
    bit_depth: png::BitDepth,
    color_type: png::ColorType,
}

/// Validate PNG has required structure
fn validate_png_structure(png_data: &PngData) -> Result<(), Box<dyn Error>> {
    // Must be RGBA format (32 bits per pixel)
    if png_data.pixels.len() != (png_data.width * png_data.height * 4) as usize {
        return Err(Box::new(PngBootError::InvalidPngFile(
            format!("Expected RGBA format, got {} bytes for {}x{} image",
                   png_data.pixels.len(), png_data.width, png_data.height)
        )));
    }
    
    // Standard image size (512x512 as per spec)
    if png_data.width != 512 || png_data.height != 512 {
        return Err(Box::new(PngBootError::InvalidPngFile(
            format!("Expected 512x512 image, got {}x{}", png_data.width, png_data.height)
        )));
    }
    
    Ok(())
}

/// Extract metadata from alpha channel
fn extract_metadata(png_data: &PngData, verbose: bool) -> Result<PngMetadata, Box<dyn Error>> {
    // Alpha channel is at byte offset 3 in each pixel (RGBA)
    let alpha_data: Vec<u8> = png_data.pixels.iter()
        .enumerate()
        .filter(|(i, _)| i % 4 == 3)  // Alpha channel
        .map(|(_, &b)| b)
        .collect();
    
    // Grid layout from first 64 alpha bytes
    let grid_layout = String::from_utf8_lossy(&alpha_data[0..64])
        .trim_end_matches('\0')
        .to_string();
    
    // Hypervisor settings from next 64 alpha bytes
    let hypervisor_settings = String::from_utf8_lossy(&alpha_data[64..128])
        .trim_end_matches('\0')
        .to_string();
    
    if verbose {
        println!("✓ Metadata extracted:");
        println!("  Grid layout: {}", grid_layout);
        println!("  Hypervisor: {}", hypervisor_settings);
    }
    
    Ok(PngMetadata {
        width: png_data.width,
        height: png_data.height,
        grid_layout,
        hypervisor_settings,
    })
}

/// Extract hidden payloads from pixel high bits
fn extract_payloads(
    png_data: &PngData,
    metadata: &PngMetadata,
    verbose: bool
) -> Result<(Vec<u8>, Vec<u8>, Vec<u8>), Box<dyn Error>> {
    // Extract high bits from R, G, B channels (rows 0-511)
    let mut kernel_data = Vec::new();
    let mut initramfs_data = Vec::new();
    let mut boot_params_data = Vec::new();
    
    // Each pixel is 4 bytes: R, G, B, A
    for y in 0..512 {
        for x in 0..512 {
            let pixel_offset = ((y * 512 + x) * 4) as usize;
            
            // R channel high bits → kernel
            let r_high = png_data.pixels[pixel_offset] >> 4;
            kernel_data.push(r_high);
            
            // G channel high bits → initramfs
            let g_high = png_data.pixels[pixel_offset + 1] >> 4;
            initramfs_data.push(g_high);
            
            // B channel high bits → boot params
            let b_high = png_data.pixels[pixel_offset + 2] >> 4;
            boot_params_data.push(b_high);
        }
    }
    
    if verbose {
        println!("✓ Payloads extracted:");
        println!("  Kernel data: {} bytes", kernel_data.len());
        println!("  Initramfs data: {} bytes", initramfs_data.len());
        println!("  Boot params data: {} bytes", boot_params_data.len());
    }
    
    Ok((kernel_data, initramfs_data, boot_params_data))
}

/// Validate checksum from alpha channel
fn validate_checksum(
    png_data: &PngData,
    kernel: &[u8],
    initramfs: &[u8],
    boot_params: &[u8]
) -> Result<bool, Box<dyn Error>> {
    // Checksum is in alpha channel of row 511 (last row)
    // First pixel of row 511: alpha byte
    let checksum_offset = ((511 * 512 + 0) * 4 + 3) as usize;
    let expected_checksum = png_data.pixels[checksum_offset];
    
    // Compute checksum of all payloads
    let combined: Vec<u8> = kernel.iter()
        .chain(initramfs.iter())
        .chain(boot_params.iter())
        .cloned()
        .collect();
    
    let computed_checksum = simple_checksum(&combined);
    
    let valid = computed_checksum == expected_checksum;
    
    if valid {
        println!("✓ Checksum validated: 0x{:02x}", computed_checksum);
    } else {
        eprintln!("✗ Checksum mismatch: expected 0x{:02x}, computed 0x{:02x}",
                 expected_checksum, computed_checksum);
    }
    
    Ok(valid)
}

/// Simple checksum algorithm
fn simple_checksum(data: &[u8]) -> u8 {
    data.iter().fold(0u8, |acc, &b| acc.wrapping_add(b))
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;
    
    #[test]
    fn test_simple_checksum() {
        let data = vec![1, 2, 3, 4, 5];
        let sum = simple_checksum(&data);
        assert_eq!(sum, 15); // 1+2+3+4+5 = 15
    }
    
    #[test]
    fn test_config_default() {
        let config = PngBootConfig::default();
        assert_eq!(config.png_path, "system.png");
        assert!(config.validate_checksum);
        assert!(!config.verbose);
    }
    
    #[test]
    fn test_metadata_creation() {
        let metadata = PngMetadata {
            width: 512,
            height: 512,
            grid_layout: "128x256".to_string(),
            hypervisor_settings: "enabled".to_string(),
        };
        
        assert_eq!(metadata.width, 512);
        assert_eq!(metadata.height, 512);
        assert_eq!(metadata.grid_layout, "128x256");
    }
}