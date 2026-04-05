// VM HUD Overlay - Interactive debugging display
//
// Renders a semi-transparent overlay on the windowed runtime showing:
//   - Color-coded VM activity indicators (running/yielded/halted/fault)
//   - Program counter positions
//   - IPC message flow visualization
//   - Memory heatmap (recently-written regions glow)
//   - Detail view for selected VM
//
// The HUD is rendered as an RGBA8 texture updated each frame on the CPU,
// then composited as a second render pass over the substrate display.

use crate::vm::{vm_state, VmState};
use crate::MAX_VMS;

/// HUD texture dimensions. Rendered at a fixed size and stretched to window.
pub const HUD_WIDTH: u32 = 512;
pub const HUD_HEIGHT: u32 = 256;

/// HUD state: tracks which VM is selected for detail view, pause state, etc.
#[derive(Debug, Clone)]
pub struct HudState {
    /// Which VM is selected for detail view (0-7). None = no selection.
    pub selected_vm: Option<usize>,
    /// Whether all VMs are paused.
    pub paused: bool,
    /// Pending single-step (consumed on next frame).
    pub single_step: bool,
    /// Pending reset (consumed on next frame).
    pub pending_reset: bool,
    /// Pending load: path to .gasm file to load.
    pub pending_load: Option<String>,
    /// Load dialog is active: user is typing a path.
    pub load_dialog_active: bool,
    /// Current load dialog text.
    pub load_dialog_text: String,
    /// Memory heatmap: tracks write intensity per region.
    /// Divided into 256 buckets covering the allocatable range.
    pub heatmap: [u8; 256],
    /// Frame counter for animation effects.
    pub frame: u32,
    /// IPC arrows: pairs of (sender_vm, receiver_vm) with recent messages.
    pub ipc_arrows: Vec<(u32, u32)>,
}

impl Default for HudState {
    fn default() -> Self {
        Self {
            selected_vm: None,
            paused: false,
            single_step: false,
            pending_reset: false,
            pending_load: None,
            load_dialog_active: false,
            load_dialog_text: String::new(),
            heatmap: [0; 256],
            frame: 0,
            ipc_arrows: Vec::new(),
        }
    }
}

impl HudState {
    pub fn new() -> Self {
        Self::default()
    }
}

/// VM state label and color for the HUD.
fn vm_status_display(state: u32) -> (&'static str, [u8; 4]) {
    match state {
        vm_state::INACTIVE => ("INACT", [40, 40, 50, 180]),
        vm_state::RUNNING => ("RUN  ", [0, 220, 80, 220]),
        vm_state::HALTED => ("HALT ", [220, 50, 50, 220]),
        vm_state::WAITING => ("WAIT ", [220, 200, 0, 220]),
        4 => ("YIELD", [150, 150, 220, 200]),
        0xFF => ("FAULT", [255, 0, 0, 255]),
        _ => ("?????", [128, 128, 128, 180]),
    }
}

