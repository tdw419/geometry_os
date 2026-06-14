// encoding.rs -- Binary encoding utilities for Memory Palace
// Phase 203+: Binary Memory Palace Extension

use std::collections::HashMap;
use std::fmt;

use serde::{Deserialize, Serialize};

#[derive(Debug)]
pub enum EncodingError {
    InvalidHex(String),
    InvalidBase64(String),
    InvalidPixelEncoding(String),
    ChecksumMismatch { expected: String, actual: String },
    UnsupportedEncoding(String),
}

impl fmt::Display for EncodingError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            EncodingError::InvalidHex(s) => write!(f, "Invalid hex string: {}", s),
            EncodingError::InvalidBase64(s) => write!(f, "Invalid base64 string: {}", s),
            EncodingError::InvalidPixelEncoding(s) => write!(f, "Invalid pixel encoding: {}", s),
            EncodingError::ChecksumMismatch { expected, actual } => {
                write!(
                    f,
                    "Checksum mismatch: expected {}, got {}",
                    expected, actual
                )
            },
            EncodingError::UnsupportedEncoding(s) => write!(f, "Encoding not supported: {}", s),
        }
    }
}

impl std::error::Error for EncodingError {}

/// Binary metadata for Memory Palace storage
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BinaryMetadata {
    /// Format type: "elf", "bios_rom", "disk_image", "raw", "pixelpack"
    pub format: String,

    /// Encoding: "base64", "hex", "pixels", "raw"
    pub encoding: String,

    /// Binary payload (base64 or hex encoded for JSON safety)
    pub data: String,

    /// Optional metadata
    #[serde(skip_serializing_if = "Option::is_none")]
    pub entry_point: Option<String>, // e.g., "0x80000000"
    #[serde(skip_serializing_if = "Option::is_none")]
    pub architecture: Option<String>, // "x86_64", "riscv64", "arm"
    pub size_bytes: u64,
    pub checksum: String, // FNV-1a hash as hex
    #[serde(skip_serializing_if = "Option::is_none")]
    pub data_reference: Option<String>, // For pixel encoding: "coordinate_range:0x10000-0x1FFFF"
}

impl BinaryMetadata {
    /// Load binary from file with specified format and encoding
    pub fn from_file(
        path: &std::path::Path,
        format: &str,
        encoding: &str,
    ) -> Result<Self, EncodingError> {
        let binary_data = std::fs::read(path)
            .map_err(|e| EncodingError::InvalidHex(format!("Failed to read file: {}", e)))?;

        let data = match encoding {
            "base64" => binary_to_base64(&binary_data),
            "hex" => binary_to_hex(&binary_data),
            _ => return Err(EncodingError::UnsupportedEncoding(encoding.to_string())),
        };

        let checksum = fnv_hash(&binary_data);

        Ok(Self {
            format: format.to_string(),
            encoding: encoding.to_string(),
            data,
            entry_point: None,
            architecture: None,
            size_bytes: binary_data.len() as u64,
            checksum,
            data_reference: None,
        })
    }

    /// Convert to binary data
    pub fn to_binary(&self) -> Result<Vec<u8>, EncodingError> {
        let data = match self.encoding.as_str() {
            "base64" => base64_to_binary(&self.data)?,
            "hex" => hex_to_binary(&self.data)?,
            encoding => return Err(EncodingError::UnsupportedEncoding(encoding.to_string())),
        };

        // Verify checksum
        let checksum = fnv_hash(&data);
        if checksum != self.checksum {
            return Err(EncodingError::ChecksumMismatch {
                expected: self.checksum.clone(),
                actual: checksum,
            });
        }

        Ok(data)
    }

    /// Inject binary directly to RAM at base address
    pub fn inject_to_ram(&self, ram: &mut Vec<u32>, base_addr: usize) -> Result<(), EncodingError> {
        let binary = self.to_binary()?;

        // Write 32-bit words (little-endian)
        for (i, chunk) in binary.chunks(4).enumerate() {
            if base_addr + i >= ram.len() {
                break; // RAM overflow - silently truncate
            }

            let word = u32::from_le_bytes({
                let mut bytes = [0u8; 4];
                bytes[..chunk.len()].copy_from_slice(chunk);
                bytes
            });

            ram[base_addr + i] = word;
        }

        Ok(())
    }

