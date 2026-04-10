// ═══════════════════════════════════════════════════════════════════════
// PIXEL COMPOSITION MODULE
//
// Pixel-level blending and compositing operations for the geometry-os
// framebuffer. Each pixel is an RGBA value packed into u32:
//
//   Bits 31-24: Alpha
//   Bits 23-16: Red
//   Bits 15- 8: Green
//   Bits  7- 0: Blue
//
// This corresponds to the OVER / ADD / MULTIPLY / SCREEN / SOURCE /
// DEST / CLEAR blend opcodes used by BLIT and drawing primitives.
//
// See docs/PIXEL_COMPOSITION_OPCODES.md for the design rationale.
// ═══════════════════════════════════════════════════════════════════════

/// RGBA pixel stored as four separate u8 channels.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Pixel {
    pub r: u8,
    pub g: u8,
    pub b: u8,
    pub a: u8,
}

impl Pixel {
    pub const fn new(r: u8, g: u8, b: u8, a: u8) -> Self {
        Self { r, g, b, a }
    }

    /// Fully transparent black.
    pub const fn transparent() -> Self {
        Self::new(0, 0, 0, 0)
    }

    /// Fully opaque black.
    pub const fn black() -> Self {
        Self::new(0, 0, 0, 255)
    }

    /// Fully opaque white.
    pub const fn white() -> Self {
        Self::new(255, 255, 255, 255)
    }

    /// Pack into u32 (ARGB layout: A<<24 | R<<16 | G<<8 | B).
    pub const fn to_u32(self) -> u32 {
        ((self.a as u32) << 24)
            | ((self.r as u32) << 16)
            | ((self.g as u32) << 8)
            | (self.b as u32)
    }

    /// Unpack from u32 (ARGB layout).
    pub const fn from_u32(v: u32) -> Self {
        Self {
            a: ((v >> 24) & 0xFF) as u8,
            r: ((v >> 16) & 0xFF) as u8,
            g: ((v >> 8) & 0xFF) as u8,
            b: (v & 0xFF) as u8,
        }
    }

    /// Convert to premultiplied alpha (internal helper).
    fn premultiply(self) -> (u32, u32, u32, u32) {
        let a = self.a as u32;
        let r = (self.r as u32 * a + 127) / 255;
        let g = (self.g as u32 * a + 127) / 255;
        let b = (self.b as u32 * a + 127) / 255;
        (r, g, b, a)
    }
}

// ── Composition opcodes ─────────────────────────────────────────────

/// Numeric identifiers for the blend/composition modes.
/// These map to pixel-pattern opcodes in the VM.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum BlendMode {
    /// Replace destination with source (no blending).
    Source = 0,
    /// Keep destination unchanged (no-op).
    Dest = 1,
    /// Porter-Duff "clear" — both source and destination are removed.
    Clear = 2,
    /// Porter-Duff "source over" — standard alpha compositing.
    Over = 3,
    /// Additive blending — clamped sum of source + destination.
    Add = 4,
    /// Multiplicative blending — src * dest / 255 per channel.
    Multiply = 5,
    /// Screen blending — 255 - (255-src)*(255-dest)/255.
    Screen = 6,
}

impl BlendMode {
    /// Dispatch from a raw opcode byte to the correct blend mode.
    /// Returns None if the byte is not a recognised blend opcode.
    pub fn from_opcode(byte: u8) -> Option<Self> {
        match byte {
            0 => Some(BlendMode::Source),
            1 => Some(BlendMode::Dest),
            2 => Some(BlendMode::Clear),
            3 => Some(BlendMode::Over),
            4 => Some(BlendMode::Add),
            5 => Some(BlendMode::Multiply),
            6 => Some(BlendMode::Screen),
            _ => None,
        }
    }