/// Fill the HUD texture buffer with current state.
///
/// `buf` must be `HUD_WIDTH * HUD_HEIGHT * 4` bytes (RGBA8).
/// `vm_states` is the array of 8 VM states.
/// `heatmap_shadow` is a snapshot of the substrate shadow for heatmap computation.
pub fn render_hud(
    buf: &mut [u8],
    hud: &HudState,
    vm_states: &[VmState; 8],
    substrate_shadow: &[u8],
) {
    let w = HUD_WIDTH as usize;
    let h = HUD_HEIGHT as usize;
    assert_eq!(buf.len(), w * h * 4);

    // Clear to semi-transparent dark background
    for pixel in buf.chunks_exact_mut(4) {
        pixel[0] = 8;
        pixel[1] = 8;
        pixel[2] = 16;
        pixel[3] = 160; // semi-transparent
    }

    // ── Row 0-1: Title bar ──
    let title = if hud.paused {
        "GEOMETRY OS  [PAUSED]"
    } else {
        "GEOMETRY OS  [LIVE]"
    };
    draw_text(buf, w, title, 4, 0, [200, 220, 255, 240]);

    // Frame counter
    let frame_str = format!("frame:{}", hud.frame);
    draw_text(buf, w, &frame_str, w - frame_str.len() * 6 - 4, 0, [150, 150, 180, 200]);

    // ── Row 2: Controls hint ──
    draw_text(buf, w, "SPC:pause  S:step  R:reset  1-8:select  L:load", 4, 16, [120, 120, 140, 180]);

    // ── Rows 3-10: VM status grid (8 VMs side by side) ──
    let vm_col_width = (w - 8) / 8; // ~63 pixels per VM column
    for vm_id in 0..MAX_VMS as usize {
        let vm = &vm_states[vm_id];
        let (label, color) = vm_status_display(vm.state);
        let x_off = 4 + vm_id * vm_col_width;
        let y_base = 32;

        // Selection highlight
        if hud.selected_vm == Some(vm_id) {
            fill_rect(buf, w, x_off, y_base - 2, vm_col_width, 42, [60, 60, 100, 120]);
        }

        // VM ID header
        let id_str = format!("VM{}", vm_id);
        let id_color = if vm.state == vm_state::RUNNING {
            [0, 255, 100, 255]
        } else if vm.state == vm_state::HALTED {
            [200, 60, 60, 200]
        } else {
            [150, 150, 160, 200]
        };
        draw_text(buf, w, &id_str, x_off + 2, y_base, id_color);

        // Status label
        draw_text(buf, w, label, x_off + 2, y_base + 10, color);

        // PC value
        let pc_str = format!("PC:{:05X}", vm.pc);
        draw_text(buf, w, &pc_str, x_off + 2, y_base + 20, [180, 180, 200, 200]);

        // Cycle count (compact)
        if vm.cycles > 0 {
            let cyc_str = if vm.cycles > 99999 {
                format!("{}k", vm.cycles / 1000)
            } else {
                format!("{}", vm.cycles)
            };
            draw_text(buf, w, &cyc_str, x_off + 2, y_base + 30, [140, 140, 160, 180]);
        }
    }

    // ── Rows 11-14: IPC message flow visualization ──
    let ipc_y = 76;
    draw_text(buf, w, "IPC:", 4, ipc_y, [180, 180, 220, 200]);

    // Scan mailboxes for pending messages
    let mut ipc_x = 32;
    for vm_id in 0..MAX_VMS as u32 {
        let header_addr = crate::MSGQ_BASE + vm_id;
        // Read the header pixel from substrate shadow
        let (x, y) = crate::hilbert::d2xy(header_addr);
        let offset = ((y * crate::substrate::TEXTURE_SIZE + x) * 4) as usize;
        if offset + 3 < substrate_shadow.len() {
            let flags = substrate_shadow[offset];
            let sender = substrate_shadow[offset + 1];
            if flags & 1 != 0 && (sender as u32) < MAX_VMS {
                // Has message from sender
                let msg_str = format!("{}->{}", sender, vm_id);
                draw_text(buf, w, &msg_str, ipc_x, ipc_y, [255, 200, 50, 240]);
                ipc_x += msg_str.len() * 6 + 8;
                if ipc_x > w - 40 {
                    draw_text(buf, w, "...", ipc_x, ipc_y, [200, 200, 200, 180]);
                    break;
                }
            }
        }
    }

    if ipc_x <= 32 {
        draw_text(buf, w, "idle", ipc_x, ipc_y, [80, 80, 100, 150]);
    }

    // ── Rows 15-25: Detail view for selected VM ──
    if let Some(sel) = hud.selected_vm {
        let detail_y = 88;
        let vm = &vm_states[sel];

        fill_rect(buf, w, 2, detail_y, w - 4, 80, [16, 16, 32, 200]);

        draw_text(buf, w, &format!("=== VM {} DETAIL ===", sel), 4, detail_y, [255, 220, 100, 240]);

        // Registers (first 16, compact hex)
        let mut reg_y = detail_y + 12;
        for row in 0..4 {
            let mut line = String::new();
            for col in 0..4 {
                let reg_idx = row * 4 + col;
                let val = vm.regs[reg_idx];
                if val != 0 {
                    line.push_str(&format!("R{:02}:{:08X} ", reg_idx, val));
                } else {
                    line.push_str("            ");
                }
            }
            if !line.trim().is_empty() {
                draw_text(buf, w, line.trim_end(), 8, reg_y, [180, 200, 220, 200]);
                reg_y += 10;
            }
        }

        // Extra state info
        draw_text(
            buf, w,
            &format!("Entry:{:05X} Base:{:05X} Bound:{:05X} Gen:{}", vm.entry_point, vm.base_addr, vm.bound_addr, vm.generation),
            8, detail_y + 56, [140, 140, 170, 180],
        );
        draw_text(
            buf, w,
            &format!("StackPtr:{} State:{} Halt:{} Frames:{}", vm.stack_ptr, vm.state, vm.halted, vm.frame_count),
            8, detail_y + 66, [140, 140, 170, 180],
        );
    }

    // ── Rows 26+: Memory heatmap ──
    let heatmap_y = if hud.selected_vm.is_some() { 172 } else { 92 };
    draw_text(buf, w, "MEM HEATMAP:", 4, heatmap_y, [180, 180, 220, 200]);

    let hm_x = 80;
    let hm_w = w - hm_x - 4;
    let hm_h = 16;
    // Draw heatmap bars
    for bucket in 0..256 {
        let intensity = hud.heatmap[bucket];
        if intensity == 0 {
            continue;
        }
        // Each bucket covers hm_w/256 pixels width
        let x_start = hm_x + (bucket * hm_w) / 256;
        let x_end = hm_x + ((bucket + 1) * hm_w) / 256;
        for px in x_start..x_end.min(w) {
            for py in 0..hm_h {
                let y = heatmap_y + py;
                if y < h {
                    let idx = (y * w + px) * 4;
                    if idx + 3 < buf.len() {
                        // Color: blue (cold) -> yellow -> red (hot)
                        let t = intensity as f32 / 255.0;
                        let r = (t * 255.0).min(255.0) as u8;
                        let g = ((1.0 - (t - 0.5).abs() * 2.0).max(0.0) * 200.0) as u8;
                        let b = ((1.0 - t) * 200.0).min(200.0) as u8;
                        let a = (80.0 + t * 175.0) as u8;
                        buf[idx] = r;
                        buf[idx + 1] = g;
                        buf[idx + 2] = b;
                        buf[idx + 3] = a;
                    }
                }
            }
        }
    }

    // Heatmap scale labels
    draw_text(buf, w, "0x0", hm_x, heatmap_y + hm_h + 2, [100, 100, 120, 160]);
    let end_label = format!("0x{:X}", crate::substrate::ALLOC_END);
    draw_text(buf, w, &end_label, hm_x + hm_w - end_label.len() * 6, heatmap_y + hm_h + 2, [100, 100, 120, 160]);

    // ── Load dialog overlay ──
    if hud.load_dialog_active {
        // Semi-transparent overlay
        fill_rect(buf, w, 50, 100, w - 100, 60, [10, 10, 30, 240]);
        draw_text(buf, w, "LOAD PROGRAM (.gasm):", 56, 106, [255, 255, 200, 255]);
        let prompt = format!("{}_", hud.load_dialog_text);
        draw_text(buf, w, &prompt, 56, 120, [220, 255, 220, 255]);
        draw_text(buf, w, "Press ENTER to load, ESC to cancel", 56, 136, [140, 140, 160, 200]);
    }
}