    /// Convert to different encoding
    pub fn convert_encoding(&mut self, to_encoding: &str) -> Result<(), EncodingError> {
        let binary = self.to_binary()?;

        self.data = match to_encoding {
            "base64" => binary_to_base64(&binary),
            "hex" => binary_to_hex(&binary),
            encoding => return Err(EncodingError::UnsupportedEncoding(encoding.to_string())),
        };

        self.encoding = to_encoding.to_string();
        Ok(())
    }

    /// Create from binary pixels (for Memory Palace storage)
    pub fn from_pixels(pixels: Vec<u32>, format: &str) -> Result<Self, EncodingError> {
        let binary = binary_pixels_to_binary(&pixels);
        let checksum = fnv_hash(&binary);

        // Store as hex string in JSON for safety
        let hex_data = binary_to_hex(&binary);

        Ok(Self {
            format: format.to_string(),
            encoding: "binary_pixels".to_string(),
            data: hex_data,
            entry_point: None,
            architecture: None,
            size_bytes: binary.len() as u64,
            checksum,
            data_reference: None,
        })
    }

    /// Get as binary pixels (for Memory Palace visualization)
    pub fn to_pixels(&self) -> Result<Vec<u32>, EncodingError> {
        let binary = self.to_binary()?;
        Ok(binary_to_binary_pixels(&binary))
    }

    /// Get as hex string (for inspection)
    pub fn to_hex_string(&self) -> Result<String, EncodingError> {
        let binary = self.to_binary()?;
        Ok(binary_to_hex(&binary))
    }

    /// Get as base64 string (for inspection)
    pub fn to_base64_string(&self) -> Result<String, EncodingError> {
        let binary = self.to_binary()?;
        Ok(binary_to_base64(&binary))
    }
}

/// Hex to binary conversion
pub fn hex_to_binary(hex: &str) -> Result<Vec<u8>, EncodingError> {
    let hex = hex.trim();
    if hex.len() % 2 != 0 {
        return Err(EncodingError::InvalidHex("Odd length".to_string()));
    }

    let mut binary = Vec::with_capacity(hex.len() / 2);
    for i in (0..hex.len()).step_by(2) {
        let byte_str = &hex[i..i + 2];
        let byte = u8::from_str_radix(byte_str, 16)
            .map_err(|_| EncodingError::InvalidHex(format!("Invalid byte: {}", byte_str)))?;
        binary.push(byte);
    }

    Ok(binary)
}

/// Binary to hex conversion
pub fn binary_to_hex(data: &[u8]) -> String {
    data.iter().map(|b| format!("{:02x}", b)).collect()
}

/// Base64 to binary conversion
pub fn base64_to_binary(b64: &str) -> Result<Vec<u8>, EncodingError> {
    use base64::{engine::general_purpose::STANDARD, Engine as _};

    STANDARD
        .decode(b64.trim())
        .map_err(|e| EncodingError::InvalidBase64(format!("{}", e)))
}

/// Binary to base64 conversion
pub fn binary_to_base64(data: &[u8]) -> String {
    use base64::{engine::general_purpose::STANDARD, Engine as _};

    STANDARD.encode(data)
}

/// Binary to pixel conversion (via pixelpack)
pub fn binary_to_pixels(data: &[u8]) -> Result<Vec<u32>, EncodingError> {
    // Encode as PNG bytes then convert to RGBA pixels
    crate::pixel::encode_pixelpack_png(data)
        .map_err(|e| EncodingError::InvalidPixelEncoding(format!("{}", e)))
        .map(|png_bytes| {
            // Simple conversion: pack PNG bytes into u32 words (little-endian)
            png_bytes
                .chunks(4)
                .map(|chunk| {
                    let mut word = 0u32;
                    for (i, &byte) in chunk.iter().enumerate() {
                        word |= (byte as u32) << (i * 8);
                    }
                    word
                })
                .collect()
        })
}

/// Pixel to binary conversion
pub fn pixels_to_binary(pixels: &[u32]) -> Result<Vec<u8>, EncodingError> {
    // Convert u32 pixels back to bytes (little-endian)
    let mut bytes = Vec::new();
    for &pixel in pixels {
        for i in 0..4 {
            bytes.push((pixel >> (i * 8)) as u8);
        }
    }

    // Decode from PNG
    crate::pixel::decode_pixelpack_png(&bytes)
        .map_err(|e| EncodingError::InvalidPixelEncoding(format!("{}", e)))
}

