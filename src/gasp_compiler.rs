// GASP Compiler — .gasp -> .gasm filmstrip
//
// Takes a declarative GaspDoc (the "source of truth") and compiles it into
// a multi-frame .gasm filmstrip that the VM executes.
//
// Expansion Pipeline:
//   1. Temporal Expansion (Tweening) — interpolate between keyframes
//   2. Spatial Expansion (Symbols) — inline symbol draw lists at offsets
//   3. Layer Flattening — merge layers into per-frame instruction streams
//
// Phase 1 targets PSET (single pixel write) and CHAR (font atlas blit).
// Phase 2 will swap these for native RECTF/LINE/TEXT GPU opcodes.

use crate::gasp::{
    parse_color, Canvas, Draw, GaspDoc, Keyframe, Layer, Symbol, SymbolFrame, Timeline,
};

// ── Register Allocation ──────────────────────────────────────
// The compiler emits .gasm TEXT, so these are conventions for the
// generated code. Each frame gets a clean register state (filmstrip VM
// resets regs between frames).

const R_X: u8 = 0; // current x coordinate
const R_Y: u8 = 1; // current y coordinate
const R_COLOR: u8 = 2; // packed RGBA color
const R_TMP1: u8 = 3; // scratch
const R_TMP2: u8 = 4; // scratch
const R_W: u8 = 5; // width / radius / dx
const R_H: u8 = 6; // height / dy
const R_CHAR: u8 = 7; // character ASCII value
const R_DX: u8 = 8; // Bresenham dx
const R_DY: u8 = 9; // Bresenham dy
const R_ERR: u8 = 10; // Bresenham error term
const R_STEP: u8 = 11; // Bresenham step direction
const R_YSTART: u8 = 12; // outer loop start y
const R_XSTART: u8 = 13; // saved start x for rect inner loop
const R_CHAR_X: u8 = 14; // text cursor x (advances per char)

// ── Compiler ─────────────────────────────────────────────────

/// Compiles a .gasp document into a .gasm filmstrip source string.
///
/// The output can be fed directly to `assemble_filmstrip_with_labels()`.
pub struct GaspCompiler {
    doc: GaspDoc,
}

impl GaspCompiler {
    pub fn new(doc: GaspDoc) -> Self {
        Self { doc }
    }

    /// Compile from a YAML string.
    pub fn from_yaml(yaml: &str) -> Result<Self, String> {
        let doc = crate::gasp::parse_gasp(yaml)?;
        Ok(Self::new(doc))
    }

    /// Compile from a JSON string.
    pub fn from_json(json: &str) -> Result<Self, String> {
        let doc = crate::gasp::parse_gasp_json(json)?;
        Ok(Self::new(doc))
    }

    // ── Main Pipeline ────────────────────────────────────────

    /// The entry point: converts the entire GaspDoc to a multi-frame .gasm string.
    pub fn compile(&self) -> Result<String, String> {
        let total_frames = self.calculate_total_frames();
        if total_frames == 0 {
            return Err("Timeline has no frames (empty or no keyframes)".into());
        }

        let mut output = String::new();

        for frame_idx in 0..total_frames {
            output.push_str(&format!(".frame \"{}\"\n", frame_idx));

            // Process each timeline layer
            for layer in &self.doc.timeline.layers {
                let draw_ops = self.interpolate_layer_at(layer, frame_idx);
                let resolved = self.resolve_symbols(&draw_ops)?;
                for op in &resolved {
                    output.push_str(&self.emit_draw(op)?);
                }
            }

            // Append any frame scripts
            if let Some(script) = self.get_script_for_frame(frame_idx) {
                output.push_str(&script.code);
                output.push('\n');
            }

            output.push_str("HALT\n");

            if frame_idx < total_frames - 1 {
                output.push_str("\n---\n");
            }
        }

        Ok(output)
    }

    // ── Temporal Expansion (Tweening) ────────────────────────