/// Update the heatmap from substrate shadow data.
/// Scans a sample of addresses in the allocatable range and updates intensity.
pub fn update_heatmap(heatmap: &mut [u8; 256], substrate_shadow: &[u8]) {
    let alloc_start = crate::substrate::ALLOC_START;
    let alloc_end = crate::substrate::ALLOC_END;
    let range = alloc_end - alloc_start;
    let bucket_size = range / 256;

    for bucket in 0..256 {
        let start_addr = alloc_start + bucket as u32 * bucket_size;
        // Sample 4 addresses per bucket
        let mut nonzero = 0u32;
        for sample in 0..4 {
            let addr = start_addr + (sample * bucket_size / 4);
            let (x, y) = crate::hilbert::d2xy(addr);
            let offset = ((y * crate::substrate::TEXTURE_SIZE + x) * 4) as usize;
            if offset + 3 < substrate_shadow.len() {
                let val = u32::from_le_bytes([
                    substrate_shadow[offset],
                    substrate_shadow[offset + 1],
                    substrate_shadow[offset + 2],
                    substrate_shadow[offset + 3],
                ]);
                if val != 0 {
                    nonzero += 1;
                }
            }
        }
        // Decay existing value, add new
        let old = heatmap[bucket] as u32;
        let new_val = ((old * 7) / 8 + nonzero * 48).min(255);
        heatmap[bucket] = new_val as u8;
    }
}

