// ═══════════════════════════════════════════════════════════════════════
// 5x7 BITMAP FONT FOR PRINTABLE ASCII
//
// Each character is 5 pixels wide, 7 pixels tall.
// Stored as 7 u8 values, one per row. Only the low 5 bits are used.
// Bit 4 = leftmost pixel, bit 0 = rightmost pixel.
//
// To render character 'X' at screen position (x, y):
//   for row in 0..7 {
//       let bits = FONT['X' as usize][row];
//       for col in 0..5 {
//           if bits & (1 << (4 - col)) != 0 {
//               screen[(y + row) * width + (x + col)] = color;
//           }
//       }
//   }
// ═══════════════════════════════════════════════════════════════════════

/// Glyph data for each ASCII character. Indexed by ASCII value.
/// Characters without a glyph are all zeros (blank).
///
/// Format: `[row0, row1, row2, row3, row4, row5, row6]`
/// where row0 is the top row and row6 is the bottom.
///
/// Bit layout within each row:
///   bit 4 = column 0 (leftmost)
///   bit 3 = column 1
///   bit 2 = column 2
///   bit 1 = column 3
///   bit 0 = column 4 (rightmost)
pub const GLYPHS: [[u8; 7]; 128] = [
    // 0x00-0x1F: control chars (blank)
    [0,0,0,0,0,0,0], // 0x00 NUL
    [0,0,0,0,0,0,0], // 0x01 SOH
    [0,0,0,0,0,0,0], // 0x02 STX
    [0,0,0,0,0,0,0], // 0x03 ETX
    [0,0,0,0,0,0,0], // 0x04 EOT
    [0,0,0,0,0,0,0], // 0x05 ENQ
    [0,0,0,0,0,0,0], // 0x06 ACK
    [0,0,0,0,0,0,0], // 0x07 BEL
    [0,0,0,0,0,0,0], // 0x08 BS
    [0,0,0,0,0,0,0], // 0x09 HT
    [0,0,0,0,0,0,0], // 0x0A LF
    [0,0,0,0,0,0,0], // 0x0B VT
    [0,0,0,0,0,0,0], // 0x0C FF
    [0,0,0,0,0,0,0], // 0x0D CR
    [0,0,0,0,0,0,0], // 0x0E SO
    [0,0,0,0,0,0,0], // 0x0F SI
    [0,0,0,0,0,0,0], // 0x10 DLE
    [0,0,0,0,0,0,0], // 0x11 DC1
    [0,0,0,0,0,0,0], // 0x12 DC2
    [0,0,0,0,0,0,0], // 0x13 DC3
    [0,0,0,0,0,0,0], // 0x14 DC4
    [0,0,0,0,0,0,0], // 0x15 NAK
    [0,0,0,0,0,0,0], // 0x16 SYN
    [0,0,0,0,0,0,0], // 0x17 ETB
    [0,0,0,0,0,0,0], // 0x18 CAN
    [0,0,0,0,0,0,0], // 0x19 EM
    [0,0,0,0,0,0,0], // 0x1A SUB
    [0,0,0,0,0,0,0], // 0x1B ESC
    [0,0,0,0,0,0,0], // 0x1C FS
    [0,0,0,0,0,0,0], // 0x1D GS
    [0,0,0,0,0,0,0], // 0x1E RS
    [0,0,0,0,0,0,0], // 0x1F US

    // 0x20: space (blank)
    [0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000], // 0x20 ' '

    // 0x21-0x2F: punctuation
    [0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00000, 0b00100], // 0x21 !
    [0b01010, 0b01010, 0b01010, 0b00000, 0b00000, 0b00000, 0b00000], // 0x22 "
    [0b01010, 0b01010, 0b11111, 0b01010, 0b11111, 0b01010, 0b01010], // 0x23 #
    [0b00100, 0b01111, 0b10100, 0b01110, 0b00101, 0b11110, 0b00100], // 0x24 $
    [0b11000, 0b11001, 0b00010, 0b00100, 0b01000, 0b10011, 0b00011], // 0x25 %
    [0b01100, 0b10010, 0b10100, 0b01000, 0b10101, 0b10010, 0b01101], // 0x26 &
    [0b00100, 0b00100, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000], // 0x27 '
    [0b00010, 0b00100, 0b01000, 0b01000, 0b01000, 0b00100, 0b00010], // 0x28 (
    [0b01000, 0b00100, 0b00010, 0b00010, 0b00010, 0b00100, 0b01000], // 0x29 )
    [0b00000, 0b00100, 0b10101, 0b01110, 0b10101, 0b00100, 0b00000], // 0x2A *
    [0b00000, 0b00100, 0b00100, 0b11111, 0b00100, 0b00100, 0b00000], // 0x2B +
    [0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00100, 0b01000], // 0x2C ,
    [0b00000, 0b00000, 0b00000, 0b11111, 0b00000, 0b00000, 0b00000], // 0x2D -
    [0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00100, 0b00000], // 0x2E .
    [0b00001, 0b00010, 0b00010, 0b00100, 0b01000, 0b01000, 0b10000], // 0x2F /

    // 0x30-0x39: digits
    [0b01110, 0b10001, 0b10011, 0b10101, 0b11001, 0b10001, 0b01110], // 0x30 0
    [0b00100, 0b01100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110], // 0x31 1
    [0b01110, 0b10001, 0b00001, 0b00010, 0b00100, 0b01000, 0b11111], // 0x32 2
    [0b01110, 0b10001, 0b00001, 0b00110, 0b00001, 0b10001, 0b01110], // 0x33 3
    [0b00010, 0b00110, 0b01010, 0b10010, 0b11111, 0b00010, 0b00010], // 0x34 4
    [0b11111, 0b10000, 0b11110, 0b00001, 0b00001, 0b10001, 0b01110], // 0x35 5
    [0b00110, 0b01000, 0b10000, 0b11110, 0b10001, 0b10001, 0b01110], // 0x36 6
    [0b11111, 0b00001, 0b00010, 0b00100, 0b01000, 0b01000, 0b01000], // 0x37 7
    [0b01110, 0b10001, 0b10001, 0b01110, 0b10001, 0b10001, 0b01110], // 0x38 8
    [0b01110, 0b10001, 0b10001, 0b01111, 0b00001, 0b00010, 0b01100], // 0x39 9

    // 0x3A-0x40: more punctuation
    [0b00000, 0b00000, 0b00100, 0b00000, 0b00000, 0b00100, 0b00000], // 0x3A :
    [0b00000, 0b00000, 0b00100, 0b00000, 0b00000, 0b00100, 0b01000], // 0x3B ;
    [0b00010, 0b00100, 0b01000, 0b10000, 0b01000, 0b00100, 0b00010], // 0x3C <
    [0b00000, 0b00000, 0b11111, 0b00000, 0b11111, 0b00000, 0b00000], // 0x3D =
    [0b01000, 0b00100, 0b00010, 0b00001, 0b00010, 0b00100, 0b01000], // 0x3E >
    [0b01110, 0b10001, 0b00001, 0b00110, 0b00100, 0b00000, 0b00100], // 0x3F ?
    [0b01110, 0b10001, 0b00001, 0b01101, 0b10101, 0b10101, 0b01110], // 0x40 @

    // 0x41-0x5A: uppercase letters
    [0b01110, 0b10001, 0b10001, 0b11111, 0b10001, 0b10001, 0b10001], // 0x41 A
    [0b11110, 0b10001, 0b10001, 0b11110, 0b10001, 0b10001, 0b11110], // 0x42 B
    [0b01110, 0b10001, 0b10000, 0b10000, 0b10000, 0b10001, 0b01110], // 0x43 C
    [0b11110, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b11110], // 0x44 D
    [0b11111, 0b10000, 0b10000, 0b11110, 0b10000, 0b10000, 0b11111], // 0x45 E
    [0b11111, 0b10000, 0b10000, 0b11110, 0b10000, 0b10000, 0b10000], // 0x46 F
    [0b01110, 0b10001, 0b10000, 0b10111, 0b10001, 0b10001, 0b01111], // 0x47 G
    [0b10001, 0b10001, 0b10001, 0b11111, 0b10001, 0b10001, 0b10001], // 0x48 H
    [0b01110, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110], // 0x49 I
    [0b00111, 0b00010, 0b00010, 0b00010, 0b00010, 0b10010, 0b01100], // 0x4A J
    [0b10001, 0b10010, 0b10100, 0b11000, 0b10100, 0b10010, 0b10001], // 0x4B K
    [0b10000, 0b10000, 0b10000, 0b10000, 0b10000, 0b10000, 0b11111], // 0x4C L
    [0b10001, 0b11011, 0b10101, 0b10101, 0b10001, 0b10001, 0b10001], // 0x4D M
    [0b10001, 0b11001, 0b10101, 0b10011, 0b10001, 0b10001, 0b10001], // 0x4E N
    [0b01110, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01110], // 0x4F O
    [0b11110, 0b10001, 0b10001, 0b11110, 0b10000, 0b10000, 0b10000], // 0x50 P
    [0b01110, 0b10001, 0b10001, 0b10001, 0b10101, 0b10010, 0b01101], // 0x51 Q
    [0b11110, 0b10001, 0b10001, 0b11110, 0b10100, 0b10010, 0b10001], // 0x52 R
    [0b01110, 0b10001, 0b10000, 0b01110, 0b00001, 0b10001, 0b01110], // 0x53 S
    [0b11111, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100], // 0x54 T
    [0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b10001, 0b01110], // 0x55 U
    [0b10001, 0b10001, 0b10001, 0b10001, 0b01010, 0b01010, 0b00100], // 0x56 V
    [0b10001, 0b10001, 0b10001, 0b10101, 0b10101, 0b10101, 0b01010], // 0x57 W
    [0b10001, 0b10001, 0b01010, 0b00100, 0b01010, 0b10001, 0b10001], // 0x58 X
    [0b10001, 0b10001, 0b01010, 0b00100, 0b00100, 0b00100, 0b00100], // 0x59 Y
    [0b11111, 0b00001, 0b00010, 0b00100, 0b01000, 0b10000, 0b11111], // 0x5A Z

    // 0x5B-0x60: brackets and backtick
    [0b01110, 0b01000, 0b01000, 0b01000, 0b01000, 0b01000, 0b01110], // 0x5B [
    [0b10000, 0b01000, 0b00100, 0b00010, 0b00100, 0b01000, 0b10000], // 0x5C backslash
    [0b01110, 0b00010, 0b00010, 0b00010, 0b00010, 0b00010, 0b01110], // 0x5D ]
    [0b00100, 0b01010, 0b10001, 0b00000, 0b00000, 0b00000, 0b00000], // 0x5E ^
    [0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b00000, 0b11111], // 0x5F _
    [0b01100, 0b00100, 0b00010, 0b00000, 0b00000, 0b00000, 0b00000], // 0x60 `

    // 0x61-0x7A: lowercase letters
    [0b00000, 0b00000, 0b01110, 0b00001, 0b01111, 0b10001, 0b01111], // 0x61 a
    [0b10000, 0b10000, 0b11110, 0b10001, 0b10001, 0b10001, 0b11110], // 0x62 b
    [0b00000, 0b00000, 0b01110, 0b10001, 0b10000, 0b10001, 0b01110], // 0x63 c
    [0b00001, 0b00001, 0b01111, 0b10001, 0b10001, 0b10001, 0b01111], // 0x64 d
    [0b00000, 0b00000, 0b01110, 0b10001, 0b11111, 0b10000, 0b01110], // 0x65 e
    [0b00110, 0b01001, 0b01000, 0b11100, 0b01000, 0b01000, 0b01000], // 0x66 f
    [0b00000, 0b00000, 0b01111, 0b10001, 0b10001, 0b01111, 0b00001,], // 0x67 g
    [0b10000, 0b10000, 0b11110, 0b10001, 0b10001, 0b10001, 0b10001], // 0x68 h
    [0b00100, 0b00000, 0b01100, 0b00100, 0b00100, 0b00100, 0b01110], // 0x69 i
    [0b00010, 0b00000, 0b00110, 0b00010, 0b00010, 0b10010, 0b01100], // 0x6A j
    [0b10000, 0b10000, 0b10010, 0b10100, 0b11000, 0b10100, 0b10010], // 0x6B k
    [0b01100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b01110], // 0x6C l
    [0b00000, 0b00000, 0b11010, 0b10101, 0b10101, 0b10001, 0b10001], // 0x6D m
    [0b00000, 0b00000, 0b11110, 0b10001, 0b10001, 0b10001, 0b10001], // 0x6E n
    [0b00000, 0b00000, 0b01110, 0b10001, 0b10001, 0b10001, 0b01110], // 0x6F o
    [0b00000, 0b00000, 0b11110, 0b10001, 0b10001, 0b11110, 0b10000], // 0x70 p
    [0b00000, 0b00000, 0b01111, 0b10001, 0b10001, 0b01111, 0b00001], // 0x71 q
    [0b00000, 0b00000, 0b10110, 0b11001, 0b10000, 0b10000, 0b10000], // 0x72 r
    [0b00000, 0b00000, 0b01111, 0b10000, 0b01110, 0b00001, 0b11110], // 0x73 s
    [0b01000, 0b01000, 0b11100, 0b01000, 0b01000, 0b01001, 0b00110], // 0x74 t
    [0b00000, 0b00000, 0b10001, 0b10001, 0b10001, 0b10001, 0b01111], // 0x75 u
    [0b00000, 0b00000, 0b10001, 0b10001, 0b10001, 0b01010, 0b00100], // 0x76 v
    [0b00000, 0b00000, 0b10001, 0b10001, 0b10101, 0b10101, 0b01010], // 0x77 w
    [0b00000, 0b00000, 0b10001, 0b01010, 0b00100, 0b01010, 0b10001], // 0x78 x
    [0b00000, 0b00000, 0b10001, 0b10001, 0b01111, 0b00001, 0b11110], // 0x79 y
    [0b00000, 0b00000, 0b11111, 0b00010, 0b00100, 0b01000, 0b11111], // 0x7A z

    // 0x7B-0x7E: braces, pipe, tilde
    [0b00010, 0b00100, 0b00100, 0b01000, 0b00100, 0b00100, 0b00010], // 0x7B {
    [0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100, 0b00100], // 0x7C |
    [0b01000, 0b00100, 0b00100, 0b00010, 0b00100, 0b00100, 0b01000], // 0x7D }
    [0b00000, 0b00000, 0b01010, 0b10100, 0b00000, 0b00000, 0b00000], // 0x7E ~

    // 0x7F: DEL (blank)
    [0,0,0,0,0,0,0], // 0x7F DEL
];