    /// Apply this blend mode to a source pixel over a destination pixel,
    /// returning the composed pixel.
    pub fn apply(self, src: Pixel, dst: Pixel) -> Pixel {
        match self {
            BlendMode::Source => src,
            BlendMode::Dest => dst,
            BlendMode::Clear => Pixel::transparent(),
            BlendMode::Over => blend_over(src, dst),
            BlendMode::Add => blend_add(src, dst),
            BlendMode::Multiply => blend_multiply(src, dst),
            BlendMode::Screen => blend_screen(src, dst),
        }
    }
}

// ── Blend implementations ───────────────────────────────────────────

/// Porter-Duff source-over alpha compositing.
///
/// Uses premultiplied alpha for correctness:
///   result = src_pre + dst_pre * (1 - src_alpha / 255)
///   then un-premultiply and convert back to u8 channels.
pub fn blend_over(src: Pixel, dst: Pixel) -> Pixel {
    let src_a = src.a as u32;

    // Fast path: source is fully opaque
    if src_a == 255 {
        return src;
    }

    // Fast path: source is fully transparent
    if src_a == 0 {
        return dst;
    }

    let dst_a = dst.a as u32;

    // Premultiplied source
    let sr = (src.r as u32 * src_a + 127) / 255;
    let sg = (src.g as u32 * src_a + 127) / 255;
    let sb = (src.b as u32 * src_a + 127) / 255;

    // Premultiplied destination
    let dr = (dst.r as u32 * dst_a + 127) / 255;
    let dg = (dst.g as u32 * dst_a + 127) / 255;
    let db = (dst.b as u32 * dst_a + 127) / 255;

    // 1 - src_alpha
    let one_minus_sa = 255 - src_a;

    // Composite premultiplied
    let out_a = src_a + (dst_a * one_minus_sa + 127) / 255;
    let out_r = sr + (dr * one_minus_sa + 127) / 255;
    let out_g = sg + (dg * one_minus_sa + 127) / 255;
    let out_b = sb + (db * one_minus_sa + 127) / 255;

    // Un-premultiply
    if out_a == 0 {
        return Pixel::transparent();
    }

    Pixel {
        r: ((out_r * 255 + out_a / 2) / out_a).min(255) as u8,
        g: ((out_g * 255 + out_a / 2) / out_a).min(255) as u8,
        b: ((out_b * 255 + out_a / 2) / out_a).min(255) as u8,
        a: out_a.min(255) as u8,
    }
}

/// Additive blending — simply sum channels and clamp to 255.
/// Alpha is max(src_a, dst_a).
pub fn blend_add(src: Pixel, dst: Pixel) -> Pixel {
    Pixel {
        r: (src.r as u32 + dst.r as u32).min(255) as u8,
        g: (src.g as u32 + dst.g as u32).min(255) as u8,
        b: (src.b as u32 + dst.b as u32).min(255) as u8,
        a: (src.a as u32 + dst.a as u32).min(255) as u8,
    }
}

/// Multiplicative blending — src * dest / 255 per channel.
pub fn blend_multiply(src: Pixel, dst: Pixel) -> Pixel {
    Pixel {
        r: ((src.r as u32 * dst.r as u32 + 127) / 255) as u8,
        g: ((src.g as u32 * dst.g as u32 + 127) / 255) as u8,
        b: ((src.b as u32 * dst.b as u32 + 127) / 255) as u8,
        a: ((src.a as u32 * dst.a as u32 + 127) / 255) as u8,
    }
}

/// Screen blending — 255 - (255 - src) * (255 - dest) / 255.
/// Always brightens.
pub fn blend_screen(src: Pixel, dst: Pixel) -> Pixel {
    fn screen_ch(a: u8, b: u8) -> u8 {
        (255 - ((255 - a as u32) * (255 - b as u32) + 127) / 255) as u8
    }
    Pixel {
        r: screen_ch(src.r, dst.r),
        g: screen_ch(src.g, dst.g),
        b: screen_ch(src.b, dst.b),
        a: screen_ch(src.a, dst.a),
    }
}
