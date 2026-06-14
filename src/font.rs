// font.rs -- 8x8 VGA/CP437-style bitmap font
//
// Each glyph is 8 rows of 8-bit wide bitmaps.
// Bit test: glyph[row] & (1 << (7 - col)) to check if pixel is on.
//
// GLYPH_W and GLYPH_H define the character cell dimensions.
// At 2x scale, each character renders as 16x16 pixels, filling a canvas cell exactly.

pub const GLYPH_W: usize = 8;
pub const GLYPH_H: usize = 8;

/// 128 glyphs (ASCII 0x00-0x7F). Printable ASCII starts at 0x20 (space).
/// Entries below 0x20 are blank (all zeros).
pub const GLYPHS: [[u8; GLYPH_H]; 128] = [
    // 0x00-0x1F: control characters (blank)
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    [0x00; 8],
    // 0x20: space
    [0x00; 8],
    // 0x21: !
    [0x18, 0x18, 0x18, 0x18, 0x18, 0x00, 0x18, 0x00],
    // 0x22: "
    [0x6C, 0x6C, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00],
    // 0x23: #
    [0x6C, 0x6C, 0xFE, 0x6C, 0xFE, 0x6C, 0x6C, 0x00],
    // 0x24: $
    [0x18, 0x3E, 0x60, 0x3C, 0x06, 0x7C, 0x18, 0x00],
    // 0x25: %
    [0x00, 0xC6, 0xCC, 0x18, 0x30, 0x66, 0xC6, 0x00],
    // 0x26: &
    [0x38, 0x6C, 0x38, 0x76, 0xDC, 0xCC, 0x76, 0x00],
    // 0x27: '
    [0x18, 0x18, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00],
    // 0x28: (
    [0x0C, 0x18, 0x30, 0x30, 0x30, 0x18, 0x0C, 0x00],
    // 0x29: )
    [0x30, 0x18, 0x0C, 0x0C, 0x0C, 0x18, 0x30, 0x00],
    // 0x2A: *
    [0x00, 0x66, 0x3C, 0xFF, 0x3C, 0x66, 0x00, 0x00],
    // 0x2B: +
    [0x00, 0x18, 0x18, 0x7E, 0x18, 0x18, 0x00, 0x00],
    // 0x2C: ,
    [0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x30],
    // 0x2D: -
    [0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x00],
    // 0x2E: .
    [0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x18, 0x00],
    // 0x2F: /
    [0x06, 0x0C, 0x18, 0x30, 0x60, 0xC0, 0x80, 0x00],
    // 0x30-0x39: digits 0-9
    [0x7C, 0xC6, 0xCE, 0xDE, 0xF6, 0xE6, 0x7C, 0x00], // 0
    [0x18, 0x38, 0x18, 0x18, 0x18, 0x18, 0x7E, 0x00], // 1
    [0x7C, 0xC6, 0x06, 0x1C, 0x30, 0x66, 0xFE, 0x00], // 2
    [0x7C, 0xC6, 0x06, 0x3C, 0x06, 0xC6, 0x7C, 0x00], // 3
    [0x1C, 0x3C, 0x6C, 0xCC, 0xFE, 0x0C, 0x1E, 0x00], // 4
    [0xFE, 0xC0, 0xFC, 0x06, 0x06, 0xC6, 0x7C, 0x00], // 5
    [0x38, 0x60, 0xC0, 0xFC, 0xC6, 0xC6, 0x7C, 0x00], // 6
    [0xFE, 0xC6, 0x0C, 0x18, 0x30, 0x30, 0x30, 0x00], // 7
    [0x7C, 0xC6, 0xC6, 0x7C, 0xC6, 0xC6, 0x7C, 0x00], // 8
    [0x7C, 0xC6, 0xC6, 0x7E, 0x06, 0x0C, 0x78, 0x00], // 9
    // 0x3A: :
    [0x00, 0x18, 0x18, 0x00, 0x00, 0x18, 0x18, 0x00],
    // 0x3B: ;
    [0x00, 0x18, 0x18, 0x00, 0x00, 0x18, 0x18, 0x30],
    // 0x3C: <
    [0x06, 0x0C, 0x18, 0x30, 0x18, 0x0C, 0x06, 0x00],
    // 0x3D: =
    [0x00, 0x00, 0x7E, 0x00, 0x7E, 0x00, 0x00, 0x00],
    // 0x3E: >
    [0x60, 0x30, 0x18, 0x0C, 0x18, 0x30, 0x60, 0x00],
    // 0x3F: ?
    [0x7C, 0xC6, 0x0C, 0x18, 0x18, 0x00, 0x18, 0x00],
    // 0x40: @
    [0x7C, 0xC6, 0xDE, 0xDE, 0xDE, 0xC0, 0x78, 0x00],
    // 0x41-0x5A: uppercase A-Z
    [0x38, 0x6C, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0x00], // A
    [0xFC, 0x66, 0x66, 0x7C, 0x66, 0x66, 0xFC, 0x00], // B
    [0x3C, 0x66, 0xC0, 0xC0, 0xC0, 0x66, 0x3C, 0x00], // C
    [0xF8, 0x6C, 0x66, 0x66, 0x66, 0x6C, 0xF8, 0x00], // D
    [0xFE, 0x62, 0x68, 0x78, 0x68, 0x62, 0xFE, 0x00], // E
    [0xFE, 0x62, 0x68, 0x78, 0x68, 0x60, 0xF0, 0x00], // F
    [0x3C, 0x66, 0xC0, 0xC0, 0xCE, 0x66, 0x3E, 0x00], // G
    [0xC6, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0xC6, 0x00], // H
    [0x3C, 0x18, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00], // I
    [0x1E, 0x0C, 0x0C, 0x0C, 0xCC, 0xCC, 0x78, 0x00], // J
    [0xE6, 0x66, 0x6C, 0x78, 0x6C, 0x66, 0xE6, 0x00], // K
    [0xF0, 0x60, 0x60, 0x60, 0x62, 0x66, 0xFE, 0x00], // L
    [0xC6, 0xEE, 0xFE, 0xFE, 0xD6, 0xC6, 0xC6, 0x00], // M
    [0xC6, 0xE6, 0xF6, 0xDE, 0xCE, 0xC6, 0xC6, 0x00], // N
    [0x7C, 0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x7C, 0x00], // O
    [0xFC, 0x66, 0x66, 0x7C, 0x60, 0x60, 0xF0, 0x00], // P
    [0x7C, 0xC6, 0xC6, 0xC6, 0xD6, 0xDE, 0x7C, 0x06], // Q
    [0xFC, 0x66, 0x66, 0x7C, 0x6C, 0x66, 0xE6, 0x00], // R
    [0x3C, 0x66, 0x30, 0x18, 0x0C, 0x66, 0x3C, 0x00], // S
    [0x7E, 0x5A, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00], // T
    [0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0xC6, 0x7C, 0x00], // U
    [0xC6, 0xC6, 0xC6, 0xC6, 0x6C, 0x38, 0x10, 0x00], // V
    [0xC6, 0xC6, 0xC6, 0xD6, 0xFE, 0xEE, 0xC6, 0x00], // W
    [0xC6, 0x6C, 0x38, 0x38, 0x6C, 0xC6, 0xC6, 0x00], // X
    [0x66, 0x66, 0x66, 0x3C, 0x18, 0x18, 0x3C, 0x00], // Y
    [0xFE, 0xC6, 0x8C, 0x18, 0x32, 0x66, 0xFE, 0x00], // Z
    // 0x5B: [
    [0x3C, 0x30, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x00],
    // 0x5C: backslash
    [0xC0, 0x60, 0x30, 0x18, 0x0C, 0x06, 0x02, 0x00],
    // 0x5D: ]
    [0x3C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x3C, 0x00],
    // 0x5E: ^
    [0x10, 0x38, 0x6C, 0xC6, 0x00, 0x00, 0x00, 0x00],
    // 0x5F: _
    [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE],
    // 0x60: `
    [0x18, 0x18, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00],
    // 0x61-0x7A: lowercase a-z
    [0x00, 0x00, 0x78, 0x0C, 0x7C, 0xCC, 0x76, 0x00], // a
    [0xE0, 0x60, 0x7C, 0x66, 0x66, 0x66, 0xDC, 0x00], // b
    [0x00, 0x00, 0x7C, 0xC6, 0xC0, 0xC6, 0x7C, 0x00], // c
    [0x1C, 0x0C, 0x7C, 0xCC, 0xCC, 0xCC, 0x76, 0x00], // d
    [0x00, 0x00, 0x7C, 0xC6, 0xFE, 0xC0, 0x7C, 0x00], // e
    [0x1C, 0x36, 0x30, 0x78, 0x30, 0x30, 0x78, 0x00], // f
    [0x00, 0x00, 0x76, 0xCC, 0xCC, 0x7C, 0x0C, 0xF8], // g
    [0xE0, 0x60, 0x6C, 0x76, 0x66, 0x66, 0xE6, 0x00], // h
    [0x18, 0x00, 0x38, 0x18, 0x18, 0x18, 0x3C, 0x00], // i
    [0x06, 0x00, 0x06, 0x06, 0x06, 0x66, 0x66, 0x3C], // j
    [0xE0, 0x60, 0x66, 0x6C, 0x78, 0x6C, 0xE6, 0x00], // k
    [0x38, 0x18, 0x18, 0x18, 0x18, 0x18, 0x3C, 0x00], // l
    [0x00, 0x00, 0xCC, 0xFE, 0xFE, 0xD6, 0xC6, 0x00], // m
    [0x00, 0x00, 0xDC, 0x66, 0x66, 0x66, 0x66, 0x00], // n
    [0x00, 0x00, 0x3C, 0x66, 0x66, 0x66, 0x3C, 0x00], // o
    [0x00, 0x00, 0xDC, 0x66, 0x66, 0x7C, 0x60, 0xF0], // p
    [0x00, 0x00, 0x76, 0xCC, 0xCC, 0x7C, 0x0C, 0x1E], // q
    [0x00, 0x00, 0xDC, 0x76, 0x60, 0x60, 0xF0, 0x00], // r
    [0x00, 0x00, 0x7E, 0xC0, 0x7C, 0x06, 0xFC, 0x00], // s
    [0x30, 0x30, 0x7C, 0x30, 0x30, 0x36, 0x1C, 0x00], // t
    [0x00, 0x00, 0xCC, 0xCC, 0xCC, 0xCC, 0x76, 0x00], // u
    [0x00, 0x00, 0xC6, 0xC6, 0xC6, 0x6C, 0x38, 0x00], // v
    [0x00, 0x00, 0xC6, 0xC6, 0xD6, 0xFE, 0x6C, 0x00], // w
    [0x00, 0x00, 0xC6, 0x6C, 0x38, 0x6C, 0xC6, 0x00], // x
    [0x00, 0x00, 0xC6, 0xC6, 0xCE, 0x76, 0x06, 0x7C], // y
    [0x00, 0x00, 0xFC, 0x98, 0x30, 0x64, 0xFC, 0x00], // z
    // 0x7B: {
    [0x0E, 0x18, 0x18, 0x70, 0x18, 0x18, 0x0E, 0x00],
    // 0x7C: |
    [0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x00],
    // 0x7D: }
    [0x70, 0x18, 0x18, 0x0E, 0x18, 0x18, 0x70, 0x00],
    // 0x7E: ~
    [0x76, 0xDC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
    // 0x7F: DEL (blank)
    [0x00; 8],
];

/// Kerning pairs table for variable-width text rendering.
/// Each entry is (left_char, right_char, adjustment).
/// Adjustment is in pixels: negative = closer together, positive = further apart.
/// Covers common Latin typographic pairs where characters visually overlap or have
/// excessive whitespace.
///
/// Lookup: use `get_kerning(left, right)` which returns an i8 adjustment.
pub const KERNING_PAIRS: &[(u8, u8, i8)] = &[
    // Uppercase-lowercase pairs (common in English)
    (b'A', b'V', -1),
    (b'A', b'v', -1),
    (b'A', b'W', -1),
    (b'A', b'w', -1),
    (b'A', b'Y', -1),
    (b'A', b'y', -1),
    (b'A', b'T', -1),
    (b'A', b't', -1),
    (b'A', b'U', -1),
    (b'A', b'u', -1),
    (b'A', b'Q', -1),
    // T with lowercase (T's right stem overlaps)
    (b'T', b'a', -1),
    (b'T', b'e', -1),
    (b'T', b'o', -1),
    (b'T', b'r', -1),
    (b'T', b's', -1),
    (b'T', b'u', -1),
    (b'T', b'y', -1),
    // L with tall uppercase (L's top-right is empty)
    (b'L', b'T', -1),
    (b'L', b'V', -1),
    (b'L', b'W', -1),
    (b'L', b'Y', -1),
    // F with lowercase
    (b'F', b'a', -1),
    (b'F', b'e', -1),
    (b'F', b'i', -1),
    (b'F', b'o', -1),
    (b'F', b'r', -1),
    (b'F', b'u', -1),
    // P with lowercase (P's bowl right edge)
    (b'P', b'a', -1),
    (b'P', b'e', -1),
    (b'P', b'o', -1),
    (b'P', b'r', -1),
    (b'P', b's', -1),
    (b'P', b't', -1),
    // R with following chars
    (b'R', b'a', -1),
    (b'R', b'e', -1),
    (b'R', b'o', -1),
    (b'R', b'u', -1),
    (b'R', b'y', -1),
    // V/W with lowercase (V/W's right diagonal)
    (b'V', b'a', -1),
    (b'V', b'e', -1),
    (b'V', b'i', -1),
    (b'V', b'o', -1),
    (b'V', b'u', -1),
    (b'V', b'y', -1),
    (b'W', b'a', -1),
    (b'W', b'e', -1),
    (b'W', b'i', -1),
    (b'W', b'o', -1),
    (b'W', b'u', -1),
    (b'W', b'y', -1),
    // Y with lowercase
    (b'Y', b'a', -1),
    (b'Y', b'e', -1),
    (b'Y', b'o', -1),
    (b'Y', b'u', -1),
    (b'Y', b'A', -1),
    // Common lowercase pairs
    (b'v', b'a', -1),
    (b'v', b'e', -1),
    (b'v', b'o', -1),
    (b'v', b'y', -1),
    (b'w', b'a', -1),
    (b'w', b'e', -1),
    (b'w', b'o', -1),
    (b'y', b'a', -1),
    (b'y', b'e', -1),
    (b'y', b'o', -1),
    // Quotes with letters
    (b'\'', b'A', -1),
    (b'\'', b'a', -1),
    (b'\'', b'S', -1),
    (b'\'', b's', -1),
    (b'\'', b'T', -1),
    (b'\'', b't', -1),
    // Dash with numbers (n-dash style)
    (b'-', b'1', -1),
    (b'-', b'2', -1),
    (b'-', b'3', -1),
    (b'-', b'4', -1),
    (b'-', b'5', -1),
    (b'-', b'6', -1),
    (b'-', b'7', -1),
    (b'-', b'8', -1),
    (b'-', b'9', -1),
    (b'-', b'0', -1),
    // Period/comma after uppercase
    (b'.', b'A', -1),
    (b'.', b'T', -1),
    (b'.', b'V', -1),
    (b'.', b'W', -1),
    (b'.', b'Y', -1),
    (b',', b'A', -1),
    (b',', b'T', -1),
    (b',', b'V', -1),
    (b',', b'W', -1),
    (b',', b'Y', -1),
    // Slash with numbers
    (b'/', b'2', -1),
    (b'/', b'7', -1),
    (b'/', b'0', -1),
];

/// Look up the kerning adjustment for a pair of characters.
/// Returns the pixel adjustment (typically -1 for tighter spacing).
/// Returns 0 if no kerning pair is defined for the given characters.
pub fn get_kerning(left: u8, right: u8) -> i8 {
    for &(l, r, adj) in KERNING_PAIRS {
        if l == left && r == right {
            return adj;
        }
    }
    0
}

/// Per-character advance widths for the variable-width font (VWTXT opcode).
/// Indexed by ASCII code (0x20-0x7F). Values outside this range default to 3.
/// Narrow chars (i, l, !, etc.) have width 2-3, wide chars (M, W, etc.) have width 7-8.
/// These are extracted from vw_font.in (byte 8 of each 9-byte glyph entry).
pub const VW_GLYPH_WIDTHS: [u8; 128] = {
    const VW_FONT: [[u8; 9]; 96] = include!("vw_font.in");
    let mut widths = [3u8; 128];
    let mut i = 0;
    while i < 96 {
        widths[0x20 + i] = VW_FONT[i][8];
        i += 1;
    }
    widths
};

/// Look up the advance width for a character in the variable-width font.
/// Returns the width in pixels (2-8 for printable ASCII, 3 for unknown/control chars).
pub fn get_glyph_width(ch: u8) -> u8 {
    if (0x20..=0x7F).contains(&ch) {
        VW_GLYPH_WIDTHS[ch as usize]
    } else {
        3 // default advance for unknown chars
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_glyph_array_has_128_entries() {
        assert_eq!(GLYPHS.len(), 128);
    }

    #[test]
    fn test_all_glyphs_have_correct_dimensions() {
        for (i, glyph) in GLYPHS.iter().enumerate() {
            assert_eq!(glyph.len(), GLYPH_H, "glyph {} has wrong height", i);
        }
    }

    #[test]
    fn test_control_characters_are_blank() {
        // ASCII 0x00-0x1F are control characters, should be all zeros
        for (i, glyph) in GLYPHS.iter().enumerate().take(32) {
            assert!(
                glyph.iter().all(|&b| b == 0),
                "control char 0x{:02X} is not blank",
                i
            );
        }
    }

    #[test]
    fn test_space_is_blank() {
        assert!(GLYPHS[0x20].iter().all(|&b| b == 0));
    }

    #[test]
    fn test_del_is_blank() {
        assert!(GLYPHS[0x7F].iter().all(|&b| b == 0));
    }

    #[test]
    fn test_exclamation_mark_has_pixels() {
        let glyph = &GLYPHS[0x21];
        assert!(
            glyph.iter().any(|&b| b != 0),
            "exclamation mark should have some pixels set"
        );
        // Check it has the characteristic pattern: top 5 rows have middle column
        assert_ne!(glyph[0] & 0x18, 0); // middle bits set in row 0
    }

    #[test]
    fn test_letter_a_shape() {
        let glyph = &GLYPHS[0x41];
        // A has a peak at row 0 (bits 3,4,5 set = 0x38 = 0b00111000)
        assert_eq!(glyph[0], 0x38, "A row 0 should be 0x38");
        // A has a flat bottom at row 6 (bits 2,3,4,5,6 set = 0x6C)
        assert_eq!(glyph[6], 0xC6, "A row 6 should be 0xC6");
    }

    #[test]
    fn test_digits_are_distinct() {
        // Each digit 0-9 should have a unique glyph
        let mut seen = std::collections::HashSet::new();
        for d in 0x30..=0x39 {
            let glyph = GLYPHS[d];
            assert!(
                seen.insert(glyph),
                "digit {} (0x{:02X}) has duplicate glyph",
                d - 0x30,
                d
            );
        }
    }

    #[test]
    fn test_uppercase_letters_are_distinct() {
        let mut seen = std::collections::HashSet::new();
        for c in 0x41..=0x5A {
            let glyph = GLYPHS[c];
            assert!(
                seen.insert(glyph),
                "uppercase letter {} (0x{:02X}) has duplicate glyph",
                c as u8 as char,
                c
            );
        }
    }

    #[test]
    fn test_lowercase_letters_are_distinct() {
        let mut seen = std::collections::HashSet::new();
        for c in 0x61..=0x7A {
            let glyph = GLYPHS[c];
            assert!(
                seen.insert(glyph),
                "lowercase letter {} (0x{:02X}) has duplicate glyph",
                c as u8 as char,
                c
            );
        }
    }

    #[test]
    fn test_printable_glyphs_have_content() {
        // All visible printable ASCII (0x21-0x7E) should have at least one pixel set.
        // Note: 0x20 (space) is printable but intentionally blank.
        for (i, glyph) in GLYPHS.iter().enumerate().take(0x7F).skip(0x21) {
            assert!(
                glyph.iter().any(|&b| b != 0),
                "printable char 0x{:02X} ({}) is blank",
                i,
                i as u8 as char
            );
        }
    }

    #[test]
    fn test_glyph_dimensions_constants() {
        assert_eq!(GLYPH_W, 8);
        assert_eq!(GLYPH_H, 8);
    }

    // ── Variable-width glyph width table tests ──

    #[test]
    fn test_vw_glyph_widths_table_size() {
        assert_eq!(VW_GLYPH_WIDTHS.len(), 128);
    }

    #[test]
    fn test_vw_glyph_widths_printable_range() {
        // All printable ASCII (0x20-0x7E) should have non-zero advance widths
        // Note: 0x7F (DEL) is a control character with 0 advance
        for c in 0x20..=0x7E {
            assert_ne!(
                VW_GLYPH_WIDTHS[c as usize], 0,
                "printable char 0x{:02X} ({}) has zero advance width",
                c, c as u8 as char
            );
        }
    }

    #[test]
    fn test_vw_glyph_widths_control_chars_default() {
        // Control chars (0x00-0x1F) should default to 3 (the fill value)
        for c in 0x00..=0x1F {
            assert_eq!(
                VW_GLYPH_WIDTHS[c as usize], 3,
                "control char 0x{:02X} should have default width 3",
                c
            );
        }
    }

    #[test]
    fn test_vw_glyph_widths_narrow_vs_wide() {
        // Narrow chars like 'i', 'l', '!', '.' should be <= 4
        for &ch in &[b'i', b'l', b'!', b'.', b',', b':', b';'] {
            assert!(
                VW_GLYPH_WIDTHS[ch as usize] <= 4,
                "'{}' should be narrow (<=4), got {}",
                ch as char,
                VW_GLYPH_WIDTHS[ch as usize]
            );
        }
        // Wide chars like 'M', 'W', 'm', 'w' should be >= 6
        for &ch in &[b'M', b'W', b'm', b'w', b'%', b'@'] {
            assert!(
                VW_GLYPH_WIDTHS[ch as usize] >= 6,
                "'{}' should be wide (>=6), got {}",
                ch as char,
                VW_GLYPH_WIDTHS[ch as usize]
            );
        }
    }

    #[test]
    fn test_get_glyph_width_function() {
        // Known widths from vw_font.in
        assert_eq!(get_glyph_width(b' '), 3); // space: 3px advance
        assert_eq!(get_glyph_width(b'i'), 3); // narrow
        assert_eq!(get_glyph_width(b'l'), 3); // narrow
        assert_eq!(get_glyph_width(b'M'), 8); // widest
        assert_eq!(get_glyph_width(b'W'), 8); // widest
                                              // Control char defaults
        assert_eq!(get_glyph_width(0x00), 3);
        assert_eq!(get_glyph_width(0x0A), 3); // newline
                                              // High byte defaults
        assert_eq!(get_glyph_width(0x80), 3);
        assert_eq!(get_glyph_width(0xFF), 3);
    }

    // ── Kerning pair tests ──

    #[test]
    fn test_kerning_pairs_table_not_empty() {
        assert!(!KERNING_PAIRS.is_empty());
        // Should have at least 50 well-known pairs
        assert!(
            KERNING_PAIRS.len() >= 50,
            "expected >= 50 kerning pairs, got {}",
            KERNING_PAIRS.len()
        );
    }

    #[test]
    fn test_kerning_pairs_valid_range() {
        // All characters in kerning pairs should be printable ASCII
        for &(l, r, adj) in KERNING_PAIRS {
            assert!(
                (0x20..=0x7E).contains(&l),
                "left char 0x{:02X} out of printable range",
                l
            );
            assert!(
                (0x20..=0x7E).contains(&r),
                "right char 0x{:02X} out of printable range",
                r
            );
            assert!(adj <= 0, "kerning adjustment should be <= 0, got {}", adj);
        }
    }

    #[test]
    fn test_get_kerning_known_pairs() {
        // AV is a classic kerning pair
        assert_eq!(get_kerning(b'A', b'V'), -1);
        assert_eq!(get_kerning(b'T', b'o'), -1);
        assert_eq!(get_kerning(b'W', b'a'), -1);
        assert_eq!(get_kerning(b'.', b'T'), -1);
    }

    #[test]
    fn test_get_kerning_no_pair() {
        // Random pairs without defined kerning should return 0
        assert_eq!(get_kerning(b'a', b'b'), 0);
        assert_eq!(get_kerning(b'X', b'Z'), 0);
        assert_eq!(get_kerning(b'3', b'7'), 0);
        assert_eq!(get_kerning(b' ', b' '), 0);
    }

    #[test]
    fn test_get_kerning_symmetry() {
        // Kerning is NOT symmetric -- AV != VA (only AV is defined)
        assert_eq!(get_kerning(b'A', b'V'), -1);
        assert_eq!(get_kerning(b'V', b'A'), 0); // reverse not defined
    }
}