/// Glyph dimensions.
pub const GLYPH_W: usize = 5;
pub const GLYPH_H: usize = 7;

/// Render a single character's glyph into a pixel buffer.
///
/// `screen` -- the framebuffer (u32 pixels, 0x00RRGGBB)
/// `sw` -- screen width in pixels
/// `ch` -- the ASCII character to render
/// `x`, `y` -- top-left position in screen pixels
/// `scale` -- how many screen pixels per glyph pixel (1 = native, 4 = 20x28 per char)
/// `fg` -- foreground color (0x00RRGGBB)
/// `bg` -- background color (0x00RRGGBB), or pass same as fg for transparent
pub fn render_char(
    screen: &mut [u32],
    sw: usize,
    sh: usize,
    ch: u8,
    x: usize,
    y: usize,
    scale: usize,
    fg: u32,
    bg: Option<u32>,
) {
    let glyph = &GLYPHS[ch as usize];
    for row in 0..GLYPH_H {
        let bits = glyph[row];
        for col in 0..GLYPH_W {
            let on = bits & (1 << (4 - col)) != 0;
            let color = if on { fg } else { match bg { Some(c) => c, None => continue } };
            // Fill scale x scale block
            for dy in 0..scale {
                for dx in 0..scale {
                    let px = x + col * scale + dx;
                    let py = y + row * scale + dy;
                    if px < sw && py < sh {
                        screen[py * sw + px] = color;
                    }
                }
            }
        }
    }
}