    /// Calculate the total number of frames needed for the timeline.
    /// This is the maximum frame number across all layers, plus one
    /// (since frames are 0-indexed).
    fn calculate_total_frames(&self) -> u32 {
        let mut max_frame = 0u32;
        for layer in &self.doc.timeline.layers {
            for kf in &layer.keyframes {
                max_frame = max_frame.max(kf.frame);
            }
        }
        // If the last keyframe has a tween, we need one more frame beyond it
        for layer in &self.doc.timeline.layers {
            if let Some(last_kf) = layer.keyframes.last() {
                if last_kf.tween.is_some() {
                    // Tween target is implicit: the tween runs for 1 frame
                    // past the keyframe. But since there's no next keyframe,
                    // the tween can't expand. This is fine -- the last
                    // keyframe's draws appear at its frame number.
                }
            }
        }
        if max_frame == 0 && self.doc.timeline.layers.iter().all(|l| l.keyframes.is_empty()) {
            return 0;
        }
        max_frame + 1
    }

    /// Interpolate a layer's draw list at a specific frame index.
    ///
    /// If the frame falls between two keyframes with a tween, generates
    /// interpolated Draw ops. Otherwise returns the keyframe's draws as-is.
    fn interpolate_layer_at(&self, layer: &Layer, frame_idx: u32) -> Vec<Draw> {
        let keyframes = &layer.keyframes;
        if keyframes.is_empty() {
            return Vec::new();
        }

        // Find the active keyframe span for this frame
        let (ki_a, ki_b) = self.find_keyframe_span(keyframes, frame_idx);

        match (ki_a, ki_b) {
            // Exact keyframe -- no interpolation needed
            (Some(a), None) => keyframes[a].draws.clone(),

            // Between two keyframes with tweening
            (Some(a), Some(b)) => {
                let kf_a = &keyframes[a];
                let kf_b = &keyframes[b];

                // Tween type can live on either the source or target keyframe
                let tween_type = kf_a.tween.as_ref().or(kf_b.tween.as_ref());
                match tween_type {
                    Some(tween_type) => {
                        let t = self.calculate_t(kf_a.frame, kf_b.frame, frame_idx, tween_type);
                        self.interpolate_draws(&kf_a.draws, &kf_b.draws, t)
                    }
                    None => {
                        // No tween -- hold previous keyframe's draws
                        kf_a.draws.clone()
                    }
                }
            }

            // Before the first keyframe
            (None, _) => Vec::new(),
        }
    }

    /// Find the keyframe pair that brackets the given frame index.
    ///
    /// Returns (Some(a), None) if frame_idx lands exactly on keyframe[a].
    /// Returns (Some(a), Some(b)) if frame_idx is between keyframes a and b.
    /// Returns (None, _) if frame_idx is before any keyframe.
    fn find_keyframe_span(&self, keyframes: &[Keyframe], frame_idx: u32) -> (Option<usize>, Option<usize>) {
        // Keyframes should be sorted by frame number, but let's be safe
        for (i, kf) in keyframes.iter().enumerate() {
            if kf.frame == frame_idx {
                return (Some(i), None);
            }
            if kf.frame > frame_idx {
                if i > 0 {
                    return (Some(i - 1), Some(i));
                }
                return (None, Some(i));
            }
        }
        // Past all keyframes -- hold the last one
        if !keyframes.is_empty() {
            (Some(keyframes.len() - 1), None)
        } else {
            (None, None)
        }
    }

    /// Calculate the interpolation parameter t ∈ [0, 1].
    fn calculate_t(&self, frame_a: u32, frame_b: u32, current: u32, tween_type: &str) -> f64 {
        if frame_a == frame_b {
            return 1.0;
        }
        let raw_t = (current - frame_a) as f64 / (frame_b - frame_a) as f64;
        let t = raw_t.clamp(0.0, 1.0);

        match tween_type {
            "linear" => t,
            "ease-in" => t * t,
            "ease-out" => t * (2.0 - t),
            "ease-in-out" => {
                if t < 0.5 {
                    2.0 * t * t
                } else {
                    -1.0 + (4.0 - 2.0 * t) * t
                }
            }
            _ => t, // unknown tween type defaults to linear
        }
    }

    /// Interpolate between two draw lists by matching draws by index.
    ///
    /// Only draws of the same type can be tweened. If types differ,
    /// we snap to the "b" draws at t >= 0.5, else hold "a" draws.
    fn interpolate_draws(&self, draws_a: &[Draw], draws_b: &[Draw], t: f64) -> Vec<Draw> {
        let max_len = draws_a.len().max(draws_b.len());
        let mut result = Vec::with_capacity(max_len);

        for i in 0..max_len {
            match (draws_a.get(i), draws_b.get(i)) {
                (Some(a), Some(b)) => {
                    result.push(self.interpolate_pair(a, b, t));
                }
                (Some(a), None) => result.push(a.clone()),
                (None, Some(b)) => result.push(b.clone()),
                (None, None) => unreachable!(),
            }
        }

        result
    }

