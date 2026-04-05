// .gasp - Geometry App Specification
//
// The canonical source format for Geometry OS GUI applications.
// Both humans (via visual editor) and AIs (via structured prompts)
// read and write .gasp files. The compiler transforms them into
// .gasm filmstrips that the VM executes.
//
// Think of it like .fla in Flash:
//   .gasp = source of truth (what you edit)
//   .gasm = compiled output (what the VM runs)
//   .glyph = machine code (what the GPU executes)

use std::collections::HashMap;

// ── Schema Types ──────────────────────────────────────────────

/// Top-level .gasp document.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct GaspDoc {
    pub name: String,
    #[serde(default)]
    pub version: u32,
    #[serde(default = "default_canvas")]
    pub canvas: Canvas,
    #[serde(default)]
    pub fps: u32,
    #[serde(default)]
    pub globals: Vec<GlobalVar>,
    #[serde(default)]
    pub symbols: HashMap<String, Symbol>,
    #[serde(default)]
    pub timeline: Timeline,
}

fn default_canvas() -> Canvas {
    Canvas {
        width: 256,
        height: 256,
    }
}

impl Default for GaspDoc {
    fn default() -> Self {
        Self {
            name: String::new(),
            version: 0,
            canvas: default_canvas(),
            fps: 12,
            globals: Vec::new(),
            symbols: HashMap::new(),
            timeline: Timeline::default(),
        }
    }
}

/// Canvas dimensions.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct Canvas {
    pub width: u32,
    pub height: u32,
}

/// A reusable symbol (like a Flash movie clip).
/// Has named frame states, each containing a draw list.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct Symbol {
    #[serde(default)]
    pub frames: Vec<SymbolFrame>,
}

/// One frame of a symbol's state.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct SymbolFrame {
    #[serde(default)]
    pub name: String,
    #[serde(default)]
    pub draws: Vec<Draw>,
}

/// The timeline: layers of keyframes with optional tweening.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize, Default)]
pub struct Timeline {
    #[serde(default)]
    pub layers: Vec<Layer>,
    #[serde(default)]
    pub scripts: Vec<FrameScript>,
}

/// A layer in the timeline. Maps to one VM stratum.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct Layer {
    pub name: String,
    #[serde(default)]
    pub keyframes: Vec<Keyframe>,
}

/// A keyframe at a specific frame number.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct Keyframe {
    pub frame: u32,
    /// Optional name for this frame (e.g. "Menu", "Settings").
    /// Maps to a `.frame "Name"` label in the compiled .gasm filmstrip,
    /// allowing `LDI r0, @Settings; FRAME r0` to jump here.
    #[serde(default)]
    pub name: Option<String>,
    /// Optional tween to the NEXT keyframe: "linear", "ease-in", "ease-out", "ease-in-out"
    #[serde(default)]
    pub tween: Option<String>,
    #[serde(default)]
    pub draws: Vec<Draw>,
}

/// A script attached to a specific frame.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct FrameScript {
    pub frame: u32,
    pub code: String,
}

// ── Draw Commands ─────────────────────────────────────────────

/// A single drawing operation. This is what the compiler expands
/// into PSET/RECTF/CHAR sequences.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
#[serde(tag = "type")]
pub enum Draw {
    /// Filled rectangle
    #[serde(rename = "rect")]
    Rect {
        x: i32,
        y: i32,
        w: u32,
        h: u32,
        #[serde(default = "default_color")]
        fill: String,
    },
    /// Filled circle
    #[serde(rename = "circle")]
    Circle {
        cx: i32,
        cy: i32,
        r: u32,
        #[serde(default = "default_color")]
        fill: String,
    },
    /// Line from (x0,y0) to (x1,y1)
    #[serde(rename = "line")]
    Line {
        x0: i32,
        y0: i32,
        x1: i32,
        y1: i32,
        #[serde(default = "default_color")]
        color: String,
    },
    /// Text string at position
    #[serde(rename = "text")]
    Text {
        x: i32,
        y: i32,
        content: String,
        #[serde(default = "default_color")]
        color: String,
    },
    /// Single pixel
    #[serde(rename = "pixel")]
    Pixel {
        x: i32,
        y: i32,
        #[serde(default = "default_color")]
        color: String,
    },
    /// Instance of a symbol at position with optional transform.
    /// AS2 parallel: like placing a MovieClip on stage.
    /// `name` is the instance name (e.g. "submit_btn") -- the compiler
    /// reserves a memory slot for its state so scripts can target it.
    #[serde(rename = "instance")]
    Instance {
        symbol: String,
        x: i32,
        y: i32,
        #[serde(default)]
        frame: Option<u32>,
        #[serde(default = "default_scale")]
        scale: f32,
        #[serde(default)]
        name: Option<String>,
        #[serde(default)]
        events: Vec<EventBinding>,
    },
}

