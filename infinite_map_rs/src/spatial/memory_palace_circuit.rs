use std::path::Path;
use std::time::{SystemTime, UNIX_EPOCH};
use image::{ImageBuffer, Rgba, RgbaImage};
use serde::{Deserialize, Serialize};

use crate::geoasm_materializer::CellState;

#[derive(Debug)]
pub enum MemoryPalaceError {
    Io(std::io::Error),
    Image(image::ImageError),
    InvalidSize,
    MetadataMissing,
    SerializationError(serde_json::Error),
}

impl From<std::io::Error> for MemoryPalaceError {
    fn from(err: std::io::Error) -> Self { MemoryPalaceError::Io(err) }
}
impl From<image::ImageError> for MemoryPalaceError {
    fn from(err: image::ImageError) -> Self { MemoryPalaceError::Image(err) }
}
impl From<serde_json::Error> for MemoryPalaceError {
    fn from(err: serde_json::Error) -> Self { MemoryPalaceError::SerializationError(err) }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CircuitMetadata {
    pub variant_id: usize,
    pub fitness: f32,
    pub generation: usize,
    pub timestamp: u64,
    pub width: usize,
    pub height: usize,
}

pub struct CircuitEncoder;
impl CircuitEncoder {
    pub fn encode_to_palace(
        circuit: &[CellState],
        metadata: &CircuitMetadata,
        output_path: &Path,
    ) -> Result<(), MemoryPalaceError> {
        // Convert circuit to raw bytes (1 CellState = 16 bytes)
        let bytes: &[u8] = bytemuck::cast_slice(circuit);
        
        // 16 bytes = 4 RGBA pixels. Total pixels = circuit.len() * 4.
        let total_pixels = circuit.len() * 4;
        let img_side = (total_pixels as f64).sqrt().ceil() as u32;
        
        let mut img: RgbaImage = ImageBuffer::new(img_side, img_side);
        
        // Map bytes to Hilbert coordinates or just linear 2D for now
        // A robust Phase 22 implementation will use Hilbert 2D mapping
        let mut byte_idx = 0;
        for y in 0..img_side {
            for x in 0..img_side {
                if byte_idx < bytes.len() {
                    let r = bytes[byte_idx];
                    let g = bytes[byte_idx + 1];
                    let b = bytes[byte_idx + 2];
                    let a = bytes[byte_idx + 3];
                    img.put_pixel(x, y, Rgba([r, g, b, a]));
                    byte_idx += 4;
                } else {
                    img.put_pixel(x, y, Rgba([0, 0, 0, 0]));
                }
            }
        }
        
        img.save(output_path).map_err(MemoryPalaceError::Image)?;
        
        // Write companion metadata JSON (Phase 20.x PixelRTS v2 standard)
        let meta_path = output_path.with_extension("meta.json");
        let meta_json = serde_json::to_string_pretty(metadata).map_err(MemoryPalaceError::SerializationError)?;
        std::fs::write(&meta_path, meta_json).map_err(MemoryPalaceError::Io)?;
        
        Ok(())
    }
}

impl CircuitEncoder {
    pub fn decode_from_palace(
        input_path: &Path,
    ) -> Result<(Vec<CellState>, CircuitMetadata), MemoryPalaceError> {
        // Load image
        let img = image::open(input_path).map_err(MemoryPalaceError::Image)?.to_rgba8();
        let mut bytes = Vec::with_capacity((img.width() * img.height() * 4) as usize);
        
        for pixel in img.pixels() {
            bytes.extend_from_slice(&pixel.0);
        }
        
        // Convert back to CellState
        let cells: &[CellState] = bytemuck::cast_slice(&bytes);
        
        // Load companion metadata
        let meta_path = input_path.with_extension("meta.json");
        let meta_json = std::fs::read_to_string(&meta_path).map_err(MemoryPalaceError::Io)?;
        let metadata: CircuitMetadata = serde_json::from_str(&meta_json).map_err(MemoryPalaceError::SerializationError)?;
        
        // Truncate to exact grid size
        let total_cells = metadata.width * metadata.height;
        let mut final_cells = cells.to_vec();
        final_cells.truncate(total_cells);
        
        Ok((final_cells, metadata))
    }
}