    /// Interpolate a single pair of draws. If types match, lerp properties.
    /// If types differ, snap at t=0.5.
    fn interpolate_pair(&self, a: &Draw, b: &Draw, t: f64) -> Draw {
        // Only tween matching types
        match (a, b) {
            (Draw::Rect { x: ax, y: ay, w: aw, h: ah, fill: af },
             Draw::Rect { x: bx, y: by, w: bw, h: bh, fill: bf }) => {
                Draw::Rect {
                    x: lerp_i32(*ax, *bx, t),
                    y: lerp_i32(*ay, *by, t),
                    w: lerp_u32(*aw, *bw, t),
                    h: lerp_u32(*ah, *bh, t),
                    fill: lerp_color_str(af, bf, t),
                }
            }
            (Draw::Circle { cx: acx, cy: acy, r: ar, fill: af },
             Draw::Circle { cx: bcx, cy: bcy, r: br, fill: bf }) => {
                Draw::Circle {
                    cx: lerp_i32(*acx, *bcx, t),
                    cy: lerp_i32(*acy, *bcy, t),
                    r: lerp_u32(*ar, *br, t),
                    fill: lerp_color_str(af, bf, t),
                }
            }
            (Draw::Line { x0: ax0, y0: ay0, x1: ax1, y1: ay1, color: ac },
             Draw::Line { x0: bx0, y0: by0, x1: bx1, y1: by1, color: bc }) => {
                Draw::Line {
                    x0: lerp_i32(*ax0, *bx0, t),
                    y0: lerp_i32(*ay0, *by0, t),
                    x1: lerp_i32(*ax1, *bx1, t),
                    y1: lerp_i32(*ay1, *by1, t),
                    color: lerp_color_str(ac, bc, t),
                }
            }
            (Draw::Text { x: ax, y: ay, content: ac, color: acc },
             Draw::Text { x: bx, y: by, content: bc, color: bcc }) => {
                Draw::Text {
                    x: lerp_i32(*ax, *bx, t),
                    y: lerp_i32(*ay, *by, t),
                    // Can't tween text content -- snap at t=0.5
                    content: if t >= 0.5 { bc.clone() } else { ac.clone() },
                    color: lerp_color_str(acc, bcc, t),
                }
            }
            (Draw::Pixel { x: ax, y: ay, color: ac },
             Draw::Pixel { x: bx, y: by, color: bc }) => {
                Draw::Pixel {
                    x: lerp_i32(*ax, *bx, t),
                    y: lerp_i32(*ay, *by, t),
                    color: lerp_color_str(ac, bc, t),
                }
            }
            (Draw::Instance { symbol: as_, x: ax, y: ay, frame: af, scale: asc },
             Draw::Instance { symbol: bs, x: bx, y: by, frame: bf, scale: bsc }) => {
                Draw::Instance {
                    symbol: if t >= 0.5 { bs.clone() } else { as_.clone() },
                    x: lerp_i32(*ax, *bx, t),
                    y: lerp_i32(*ay, *by, t),
                    frame: if t >= 0.5 { *bf } else { *af },
                    scale: lerp_f32(*asc, *bsc, t),
                }
            }
            // Type mismatch: snap at t=0.5
            _ => {
                if t >= 0.5 { b.clone() } else { a.clone() }
            }
        }
    }

    // ── Spatial Expansion (Symbol Resolution) ────────────────

    /// Resolve all Instance draws by inlining their symbol's draw list
    /// at the specified offset. Recursively handles nested instances.
    fn resolve_symbols(&self, draws: &[Draw]) -> Result<Vec<Draw>, String> {
        let mut resolved = Vec::with_capacity(draws.len());
        for draw in draws {
            match draw {
                Draw::Instance { symbol, x, y, frame, scale } => {
                    let sym = self.doc.symbols.get(symbol)
                        .ok_or_else(|| format!("Undefined symbol: '{}'", symbol))?;
                    let inline_draws = self.inline_symbol(sym, *x, *y, *frame, *scale)?;
                    resolved.extend(inline_draws);
                }
                _ => resolved.push(draw.clone()),
            }
        }
        Ok(resolved)
    }

