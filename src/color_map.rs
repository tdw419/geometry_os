// ═══════════════════════════════════════════════════════════════════════
// ASCII → PIXEL COLOR MAP MODULE
//
// Every ASCII character maps to a pixel whose blue channel equals the
// ASCII byte value, with red and green set to zero and alpha fully
// opaque:
//
//   char 'A' (0x41) → #000041 (R=0, G=0, B=0x41, A=255)
//
// The module also supports an optional palette-based remapping where
// the raw ASCII value acts as a palette index, allowing the display
// colour to differ from the identity colour.
//
// See docs/ASCII_PIXEL_COLOR_MAP.md for the full specification.
// ═══════════════════════════════════════════════════════════════════════

use crate::pixel::Pixel;

/// Default palette: identity mapping (each index maps to itself in the
/// blue channel). Index 0..=255 maps to Pixel { r: 0, g: 0, b: index, a: 255 }.
pub const DEFAULT_PALETTE: [Pixel; 256] = {
    let mut table = [Pixel {
        r: 0,
        g: 0,
        b: 0,
        a: 0,
    }; 256];
    let mut i: usize = 0;
    while i < 256 {
        table[i] = Pixel {
            r: 0,
            g: 0,
            b: i as u8,
            a: 255,
        };
        i += 1;
    }
    table
};

/// Spread palette: distributes values across RGB channels for visual
/// distinction.  Low values (0x00-0x3F) → red-dominant, mid (0x40-0x7F)
/// → green-dominant, high (0x80-0xFF) → blue-dominant.
pub fn spread_palette() -> [Pixel; 256] {
    let mut table = [Pixel::black(); 256];
    for i in 0u32..=255u32 {
        let (r, g, b) = if i <= 0x3F {
            // Red-dominant: scale i across 0..0x3F → 0..255
            let brightness = (i * 255 / 0x3F) as u8;
            (brightness, 0, 0)
        } else if i <= 0x7F {
            // Green-dominant: scale (i - 0x40) across 0..0x3F → 0..255
            let norm = i - 0x40;
            let brightness = (norm * 255 / 0x3F) as u8;
            (0, brightness, 0)
        } else {
            // Blue-dominant: scale (i - 0x80) across 0..0x7F → 0..255
            let norm = i - 0x80;
            let brightness = (norm * 255 / 0x7F) as u8;
            (0, 0, brightness)
        };
        table[i as usize] = Pixel::new(r, g, b, 255);
    }
    table
}

// ── Core lookup functions ─────────────────────────────────────────

/// Map an ASCII character (or any u8 byte) to its identity pixel.
///
/// The byte value is placed in the blue channel. Red and green are zero,
/// alpha is 255 (fully opaque).
///
/// Returns `None` for values > 127 when `ascii_only` is true.
/// When `ascii_only` is false, all u8 values 0..=255 are accepted.
pub fn char_to_pixel(byte: u8, ascii_only: bool) -> Option<Pixel> {
    if ascii_only && byte > 0x7F {
        return None;
    }
    Some(Pixel::new(0, 0, byte, 255))
}

/// Map a byte to a pixel using the default (identity) palette.
/// All 256 byte values are valid.
pub fn byte_to_pixel(byte: u8) -> Pixel {
    DEFAULT_PALETTE[byte as usize]
}

/// Map a byte to a pixel using a custom palette.
///
/// The byte is treated as an index into the 256-entry palette.
/// Returns the palette colour for that index.
pub fn byte_to_palette_pixel(byte: u8, palette: &[Pixel; 256]) -> Pixel {
    palette[byte as usize]
}

/// Look up a character's pixel using a palette.
///
/// Converts the character to its ASCII byte value, then indexes into
/// the palette. Returns `None` if the character is outside ASCII range
/// (code point > 127).
pub fn char_to_palette_pixel(ch: char, palette: &[Pixel; 256]) -> Option<Pixel> {
    let byte = ch as u32;
    if byte > 127 {
        return None;
    }
    Some(palette[byte as usize])
}

// ── Inverse lookup ────────────────────────────────────────────────

/// Inverse lookup: given a Pixel produced by the identity mapping,
/// recover the ASCII byte (blue channel value).
///
/// Returns `None` if the pixel does not match the identity mapping
/// pattern (non-zero red or green, or alpha ≠ 255).
pub fn pixel_to_char(pixel: Pixel) -> Option<u8> {
    if pixel.r != 0 || pixel.g != 0 || pixel.a != 255 {
        return None;
    }
    Some(pixel.b)
}

/// Inverse lookup for palette-based pixels.
///
/// Searches the palette for an exact match and returns the index (which
/// is the ASCII byte value). Returns `None` if no palette entry matches.
pub fn pixel_to_palette_index(pixel: Pixel, palette: &[Pixel; 256]) -> Option<u8> {
    for i in 0..256 {
        if palette[i] == pixel {
            return Some(i as u8);
        }
    }
    None
}

// ── Palette indexing helpers ──────────────────────────────────────

/// Build a greyscale palette where index i maps to brightness i.
/// Useful for visualising the full 0..255 range.
pub fn greyscale_palette() -> [Pixel; 256] {
    let mut table = [Pixel::black(); 256];
    for i in 0usize..=255 {
        table[i] = Pixel::new(i as u8, i as u8, i as u8, 255);
    }
    table
}

/// Build a palette from a closure that maps index → colour.
pub fn build_palette<F>(f: F) -> [Pixel; 256]
where
    F: Fn(u8) -> Pixel,
{
    let mut table = [Pixel::black(); 256];
    for i in 0u8..=255 {
        table[i as usize] = f(i);
    }
    table
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_nul_is_black() {
        let p = byte_to_pixel(0x00);
        assert_eq!(p, Pixel::new(0, 0, 0, 255));
    }

    #[test]
    fn test_space_identity() {
        let p = byte_to_pixel(b' ');
        assert_eq!(p.r, 0);
        assert_eq!(p.g, 0);
        assert_eq!(p.b, 0x20);
        assert_eq!(p.a, 255);
    }

    #[test]
    fn test_uppercase_a() {
        let p = byte_to_pixel(b'A');
        assert_eq!(p, Pixel::new(0, 0, 0x41, 255));
    }

    #[test]
    fn test_roundtrip_identity() {
        for b in 0u8..=127 {
            let p = byte_to_pixel(b);
            assert_eq!(pixel_to_char(p), Some(b));
        }
    }
}