/// Binary to binary pixel encoding (0 = black, 1 = white)
/// Each pixel stores 1 bit of data
/// Returns vec of u32 RGBA pixels (0xFF000000 = black, 0xFFFFFFFF = white)
pub fn binary_to_binary_pixels(data: &[u8]) -> Vec<u32> {
    let mut pixels = Vec::with_capacity(data.len() * 8);

    for byte in data {
        for bit_idx in (0..8).rev() {
            let bit = (byte >> bit_idx) & 1;
            let pixel = if bit == 1 {
                0xFFFFFFFF // White = binary 1
            } else {
                0xFF000000 // Black = binary 0
            };
            pixels.push(pixel);
        }
    }

    pixels
}

/// Binary pixel to binary conversion
/// Takes vec of u32 RGBA pixels and returns binary data
pub fn binary_pixels_to_binary(pixels: &[u32]) -> Vec<u8> {
    let mut bytes = Vec::new();
    let mut current_byte = 0u8;
    let mut bit_count = 0;

    for &pixel in pixels {
        let bit = if pixel == 0xFFFFFFFF { 1 } else { 0 };
        current_byte = (current_byte << 1) | bit;
        bit_count += 1;

        if bit_count == 8 {
            bytes.push(current_byte);
            current_byte = 0;
            bit_count = 0;
        }
    }

    // Handle remaining bits if any
    if bit_count > 0 {
        current_byte <<= (8 - bit_count);
        bytes.push(current_byte);
    }

    bytes
}

