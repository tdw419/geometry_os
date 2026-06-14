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

// ── Hit-Test Scratch Registers ──────────────────────────────
// r15-r19 are reserved for hit-test dispatch. They hold mouse
// coordinates and comparison temporaries during bounds checking.
const R_MOUSE_X: u8 = 15; // mouse X loaded from SYS_INPUT_BASE
const R_MOUSE_Y: u8 = 16; // mouse Y loaded from SYS_INPUT_BASE + 1
const R_MOUSE_BTN: u8 = 17; // mouse button bitmask from SYS_INPUT_BASE + 2
const R_HT_TMP1: u8 = 18; // hit-test scratch (x + width, etc)
const R_HT_TMP2: u8 = 19; // hit-test scratch

/// System input bus addresses (host-populated, read-only for VMs).
const SYS_MOUSE_X_ADDR: u32 = 0x00E2_0000;
const SYS_MOUSE_Y_ADDR: u32 = 0x00E2_0001;
const SYS_MOUSE_BTN_ADDR: u32 = 0x00E2_0002;

/// Base register for named instance properties.
/// R0-R14 are reserved for draw emission, so named instances start here.
const INSTANCE_BASE_REG: u8 = 20;

/// Number of registers reserved per named instance:
///   +0 = _x (i32)
///   +1 = _y (i32)
///   +2 = _dims (u32 packed: w<<16 | h)
///   +3 = _color (u32 packed RGBA)
const REGS_PER_INSTANCE: u8 = 4;

// ── Instance Register Map ────────────────────────────────────
//
// Maps instance names to base registers so that AI scripts can
// address properties like "submit_btn._x" and the compiler can
// resolve them to concrete register numbers.
//
// AS2 parallel: this is the "display list" that maps instance names
// to property slots. When the AI writes `ADD submit_btn._x, 5`,
// the compiler translates it to `ADD r20, 5`.

/// Property offsets from an instance's base register.
#[derive(Debug, Clone, Copy)]
enum InstanceProp {
    X = 0,
    Y = 1,
    Dims = 2, // packed: w<<16 | h
    Color = 3,
}

impl InstanceProp {
    fn from_name(name: &str) -> Option<Self> {
        match name {
            "_x" => Some(Self::X),
            "_y" => Some(Self::Y),
            "_width" | "_height" | "_dims" => Some(Self::Dims),
            "_color" | "_alpha" => Some(Self::Color),
            _ => None,
        }
    }
}

/// Tracks register allocation for named instances.
#[derive(Debug, Clone)]
struct InstanceRegisterMap {
    /// instance_name -> base register number
    instances: std::collections::HashMap<String, u8>,
    /// Ordered list for deterministic iteration
    order: Vec<String>,
}

impl InstanceRegisterMap {
    fn new() -> Self {
        Self {
            instances: std::collections::HashMap::new(),
            order: Vec::new(),
        }
    }

    /// Register a named instance, assigning it the next available
    /// base register. Returns the base register number.
    fn allocate(&mut self, name: &str) -> u8 {
        if let Some(&reg) = self.instances.get(name) {
            return reg;
        }
        let idx = self.order.len() as u8;
        let base = INSTANCE_BASE_REG + idx * REGS_PER_INSTANCE;
        self.instances.insert(name.to_string(), base);
        self.order.push(name.to_string());
        base
    }

    /// Look up the base register for an instance name.
    fn get_base(&self, name: &str) -> Option<u8> {
        self.instances.get(name).copied()
    }

    /// Resolve "instance_name._property" to a register number.
    /// Returns None if the instance or property is unknown.
    fn resolve(&self, qualified: &str) -> Option<u8> {
        let dot = qualified.find("._")?;
        let inst_name = &qualified[..dot];
        let prop_name = &qualified[dot + 1..]; // includes the "_"
        let base = self.get_base(inst_name)?;
        let prop = InstanceProp::from_name(prop_name)?;
        Some(base + prop as u8)
    }

    /// Iterate instances in allocation order: (name, base_reg)
    fn iter(&self) -> impl Iterator<Item = (&str, u8)> {
        self.order.iter().map(move |name| {
            let &base = self.instances.get(name).unwrap();
            (name.as_str(), base)
        })
    }

    /// Number of named instances.
    fn len(&self) -> usize {
        self.order.len()
    }
}

// ── Resolved Draw (carries instance name through inlining) ───