/// Render a string of characters.
pub fn render_str(
    screen: &mut [u32],
    sw: usize,
    sh: usize,
    s: &str,
    x: usize,
    y: usize,
    scale: usize,
    fg: u32,
    bg: Option<u32>,
) {
    let mut cx = x;
    for ch in s.bytes() {
        render_char(screen, sw, sh, ch, cx, y, scale, fg, bg);
        cx += (GLYPH_W + 1) * scale; // 1px gap between chars
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn glyph_x_has_cross_pattern() {
        let x = &GLYPHS[b'X' as usize];
        // Row 0: #...# = 10001
        assert_eq!(x[0], 0b10001);
        // Row 2: .#.#. = 01010 (diagonals converging)
        assert_eq!(x[2], 0b01010);
        // Row 3: ..#.. = 00100 (center cross point)
        assert_eq!(x[3], 0b00100);
        // Row 4: .#.#. = 01010 (diagonals diverging)
        assert_eq!(x[4], 0b01010);
        // Row 6: #...# = 10001
        assert_eq!(x[6], 0b10001);
    }

    #[test]
    fn glyph_a_has_top_bar() {
        let a = &GLYPHS[b'A' as usize];
        // Row 0: .###. = 01110
        assert_eq!(a[0], 0b01110);
        // Row 3: ##### = 11111
        assert_eq!(a[3], 0b11111);
    }

    #[test]
    fn glyph_space_is_blank() {
        let sp = &GLYPHS[b' ' as usize];
        for row in sp {
            assert_eq!(*row, 0);
        }
    }

    #[test]
    fn render_char_writes_pixels() {
        let mut buf = vec![0u32; 20 * 20];
        render_char(&mut buf, 20, 20, b'X', 2, 2, 2, 0xFFFFFF, None);
        // Check that at least some pixels were written (X has 9 lit pixels in 5x7)
        let written = buf.iter().filter(|&&p| p != 0).count();
        assert!(written > 0, "X glyph should write some pixels");
    }

    #[test]
    fn all_printable_have_some_pixels() {
        for ch in 0x20u8..=0x7E {
            let glyph = &GLYPHS[ch as usize];
            let has_pixels: bool = glyph.iter().any(|&r| r != 0);
            if ch == 0x20 {
                assert!(!has_pixels, "space should be blank");
            } else {
                assert!(has_pixels, "char 0x{:02X} ({}) should have pixels", ch, ch as char);
            }
        }
    }
}