/// FNV-1a hash (32-bit) for checksum
fn fnv_hash(data: &[u8]) -> String {
    let mut hash: u32 = 0x811c9dc5;

    for &byte in data {
        hash ^= byte as u32;
        hash = hash.wrapping_mul(0x01000193);
    }

    format!("{:08x}", hash)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hex_roundtrip() {
        let original = vec![0xDE, 0xAD, 0xBE, 0xEF, 0x00, 0xFF];
        let hex = binary_to_hex(&original);
        let decoded = hex_to_binary(&hex).unwrap();
        assert_eq!(original, decoded);
    }

    #[test]
    fn test_base64_roundtrip() {
        let original = vec![0xDE, 0xAD, 0xBE, 0xEF, 0x00, 0xFF];
        let b64 = binary_to_base64(&original);
        let decoded = base64_to_binary(&b64).unwrap();
        assert_eq!(original, decoded);
    }

    #[test]
    fn test_binary_metadata_from_file() {
        // Create a temporary file
        let temp_file = std::env::temp_dir().join("test_binary.bin");
        std::fs::write(&temp_file, vec![0xDE, 0xAD, 0xBE, 0xEF]).unwrap();

        let metadata = BinaryMetadata::from_file(&temp_file, "elf", "base64").unwrap();
        assert_eq!(metadata.format, "elf");
        assert_eq!(metadata.encoding, "base64");
        assert_eq!(metadata.size_bytes, 4);

        // Cleanup
        std::fs::remove_file(&temp_file).ok();
    }

    #[test]
    fn test_binary_metadata_roundtrip() {
        let original = vec![0xDE, 0xAD, 0xBE, 0xEF, 0x00, 0xFF, 0x12, 0x34];
        let metadata = BinaryMetadata {
            format: "raw".to_string(),
            encoding: "hex".to_string(),
            data: binary_to_hex(&original),
            entry_point: None,
            architecture: None,
            size_bytes: original.len() as u64,
            checksum: fnv_hash(&original),
            data_reference: None,
        };

        let decoded = metadata.to_binary().unwrap();
        assert_eq!(original, decoded);
    }

    #[test]
    fn test_convert_encoding() {
        let mut metadata = BinaryMetadata {
            format: "raw".to_string(),
            encoding: "base64".to_string(),
            data: binary_to_base64(&[0xDE, 0xAD, 0xBE, 0xEF]),
            entry_point: None,
            architecture: None,
            size_bytes: 4,
            checksum: fnv_hash(&[0xDE, 0xAD, 0xBE, 0xEF]),
            data_reference: None,
        };

        metadata.convert_encoding("hex").unwrap();
        assert_eq!(metadata.encoding, "hex");
        assert_eq!(metadata.data, "deadbeef");

        let decoded = metadata.to_binary().unwrap();
        assert_eq!(decoded, vec![0xDE, 0xAD, 0xBE, 0xEF]);
    }

    #[test]
    fn test_inject_to_ram() {
        let mut ram = vec![0u32; 1024];
        let metadata = BinaryMetadata {
            format: "raw".to_string(),
            encoding: "hex".to_string(),
            data: "deadbeef12345678".to_string(),
            entry_point: None,
            architecture: None,
            size_bytes: 8,
            checksum: fnv_hash(&[0xDE, 0xAD, 0xBE, 0xEF, 0x12, 0x34, 0x56, 0x78]),
            data_reference: None,
        };

        metadata.inject_to_ram(&mut ram, 0x100).unwrap();
        assert_eq!(ram[0x100], 0xEFBEADDE); // little-endian
        assert_eq!(ram[0x101], 0x78563412);
    }

    #[test]
    fn test_checksum_validation() {
        let mut metadata = BinaryMetadata {
            format: "elf".to_string(),
            encoding: "hex".to_string(),
            data: "deadbeef".to_string(),
            entry_point: None,
            architecture: None,
            size_bytes: 4,
            checksum: fnv_hash(&[0xDE, 0xAD, 0xBE, 0xEF]),
            data_reference: None,
        };

        // Should succeed
        let result = metadata.to_binary();
        assert!(result.is_ok());

        // Corrupt checksum
        metadata.checksum = "00000000".to_string();
        let result = metadata.to_binary();
        assert!(result.is_err());
    }

    #[test]
    fn test_binary_pixel_encoding() {
        // Test with simple binary data
        let data = vec![0b10101010, 0b01010101]; // AA 55 in hex
        let pixels = binary_to_binary_pixels(&data);

        // Each byte = 8 pixels, so 2 bytes = 16 pixels
        assert_eq!(pixels.len(), 16);

        // Check first byte (10101010)
        // MSB first: 1, 0, 1, 0, 1, 0, 1, 0
        assert_eq!(pixels[0], 0xFFFFFFFF); // 1 = white
        assert_eq!(pixels[1], 0xFF000000); // 0 = black
        assert_eq!(pixels[2], 0xFFFFFFFF); // 1 = white
        assert_eq!(pixels[3], 0xFF000000); // 0 = black
        assert_eq!(pixels[4], 0xFFFFFFFF); // 1 = white
        assert_eq!(pixels[5], 0xFF000000); // 0 = black
        assert_eq!(pixels[6], 0xFFFFFFFF); // 1 = white
        assert_eq!(pixels[7], 0xFF000000); // 0 = black

        // Round-trip test
        let decoded = binary_pixels_to_binary(&pixels);
        assert_eq!(decoded, data);
    }

    #[test]
    fn test_binary_pixel_encoding_full_bytes() {
        // Test with all zeros
        let zeros = vec![0u8; 4];
        let pixels = binary_to_binary_pixels(&zeros);
        assert_eq!(pixels.len(), 32);
        assert!(pixels.iter().all(|&p| p == 0xFF000000));

        // Test with all ones
        let ones = vec![0xFFu8; 4];
        let pixels = binary_to_binary_pixels(&ones);
        assert_eq!(pixels.len(), 32);
        assert!(pixels.iter().all(|&p| p == 0xFFFFFFFF));

        // Round-trip
        let decoded = binary_pixels_to_binary(&pixels);
        assert_eq!(decoded, ones);
    }

    #[test]
    fn test_binary_pixel_partial_byte() {
        // Test with partial byte (less than 8 bits should be padded)
        let data = vec![0b10101010];
        let mut pixels = binary_to_binary_pixels(&data);

        // Add 4 more pixels (partial byte)
        pixels.push(0xFFFFFFFF); // 1
        pixels.push(0xFF000000); // 0
        pixels.push(0xFFFFFFFF); // 1
        pixels.push(0xFF000000); // 0

        // Should decode with padding
        let decoded = binary_pixels_to_binary(&pixels);
        // The partial byte should be padded to 8 bits: 1010 padded to 10100000 = A0
        assert_eq!(decoded.len(), 2);
        assert_eq!(decoded[0], 0b10101010);
        assert_eq!(decoded[1], 0b10100000); // padded
    }
}