// ── Primitive drawing functions ──

/// Draw a filled rectangle.
fn fill_rect(buf: &mut [u8], width: usize, x: usize, y: usize, w: usize, h: usize, color: [u8; 4]) {
    for py in y..y + h {
        for px in x..x + w {
            let idx = (py * width + px) * 4;
            if idx + 3 < buf.len() {
                // Alpha blend
                let sa = color[3] as u32;
                let da = buf[idx + 3] as u32;
                let a_out = sa + da * (255 - sa) / 255;
                if a_out > 0 {
                    buf[idx] = ((color[0] as u32 * sa + buf[idx] as u32 * da * (255 - sa) / 255) / a_out) as u8;
                    buf[idx + 1] = ((color[1] as u32 * sa + buf[idx + 1] as u32 * da * (255 - sa) / 255) / a_out) as u8;
                    buf[idx + 2] = ((color[2] as u32 * sa + buf[idx + 2] as u32 * da * (255 - sa) / 255) / a_out) as u8;
                    buf[idx + 3] = a_out as u8;
                }
            }
        }
    }
}

/// Draw a single character from the embedded 5x8 font.
/// Returns the width of the character drawn (5 pixels + 1 spacing).
fn draw_char(buf: &mut [u8], width: usize, ch: char, x: usize, y: usize, color: [u8; 4]) -> usize {
    let glyph = font5x8(ch);
    if glyph.is_none() {
        return 6;
    }
    let glyph = glyph.unwrap();
    for row in 0..8 {
        let bits = glyph[row as usize];
        for col in 0..5 {
            if (bits >> (4 - col)) & 1 != 0 {
                let px = x + col as usize;
                let py = y + row as usize;
                let idx = (py * width + px) * 4;
                if idx + 3 < buf.len() {
                    buf[idx] = color[0];
                    buf[idx + 1] = color[1];
                    buf[idx + 2] = color[2];
                    buf[idx + 3] = color[3];
                }
            }
        }
    }
    6 // 5px glyph + 1px spacing
}

/// Draw a text string at the given position.
fn draw_text(buf: &mut [u8], width: usize, text: &str, x: usize, y: usize, color: [u8; 4]) {
    let mut cx = x;
    for ch in text.chars() {
        cx += draw_char(buf, width, ch, cx, y, color);
    }
}

