// Substrate - The GPU RAM Texture
//
// The substrate IS memory. A 4096x4096 RGBA8 texture on the GPU.
// Each pixel is one 32-bit word. Instructions live here. Data lives here.
// The compute shader reads from here and writes back here.
//
// The CPU can poke pixels in before execution (bootstrap).
// The CPU can peek pixels after execution (verification).
// During execution, only the GPU touches this texture.

use crate::hilbert;
use std::sync::{Arc, Mutex};

pub const TEXTURE_SIZE: u32 = 4096;
pub const TEXTURE_PIXELS: u32 = TEXTURE_SIZE * TEXTURE_SIZE; // 16M pixels = 64MB
pub const TEXTURE_BYTES: u64 = (TEXTURE_PIXELS as u64) * 4;

/// CPU-side shadow of the GPU texture.
/// Used for bootstrap (writing programs) and verification (reading results).
pub struct Substrate {
    /// Shadow RAM: flat RGBA8 data, row-major (not Hilbert-ordered).
    /// Pixel at (x,y) is at offset (y * 4096 + x) * 4.
    shadow: Arc<Mutex<Vec<u8>>>,
}

impl Substrate {
    /// Create a blank substrate (all zeros)
    pub fn new() -> Self {
        let shadow = vec![0u8; (TEXTURE_PIXELS as usize) * 4];
        Self {
            shadow: Arc::new(Mutex::new(shadow)),
        }
    }

    /// Get a clone of the shadow RAM for GPU upload
    pub fn shadow_clone(&self) -> Vec<u8> {
        self.shadow.lock().unwrap().clone()
    }

    /// Get a reference to the Arc<Mutex<Vec<u8>>>
    pub fn shadow_arc(&self) -> Arc<Mutex<Vec<u8>>> {
        Arc::clone(&self.shadow)
    }

    /// Write a 32-bit value at a Hilbert address (for bootstrap).
    /// This is `poke_substrate_single` from the original.
    pub fn poke(&self, addr: u32, value: u32) {
        let (x, y) = hilbert::d2xy(addr);
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        let mut shadow = self.shadow.lock().unwrap();
        let bytes = value.to_le_bytes();
        shadow[offset..offset + 4].copy_from_slice(&bytes);
    }

    /// Read a 32-bit value from a Hilbert address (for verification).
    /// This is `peek_substrate_single` from the original.
    pub fn peek(&self, addr: u32) -> u32 {
        let (x, y) = hilbert::d2xy(addr);
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        let shadow = self.shadow.lock().unwrap();
        let mut bytes = [0u8; 4];
        bytes.copy_from_slice(&shadow[offset..offset + 4]);
        u32::from_le_bytes(bytes)
    }

    /// Write an entire program starting at a given Hilbert address.
    pub fn load_program(&self, start_addr: u32, pixels: &[u32]) {
        for (i, &pixel) in pixels.iter().enumerate() {
            self.poke(start_addr + i as u32, pixel);
        }
    }

    /// Verify that a range of pixels matches expected values.
    /// Returns (matched_count, total_count).
    pub fn verify(&self, start_addr: u32, expected: &[u32]) -> (usize, usize) {
        let mut matched = 0;
        for (i, &exp) in expected.iter().enumerate() {
            let got = self.peek(start_addr + i as u32);
            if got == exp {
                matched += 1;
            } else {
                eprintln!(
                    "  MISMATCH addr {}: expected 0x{:08X}, got 0x{:08X}",
                    start_addr + i as u32,
                    exp,
                    got
                );
            }
        }
        (matched, expected.len())
    }

    /// Update shadow from raw row-major GPU data (after sync_gpu_to_shadow)
    pub fn update_from_gpu(&self, data: &[u8]) {
        let mut shadow = self.shadow.lock().unwrap();
        shadow.copy_from_slice(data);
    }

    /// Render a region of the substrate as a colored PNG for visual inspection.
    /// Each pixel colored by opcode: NOP=black, LDI=blue, LOAD=green, etc.
    pub fn render_png(&self, width: u32, height: u32, start_addr: u32, path: &str) {
        use image::{ImageBuffer, Rgb};

        let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> =
            ImageBuffer::new(width, height);

        let opcode_color = |op: u8| -> Rgb<u8> {
            match op {
                0 => Rgb([0, 0, 0]),         // NOP - black
                1 => Rgb([0, 80, 255]),       // LDI - blue
                2 => Rgb([0, 200, 200]),      // MOV - cyan
                3 => Rgb([0, 200, 0]),        // LOAD - green
                4 => Rgb([200, 200, 0]),      // STORE - yellow
                5 => Rgb([200, 100, 0]),      // ADD - orange
                6 => Rgb([200, 0, 100]),      // SUB - magenta
                10 => Rgb([255, 0, 0]),       // BRANCH - red
                13 => Rgb([255, 255, 255]),   // HALT - white
                _ => Rgb([80, 80, 80]),       // unknown - gray
            }
        };

        for y in 0..height {
            for x in 0..width {
                let addr = start_addr + y * width + x;
                let value = self.peek(addr);
                let opcode = (value & 0xFF) as u8;
                img.put_pixel(x, y, opcode_color(opcode));
            }
        }

        if let Err(e) = img.save(path) {
            eprintln!("Failed to save substrate PNG: {e}");
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn poke_peek_roundtrip() {
        let s = Substrate::new();
        s.poke(0, 0xDEADBEEF);
        s.poke(100, 0x12345678);
        s.poke(1_000_000, 0x00000001);

        assert_eq!(s.peek(0), 0xDEADBEEF);
        assert_eq!(s.peek(100), 0x12345678);
        assert_eq!(s.peek(1_000_000), 0x00000001);
    }

    #[test]
    fn load_and_verify_program() {
        let s = Substrate::new();
        let pixels = vec![0x01, 0x02, 0x03, 0x04];
        s.load_program(0, &pixels);
        let (matched, total) = s.verify(0, &pixels);
        assert_eq!(matched, total);
    }
}