    /// Inline a symbol's draw list at the given offset.
    fn inline_symbol(&self, sym: &Symbol, ox: i32, oy: i32, frame: Option<u32>, scale: f32) -> Result<Vec<Draw>, String> {
        let sf = match frame {
            Some(idx) => sym.frames.get(idx as usize)
                .ok_or_else(|| format!("Symbol frame index {} out of range", idx))?,
            None => sym.frames.first()
                .ok_or_else(|| "Symbol has no frames".to_string())?,
        };

        let mut draws = Vec::with_capacity(sf.draws.len());
        for draw in &sf.draws {
            draws.push(self.offset_draw(draw, ox, oy, scale));
        }

        // Recursively resolve any nested instances
        self.resolve_symbols(&draws)
    }

    /// Apply a position offset and scale to a draw operation.
    fn offset_draw(&self, draw: &Draw, ox: i32, oy: i32, scale: f32) -> Draw {
        match draw {
            Draw::Rect { x, y, w, h, fill } => Draw::Rect {
                x: ( (*x as f32 + ox as f32) * scale ) as i32,
                y: ( (*y as f32 + oy as f32) * scale ) as i32,
                w: ( (*w as f32) * scale ) as u32,
                h: ( (*h as f32) * scale ) as u32,
                fill: fill.clone(),
            },
            Draw::Circle { cx, cy, r, fill } => Draw::Circle {
                cx: ( (*cx as f32 + ox as f32) * scale ) as i32,
                cy: ( (*cy as f32 + oy as f32) * scale ) as i32,
                r: ( (*r as f32) * scale ) as u32,
                fill: fill.clone(),
            },
            Draw::Line { x0, y0, x1, y1, color } => Draw::Line {
                x0: ( (*x0 as f32 + ox as f32) * scale ) as i32,
                y0: ( (*y0 as f32 + oy as f32) * scale ) as i32,
                x1: ( (*x1 as f32 + ox as f32) * scale ) as i32,
                y1: ( (*y1 as f32 + oy as f32) * scale ) as i32,
                color: color.clone(),
            },
            Draw::Text { x, y, content, color } => Draw::Text {
                x: ( (*x as f32 + ox as f32) * scale ) as i32,
                y: ( (*y as f32 + oy as f32) * scale ) as i32,
                content: content.clone(),
                color: color.clone(),
            },
            Draw::Pixel { x, y, color } => Draw::Pixel {
                x: ( (*x as f32 + ox as f32) * scale ) as i32,
                y: ( (*y as f32 + oy as f32) * scale ) as i32,
                color: color.clone(),
            },
            Draw::Instance { symbol, x, y, frame, scale: inner_scale } => Draw::Instance {
                symbol: symbol.clone(),
                x: ( (*x as f32 + ox as f32) * scale ) as i32,
                y: ( (*y as f32 + oy as f32) * scale ) as i32,
                frame: *frame,
                scale: scale * inner_scale,
            },
        }
    }

    // ── Frame Scripts ────────────────────────────────────────

    fn get_script_for_frame(&self, frame_idx: u32) -> Option<&crate::gasp::FrameScript> {
        self.doc.timeline.scripts.iter().find(|s| s.frame == frame_idx)
    }

    // ── Draw Emission ────────────────────────────────────────

    /// Emit .gasm instructions for a single draw operation.
    fn emit_draw(&self, draw: &Draw) -> Result<String, String> {
        match draw {
            Draw::Rect { x, y, w, h, fill } => {
                let color = parse_color(fill)?;
                Ok(self.expand_rect_to_psets(*x, *y, *w, *h, color))
            }
            Draw::Circle { cx, cy, r, fill } => {
                let color = parse_color(fill)?;
                Ok(self.expand_circle_to_psets(*cx, *cy, *r, color))
            }
            Draw::Line { x0, y0, x1, y1, color } => {
                let c = parse_color(color)?;
                Ok(self.expand_line_to_psets(*x0, *y0, *x1, *y1, c))
            }
            Draw::Text { x, y, content, color } => {
                let c = parse_color(color)?;
                Ok(self.expand_text_to_chars(*x, *y, content, c))
            }
            Draw::Pixel { x, y, color } => {
                let c = parse_color(color)?;
                Ok(self.expand_pixel_to_pset(*x, *y, c))
            }
            Draw::Instance { .. } => {
                // Should be resolved by now
                Err("Internal error: unresolved Instance in emit_draw".into())
            }
        }
    }

