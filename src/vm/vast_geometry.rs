//! vast_geometry.rs -- Geometry definitions for the Vast Substrate
//!
//! Provides coordinate transformations and spatial indexing constants
//! for scaling PixelFS to terabyte-scale visual storage.

use crate::vm::hilbert;

/// Order of the global Hilbert curve for chunk addressing.
/// Order 16 = 65536 x 65536 chunks.
pub const GLOBAL_HILBERT_ORDER: u32 = 16;

/// Pixels per chunk edge.
pub const CHUNK_SIZE: u32 = 64;

/// Total addressable world size in chunks.
pub const WORLD_CHUNKS_EDGE: u32 = 1 << GLOBAL_HILBERT_ORDER;

/// Total addressable world size in pixels.
pub const WORLD_PIXELS_EDGE: u64 = (WORLD_CHUNKS_EDGE as u64) * (CHUNK_SIZE as u64);

/// Address of a pixel in the vast world.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub struct VastAddr {
    pub x: i64,
    pub y: i64,
}

impl VastAddr {
    pub fn new(x: i64, y: i64) -> Self {
        Self { x, y }
    }

    /// Convert to a global 1D Hilbert index.
    pub fn to_hilbert_index(&self) -> u64 {
        // Offset to positive space for Hilbert curve
        let ux = (self.x + (WORLD_PIXELS_EDGE as i64 / 2)) as u64;
        let uy = (self.y + (WORLD_PIXELS_EDGE as i64 / 2)) as u64;
        hilbert::xy2d(WORLD_PIXELS_EDGE, ux, uy)
    }

    /// Convert from a global 1D Hilbert index.
    pub fn from_hilbert_index(d: u64) -> Self {
        let (ux, uy) = hilbert::d2xy(WORLD_PIXELS_EDGE, d);
        let x = ux as i64 - (WORLD_PIXELS_EDGE as i64 / 2);
        let y = uy as i64 - (WORLD_PIXELS_EDGE as i64 / 2);
        Self { x, y }
    }
}

/// A block address (64x64 chunk).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub struct ChunkAddr {
    pub cx: i32,
    pub cy: i32,
}

impl ChunkAddr {
    pub fn new(cx: i32, cy: i32) -> Self {
        Self { cx, cy }
    }

    /// Convert to a global Hilbert chunk index.
    pub fn to_global_index(&self) -> u64 {
        let ux = (self.cx + (WORLD_CHUNKS_EDGE as i32 / 2)) as u64;
        let uy = (self.cy + (WORLD_CHUNKS_EDGE as i32 / 2)) as u64;
        hilbert::xy2d(WORLD_CHUNKS_EDGE as u64, ux, uy)
    }
}
