//! PNG Boot Kernel Extractor - Phase 12.4
//!
//! Extracts kernel payloads from PNG files with pixelpack encoding.
//! This is the core of the self-boot capability: kernels are embedded
//! in PNG images and extracted at boot time without external tools.
//!
//! PNG Format:
//! - Standard PNG with RGBA pixels
//! - Optional metadata: geo_boot=source|bytecode (stored as PNG text chunk)
//! - Pixelpack encoding: each RGBA pixel encodes one 32-bit word
//!   - R byte = bits 0-7 (least significant)
//!   - G byte = bits 8-15
//!   - B byte = bits 16-23
//!   - A byte = bits 24-31 (most significant)
//!
//! This format is self-describing and git-diffable.

use image::{DynamicImage, GenericImageView, ImageError};
use std::path::Path;
use thiserror::Error;

/// Errors that can occur during PNG kernel extraction
#[derive(Error, Debug)]
pub enum PngBootError {
    #[error("Failed to load PNG image: {0}")]
    ImageLoad(#[from] ImageError),

    #[error("Not a PNG file")]
    NotPng,

    #[error("Invalid PNG dimensions: {0}x{1} (must be square power-of-2)")]
    InvalidDimensions(u32, u32),

    #[error("PNG too small: {0}x{1} (minimum 128x128)")]
    TooSmall(u32, u32),

    #[error("Empty PNG (no data pixels)")]
    EmptyPng,

    #[error("Kernel extraction failed: {0}")]
    ExtractionFailed(String),
}

/// PNG boot metadata information
#[derive(Debug, Clone, PartialEq)]
pub enum PngBootType {
    /// Source code (assembly) that needs compilation
    Source,
    /// Pre-compiled bytecode (ready to run)
    Bytecode,
    /// Unknown or no metadata
    Unknown,
}

/// Result of PNG kernel extraction
#[derive(Debug, Clone)]
pub struct PngKernelExtracted {
    /// Raw kernel bytes
    pub kernel_data: Vec<u8>,
    /// Boot type from metadata
    pub boot_type: PngBootType,
    /// PNG dimensions
    pub width: u32,
    pub height: u32,
    /// Estimated kernel size in words
    pub word_count: usize,
}

/// PNG boot kernel extractor
///
/// Extracts kernel payloads from PNG files with pixelpack encoding.
/// This enables autonomous boot from PNG files without external tools.
pub struct PngBootExtractor;

impl PngBootExtractor {
    /// Extract kernel from PNG file
    ///
    /// # Arguments
    /// * `png_path` - Path to PNG file containing kernel
    ///
    /// # Returns
    /// `PngKernelExtracted` with kernel bytes and metadata
    ///
    /// # Example
    /// ```rust,no_run
    /// use std::path::Path;
    /// use infinite_map_rs::spatial::png_boot_extractor::PngBootExtractor;
    ///
    /// let result = PngBootExtractor::extract(Path::new("boot.png"))?;
    /// println!("Kernel: {} bytes, type: {:?}", result.kernel_data.len(), result.boot_type);
    /// ```
    pub fn extract(png_path: &Path) -> Result<PngKernelExtracted, PngBootError> {
        // Load PNG
        let img = image::open(png_path)?;

        // Validate PNG dimensions
        Self::validate_dimensions(&img)?;

        // Extract boot type from metadata (if available)
        let boot_type = Self::extract_boot_type(&img);

        // Decode kernel from pixelpack pixels
        let kernel_data = Self::decode_pixelpack(&img)?;

        let (width, height) = img.dimensions();
        let word_count = kernel_data.len() / 4;

        Ok(PngKernelExtracted {
            kernel_data,
            boot_type,
            width,
            height,
            word_count,
        })
    }

    /// Validate PNG dimensions for boot images
    ///
    /// Boot images must be:
    /// - Square (width == height)
    /// - Power-of-2 dimensions (e.g., 128, 256, 512)
    /// - At least 128x128 pixels
    fn validate_dimensions(img: &DynamicImage) -> Result<(), PngBootError> {
        let (width, height) = img.dimensions();

        // Check minimum size
        if width < 128 || height < 128 {
            return Err(PngBootError::TooSmall(width, height));
        }

        // Check square geometry
        if width != height {
            return Err(PngBootError::InvalidDimensions(width, height));
        }

        // Check power-of-2
        if !width.is_power_of_two() {
            return Err(PngBootError::InvalidDimensions(width, height));
        }

        Ok(())
    }

    /// Extract boot type from PNG metadata
    ///
    /// Reads geo_boot text chunk to determine if PNG contains:
    /// - Source code (needs compilation)
    /// - Bytecode (ready to run)
    /// - Unknown/no metadata
    fn extract_boot_type(_img: &DynamicImage) -> PngBootType {
        // TODO: Read PNG text chunks with geo_boot metadata
        // The image crate doesn't expose text chunks directly
        // We would need to use png crate or manual PNG parsing
        // For now, default to bytecode (most common case)

        // Future implementation:
        // 1. Parse PNG chunks
        // 2. Find tEXt chunk with keyword "geo_boot"
        // 3. Parse value: "source" | "bytecode"
        // 4. Return appropriate type

        PngBootType::Unknown
    }