    /// Single pixel: LDI r0, x; LDI r1, y; LDI r2, color; PSET r0, r1, r2
    fn expand_pixel_to_pset(&self, x: i32, y: i32, color: u32) -> String {
        format!(
            "LDI r{}, {}\nLDI r{}, {}\nLDI r{}, 0x{:08X}\nPSET r{}, r{}, r{}\n",
            R_X, x, R_Y, y, R_COLOR, color, R_X, R_Y, R_COLOR
        )
    }

    /// Filled rectangle: two nested loops of PSET.
    ///
    /// Emits a Y-outer, X-inner loop using SUB/BNE:
    ///
    ///   LDI r_color, 0xRRGGBBAA
    ///   LDI r_ystart, y
    ///   LDI r_h, y+h        ; outer bound
    ///   LDI r_xstart, x
    ///   y_loop:
    ///     MOV r_x, r_xstart
    ///     LDI r_w, x+w      ; inner bound
    ///     x_loop:
    ///       PSET r_x, r_y, r_color
    ///       LDI r_tmp1, 1
    ///       ADD r_x, r_tmp1
    ///       BLTU r_x, r_w, x_loop
    ///     LDI r_tmp1, 1
    ///     ADD r_y, r_tmp1
    ///     BLTU r_y, r_h, y_loop
    fn expand_rect_to_psets(&self, x: i32, y: i32, w: u32, h: u32, color: u32) -> String {
        if w == 0 || h == 0 {
            return String::new();
        }

        let x_end = x + w as i32;
        let y_end = y + h as i32;

        format!(
            "LDI r{}, 0x{:08X} ; color\n\
             LDI r{}, {} ; y_start\n\
             LDI r{}, {} ; y_end\n\
             LDI r{}, {} ; x_start\n\
             y_loop:\n\
               MOV r{}, r{} ; x = x_start\n\
               LDI r{}, {} ; x_end\n\
               x_loop:\n\
                 PSET r{}, r{}, r{}\n\
                 LDI r{}, 1\n\
                 ADD r{}, r{}\n\
                 BLTU r{}, r{}, x_loop\n\
               LDI r{}, 1\n\
               ADD r{}, r{}\n\
               BLTU r{}, r{}, y_loop\n",
            // color setup
            R_COLOR, color,
            // y setup
            R_YSTART, y,
            R_H, y_end,
            R_XSTART, x,
            // y_loop body
            R_X, R_XSTART,
            R_W, x_end,
            // x_loop body
            R_X, R_Y, R_COLOR,
            R_TMP1,
            R_X, R_TMP1,
            R_X, R_W,
            // y increment
            R_TMP1,
            R_Y, R_TMP1,
            R_Y, R_H,
        )
    }

    /// Bresenham's line algorithm: emit PSET for each pixel.
    ///
    /// For Phase 1, we unroll the line as individual pixel writes.
    /// Each pixel gets its own LDI/LDI/LDI/PSET sequence. This is
    /// verbose but guaranteed correct and debuggable.
    ///
    /// For short lines this is fine. For long lines, Phase 2's LINE
    /// opcode will collapse this to a single instruction.
    fn expand_line_to_psets(&self, x0: i32, y0: i32, x1: i32, y1: i32, color: u32) -> String {
        let mut output = String::new();
        let dx = (x1 - x0).abs();
        let dy = -(y1 - y0).abs();
        let sx: i32 = if x0 < x1 { 1 } else { -1 };
        let sy: i32 = if y0 < y1 { 1 } else { -1 };
        let mut err = dx + dy;
        let mut cx = x0;
        let mut cy = y0;

        loop {
            // Emit single pixel
            output.push_str(&format!(
                "LDI r{}, {}\nLDI r{}, {}\nLDI r{}, 0x{:08X}\nPSET r{}, r{}, r{}\n",
                R_X, cx, R_Y, cy, R_COLOR, color, R_X, R_Y, R_COLOR
            ));

            if cx == x1 && cy == y1 {
                break;
            }
            let e2 = 2 * err;
            if e2 >= dy {
                err += dy;
                cx += sx;
            }
            if e2 <= dx {
                err += dx;
                cy += sy;
            }

            // Safety: prevent infinite loop on degenerate cases
            if (cx - x0).unsigned_abs() > 65536 || (cy - y0).unsigned_abs() > 65536 {
                break;
            }
        }

        output
    }