fn default_color() -> String {
    "#FFFFFF".to_string()
}

fn default_scale() -> f32 {
    1.0
}

// ── AS2-Style Event Bindings ─────────────────────────────────

/// An event handler attached to an instance.
/// AS2 parallel: on(press) { gotoAndPlay(5); }
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct EventBinding {
    /// Event trigger: "press", "release", "rollOver", "rollOut", "enterFrame"
    pub on: String,
    /// .gasm code to execute when the event fires
    pub code: String,
}

// ── Symbol Property Block (AS2 MovieClip Properties) ─────────

/// Properties tracked per named instance, stored in a reserved
/// memory region so scripts can read/write them by name.
///
/// AS2 parallel: ball_mc._x, ball_mc._y, ball_mc._alpha, etc.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct InstanceProps {
    pub name: String,
    pub symbol: String,
    pub x: i32,
    pub y: i32,
    #[serde(default = "default_scale")]
    pub scale: f32,
    #[serde(default = "default_alpha")]
    pub alpha: u8,
    #[serde(default)]
    pub visible: bool,
    #[serde(default)]
    pub frame: u32,
}

fn default_alpha() -> u8 {
    255
}

// ── Global Variable Declarations ─────────────────────────────

/// A global variable declaration (AS2 parallel: _global.myVar = 10).
/// The compiler allocates a fixed address in GPU memory.
#[derive(Debug, Clone, serde::Serialize, serde::Deserialize)]
pub struct GlobalVar {
    pub name: String,
    #[serde(default)]
    pub value: i32,
}

// ── Parsing ───────────────────────────────────────────────────

/// Parse a .gasp document from a YAML string.
pub fn parse_gasp(yaml: &str) -> Result<GaspDoc, String> {
    serde_yaml::from_str(yaml).map_err(|e| format!("GASP parse error: {}", e))
}

/// Parse a .gasp document from a JSON string.
pub fn parse_gasp_json(json: &str) -> Result<GaspDoc, String> {
    serde_json::from_str(json).map_err(|e| format!("GASP JSON parse error: {}", e))
}

// ── Color Helpers ─────────────────────────────────────────────

