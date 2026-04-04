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

    /// Load the font atlas into the substrate at FONT_BASE.
    /// Required for the CHAR opcode to work on the GPU path.
    pub fn load_font_atlas(&self) {
        use crate::font_atlas;
        for ascii in 0..font_atlas::FONT_CHARS {
            let rows = font_atlas::get_char_rows(ascii as u8);
            for row in 0..8u32 {
                let addr = font_atlas::FONT_BASE + (ascii as u32) * 8 + row;
                self.poke(addr, rows[row as usize] as u32);
            }
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

        let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(width, height);

        let opcode_color = |op: u8| -> Rgb<u8> {
            match op {
                0 => Rgb([0, 0, 0]),        // NOP - black
                1 => Rgb([0, 80, 255]),     // LDI - blue
                2 => Rgb([0, 200, 200]),    // MOV - cyan
                3 => Rgb([0, 200, 0]),      // LOAD - green
                4 => Rgb([200, 200, 0]),    // STORE - yellow
                5 => Rgb([200, 100, 0]),    // ADD - orange
                6 => Rgb([200, 0, 100]),    // SUB - magenta
                10 => Rgb([255, 0, 0]),     // BRANCH - red
                13 => Rgb([255, 255, 255]), // HALT - white
                14 => Rgb([100, 255, 100]), // ENTRY - bright green
                _ => Rgb([80, 80, 80]),     // unknown - gray
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

    /// Render a Hilbert-curve visualization of an address range.
    ///
    /// Takes a range of Hilbert linear addresses (start_addr..start_addr+count),
    /// maps each to its (x,y) position on the 4096x4096 grid, and renders
    /// the actual 2D texture pixels. Nearby addresses cluster visually because
    /// the Hilbert curve preserves spatial locality.
    ///
    /// The output image is `img_size x img_size` pixels, centered on the
    /// region of interest. Each pixel is colored by opcode.
    pub fn render_hilbert_png(
        &self,
        start_addr: u32,
        count: u32,
        img_size: u32,
        path: &str,
    ) {
        use image::{GenericImage, ImageBuffer, Rgb};

        let opcode_color = |op: u8| -> Rgb<u8> {
            match op {
                0 => Rgb([10, 10, 10]),      // NOP - near-black
                1 => Rgb([0, 80, 255]),      // LDI - blue
                2 => Rgb([0, 200, 200]),     // MOV - cyan
                3 => Rgb([0, 200, 0]),       // LOAD - green
                4 => Rgb([200, 200, 0]),     // STORE - yellow
                5 => Rgb([200, 100, 0]),     // ADD - orange
                6 => Rgb([200, 0, 100]),     // SUB - magenta
                7 => Rgb([150, 80, 255]),    // MUL - purple
                8 => Rgb([80, 150, 255]),    // DIV - light blue
                9 => Rgb([255, 128, 0]),     // JMP - bright orange
                10 => Rgb([255, 0, 0]),      // BRANCH - red
                11 => Rgb([255, 200, 0]),    // CALL - gold
                12 => Rgb([200, 200, 200]),  // RET - silver
                13 => Rgb([255, 255, 255]),  // HALT - white
                14 => Rgb([100, 255, 100]),  // ENTRY - bright green
                _ => Rgb([80, 80, 80]),      // unknown - gray
            }
        };

        // Find bounding box of all Hilbert coordinates in the range
        let mut min_x = u32::MAX;
        let mut min_y = u32::MAX;
        let mut max_x = 0u32;
        let mut max_y = 0u32;

        for d in start_addr..start_addr + count {
            let (x, y) = hilbert::d2xy(d);
            min_x = min_x.min(x);
            min_y = min_y.min(y);
            max_x = max_x.max(x);
            max_y = max_y.max(y);
        }

        // Add padding
        let pad = 8u32;
        min_x = min_x.saturating_sub(pad);
        min_y = min_y.saturating_sub(pad);
        max_x = (max_x + pad).min(TEXTURE_SIZE - 1);
        max_y = (max_y + pad).min(TEXTURE_SIZE - 1);

        let region_w = max_x - min_x + 1;
        let region_h = max_y - min_y + 1;

        // Scale to fit img_size while preserving aspect ratio
        let scale = (img_size as f64 / region_w.max(region_h) as f64).min(1.0);
        let out_w = ((region_w as f64 * scale) as u32).max(1);
        let out_h = ((region_h as f64 * scale) as u32).max(1);

        let mut img: ImageBuffer<Rgb<u8>, Vec<u8>> = ImageBuffer::new(out_w, out_h);

        // Fill with dark background
        for pixel in img.pixels_mut() {
            *pixel = Rgb([5, 5, 15]);
        }

        // Render the entire visible region from the texture
        let shadow = self.shadow.lock().unwrap();
        for py in 0..region_h {
            for px in 0..region_w {
                let tx = min_x + px;
                let ty = min_y + py;
                if tx >= TEXTURE_SIZE || ty >= TEXTURE_SIZE {
                    continue;
                }
                let offset = ((ty * TEXTURE_SIZE + tx) * 4) as usize;
                let r = shadow[offset];
                let g = shadow[offset + 1];
                let b = shadow[offset + 2];
                let a = shadow[offset + 3];
                // Only color non-zero pixels (skip empty memory)
                if r == 0 && g == 0 && b == 0 && a == 0 {
                    continue;
                }
                let value = u32::from_le_bytes([r, g, b, a]);
                let opcode = (value & 0xFF) as u8;
                let color = opcode_color(opcode);
                let ox = (px as f64 * scale) as u32;
                let oy = (py as f64 * scale) as u32;
                if ox < out_w && oy < out_h {
                    img.put_pixel(ox, oy, color);
                }
            }
        }
        drop(shadow);

        if let Err(e) = img.save(path) {
            eprintln!("Failed to save Hilbert PNG: {e}");
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