    /// Decode pixelpack encoding from RGBA pixels
    ///
    /// Pixelpack encoding:
    /// - Each RGBA pixel = one 32-bit word
    /// - R byte = bits 0-7 (least significant)
    /// - G byte = bits 8-15
    /// - B byte = bits 16-23
    /// - A byte = bits 24-31 (most significant)
    ///
    /// Pixels are read left-to-right, top-to-bottom (scanline order)
    ///
    /// # Arguments
    /// * `img` - PNG image with RGBA pixels
    ///
    /// # Returns
    /// Raw kernel bytes as Vec<u8>
    fn decode_pixelpack(img: &DynamicImage) -> Result<Vec<u8>, PngBootError> {
        let rgba_img = img.to_rgba8();
        let (width, height) = rgba_img.dimensions();

        if width == 0 || height == 0 {
            return Err(PngBootError::EmptyPng);
        }

        // Pre-allocate kernel data buffer (4 bytes per pixel)
        let mut kernel_data = Vec::with_capacity((width * height * 4) as usize);

        // Decode pixels in scanline order (left-to-right, top-to-bottom)
        for y in 0..height {
            for x in 0..width {
                let pixel = rgba_img.get_pixel(x, y);
                let rgba = pixel.0; // [R, G, B, A] bytes

                // Pack RGBA into u32 (little-endian byte order)
                // A (most significant) | B | G | R (least significant)
                let packed_word: u32 = ((rgba[3] as u32) << 24)
                    | ((rgba[2] as u32) << 16)
                    | ((rgba[1] as u32) << 8)
                    | (rgba[0] as u32);

                // Append to kernel data as little-endian bytes
                kernel_data.extend_from_slice(&packed_word.to_le_bytes());
            }
        }

        Ok(kernel_data)
    }

    /// Validate that extracted kernel looks valid
    ///
    /// Performs basic sanity checks:
    /// - Not empty
    /// - Size is multiple of 4 (word-aligned)
    /// - Check for ELF magic if applicable
    pub fn validate_kernel(kernel_data: &[u8]) -> Result<(), PngBootError> {
        if kernel_data.is_empty() {
            return Err(PngBootError::ExtractionFailed("Kernel data is empty".into()));
        }

        if kernel_data.len() % 4 != 0 {
            return Err(PngBootError::ExtractionFailed(
                format!("Kernel size {} not word-aligned", kernel_data.len())
            ));
        }

        // Check for ELF magic (common for RISC-V kernels)
        if kernel_data.len() >= 4 {
            let magic = &kernel_data[0..4];
            if magic == b"\x7fELF" {
                // Looks like ELF kernel - good sign
                return Ok(());
            }
        }

        // No ELF magic, but that's OK (could be raw binary)
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;
    use tempfile::NamedTempFile;

    /// Create a minimal valid PNG for testing
    fn create_test_png(width: u32, height: u32) -> NamedTempFile {
        let mut file = NamedTempFile::new().unwrap();

        // Create a simple PNG with solid color (for testing structure, not content)
        let img = image::RgbImage::from_pixel(width, height, image::Rgb([128, 128, 128]));
        img.write_to(file.as_file_mut(), image::ImageFormat::Png)
            .unwrap();

        file
    }

    #[test]
    fn test_png_boot_extractor_create() {
        // Test that we can create the extractor (it's a unit struct)
        let _extractor = PngBootExtractor;
    }

    #[test]
    fn test_validate_dimensions_valid() {
        let png = create_test_png(128, 128);
        let img = image::open(png.path()).unwrap();

        let result = PngBootExtractor::validate_dimensions(&img);
        assert!(result.is_ok());
    }

    #[test]
    fn test_validate_dimensions_too_small() {
        let png = create_test_png(64, 64);
        let img = image::open(png.path()).unwrap();

        let result = PngBootExtractor::validate_dimensions(&img);
        assert!(matches!(result, Err(PngBootError::TooSmall(_, _))));
    }

    #[test]
    fn test_validate_dimensions_not_square() {
        let png = create_test_png(128, 256);
        let img = image::open(png.path()).unwrap();

        let result = PngBootExtractor::validate_dimensions(&img);
        assert!(matches!(result, Err(PngBootError::InvalidDimensions(_, _))));
    }

    #[test]
    fn test_validate_dimensions_not_power_of_two() {
        let png = create_test_png(200, 200);
        let img = image::open(png.path()).unwrap();

        let result = PngBootExtractor::validate_dimensions(&img);
        assert!(matches!(result, Err(PngBootError::InvalidDimensions(_, _))));
    }

    #[test]
    fn test_extract_from_valid_png() {
        let png = create_test_png(128, 128);

        let result = PngBootExtractor::extract(png.path());
        assert!(result.is_ok());

        let extracted = result.unwrap();
        assert_eq!(extracted.width, 128);
        assert_eq!(extracted.height, 128);
        assert_eq!(extracted.word_count, 128 * 128); // One word per pixel
        assert!(extracted.kernel_data.len() > 0);
    }

    #[test]
    fn test_validate_kernel_empty() {
        let result = PngBootExtractor::validate_kernel(&[]);
        assert!(matches!(result, Err(PngBootError::ExtractionFailed(_))));
    }

    #[test]
    fn test_validate_kernel_not_aligned() {
        let data = vec![1u8, 2, 3]; // 3 bytes, not word-aligned
        let result = PngBootExtractor::validate_kernel(&data);
        assert!(matches!(result, Err(PngBootError::ExtractionFailed(_))));
    }

    #[test]
    fn test_validate_kernel_valid() {
        let data = vec![1u8, 2, 3, 4]; // 4 bytes, word-aligned
        let result = PngBootExtractor::validate_kernel(&data);
        assert!(result.is_ok());
    }

    #[test]
    fn test_validate_kernel_elf_magic() {
        let mut data = vec![0u8; 64];
        data[0..4].copy_from_slice(b"\x7fELF");

        let result = PngBootExtractor::validate_kernel(&data);
        assert!(result.is_ok());
    }
}