/// Parse a color string (#RGB, #RRGGBB, #RRGGBBAA) into a u32.
/// Output: 0xRRGGBBAA (matching the VM's packed pixel format).
pub fn parse_color(s: &str) -> Result<u32, String> {
    let s = s.trim();
    if !s.starts_with('#') {
        return Err(format!("Color must start with '#', got '{}'", s));
    }
    let hex = &s[1..];
    match hex.len() {
        3 => {
            // #RGB -> #RRGGBBFF
            let r = u8::from_str_radix(&hex[0..1].repeat(2), 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            let g = u8::from_str_radix(&hex[1..2].repeat(2), 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            let b = u8::from_str_radix(&hex[2..3].repeat(2), 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            Ok(pack_color(r, g, b, 255))
        }
        6 => {
            // #RRGGBB -> 0xRRGGBBFF
            let r = u8::from_str_radix(&hex[0..2], 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            let g = u8::from_str_radix(&hex[2..4], 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            let b = u8::from_str_radix(&hex[4..6], 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            Ok(pack_color(r, g, b, 255))
        }
        8 => {
            // #RRGGBBAA
            let r = u8::from_str_radix(&hex[0..2], 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            let g = u8::from_str_radix(&hex[2..4], 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            let b = u8::from_str_radix(&hex[4..6], 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            let a = u8::from_str_radix(&hex[6..8], 16)
                .map_err(|e| format!("Bad color '{}': {}", s, e))?;
            Ok(pack_color(r, g, b, a))
        }
        _ => Err(format!(
            "Color must be #RGB, #RRGGBB, or #RRGGBBAA, got '{}'",
            s
        )),
    }
}

/// Pack RGBA bytes into a u32 (little-endian: R | G<<8 | B<<16 | A<<24).
/// This matches the VM's pixel format.
pub fn pack_color(r: u8, g: u8, b: u8, a: u8) -> u32 {
    (r as u32) | ((g as u32) << 8) | ((b as u32) << 16) | ((a as u32) << 24)
}

/// Extract the red channel from a packed color.
pub fn color_r(c: u32) -> u8 {
    (c & 0xFF) as u8
}

/// Extract the green channel.
pub fn color_g(c: u32) -> u8 {
    ((c >> 8) & 0xFF) as u8
}

/// Extract the blue channel.
pub fn color_b(c: u32) -> u8 {
    ((c >> 16) & 0xFF) as u8
}

/// Extract the alpha channel.
pub fn color_a(c: u32) -> u8 {
    ((c >> 24) & 0xFF) as u8
}

// ── Tests ─────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_minimal_gasp() {
        let yaml = r###"
name: "Test App"
version: 1
canvas: { width: 128, height: 128 }
"###;
        let doc = parse_gasp(yaml).unwrap();
        assert_eq!(doc.name, "Test App");
        assert_eq!(doc.version, 1);
        assert_eq!(doc.canvas.width, 128);
        assert_eq!(doc.canvas.height, 128);
        assert!(doc.symbols.is_empty());
        assert!(doc.timeline.layers.is_empty());
    }

    #[test]
    fn test_parse_symbol_with_frames() {
        let yaml = r###"
name: "Button Demo"
symbols:
  button:
    frames:
      - name: "Idle"
        draws:
          - type: rect
            x: 10
            y: 10
            w: 80
            h: 30
            fill: "#3366CC"
          - type: text
            x: 20
            y: 20
            content: "Click Me"
            color: "#FFFFFF"
      - name: "Pressed"
        draws:
          - type: rect
            x: 10
            y: 10
            w: 80
            h: 30
            fill: "#225599"
"###;
        let doc = parse_gasp(yaml).unwrap();
        assert!(doc.symbols.contains_key("button"));
        let btn = &doc.symbols["button"];
        assert_eq!(btn.frames.len(), 2);
        assert_eq!(btn.frames[0].name, "Idle");
        assert_eq!(btn.frames[1].name, "Pressed");
        // Idle has rect + text = 2 draws
        assert_eq!(btn.frames[0].draws.len(), 2);
    }

    #[test]
    fn test_parse_timeline_with_layers() {
        let yaml = r###"
name: "Timeline Test"
timeline:
  layers:
    - name: "Background"
      keyframes:
        - frame: 0
          draws:
            - type: rect
              x: 0
              y: 0
              w: 256
              h: 256
              fill: "#1a1a2e"
    - name: "UI Layer"
      keyframes:
        - frame: 0
          draws:
            - type: instance
              symbol: "button"
              x: 80
              y: 100
        - frame: 30
          tween: "ease-in-out"
          draws:
            - type: instance
              symbol: "button"
              x: 80
              y: 150
  scripts:
    - frame: 0
      code: "LDI r0, 0xFFFFFFFF"
"###;
        let doc = parse_gasp(yaml).unwrap();
        assert_eq!(doc.timeline.layers.len(), 2);
        assert_eq!(doc.timeline.layers[0].name, "Background");
        assert_eq!(doc.timeline.layers[1].keyframes.len(), 2);
        assert_eq!(
            doc.timeline.layers[1].keyframes[1].tween,
            Some("ease-in-out".to_string())
        );
        assert_eq!(doc.timeline.scripts.len(), 1);
        assert_eq!(doc.timeline.scripts[0].frame, 0);
    }

    #[test]
    fn test_parse_all_draw_types() {
        let yaml = r###"
name: "All Draws"
symbols:
  test:
    frames:
      - name: "main"
        draws:
          - type: rect
            x: 0
            y: 0
            w: 100
            h: 50
            fill: "#FF0000"
          - type: circle
            cx: 50
            cy: 50
            r: 20
            fill: "#00FF00"
          - type: line
            x0: 0
            y0: 0
            x1: 100
            y1: 100
            color: "#0000FF"
          - type: text
            x: 10
            y: 10
            content: "Hello"
            color: "#FFFFFF"
          - type: pixel
            x: 5
            y: 5
            color: "#FF00FF"
          - type: instance
            symbol: "other"
            x: 30
            y: 40
"###;
        let doc = parse_gasp(yaml).unwrap();
        let draws = &doc.symbols["test"].frames[0].draws;
        assert_eq!(draws.len(), 6);
    }

    #[test]
    fn test_color_parsing() {
        // #RGB
        assert_eq!(parse_color("#F00").unwrap(), pack_color(255, 0, 0, 255));
        // #RRGGBB
        assert_eq!(
            parse_color("#3366CC").unwrap(),
            pack_color(0x33, 0x66, 0xCC, 255)
        );
        // #RRGGBBAA
        assert_eq!(
            parse_color("#11223344").unwrap(),
            pack_color(0x11, 0x22, 0x33, 0x44)
        );
        // Bad format
        assert!(parse_color("red").is_err());
        assert!(parse_color("#12").is_err());
    }

    #[test]
    fn test_parse_json_gasp() {
        let json = r###"{"name":"JSON App","version":2,"canvas":{"width":64,"height":64}}"###;
        let doc = parse_gasp_json(json).unwrap();
        assert_eq!(doc.name, "JSON App");
        assert_eq!(doc.canvas.width, 64);
    }

    #[test]
    fn test_default_canvas() {
        let yaml = r###"name: "No Canvas""###;
        let doc = parse_gasp(yaml).unwrap();
        assert_eq!(doc.canvas.width, 256);
        assert_eq!(doc.canvas.height, 256);
    }
}