/// Minimal 5x8 bitmap font for ASCII 32-126.
/// Each entry is 8 rows of 5-bit bitmaps (MSB = left pixel).
fn font5x8(ch: char) -> Option<[u8; 8]> {
    // Compact 5x8 font table — covers printable ASCII.
    // Generated from a standard 5x7/5x8 pixel font.
    Some(match ch {
        ' ' => [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        '!' => [0x04, 0x04, 0x04, 0x04, 0x04, 0x00, 0x04, 0x00],
        '"' => [0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        '#' => [0x0A, 0x0A, 0x1F, 0x0A, 0x1F, 0x0A, 0x0A, 0x00],
        '$' => [0x04, 0x0F, 0x14, 0x0E, 0x05, 0x1E, 0x04, 0x00],
        '%' => [0x18, 0x19, 0x02, 0x04, 0x08, 0x13, 0x03, 0x00],
        '&' => [0x08, 0x14, 0x14, 0x08, 0x15, 0x12, 0x0D, 0x00],
        '\'' => [0x04, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        '(' => [0x02, 0x04, 0x08, 0x08, 0x08, 0x04, 0x02, 0x00],
        ')' => [0x08, 0x04, 0x02, 0x02, 0x02, 0x04, 0x08, 0x00],
        '*' => [0x00, 0x04, 0x15, 0x0E, 0x15, 0x04, 0x00, 0x00],
        '+' => [0x00, 0x04, 0x04, 0x1F, 0x04, 0x04, 0x00, 0x00],
        ',' => [0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x08],
        '-' => [0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00],
        '.' => [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00],
        '/' => [0x01, 0x01, 0x02, 0x04, 0x08, 0x10, 0x10, 0x00],
        '0' => [0x0E, 0x11, 0x13, 0x15, 0x19, 0x11, 0x0E, 0x00],
        '1' => [0x04, 0x0C, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00],
        '2' => [0x0E, 0x11, 0x01, 0x06, 0x08, 0x10, 0x1F, 0x00],
        '3' => [0x0E, 0x11, 0x01, 0x06, 0x01, 0x11, 0x0E, 0x00],
        '4' => [0x02, 0x06, 0x0A, 0x12, 0x1F, 0x02, 0x02, 0x00],
        '5' => [0x1F, 0x10, 0x1E, 0x01, 0x01, 0x11, 0x0E, 0x00],
        '6' => [0x06, 0x08, 0x10, 0x1E, 0x11, 0x11, 0x0E, 0x00],
        '7' => [0x1F, 0x01, 0x02, 0x04, 0x08, 0x08, 0x08, 0x00],
        '8' => [0x0E, 0x11, 0x11, 0x0E, 0x11, 0x11, 0x0E, 0x00],
        '9' => [0x0E, 0x11, 0x11, 0x0F, 0x01, 0x02, 0x0C, 0x00],
        ':' => [0x00, 0x00, 0x04, 0x00, 0x00, 0x04, 0x00, 0x00],
        ';' => [0x00, 0x00, 0x04, 0x00, 0x00, 0x04, 0x04, 0x08],
        '<' => [0x02, 0x04, 0x08, 0x10, 0x08, 0x04, 0x02, 0x00],
        '=' => [0x00, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x00, 0x00],
        '>' => [0x08, 0x04, 0x02, 0x01, 0x02, 0x04, 0x08, 0x00],
        '?' => [0x0E, 0x11, 0x01, 0x02, 0x04, 0x00, 0x04, 0x00],
        '@' => [0x0E, 0x11, 0x17, 0x15, 0x17, 0x10, 0x0E, 0x00],
        'A' => [0x0E, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11, 0x00],
        'B' => [0x1E, 0x11, 0x11, 0x1E, 0x11, 0x11, 0x1E, 0x00],
        'C' => [0x0E, 0x11, 0x10, 0x10, 0x10, 0x11, 0x0E, 0x00],
        'D' => [0x1C, 0x12, 0x11, 0x11, 0x11, 0x12, 0x1C, 0x00],
        'E' => [0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x1F, 0x00],
        'F' => [0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x10, 0x00],
        'G' => [0x0E, 0x11, 0x10, 0x17, 0x11, 0x11, 0x0F, 0x00],
        'H' => [0x11, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11, 0x00],
        'I' => [0x0E, 0x04, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00],
        'J' => [0x07, 0x02, 0x02, 0x02, 0x02, 0x12, 0x0C, 0x00],
        'K' => [0x11, 0x12, 0x14, 0x18, 0x14, 0x12, 0x11, 0x00],
        'L' => [0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x1F, 0x00],
        'M' => [0x11, 0x1B, 0x15, 0x15, 0x11, 0x11, 0x11, 0x00],
        'N' => [0x11, 0x19, 0x15, 0x13, 0x11, 0x11, 0x11, 0x00],
        'O' => [0x0E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E, 0x00],
        'P' => [0x1E, 0x11, 0x11, 0x1E, 0x10, 0x10, 0x10, 0x00],
        'Q' => [0x0E, 0x11, 0x11, 0x11, 0x15, 0x12, 0x0D, 0x00],
        'R' => [0x1E, 0x11, 0x11, 0x1E, 0x14, 0x12, 0x11, 0x00],
        'S' => [0x0E, 0x11, 0x10, 0x0E, 0x01, 0x11, 0x0E, 0x00],
        'T' => [0x1F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x00],
        'U' => [0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E, 0x00],
        'V' => [0x11, 0x11, 0x11, 0x11, 0x0A, 0x0A, 0x04, 0x00],
        'W' => [0x11, 0x11, 0x11, 0x15, 0x15, 0x1B, 0x11, 0x00],
        'X' => [0x11, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x11, 0x00],
        'Y' => [0x11, 0x11, 0x0A, 0x04, 0x04, 0x04, 0x04, 0x00],
        'Z' => [0x1F, 0x01, 0x02, 0x04, 0x08, 0x10, 0x1F, 0x00],
        '[' => [0x0E, 0x08, 0x08, 0x08, 0x08, 0x08, 0x0E, 0x00],
        '\\' => [0x10, 0x10, 0x08, 0x04, 0x02, 0x01, 0x01, 0x00],
        ']' => [0x0E, 0x02, 0x02, 0x02, 0x02, 0x02, 0x0E, 0x00],
        '^' => [0x04, 0x0A, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00],
        '_' => [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00],
        '`' => [0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        'a' => [0x00, 0x00, 0x0E, 0x01, 0x0F, 0x11, 0x0F, 0x00],
        'b' => [0x10, 0x10, 0x1E, 0x11, 0x11, 0x11, 0x1E, 0x00],
        'c' => [0x00, 0x00, 0x0E, 0x11, 0x10, 0x11, 0x0E, 0x00],
        'd' => [0x01, 0x01, 0x0F, 0x11, 0x11, 0x11, 0x0F, 0x00],
        'e' => [0x00, 0x00, 0x0E, 0x11, 0x1F, 0x10, 0x0E, 0x00],
        'f' => [0x06, 0x08, 0x08, 0x1E, 0x08, 0x08, 0x08, 0x00],
        'g' => [0x00, 0x00, 0x0F, 0x11, 0x0F, 0x01, 0x0E, 0x00],
        'h' => [0x10, 0x10, 0x1E, 0x11, 0x11, 0x11, 0x11, 0x00],
        'i' => [0x04, 0x00, 0x0C, 0x04, 0x04, 0x04, 0x0E, 0x00],
        'j' => [0x02, 0x00, 0x06, 0x02, 0x02, 0x12, 0x0C, 0x00],
        'k' => [0x10, 0x10, 0x12, 0x14, 0x18, 0x14, 0x12, 0x00],
        'l' => [0x0C, 0x04, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00],
        'm' => [0x00, 0x00, 0x1A, 0x15, 0x15, 0x15, 0x15, 0x00],
        'n' => [0x00, 0x00, 0x1E, 0x11, 0x11, 0x11, 0x11, 0x00],
        'o' => [0x00, 0x00, 0x0E, 0x11, 0x11, 0x11, 0x0E, 0x00],
        'p' => [0x00, 0x00, 0x1E, 0x11, 0x1E, 0x10, 0x10, 0x00],
        'q' => [0x00, 0x00, 0x0F, 0x11, 0x0F, 0x01, 0x01, 0x00],
        'r' => [0x00, 0x00, 0x16, 0x19, 0x10, 0x10, 0x10, 0x00],
        's' => [0x00, 0x00, 0x0F, 0x10, 0x0E, 0x01, 0x1E, 0x00],
        't' => [0x08, 0x08, 0x1E, 0x08, 0x08, 0x09, 0x06, 0x00],
        'u' => [0x00, 0x00, 0x11, 0x11, 0x11, 0x11, 0x0F, 0x00],
        'v' => [0x00, 0x00, 0x11, 0x11, 0x11, 0x0A, 0x04, 0x00],
        'w' => [0x00, 0x00, 0x11, 0x11, 0x15, 0x15, 0x0A, 0x00],
        'x' => [0x00, 0x00, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x00],
        'y' => [0x00, 0x00, 0x11, 0x11, 0x0F, 0x01, 0x0E, 0x00],
        'z' => [0x00, 0x00, 0x1F, 0x02, 0x04, 0x08, 0x1F, 0x00],
        '{' => [0x02, 0x04, 0x04, 0x08, 0x04, 0x04, 0x02, 0x00],
        '|' => [0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x00],
        '}' => [0x08, 0x04, 0x04, 0x02, 0x04, 0x04, 0x08, 0x00],
        '~' => [0x00, 0x00, 0x08, 0x15, 0x02, 0x00, 0x00, 0x00],
        _ => return None,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::VmState;

    #[test]
    fn render_hud_does_not_crash() {
        let mut buf = vec![0u8; (HUD_WIDTH * HUD_HEIGHT * 4) as usize];
        let hud = HudState::new();
        let vm_states = [VmState::default(); 8];
        let shadow = vec![0u8; 1024];
        render_hud(&mut buf, &hud, &vm_states, &shadow);
    }

    #[test]
    fn font5x8_covers_common_chars() {
        for ch in "Hello World 0123456789!@#".chars() {
            assert!(font5x8(ch).is_some(), "Missing glyph for '{}'", ch);
        }
    }

    #[test]
    fn hud_state_default() {
        let hud = HudState::default();
        assert!(!hud.paused);
        assert!(hud.selected_vm.is_none());
        assert!(hud.load_dialog_text.is_empty());
    }
}
