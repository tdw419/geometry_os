//! Geometric Programming Extractor for .rts.png Files
//!
//! Extracts "Geometric Programming" instructions from .rts.png files.
//! In Geometry OS, the screen is the hard drive, and pixels are the instructions.

use crate::hilbert::HilbertCurve;
use anyhow::Result;
use image::{DynamicImage, GenericImageView};

/// Extracts Geometric Programming instructions (RGBA pixels) from an image.
/// Each pixel represents a single instruction.
pub fn extract_geometric_from_rts(img: &DynamicImage) -> Result<Vec<[u8; 4]>> {
    let (width, height) = img.dimensions();
    let grid_size = width.min(height);

    if !grid_size.is_power_of_two() {
        anyhow::bail!("Grid size {} is not a power of two", grid_size);
    }

    let curve = HilbertCurve::new(grid_size);
    let rgba_img = img.to_rgba8();

    // For now, extract all pixels along the Hilbert curve
    let mut instructions = Vec::with_capacity((grid_size * grid_size) as usize);

    for d in 0..(grid_size * grid_size) as u64 {
        let (x, y) = curve.d2xy(d);
        let pixel = rgba_img.get_pixel(x, y);
        instructions.push([pixel[0], pixel[1], pixel[2], pixel[3]]);
    }

    // Trim trailing empty (all zero) instructions
    while let Some(last) = instructions.last() {
        if last[0] == 0 && last[1] == 0 && last[2] == 0 && last[3] == 0 {
            instructions.pop();
        } else {
            break;
        }
    }

    Ok(instructions)
}