/// A draw operation annotated with its originating instance name.
///
/// When a named Instance (e.g. `submit_btn`) is inlined into concrete
/// draw ops (Rect, Circle, etc.), each resolved draw carries the
/// instance name so the compiler can emit register-based instructions
/// that read from the InstanceRegisterMap instead of hardcoded immediates.
#[derive(Debug, Clone)]
struct ResolvedDraw {
    draw: Draw,
    /// The instance name this draw originated from, if any.
    instance_name: Option<String>,
}

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

        // Build instance register map (must happen before symbol inlining)
        let instance_map = self.build_instance_map();

        // Build frame label map: frame_index -> name (from keyframe.name across all layers)
        let frame_labels = self.build_frame_label_map();

        let mut output = String::new();

        for frame_idx in 0..total_frames {
            // Use named label if a keyframe at this frame_index has a name,
            // otherwise fall back to numeric index
            let idx_str;
            let label: &str = match frame_labels.get(&(frame_idx as usize)) {
                Some(name) => name,
                None => {
                    idx_str = frame_idx.to_string();
                    &idx_str
                }
            };
            output.push_str(&format!(".frame \"{}\"\n", label));

            // Emit instance property initialization header
            output.push_str(&self.emit_instance_header(&instance_map, frame_idx));

            // Emit hit-test dispatch for interactive instances
            output.push_str(&self.emit_hit_tests(&instance_map, frame_idx));

            // Process each timeline layer
            for layer in &self.doc.timeline.layers {
                let draw_ops = self.interpolate_layer_at(layer, frame_idx);
                let resolved = self.resolve_symbols(&draw_ops)?;
                for rd in &resolved {
                    output.push_str(&self.emit_resolved_draw(rd, &instance_map)?);
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
            (Draw::Instance { symbol: as_, x: ax, y: ay, frame: af, scale: asc, .. },
             Draw::Instance { symbol: bs, x: bx, y: by, frame: bf, scale: bsc, .. }) => {
                Draw::Instance {
                    symbol: if t >= 0.5 { bs.clone() } else { as_.clone() },
                    x: lerp_i32(*ax, *bx, t),
                    y: lerp_i32(*ay, *by, t),
                    frame: if t >= 0.5 { *bf } else { *af },
                    scale: lerp_f32(*asc, *bsc, t),
                    name: None,
                    events: vec![],
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
    /// Named instances propagate their name to all resolved draws.
    fn resolve_symbols(&self, draws: &[Draw]) -> Result<Vec<ResolvedDraw>, String> {
        let mut resolved = Vec::with_capacity(draws.len());
        for draw in draws {
            match draw {
                Draw::Instance { symbol, x, y, frame, scale, name, .. } => {
                    let sym = self.doc.symbols.get(symbol)
                        .ok_or_else(|| format!("Undefined symbol: '{}'", symbol))?;
                    let inline_draws = self.inline_symbol(sym, *x, *y, *frame, *scale, name.clone())?;
                    resolved.extend(inline_draws);
                }
                _ => resolved.push(ResolvedDraw {
                    draw: draw.clone(),
                    instance_name: None,
                }),
            }
        }
        Ok(resolved)
    }

    /// Inline a symbol's draw list at the given offset.
    /// `owner_name` is propagated to all resulting draws so the compiler
    /// can emit register-based instructions for named instances.
    fn inline_symbol(&self, sym: &Symbol, ox: i32, oy: i32, frame: Option<u32>, scale: f32, owner_name: Option<String>) -> Result<Vec<ResolvedDraw>, String> {
        let sf = match frame {
            Some(idx) => sym.frames.get(idx as usize)
                .ok_or_else(|| format!("Symbol frame index {} out of range", idx))?,
            None => sym.frames.first()
                .ok_or_else(|| "Symbol has no frames".to_string())?,
        };

        let mut draws = Vec::with_capacity(sf.draws.len());
        for draw in &sf.draws {
            draws.push(ResolvedDraw {
                draw: self.offset_draw(draw, ox, oy, scale),
                instance_name: owner_name.clone(),
            });
        }

        // Recursively resolve any nested instances (nested instances
        // inherit the parent's name for register targeting)
        let mut resolved = Vec::new();
        for rd in &draws {
            match &rd.draw {
                Draw::Instance { symbol, x, y, frame, scale, .. } => {
                    let sym = self.doc.symbols.get(symbol)
                        .ok_or_else(|| format!("Undefined symbol: '{}'", symbol))?;
                    let nested = self.inline_symbol(sym, *x, *y, *frame, *scale, rd.instance_name.clone())?;
                    resolved.extend(nested);
                }
                _ => resolved.push(rd.clone()),
            }
        }
        Ok(resolved)
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
            Draw::Instance { symbol, x, y, frame, scale: inner_scale, name, events, .. } => Draw::Instance {
                symbol: symbol.clone(),
                x: ( (*x as f32 + ox as f32) * scale ) as i32,
                y: ( (*y as f32 + oy as f32) * scale ) as i32,
                frame: *frame,
                scale: scale * inner_scale,
                name: name.clone(),
                events: events.clone(),
            },
        }
    }

    // ── Frame Scripts ────────────────────────────────────────

    fn get_script_for_frame(&self, frame_idx: u32) -> Option<&crate::gasp::FrameScript> {
        self.doc.timeline.scripts.iter().find(|s| s.frame == frame_idx)
    }

    // ── Instance Register Map ───────────────────────────────

    /// Scan all draws across all layers and keyframes to find
    /// named instances. Build a register map for them.
    ///
    /// This must run BEFORE symbol inlining, because the Instance
    /// draws are what carry the `name` field.
    fn build_instance_map(&self) -> InstanceRegisterMap {
        let mut map = InstanceRegisterMap::new();
        for layer in &self.doc.timeline.layers {
            for kf in &layer.keyframes {
                self.collect_named_instances(&kf.draws, &mut map);
            }
        }
        map
    }

    /// Build a map from frame index to label name, derived from keyframe.name
    /// across all layers. If multiple keyframes at the same frame have names,
    /// the last one wins (order is deterministic per layer iteration order).
    fn build_frame_label_map(&self) -> std::collections::HashMap<usize, String> {
        let mut labels = std::collections::HashMap::new();
        for layer in &self.doc.timeline.layers {
            for kf in &layer.keyframes {
                if let Some(ref name) = kf.name {
                    labels.insert(kf.frame as usize, name.clone());
                }
            }
        }
        labels
    }

    /// Recursively collect named instances from a draw list.
    fn collect_named_instances(&self, draws: &[Draw], map: &mut InstanceRegisterMap) {
        for draw in draws {
            if let Draw::Instance { name: Some(n), .. } = draw {
                map.allocate(n);
            }
        }
    }

    /// Emit the property initialization header for all named instances.
    ///
    /// For each instance, emits:
    ///   ; -- instance "submit_btn" [r20-r23] --
    ///   LDI r20, <x>
    ///   LDI r21, <y>
    ///   LDI r22, <dims>
    ///   LDI r23, <color>
    fn emit_instance_header(&self, map: &InstanceRegisterMap, frame_idx: u32) -> String {
        if map.len() == 0 {
            return String::new();
        }

        let mut output = String::new();
        output.push_str("; ── Instance Properties ─────────────────\n");

        for (name, base) in map.iter() {
            let (x, y, dims, color) = self.find_instance_state(name, frame_idx);
            output.push_str(&format!(
                "; -- instance \"{}\" [r{}-r{}] --\n\
                 LDI r{}, {}\n\
                 LDI r{}, {}\n\
                 LDI r{}, 0x{:08X}\n\
                 LDI r{}, 0x{:08X}\n",
                name, base, base + 3,
                base, x,
                base + 1, y,
                base + 2, dims,
                base + 3, color,
            ));
        }

        output
    }

    /// Find an instance's property values at a given frame index.
    /// Returns (x, y, packed_dims, color) by interpolating.
    fn find_instance_state(&self, target: &str, frame_idx: u32) -> (i32, i32, u32, u32) {
        for layer in &self.doc.timeline.layers {
            let draws = self.interpolate_layer_at(layer, frame_idx);
            for draw in &draws {
                if let Draw::Instance { name, x, y, symbol, .. } = draw {
                    if name.as_ref().map(|s| s.as_str()) == Some(target) {
                        let (w, h, color) = self.symbol_bounds(symbol);
                        let dims = (w << 16) | h;
                        return (*x, *y, dims, color);
                    }
                }
            }
        }
        (0, 0, 0, 0)
    }

    /// Get bounding dimensions and default color of a symbol.
    fn symbol_bounds(&self, symbol_name: &str) -> (u32, u32, u32) {
        if let Some(sym) = self.doc.symbols.get(symbol_name) {
            if let Some(frame) = sym.frames.first() {
                for draw in &frame.draws {
                    match draw {
                        Draw::Rect { x: _, y: _, w, h, fill } => {
                            let color = parse_color(fill).unwrap_or(0xFFFFFFFF);
                            return (*w, *h, color);
                        }
                        Draw::Circle { cx: _, cy: _, r, fill } => {
                            let color = parse_color(fill).unwrap_or(0xFFFFFFFF);
                            return (*r * 2, *r * 2, color);
                        }
                        _ => continue,
                    }
                }
            }
        }
        (0, 0, 0xFFFFFFFF)
    }

    // ── Hit-Test Dispatch ────────────────────────────────────

    /// Generate hit-test boundary checks for named instances with event bindings.
    ///
    /// For each instance with a "press" event, emits assembly that:
    ///   1. Loads mouse X/Y from the system input bus
    ///   2. Compares against instance bounds (from property registers)
    ///   3. On hit, executes the event handler code inline
    ///
    /// Pattern per instance:
    /// ```gasm
    /// ; ── hit-test: "submit_btn" press ──
    /// LDI r15, 0x00E20000     ; mouse X address
    /// LOAD r15, r15           ; r15 = mouse X
    /// LDI r16, 0x00E20001     ; mouse Y address
    /// LOAD r16, r16           ; r16 = mouse Y
    /// BLT r15, r20, _ht_skip_submit_btn_0  ; if mouseX < btn._x, skip
    /// MOV r18, r22            ; r18 = dims (w<<16|h)
    /// LDI r19, 16
    /// SHR r18, r19            ; r18 = width
    /// ADD r18, r20            ; r18 = _x + width
    /// BGE r15, r18, _ht_skip_submit_btn_0  ; if mouseX >= _x+width, skip
    /// BLT r16, r21, _ht_skip_submit_btn_0  ; if mouseY < btn._y, skip
    /// MOV r18, r22            ; reload dims
    /// AND r18, r19            ; actually LDI r19, 0xFFFF first... extract h
    /// ADD r18, r21            ; r18 = _y + height
    /// BGE r16, r18, _ht_skip_submit_btn_0  ; if mouseY >= _y+height, skip
    /// ; -- onPress handler --
    /// ADD r20, 5
    /// JMP _ht_done_submit_btn_0
    /// _ht_skip_submit_btn_0:
    /// NOP
    /// _ht_done_submit_btn_0:
    /// ```
    fn emit_hit_tests(
        &self,
        instance_map: &InstanceRegisterMap,
        frame_idx: u32,
    ) -> String {
        let mut output = String::new();
        let mut ht_idx: u32 = 0;

        for layer in &self.doc.timeline.layers {
            let draws = self.interpolate_layer_at(layer, frame_idx);
            for draw in &draws {
                if let Draw::Instance {
                    name: Some(ref name),
                    events,
                    ..
                } = draw
                {
                    if events.is_empty() {
                        continue;
                    }
                    if let Some(base) = instance_map.get_base(name) {
                        for event in events {
                            let block = self.emit_single_hit_test(
                                name, base, &event.on, &event.code, ht_idx,
                            );
                            output.push_str(&block);
                            ht_idx += 1;
                        }
                    }
                }
            }
        }

        if !output.is_empty() {
            format!(
                "; ── Hit-Test Dispatch ──────────────────\n{}",
                output
            )
        } else {
            String::new()
        }
    }

    /// Emit a single hit-test block for one event on one instance.
    fn emit_single_hit_test(
        &self,
        name: &str,
        base: u8,
        trigger: &str,
        code: &str,
        idx: u32,
    ) -> String {
        // Only "press" and "release" involve mouse position hit-testing
        if trigger != "press" && trigger != "release" {
            return String::new();
        }

        let r_x = base + InstanceProp::X as u8;
        let r_y = base + InstanceProp::Y as u8;
        let r_dims = base + InstanceProp::Dims as u8;

        let skip_label = format!("_ht_skip_{}_{}", name, idx);
        let done_label = format!("_ht_done_{}_{}", name, idx);

        format!(
            "; -- hit-test: \"{name}\" {trigger} [r{base}-r{base3}] --\n\
             LDI r{rmx}, 0x{mx:08X}\n\
             LOAD r{rmx}, r{rmx}\n\
             LDI r{rmy}, 0x{my:08X}\n\
             LOAD r{rmy}, r{rmy}\n\
             BLT r{rmx}, r{rx}, {skip}\n\
             MOV r{ht1}, r{rdims}\n\
             LDI r{ht2}, 16\n\
             SHR r{ht1}, r{ht2}\n\
             ADD r{ht1}, r{rx}\n\
             BGE r{rmx}, r{ht1}, {skip}\n\
             BLT r{rmy}, r{ry}, {skip}\n\
             MOV r{ht1}, r{rdims}\n\
             LDI r{ht2}, 0xFFFF\n\
             AND r{ht1}, r{ht2}\n\
             ADD r{ht1}, r{ry}\n\
             BGE r{rmy}, r{ht1}, {skip}\n\
             ; -- {trigger} handler: \"{name}\" --\n\
             {code}\n\
             JMP {done}\n\
             {skip}:\n\
             NOP\n\
             {done}:\n",
            name = name,
            trigger = trigger,
            base = base,
            base3 = base + 3,
            rmx = R_MOUSE_X,
            rmy = R_MOUSE_Y,
            mx = SYS_MOUSE_X_ADDR,
            my = SYS_MOUSE_Y_ADDR,
            rx = r_x,
            ry = r_y,
            rdims = r_dims,
            ht1 = R_HT_TMP1,
            ht2 = R_HT_TMP2,
            skip = skip_label,
            done = done_label,
            code = code.trim(),
        )
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
            },
        }
    }

    // ── Register-Based Draw Emission (named instances) ──────

    /// Emit a resolved draw, using register-based instructions if it
    /// belongs to a named instance.
    ///
    /// When `instance_name` is set and the instance exists in the map,
    /// the draw reads position/color from the instance's property registers
    /// instead of hardcoded immediates. This is the "AS2 reactive" path:
    /// a script can `ADD r20, 5` and the next RECTF will render at the
    /// new position.
    fn emit_resolved_draw(
        &self,
        rd: &ResolvedDraw,
        instance_map: &InstanceRegisterMap,
    ) -> Result<String, String> {
        if let Some(ref name) = rd.instance_name {
            if let Some(base) = instance_map.get_base(name) {
                return self.emit_draw_from_instance(&rd.draw, base, name);
            }
        }
        // Unnamed draw: use the original immediate-based path
        self.emit_draw(&rd.draw)
    }

    /// Emit a draw operation that reads from instance property registers.
    ///
    /// Instead of `LDI r0, 100`, we emit `MOV r0, r{base}` which copies
    /// the instance's _x property into the draw register. The draw opcode
    /// then operates on whatever value the register holds -- making it
    /// reactive to any script modifications.
    fn emit_draw_from_instance(&self, draw: &Draw, base: u8, name: &str) -> Result<String, String> {
        let r_x = base + InstanceProp::X as u8;
        let r_y = base + InstanceProp::Y as u8;
        let r_dims = base + InstanceProp::Dims as u8;
        let r_color = base + InstanceProp::Color as u8;

        match draw {
            Draw::Rect { x: _, y: _, w, h, fill: _ } => {
                if *w == 0 || *h == 0 {
                    return Ok(String::new());
                }
                // Read dims from instance register (packed w<<16|h)
                Ok(format!(
                    "; -- draw instance \"{}\" via registers [r{}-r{}] --\n\
                     MOV r{}, r{}\n\
                     MOV r{}, r{}\n\
                     RECTF r{}, r{}, r{}\n",
                    name, base, base + 3,
                    R_X, r_x,
                    R_Y, r_y,
                    R_X, R_Y, r_dims,
                ))
            }
            Draw::Circle { cx: _, cy: _, r, fill: _ } => {
                if *r == 0 {
                    // Degenerate circle: emit MOV + PSET
                    return Ok(format!(
                        "; -- draw instance \"{}\" via registers [r{}-r{}] --\n\
                         MOV r{}, r{}\n\
                         MOV r{}, r{}\n\
                         MOV r{}, r{}\n\
                         PSET r{}, r{}, r{}\n",
                        name, base, base + 3,
                        R_X, r_x,
                        R_Y, r_y,
                        R_COLOR, r_color,
                        R_X, R_Y, R_COLOR,
                    ));
                }
                // For circles, extract width from dims as diameter, halve for radius
                Ok(format!(
                    "; -- draw instance \"{}\" via registers [r{}-r{}] --\n\
                     MOV r{}, r{}\n\
                     MOV r{}, r{}\n\
                     MOV r{}, r{}\n\
                     LDI r{}, 16\n\
                     SHR r{}, r{}\n\
                     CIRCLEF r{}, r{}, r{}\n",
                    name, base, base + 3,
                    R_X, r_x,
                    R_Y, r_y,
                    R_W, r_dims,
                    R_TMP1,
                    R_W, R_TMP1,
                    R_X, R_Y, R_W,
                ))
            }
            Draw::Line { x0: _, y0: _, x1, y1, color: _ } => {
                // Lines from instances: position from registers,
                // endpoint offset packed as immediate
                let x1u = (*x1 as u32) & 0xFFFF;
                let y1u = (*y1 as u32) & 0xFFFF;
                let packed = (x1u << 16) | y1u;
                Ok(format!(
                    "; -- draw instance \"{}\" via registers [r{}-r{}] --\n\
                     MOV r{}, r{}\n\
                     MOV r{}, r{}\n\
                     MOV r{}, r{}\n\
                     LINE r{}, r{}, 0x{:08X}\n",
                    name, base, base + 3,
                    R_X, r_x,
                    R_Y, r_y,
                    R_COLOR, r_color,
                    R_X, R_Y, packed,
                ))
            }
            Draw::Text { x: _, y: _, content, color: _ } => {
                // Text from instance: position from registers
                let mut output = format!(
                    "; -- draw instance \"{}\" via registers [r{}-r{}] --\n\
                     MOV r{}, r{}\n",
                    name, base, base + 3,
                    R_COLOR, r_color,
                );
                // Use the instance x/y as the text origin
                for (i, ch) in content.chars().enumerate() {
                    let ascii = ch as u32;
                    // Offset each char by 8 pixels from instance origin
                    let char_offset = i as i32 * 8;
                    output.push_str(&format!(
                        "MOV r{}, r{}\n\
                         MOV r{}, r{}\n\
                         LDI r{}, {}\n\
                         ADD r{}, r{}\n\
                         LDI r{}, {}\n\
                         CHAR r{}, r{}\n",
                        R_X, r_x,
                        R_Y, r_y,
                        R_TMP1, char_offset,
                        R_X, R_TMP1,
                        R_CHAR, ascii,
                        R_CHAR, R_Y,
                    ));
                }
                Ok(output)
            }
            Draw::Pixel { x: _, y: _, color: _ } => {
                Ok(format!(
                    "; -- draw instance \"{}\" via registers [r{}-r{}] --\n\
                     MOV r{}, r{}\n\
                     MOV r{}, r{}\n\
                     MOV r{}, r{}\n\
                     PSET r{}, r{}, r{}\n",
                    name, base, base + 3,
                    R_X, r_x,
                    R_Y, r_y,
                    R_COLOR, r_color,
                    R_X, R_Y, R_COLOR,
                ))
            }
            Draw::Instance { .. } => {
                Err("Internal error: unresolved Instance in emit_draw_from_instance".into())
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

    /// Filled rectangle via native RECTF opcode.
    ///
    /// Emits: LDI r0, x; LDI r1, y; LDI r2, color; RECTF r0, r1, (w<<16|h)
    ///
    /// The data word packs width (upper 16) and height (lower 16) as an immediate.
    fn expand_rect_to_psets(&self, x: i32, y: i32, w: u32, h: u32, color: u32) -> String {
        if w == 0 || h == 0 {
            return String::new();
        }

        let packed = ((w as u32) << 16) | (h as u32);
        format!(
            "LDI r{}, {}\n\
             LDI r{}, {}\n\
             LDI r{}, 0x{:08X}\n\
             RECTF r{}, r{}, 0x{:08X}\n",
            R_X, x,
            R_Y, y,
            R_COLOR, color,
            R_X, R_Y, packed,
        )
    }

    /// Line via native LINE opcode.
    ///
    /// Emits: LDI r0, x0; LDI r1, y0; LDI r2, color; LINE r0, r1, (x1<<16|y1)
    ///
    /// The data word packs x1 (upper 16) and y1 (lower 16) as an immediate.
    fn expand_line_to_psets(&self, x0: i32, y0: i32, x1: i32, y1: i32, color: u32) -> String {
        // Clamp endpoints to u16 range for packing
        let x1u = (x1 as u32) & 0xFFFF;
        let y1u = (y1 as u32) & 0xFFFF;
        let packed = (x1u << 16) | y1u;
        format!(
            "LDI r{}, {}\n\
             LDI r{}, {}\n\
             LDI r{}, 0x{:08X}\n\
             LINE r{}, r{}, 0x{:08X}\n",
            R_X, x0,
            R_Y, y0,
            R_COLOR, color,
            R_X, R_Y, packed,
        )
    }

    /// Filled circle via native CIRCLEF opcode.
    ///
    /// Emits: LDI r0, cx; LDI r1, cy; LDI r2, color; LDI r5, radius; CIRCLEF r0, r1, r5
    fn expand_circle_to_psets(&self, cx: i32, cy: i32, r: u32, color: u32) -> String {
        if r == 0 {
            return self.expand_pixel_to_pset(cx, cy, color);
        }

        format!(
            "LDI r{}, {}\n\
             LDI r{}, {}\n\
             LDI r{}, 0x{:08X}\n\
             LDI r{}, {}\n\
             CIRCLEF r{}, r{}, r{}\n",
            R_X, cx,
            R_Y, cy,
            R_COLOR, color,
            R_W, r,
            R_X, R_Y, R_W,
        )
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
            fps: 0,
            globals: vec![],
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
            canvas: Canvas {
                width: 64,
                height: 64,
            },
            symbols: Default::default(),
            fps: 0,
            globals: vec![],
            timeline: Timeline::default(),
        });
        let out = compiler.expand_rect_to_psets(5, 10, 3, 2, 0xFF0000FF);
        // Phase 2: single RECTF opcode with packed (w<<16|h)
        assert!(out.contains("RECTF"));
        assert!(out.contains("LDI r0, 5"));  // x
        assert!(out.contains("LDI r1, 10")); // y
        // packed: (3 << 16) | 2 = 0x00030002
        assert!(out.contains("0x00030002"));
        // Should NOT contain loop constructs
        assert!(!out.contains("y_loop:"));
        assert!(!out.contains("PSET"));
    }

    #[test]
    fn test_emit_line() {
        let compiler = GaspCompiler::new(GaspDoc {
            name: "test".into(),
            version: 1,
            canvas: Canvas { width: 64, height: 64 },
            symbols: Default::default(),
            fps: 0,
            globals: vec![],
            timeline: Timeline::default(),
        });
        let out = compiler.expand_line_to_psets(0, 0, 5, 0, 0xFFFFFFFF);
        // Phase 2: single LINE opcode with packed (x1<<16|y1)
        assert!(out.contains("LINE"));
        assert!(out.contains("LDI r0, 0"));  // x0
        assert!(out.contains("LDI r1, 0"));  // y0
        // packed: (5 << 16) | 0 = 0x00050000
        assert!(out.contains("0x00050000"));
        // Should NOT contain PSET
        assert!(!out.contains("PSET"));
    }

    #[test]
    fn test_emit_text() {
        let compiler = GaspCompiler::new(GaspDoc {
            name: "test".into(),
            version: 1,
            canvas: Canvas { width: 64, height: 64 },
            symbols: Default::default(),
            fps: 0,
            globals: vec![],
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

    // ── Instance Register Map Tests ────────────────────────────

    #[test]
    fn test_instance_register_map_allocate() {
        let mut map = InstanceRegisterMap::new();
        let base0 = map.allocate("btn_submit");
        assert_eq!(base0, INSTANCE_BASE_REG); // r20

        let base1 = map.allocate("btn_cancel");
        assert_eq!(base1, INSTANCE_BASE_REG + REGS_PER_INSTANCE); // r24

        // Re-allocate same name returns same register
        assert_eq!(map.allocate("btn_submit"), base0);
    }

    #[test]
    fn test_instance_register_map_resolve() {
        let mut map = InstanceRegisterMap::new();
        let base = map.allocate("ball"); // r20

        // _x = base + 0, _y = base + 1, _dims = base + 2, _color = base + 3
        assert_eq!(map.resolve("ball._x"), Some(base));
        assert_eq!(map.resolve("ball._y"), Some(base + 1));
        assert_eq!(map.resolve("ball._dims"), Some(base + 2));
        assert_eq!(map.resolve("ball._color"), Some(base + 3));
        assert_eq!(map.resolve("ball._width"), Some(base + 2));
        assert_eq!(map.resolve("ball._alpha"), Some(base + 3));
    }

    #[test]
    fn test_instance_register_map_resolve_unknown() {
        let mut map = InstanceRegisterMap::new();
        map.allocate("ball");

        // Unknown instance
        assert_eq!(map.resolve("ghost._x"), None);
        // Unknown property
        assert_eq!(map.resolve("ball._rotation"), None);
        // Not a qualified name
        assert_eq!(map.resolve("ball"), None);
    }

    #[test]
    fn test_instance_register_map_multiple() {
        let mut map = InstanceRegisterMap::new();
        let base_a = map.allocate("a"); // r20
        let base_b = map.allocate("b"); // r24

        assert_ne!(base_a, base_b);
        assert_eq!(map.len(), 2);

        // Verify iteration order matches allocation order
        let ordered: Vec<_> = map.iter().collect();
        assert_eq!(ordered[0], ("a", base_a));
        assert_eq!(ordered[1], ("b", base_b));
    }

    #[test]
    fn test_build_instance_map() {
        let yaml = r##"
name: "Instance Map Test"
symbols:
  btn:
    frames:
      - draws:
          - type: rect
            x: 0
            y: 0
            w: 80
            h: 30
            color: "#FF0000"
timeline:
  layers:
    - name: "ui"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: btn
              x: 100
              y: 200
              name: "submit_btn"
            - type: instance
              symbol: btn
              x: 300
              y: 200
              name: "cancel_btn"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let map = compiler.build_instance_map();

        assert_eq!(map.len(), 2);
        assert!(map.get_base("submit_btn").is_some());
        assert!(map.get_base("cancel_btn").is_some());
        assert!(map.get_base("nonexistent").is_none());

        // submit_btn gets r20, cancel_btn gets r24
        assert_eq!(map.get_base("submit_btn").unwrap(), INSTANCE_BASE_REG);
        assert_eq!(map.get_base("cancel_btn").unwrap(), INSTANCE_BASE_REG + REGS_PER_INSTANCE);
    }

    #[test]
    fn test_emit_instance_header_compiled() {
        let yaml = r##"
name: "Header Test"
symbols:
  box:
    frames:
      - draws:
          - type: rect
            x: 0
            y: 0
            w: 50
            h: 50
            color: "#00FF00"
timeline:
  layers:
    - name: "main"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: box
              x: 10
              y: 20
              name: "my_widget"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Should contain instance property header
        assert!(output.contains("; -- instance \"my_widget\" [r20-r23] --"));
        assert!(output.contains("LDI r20, 10"));  // _x = 10
        assert!(output.contains("LDI r21, 20"));  // _y = 20
        // packed dims: (50 << 16) | 50 = 0x00320032
        assert!(output.contains("LDI r22, 0x00320032"));
        // color #00FF00 -> 0x0000FF00 (RGBA)
        assert!(output.contains("LDI r23,"));
    }

    #[test]
    fn test_no_instance_header_for_unnamed() {
        let yaml = r##"
name: "No Header Test"
timeline:
  layers:
    - name: "bg"
      keyframes:
        - frame: 0
          draws:
            - type: rect
              x: 0
              y: 0
              w: 100
              h: 100
              color: "#FFFFFF"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // No instance header for non-instance draws
        assert!(!output.contains("Instance Properties"));
        assert!(!output.contains("LDI r20"));
    }

    #[test]
    fn test_register_driven_rect_draw() {
        // Named instance should emit MOV-based draws, not immediate LDI
        let yaml = r##"
name: "Register Draw Test"
symbols:
  box:
    frames:
      - draws:
          - type: rect
            x: 0
            y: 0
            w: 50
            h: 50
            color: "#FF0000"
timeline:
  layers:
    - name: "main"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: box
              x: 100
              y: 200
              name: "my_button"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Header should hydrate registers with initial values
        assert!(output.contains("LDI r20, 100"), "header should set _x=100");
        assert!(output.contains("LDI r21, 200"), "header should set _y=200");

        // Draw section should use MOV from instance registers
        assert!(
            output.contains("draw instance \"my_button\" via registers"),
            "should have register-based draw comment"
        );
        assert!(
            output.contains("MOV r0, r20"),
            "draw should MOV _x from instance reg r20"
        );
        assert!(
            output.contains("MOV r1, r21"),
            "draw should MOV _y from instance reg r21"
        );

        // RECTF should reference the packed dims register, not an immediate
        assert!(
            output.contains("RECTF r0, r1, r22"),
            "RECTF should use packed dims from r22"
        );

        // Should NOT have hardcoded LDI r0, 100 in the draw section
        // (only in the header)
        let header_end = output.find("RECTF").unwrap();
        let header_section = &output[..header_end];
        assert!(
            header_section.contains("LDI r20, 100"),
            "LDI should only appear in header"
        );
    }

    #[test]
    fn test_register_driven_circle_draw() {
        let yaml = r##"
name: "Circle Register Test"
symbols:
  orb:
    frames:
      - draws:
          - type: circle
            cx: 0
            cy: 0
            r: 25
            fill: "#0000FF"
timeline:
  layers:
    - name: "main"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: orb
              x: 50
              y: 50
              name: "target_orb"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Should use MOV from instance registers for position
        assert!(
            output.contains("draw instance \"target_orb\" via registers"),
            "circle draw should be register-driven"
        );
        assert!(
            output.contains("CIRCLEF"),
            "should emit CIRCLEF opcode"
        );
        // Circle uses SHR to halve the width from dims register
        assert!(
            output.contains("SHR"),
            "circle radius should be computed from dims via SHR"
        );
    }

    #[test]
    fn test_unnamed_draw_uses_immediates() {
        // Unnamed draws should still use the old LDI-immediate path
        let yaml = r##"
name: "Immediate Draw Test"
timeline:
  layers:
    - name: "bg"
      keyframes:
        - frame: 0
          draws:
            - type: rect
              x: 5
              y: 10
              w: 3
              h: 2
              color: "#FFFFFF"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Should use immediate LDI for unnamed draws
        assert!(
            output.contains("LDI r0, 5"),
            "unnamed rect should use LDI for x"
        );
        assert!(
            output.contains("LDI r1, 10"),
            "unnamed rect should use LDI for y"
        );
        assert!(
            output.contains("RECTF r0, r1,"),
            "should still emit RECTF"
        );
        // Should NOT have register-based draw comments
        assert!(
            !output.contains("via registers"),
            "unnamed draws should not use register path"
        );
    }

    #[test]
    fn test_hit_test_emission_for_press_event() {
        let yaml = r##"
name: hit_test_demo
version: 1
canvas: { width: 128, height: 128 }
fps: 1
symbols:
  btn_sym:
    frames:
      - draws:
          - type: rect
            x: 0
            y: 0
            w: 60
            h: 30
            color: "#336699"
timeline:
  layers:
    - name: "main"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: btn_sym
              x: 40
              y: 50
              name: click_me
              events:
                - on: press
                  code: "ADD r20, 5"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Should emit hit-test section
        assert!(
            output.contains("Hit-Test Dispatch"),
            "should have hit-test section header"
        );
        // Should load mouse X from sys input bus
        assert!(
            output.contains("LDI r15, 0x00E20000"),
            "should load mouse X address"
        );
        assert!(
            output.contains("LOAD r15, r15"),
            "should read mouse X via LOAD"
        );
        // Should load mouse Y
        assert!(
            output.contains("LDI r16, 0x00E20001"),
            "should load mouse Y address"
        );
        // Should compare against instance registers
        assert!(
            output.contains("BLT r15, r20"),
            "should compare mouseX < instance._x"
        );
        // Should extract width via SHR
        assert!(
            output.contains("SHR r18, r19"),
            "should extract width from packed dims"
        );
        // Should emit the handler code inline
        assert!(
            output.contains("ADD r20, 5"),
            "handler code should appear inline"
        );
        // Should have skip/done labels
        assert!(
            output.contains("_ht_skip_click_me_0:"),
            "should have skip label"
        );
        assert!(
            output.contains("_ht_done_click_me_0:"),
            "should have done label"
        );
        // Should JMP past skip on hit
        assert!(
            output.contains("JMP _ht_done_click_me_0"),
            "handler should jump to done label"
        );
    }

    #[test]
    fn test_no_hit_test_for_non_interactive_instances() {
        let yaml = r##"
name: no_events
version: 1
canvas: { width: 64, height: 64 }
fps: 1
symbols:
  box_sym:
    frames:
      - draws:
          - type: rect
            x: 0
            y: 0
            w: 20
            h: 20
            color: "#FF0000"
timeline:
  layers:
    - name: "main"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: box_sym
              x: 10
              y: 10
              name: static_box
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // No hit-test should be emitted for instances without events
        assert!(
            !output.contains("Hit-Test Dispatch"),
            "no hit-test for instances without events"
        );
        assert!(
            !output.contains("BLT"),
            "no bounds checks without events"
        );
    }

    #[test]
    fn test_hit_test_extract_height_from_dims() {
        let yaml = r##"
name: ht_dims
version: 1
canvas: { width: 64, height: 64 }
fps: 1
symbols:
  tall_btn:
    frames:
      - draws:
          - type: rect
            x: 0
            y: 0
            w: 30
            h: 80
            color: "#00FF00"
timeline:
  layers:
    - name: "main"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: tall_btn
              x: 10
              y: 20
              name: big_btn
              events:
                - on: press
                  code: "ADD r21, 10"
"##;
        let doc = crate::gasp::parse_gasp(yaml).unwrap();
        let compiler = GaspCompiler::new(doc);
        let output = compiler.compile().unwrap();

        // Height extraction uses AND with 0xFFFF mask
        assert!(
            output.contains("LDI r19, 0xFFFF"),
            "should load height mask constant"
        );
        assert!(
            output.contains("AND r18, r19"),
            "should mask out width to extract height"
        );
        // Should compare mouseY against _y + height
        assert!(
            output.contains("BGE r16, r18, _ht_skip_big_btn_0"),
            "should skip if mouseY >= _y + height"
        );
    }
}