    /// Midpoint circle algorithm: emit filled circle as PSETs.
    ///
    /// Draws horizontal scan lines for each row of the circle.
    fn expand_circle_to_psets(&self, cx: i32, cy: i32, r: u32, color: u32) -> String {
        if r == 0 {
            return self.expand_pixel_to_pset(cx, cy, color);
        }

        let mut output = String::new();
        let r = r as i32;
        let mut x = r;
        let mut y = 0i32;
        let mut d = 1 - r;

        while x >= y {
            // Draw 4 horizontal scan lines for this octant pair
            for &(sx, sy) in &[
                ( cx + x, cy + y),
                ( cx - x, cy + y),
                ( cx + x, cy - y),
                ( cx - x, cy - y),
            ] {
                // Horizontal line from (cx-y, sy) to (cx+y, sy) -- but only
                // for the "wide" spans. Actually, let's do the simple thing:
                // for each of the 8 octant points, draw a horizontal line.
                output.push_str(&self.expand_line_to_psets(sx, sy, cx + y, sy, color));
            }

            // Also draw the "corner" spans
            for &(sx, sy) in &[
                (cx + y, cy + x),
                (cx - y, cy + x),
                (cx + y, cy - x),
                (cx - y, cy - x),
            ] {
                output.push_str(&self.expand_line_to_psets(cx - x, sy, cx + x, sy, color));
            }

            y += 1;
            if d <= 0 {
                d += 2 * y + 1;
            } else {
                x -= 1;
                d += 2 * (y - x) + 1;
            }
        }

        output
    }

    /// Text: emit CHAR sequences for each character.
    ///
    /// The CHAR opcode blits an 8x8 glyph from the font atlas.
    /// We advance the x cursor by 8 pixels per character.
    fn expand_text_to_chars(&self, x: i32, y: i32, content: &str, color: u32) -> String {
        let mut output = String::new();

        // Set up color (CHAR doesn't use color directly -- it copies bitmap --
        // but for Phase 1 we use PSET-based rendering so color matters)
        output.push_str(&format!("LDI r{}, 0x{:08X} ; text color\n", R_COLOR, color));

        for (i, ch) in content.chars().enumerate() {
            let char_x = x + (i as i32) * 8;
            let ascii = ch as u32;

            // Load character code and target position, then CHAR
            output.push_str(&format!(
                "LDI r{}, {} ; char '{}'\n\
                 LDI r{}, {}\n\
                 LDI r{}, {}\n\
                 CHAR r{}, r{}\n",
                R_CHAR, ascii, ch,
                R_X, char_x,
                R_Y, y,
                R_CHAR, R_Y,
            ));
        }

        output
    }
}

// ── Math Helpers ─────────────────────────────────────────────

fn lerp_i32(a: i32, b: i32, t: f64) -> i32 {
    (a as f64 + (b as f64 - a as f64) * t).round() as i32
}

fn lerp_u32(a: u32, b: u32, t: f64) -> u32 {
    (a as f64 + (b as f64 - a as f64) * t).round() as u32
}

fn lerp_f32(a: f32, b: f32, t: f64) -> f32 {
    (a as f64 + (b as f64 - a as f64) * t) as f32
}

/// Interpolate between two hex color strings.
fn lerp_color_str(a: &str, b: &str, t: f64) -> String {
    let ca = parse_color(a).unwrap_or(0xFFFFFFFF);
    let cb = parse_color(b).unwrap_or(0xFFFFFFFF);
    let cr = lerp_u8((ca & 0xFF) as u8, (cb & 0xFF) as u8, t);
    let cg = lerp_u8(((ca >> 8) & 0xFF) as u8, ((cb >> 8) & 0xFF) as u8, t);
    let cbl = lerp_u8(((ca >> 16) & 0xFF) as u8, ((cb >> 16) & 0xFF) as u8, t);
    let cal = lerp_u8(((ca >> 24) & 0xFF) as u8, ((cb >> 24) & 0xFF) as u8, t);
    format!("#{:02X}{:02X}{:02X}{:02X}", cr, cg, cbl, cal)
}

fn lerp_u8(a: u8, b: u8, t: f64) -> u8 {
    (a as f64 + (b as f64 - a as f64) * t).round() as u8
}

// ── Tests ────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    fn make_simple_doc() -> GaspDoc {
        let yaml = r##"
name: "Test"
canvas: { width: 128, height: 128 }
timeline:
  layers:
    - name: "BG"
      keyframes:
        - frame: 0
          draws:
            - type: rect
              x: 0
              y: 0
              w: 64
              h: 64
              fill: "#FF0000"
        - frame: 5
          tween: "linear"
          draws:
            - type: rect
              x: 64
              y: 64
              w: 64
              h: 64
              fill: "#0000FF"
"##;
        crate::gasp::parse_gasp(yaml).unwrap()
    }

    #[test]
    fn test_compile_minimal() {
        let doc = make_simple_doc();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Should have 6 frames (0 through 5)
        assert!(output.contains(".frame \"0\""));
        assert!(output.contains(".frame \"5\""));
        // Should have frame separators
        assert!(output.contains("---"));
        // Each frame should have HALT
        assert_eq!(output.matches("HALT").count(), 6);
    }

    #[test]
    fn test_tween_linear_rect() {
        let doc = make_simple_doc();
        let compiler = GaspCompiler::new(doc);

        // Frame 0: x=0, y=0
        let layer = &compiler.doc.timeline.layers[0];
        let draws_0 = compiler.interpolate_layer_at(layer, 0);
        assert_eq!(draws_0.len(), 1);
        match &draws_0[0] {
            Draw::Rect { x, y, .. } => {
                assert_eq!(*x, 0);
                assert_eq!(*y, 0);
            }
            _ => panic!("Expected Rect"),
        }

        // Frame 3 between kf 0 and kf 5: t = 3/5 = 0.6, lerp(0,64,0.6) = 38
        let draws_3 = compiler.interpolate_layer_at(layer, 3);
        match &draws_3[0] {
            Draw::Rect { x, y, .. } => {
                assert_eq!(*x, 38);
                assert_eq!(*y, 38);
            }
            _ => panic!("Expected Rect"),
        }

        // Frame 5: x=64, y=64
        let draws_5 = compiler.interpolate_layer_at(layer, 5);
        match &draws_5[0] {
            Draw::Rect { x, y, .. } => {
                assert_eq!(*x, 64);
                assert_eq!(*y, 64);
            }
            _ => panic!("Expected Rect"),
        }
    }

    #[test]
    fn test_tween_easing() {
        let yaml = r##"
name: "Ease Test"
timeline:
  layers:
    - name: "obj"
      keyframes:
        - frame: 0
          tween: "ease-in"
          draws:
            - type: pixel
              x: 0
              y: 0
              color: "#FFFFFF"
        - frame: 10
          draws:
            - type: pixel
              x: 100
              y: 0
              color: "#FFFFFF"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let layer = &compiler.doc.timeline.layers[0];

        // At frame 5 (t=0.5), ease-in: t^2 = 0.25, so x = 0 + (100-0)*0.25 = 25
        let draws = compiler.interpolate_layer_at(layer, 5);
        match &draws[0] {
            Draw::Pixel { x, .. } => assert_eq!(*x, 25),
            _ => panic!("Expected Pixel"),
        }
    }

    #[test]
    fn test_symbol_resolution() {
        let yaml = r##"
name: "Symbol Test"
symbols:
  dot:
    frames:
      - name: "main"
        draws:
          - type: pixel
            x: 0
            y: 0
            color: "#FF0000"
timeline:
  layers:
    - name: "main"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: "dot"
              x: 50
              y: 60
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // The symbol should be inlined at offset (50, 60)
        assert!(output.contains("LDI r0, 50"));
        assert!(output.contains("LDI r1, 60"));
        assert!(output.contains("PSET"));
    }

    #[test]
    fn test_empty_timeline() {
        let yaml = r##"
name: "Empty"
timeline:
  layers:
    - name: "bg"
      keyframes: []
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let result = compiler.compile();
        assert!(result.is_err());
    }

    #[test]
    fn test_no_tween_hold() {
        let yaml = r##"
name: "Hold Test"
timeline:
  layers:
    - name: "obj"
      keyframes:
        - frame: 0
          draws:
            - type: pixel
              x: 10
              y: 20
              color: "#FFFFFF"
        - frame: 5
          draws:
            - type: pixel
              x: 50
              y: 60
              color: "#FFFFFF"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let layer = &compiler.doc.timeline.layers[0];

        // No tween on kf0: frames 1-4 should hold kf0's values
        let draws = compiler.interpolate_layer_at(layer, 3);
        match &draws[0] {
            Draw::Pixel { x, y, .. } => {
                assert_eq!(*x, 10);
                assert_eq!(*y, 20);
            }
            _ => panic!("Expected Pixel"),
        }

        // Frame 5 should be kf1
        let draws5 = compiler.interpolate_layer_at(layer, 5);
        match &draws5[0] {
            Draw::Pixel { x, y, .. } => {
                assert_eq!(*x, 50);
                assert_eq!(*y, 60);
            }
            _ => panic!("Expected Pixel"),
        }
    }

    #[test]
    fn test_color_interpolation() {
        let a = "#FF0000";
        let b = "#0000FF";
        // t=0.5 should give #800080
        let mid = lerp_color_str(a, b, 0.5);
        assert_eq!(mid, "#800080FF"); // R=0x80 G=0x00 B=0x80 A=0xFF
        // Let me just check it's between
        assert!(mid.starts_with('#'));
    }

    #[test]
    fn test_emit_pixel() {
        let compiler = GaspCompiler::new(GaspDoc {
            name: "test".into(),
            version: 1,
            canvas: Canvas { width: 64, height: 64 },
            symbols: Default::default(),
            timeline: Timeline::default(),
        });
        let out = compiler.expand_pixel_to_pset(10, 20, 0x0000FFFF);
        assert!(out.contains("LDI r0, 10"));
        assert!(out.contains("LDI r1, 20"));
        assert!(out.contains("PSET"));
    }

    #[test]
    fn test_emit_rect() {
        let compiler = GaspCompiler::new(GaspDoc {
            name: "test".into(),
            version: 1,
            canvas: Canvas { width: 64, height: 64 },
            symbols: Default::default(),
            timeline: Timeline::default(),
        });
        let out = compiler.expand_rect_to_psets(5, 10, 3, 2, 0xFF0000FF);
        assert!(out.contains("y_loop:"));
        assert!(out.contains("x_loop:"));
        assert!(out.contains("PSET"));
        assert!(out.contains("BLTU"));
    }

    #[test]
    fn test_emit_line() {
        let compiler = GaspCompiler::new(GaspDoc {
            name: "test".into(),
            version: 1,
            canvas: Canvas { width: 64, height: 64 },
            symbols: Default::default(),
            timeline: Timeline::default(),
        });
        let out = compiler.expand_line_to_psets(0, 0, 5, 0, 0xFFFFFFFF);
        // Horizontal line of 6 pixels
        assert_eq!(out.matches("PSET").count(), 6);
    }

    #[test]
    fn test_emit_text() {
        let compiler = GaspCompiler::new(GaspDoc {
            name: "test".into(),
            version: 1,
            canvas: Canvas { width: 64, height: 64 },
            symbols: Default::default(),
            timeline: Timeline::default(),
        });
        let out = compiler.expand_text_to_chars(10, 20, "AB", 0xFFFFFFFF);
        assert!(out.contains("CHAR"));
        assert!(out.contains("65")); // 'A'
        assert!(out.contains("66")); // 'B'
    }

    #[test]
    fn test_filmstrip_format() {
        let yaml = r##"
name: "Format Test"
timeline:
  layers:
    - name: "bg"
      keyframes:
        - frame: 0
          draws:
            - type: pixel
              x: 1
              y: 1
              color: "#FFFFFF"
        - frame: 1
          draws:
            - type: pixel
              x: 2
              y: 2
              color: "#FFFFFF"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Should have exactly one "---" separator between 2 frames
        assert_eq!(output.matches("---").count(), 1);
        assert!(output.contains(".frame \"0\""));
        assert!(output.contains(".frame \"1\""));
    }
}
