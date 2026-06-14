// riscv/viz.rs -- Live RISC-V Boot Visualization on Pixel Substrate
//
// Reads the RISC-V interpreter state and renders it as pixels:
//   - Register/CSR values as 8x8 text (using the font crate)
//   - Instruction fetch heatmap (4MB regions as 64x64 pixel grid)
//   - SBI call timeline (each call = one colored pixel stripe)
//   - Timer/privilege/counter status bar
//
// Every pixel IS a value. Every color IS a hex byte.
// This is the pixel = memory = code chain made visible.

use super::bus::Bus;
use super::cpu::{self, RiscvCpu};
use super::framebuf::{FB_HEIGHT, FB_WIDTH};
use crate::font::{GLYPHS, GLYPH_H, GLYPH_W};

// ── Color palette ──────────────────────────────────────────

/// RGBA pixel from RGB components.
#[inline(always)]
fn rgba(r: u8, g: u8, b: u8) -> u32 {
    ((r as u32) << 24) | ((g as u32) << 16) | ((b as u32) << 8) | 0xFF
}

/// Encode a byte as a color for pixel representation.
/// 0x00 = dark, 0xFF = bright, code-space addresses (0x80+) get warm tones.
fn byte_to_color(b: u8) -> u32 {
    let r = b.saturating_add(40);
    let g = (b.wrapping_mul(3)).saturating_add(20);
    let b2 = (255u8).saturating_sub(b.wrapping_mul(2));
    rgba(r, g, b2)
}

const COL_DIM: u32 = 0x0F0F19FF; // dark background
const COL_LABEL: u32 = 0x64C8FFFF; // cyan for labels
const COL_VALUE: u32 = 0xC8DCFFFF; // light blue for hex text
const COL_ACCENT: u32 = 0xFFC832FF; // amber for highlights
const COL_ALERT: u32 = 0xFF3232FF; // red for faults/traps
const COL_OK: u32 = 0x32C832FF; // green for good

// ── Font rendering (8x8 bitmap) ────────────────────────────

/// Draw a single character at (px, py) using the 8x8 font.
fn draw_char(buf: &mut [u32], ch: char, px: u32, py: u32, fg: u32) {
    let code = ch as usize;
    if code >= 128 {
        return;
    }
    let glyph = &GLYPHS[code];
    for row in 0..GLYPH_H {
        for col in 0..GLYPH_W {
            if glyph[row] & (1 << (7 - col)) != 0 {
                let x = px + col as u32;
                let y = py + row as u32;
                if x < FB_WIDTH as u32 && y < FB_HEIGHT as u32 {
                    buf[(y as usize) * FB_WIDTH + (x as usize)] = fg;
                }
            }
        }
    }
}

/// Draw text at (px, py), each char 8px wide.
fn draw_text(buf: &mut [u32], text: &str, px: u32, py: u32, fg: u32) {
    for (i, ch) in text.chars().enumerate() {
        draw_char(buf, ch, px + (i as u32) * GLYPH_W as u32, py, fg);
    }
}

/// Clear the entire framebuffer to a background color.
fn clear(buf: &mut [u32], color: u32) {
    for p in buf.iter_mut() {
        *p = color;
    }
}

/// Fill a rectangle with a solid color.
fn fill_rect(buf: &mut [u32], x0: u32, y0: u32, w: u32, h: u32, color: u32) {
    for dy in 0..h {
        for dx in 0..w {
            let x = x0 + dx;
            let y = y0 + dy;
            if x < FB_WIDTH as u32 && y < FB_HEIGHT as u32 {
                buf[(y as usize) * FB_WIDTH + (x as usize)] = color;
            }
        }
    }
}

// ── Pixel value rendering ──────────────────────────────────

/// Render a 32-bit value as 4 colored pixels starting at (px, py).
/// Each pixel's color IS one byte of the value.
fn write_value_as_pixels(buf: &mut [u32], val: u32, px: u32, py: u32) {
    for i in 0..4 {
        let byte = ((val >> (24 - i * 8)) & 0xFF) as u8;
        let x = px + (i as u32) * 2; // 2px spacing
        if x + 1 < FB_WIDTH as u32 && py < FB_HEIGHT as u32 {
            let idx = (py as usize) * FB_WIDTH + (x as usize);
            buf[idx] = byte_to_color(byte);
            if idx + 1 < buf.len() {
                buf[idx + 1] = byte_to_color(byte);
            }
        }
    }
}

/// Render a 64-bit value as 8 colored pixels at (px, py).
fn write_value64_as_pixels(buf: &mut [u32], val: u64, px: u32, py: u32) {
    write_value_as_pixels(buf, (val >> 32) as u32, px, py);
    write_value_as_pixels(buf, (val & 0xFFFF_FFFF) as u32, px + 8, py);
}

/// Format a 32-bit value as an 8-char hex string (e.g., "0x80200000")
fn hex32(val: u32) -> String {
    format!("{:08X}", val)
}

/// Format a u64 as 16-char hex
fn hex64(val: u64) -> String {
    format!("{:016X}", val)
}

// ── Privilege color ────────────────────────────────────────

fn privilege_color(priv_: cpu::Privilege) -> u32 {
    match priv_ {
        cpu::Privilege::Machine => rgba(255, 80, 80), // red = M-mode
        cpu::Privilege::Supervisor => rgba(80, 180, 255), // blue = S-mode
        cpu::Privilege::User => rgba(80, 255, 80),    // green = U-mode
    }
}

fn privilege_label(priv_: cpu::Privilege) -> &'static str {
    match priv_ {
        cpu::Privilege::Machine => "M",
        cpu::Privilege::Supervisor => "S",
        cpu::Privilege::User => "U",
    }
}

// ── SBI call type → color ──────────────────────────────────

fn sbi_call_color(a7: u32) -> u32 {
    match a7 {
        0x54494D45 => rgba(255, 255, 100),            // SET_TIMER (yellow)
        _ if a7 == 0x53595354 => rgba(100, 200, 255), // SYSTEM_RESET (cyan)
        _ if a7 & 0xFF00_0000 == 0x4800_0000 => rgba(100, 255, 150), // HSM (green)
        _ => rgba(150, 150, 150),                     // other (gray)
    }
}

/// Categorize an SBI ecall for the mini timeline
fn sbi_call_category(a7: u32) -> u32 {
    match a7 >> 24 {
        0x48 => 0,                  // 'H' HSM extension
        0x54 => 1,                  // 'T' TIME extension (SET_TIMER = 0x54494D45)
        0x49 => 2,                  // 'I' IPI
        0x52 => 3,                  // 'R' RFENCE
        _ if a7 == 0x53595354 => 4, // SYSTEM_RESET
        _ => 5,
    }
}

// ── Main render function ───────────────────────────────────

/// Render the full RISC-V boot state onto the framebuffer pixel grid.
///
/// Layout (256-wide, chars are 8px wide = 32 cols, rows are 8px tall = 32 rows):
///
///   Row 0:  "BOOT VIZ     INST: 00000000    FAULTS: 0000"
///   Row 1:  "PC: 0x80200000  SP: 0x80800000  PRIV: S"
///   Row 2:  "RA: 0xC0002C18  GP: 0xC0000000  TP: 0xC0010000"
///   Row 3:  "SATP: 0x80000000  ┃ MSTATUS: 0x00002000"
///   Row 4:  "MCAUSE: 0x0000000B  MEPC: 0x80200500"
///   Row 5:  "SCAUSE: 0x80000005  SEPC: 0xC0002C18"
///   Row 6:  "STVEC: 0xC0000000  MTVEC: 0x80000000"
///   Row 7:  "MTIME: 0x0000000012345678  TIMER_CMP: 0x..."
///   Row 8:  "(blank)"
///   Rows 9-24: Register file grid (x[0]..x[15] in first row, x[16]..x[31] second)
///   Row 25: "(blank)"
///   Rows 26-27: SBI ecall mini-timeline (each colon = one call)
///   Rows 28-31: Legend / status bar
///   Rows 32-63: MMU page table heatmap (32x32 L1 grid)
///   Rows 64-127: Instruction fetch heatmap (64x64)
///   Rows 128-255: (reserved for future)
///
pub fn render_boot_state(
    fb: &mut [u32],
    cpu: &RiscvCpu,
    mtime: u64,
    sbi_out_len: usize,
    ecall_count: usize,
    last_ecall: Option<(u32, u32, u32)>,
    instruction_count: u64,
    fault_count: u64,
    user_mode_entered: bool,
) {
    // Clear to dark
    clear(fb, COL_DIM);

    let x_8 = |col: usize| -> u32 { (col * GLYPH_W) as u32 };

    // ═══ Row 0: Header bar ═══════════════════════════════
    fill_rect(fb, 0, 0, FB_WIDTH as u32, GLYPH_H as u32, rgba(20, 20, 40));
    draw_text(fb, "BOOT VIZ", x_8(0), 0, COL_ACCENT);
    draw_text(
        fb,
        &format!("INST:{}", hex64(instruction_count)),
        x_8(12),
        0,
        COL_VALUE,
    );
    draw_text(
        fb,
        &format!("FLT:{}", hex64(fault_count as u64)),
        x_8(25),
        0,
        COL_ALERT,
    );

    // ═══ Row 1: PC, SP, privilege ════════════════════════
    draw_text(fb, "PC:", x_8(0), 1 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &format!("0x{:08X}", cpu.pc),
        x_8(3),
        1 * GLYPH_H as u32,
        COL_VALUE,
    );
    // PC as colored pixels
    write_value_as_pixels(fb, cpu.pc as u32, x_8(13), 1 * GLYPH_H as u32);

    draw_text(fb, "SP:", x_8(16), 1 * GLYPH_H as u32, COL_LABEL);
    draw_text(fb, &hex32(cpu.x[2]), x_8(19), 1 * GLYPH_H as u32, COL_VALUE);

    // Privilege indicator: colored rectangle
    let priv_col = privilege_color(cpu.privilege);
    fill_rect(fb, x_8(28), 1 * GLYPH_H as u32 + 1, 24, 6, priv_col);
    draw_text(
        fb,
        privilege_label(cpu.privilege),
        x_8(28),
        1 * GLYPH_H as u32,
        rgba(0, 0, 0),
    );

    // ═══ Row 2: RA, GP, TP ═══════════════════════════════
    draw_text(fb, "RA:", x_8(0), 2 * GLYPH_H as u32, COL_LABEL);
    draw_text(fb, &hex32(cpu.x[1]), x_8(3), 2 * GLYPH_H as u32, COL_VALUE);
    write_value_as_pixels(fb, cpu.x[1], x_8(12), 2 * GLYPH_H as u32);

    draw_text(fb, "GP:", x_8(16), 2 * GLYPH_H as u32, COL_LABEL);
    draw_text(fb, &hex32(cpu.x[3]), x_8(19), 2 * GLYPH_H as u32, COL_VALUE);

    draw_text(fb, "TP:", x_8(25), 2 * GLYPH_H as u32, COL_LABEL);
    draw_text(fb, &hex32(cpu.x[4]), x_8(28), 2 * GLYPH_H as u32, COL_VALUE);

    // ═══ Row 3: SATP + MSTATUS ═══════════════════════════
    draw_text(fb, "SATP:", x_8(0), 3 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &hex32(cpu.csr.satp),
        x_8(6),
        3 * GLYPH_H as u32,
        COL_VALUE,
    );
    write_value_as_pixels(fb, cpu.csr.satp, x_8(15), 3 * GLYPH_H as u32);

    draw_text(fb, "MSTAT:", x_8(18), 3 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &hex32(cpu.csr.mstatus),
        x_8(24),
        3 * GLYPH_H as u32,
        COL_VALUE,
    );

    // ═══ Row 4: MCAUSE + MEPC ════════════════════════════
    draw_text(fb, "MCAUSE:", x_8(0), 4 * GLYPH_H as u32, COL_LABEL);
    let mcause_str = hex32(cpu.csr.mcause);
    draw_text(
        fb,
        &mcause_str,
        x_8(7),
        4 * GLYPH_H as u32,
        if cpu.csr.mcause != 0 {
            COL_ALERT
        } else {
            COL_VALUE
        },
    );

    draw_text(fb, "MEPC:", x_8(16), 4 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &hex32(cpu.csr.mepc),
        x_8(21),
        4 * GLYPH_H as u32,
        COL_VALUE,
    );

    // ═══ Row 5: SCAUSE + SEPC ════════════════════════════
    draw_text(fb, "SCAUSE:", x_8(0), 5 * GLYPH_H as u32, COL_LABEL);
    let scause_str = hex32(cpu.csr.scause);
    draw_text(
        fb,
        &scause_str,
        x_8(7),
        5 * GLYPH_H as u32,
        if cpu.csr.scause != 0 {
            COL_ALERT
        } else {
            COL_VALUE
        },
    );

    draw_text(fb, "SEPC:", x_8(16), 5 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &hex32(cpu.csr.sepc),
        x_8(21),
        5 * GLYPH_H as u32,
        COL_VALUE,
    );

    // ═══ Row 6: STVEC + MTVEC ════════════════════════════
    draw_text(fb, "STVEC:", x_8(0), 6 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &hex32(cpu.csr.stvec),
        x_8(6),
        6 * GLYPH_H as u32,
        COL_VALUE,
    );
    write_value_as_pixels(fb, cpu.csr.stvec, x_8(15), 6 * GLYPH_H as u32);

    draw_text(fb, "MTVEC:", x_8(18), 6 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &hex32(cpu.csr.mtvec),
        x_8(24),
        6 * GLYPH_H as u32,
        COL_VALUE,
    );

    // ═══ Row 7: MTIME + MIP ══════════════════════════════
    draw_text(fb, "MTIME:", x_8(0), 7 * GLYPH_H as u32, COL_LABEL);
    draw_text(fb, &hex64(mtime), x_8(6), 7 * GLYPH_H as u32, COL_VALUE);
    write_value64_as_pixels(fb, mtime, x_8(22), 7 * GLYPH_H as u32);

    // ═══ Row 8: SBI output length + user mode flag ═══════
    draw_text(fb, "SBI_OUT:", x_8(0), 8 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &format!("{:05}", sbi_out_len),
        x_8(8),
        8 * GLYPH_H as u32,
        COL_VALUE,
    );
    draw_text(fb, "ECALLS:", x_8(14), 8 * GLYPH_H as u32, COL_LABEL);
    draw_text(
        fb,
        &format!("{:05}", cpu.ecall_count),
        x_8(21),
        8 * GLYPH_H as u32,
        COL_VALUE,
    );
    if user_mode_entered {
        draw_text(fb, "U-MODE!", x_8(26), 8 * GLYPH_H as u32, COL_OK);
    }

    // ═══ Row 9: Separator line ════════════════════════════
    let sep_y = 9 * GLYPH_H as u32;
    fill_rect(fb, 0, sep_y, FB_WIDTH as u32, 1, rgba(40, 40, 60));

    // ═══ Row 10-14: Register file (compressed) ═══════════
    // Show a0 (x10), a1 (x11), s0 (x8), s1 (x9), a7 (x17) — key registers
    let reg_pairs = [
        ("A0", cpu.x[10]),
        ("A1", cpu.x[11]),
        ("A2", cpu.x[12]),
        ("A3", cpu.x[13]),
        ("A4", cpu.x[14]),
        ("A5", cpu.x[15]),
        ("A6", cpu.x[16]),
        ("A7", cpu.x[17]),
        ("S0", cpu.x[8]),
        ("S1", cpu.x[9]),
        ("S2", cpu.x[18]),
        ("S3", cpu.x[19]),
    ];
    for (idx, (name, val)) in reg_pairs.iter().enumerate() {
        let col = if idx < 8 { idx * 4 } else { (idx - 8) * 4 };
        let row = if idx < 8 { 10 } else { 11 };
        draw_text(
            fb,
            &format!("{}:", name),
            x_8(col),
            row as u32 * GLYPH_H as u32,
            COL_LABEL,
        );
        draw_text(
            fb,
            &format!("{:08X}", val),
            x_8(col + 2),
            row as u32 * GLYPH_H as u32,
            COL_VALUE,
        );
        write_value_as_pixels(fb, *val, x_8(col + 2), row as u32 * GLYPH_H as u32 + 9);
    }

    // ═══ Row 12: SBI call statistics ══════════════════════
    draw_text(
        fb,
        &format!("SBI calls: {}", ecall_count),
        x_8(0),
        12 * GLYPH_H as u32,
        COL_LABEL,
    );
    if let Some((last_a7, last_a6, last_a0)) = last_ecall {
        draw_text(
            fb,
            &format!(
                "last: a7={:08X} a6={:08X} a0={:08X}",
                last_a7, last_a6, last_a0
            ),
            x_8(0),
            13 * GLYPH_H as u32,
            COL_VALUE,
        );
    }

    // ═══ Row 14: SBI ecall count mini-bar ═══════════════════
    let timeline_y = 14 * GLYPH_H as u32 + 2;
    draw_text(fb, "SBI ECALLS:", x_8(0), timeline_y, COL_LABEL);
    // Show ecall count as colored pixel bar: each segment = 100 calls
    let bar_cols = (ecall_count / 100).min(240);
    for i in 0..bar_cols {
        let px = (14 * GLYPH_W + i) as u32;
        let idx = (timeline_y as usize + 1) * FB_WIDTH + px as usize;
        if idx < fb.len() {
            fb[idx] = rgba(100, 200, 100);
        }
    }

    // ═══ Rows 16-31: Page table heatmap + instruction heatmap ═══════
    // The mmu_heatmap module handles this — we call render_mmu_heatmap
    // from the boot loop to paint rows 16-128.
    //
    // Instead of duplicating, we mark the region with a label:
    draw_text(fb, "MMU HEATMAP:", x_8(0), 16 * GLYPH_H as u32, COL_DIM);

    // ═══ Bottom status line ═══════════════════════════════
    let bottom_y = 31 * GLYPH_H as u32;
    fill_rect(
        fb,
        0,
        bottom_y,
        FB_WIDTH as u32,
        GLYPH_H as u32,
        rgba(20, 20, 40),
    );
    draw_text(
        fb,
        &format!(
            "[{}] PC:0x{:08X} SATP:0x{:08X} MTIME:{} FLT:{}",
            privilege_label(cpu.privilege),
            cpu.pc,
            cpu.csr.satp,
            mtime,
            fault_count,
        ),
        x_8(0),
        bottom_y,
        rgba(120, 120, 160),
    );

    // ═══ Render pixel-value bars alongside register text ══
    // This is the key insight: every hex value is ALSO a row of colored pixels
    // The PC value at row 1 is already rendered as pixels at x_8(13)
    // Let's add a pixel gradient bar showing the 4MB address space usage
    render_address_space_bar(fb, cpu, mtime);
}

/// Render a thin bar showing which 4MB regions of the 256MB address space
/// have seen instruction fetches. Each pixel column = one 4MB region.
fn render_address_space_bar(fb: &mut [u32], cpu: &RiscvCpu, _mtime: u64) {
    let bar_y = 15 * GLYPH_H as u32;
    let bar_h = 6;
    // Show 64 4MB regions = 256MB = 0x00000000..0x10000000
    // Each pixel column = one 4MB region
    for region in 0..64u32 {
        let start_addr = region * 0x400000;
        // Color based on where PC is relative to this region
        let pc = cpu.pc as u64;
        let in_region = pc >= start_addr as u64 && pc < (start_addr + 0x400000) as u64;
        let color = if in_region {
            rgba(255, 200, 50) // current execution region = amber
        } else if (start_addr as u64) < 0x20000000 {
            rgba(30, 60, 90) // low memory = cool blue
        } else if (start_addr as u64) >= 0xC0000000 {
            rgba(60, 30, 90) // high kernel vaddr = purple
        } else {
            rgba(20, 20, 30) // default
        };
        let px = region as u32;
        for dy in 0..bar_h {
            let y = bar_y + dy;
            if px < FB_WIDTH as u32 && y < FB_HEIGHT as u32 {
                fb[(y as usize) * FB_WIDTH + (px as usize)] = color;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::riscv::cpu::{Privilege, RiscvCpu};
    use crate::riscv::framebuf::{FB_HEIGHT, FB_WIDTH};

    #[test]
    fn test_viz_render_and_save_png() {
        // Build a minimal RiscvCpu — set CSRs directly via mutable fields
        let mut cpu = RiscvCpu {
            x: [0; 32],
            pc: 0x8020_0000,
            privilege: Privilege::Supervisor,
            ..Default::default()
        };
        cpu.csr.satp = 0x8000_0000;
        cpu.csr.mstatus = 0x0000_2000;
        cpu.csr.mcause = 0x8000_000B;
        cpu.csr.mepc = 0x8020_0500;
        cpu.csr.scause = 0x8000_0005;
        cpu.csr.sepc = 0xC000_2C18;
        cpu.csr.stvec = 0xC000_0000;
        cpu.csr.mtvec = 0x8000_0000;
        cpu.x[1] = 0xC000_2C18;
        cpu.x[2] = 0x8080_0000;
        cpu.x[3] = 0xC000_0000;
        cpu.x[4] = 0xC001_0000;
        cpu.x[10] = 0x0000_0005;
        cpu.x[11] = 0x8000_0000;
        cpu.x[17] = 0x5449_4D45;

        let mut fb = vec![0u32; FB_WIDTH * FB_HEIGHT];
        render_boot_state(
            &mut fb,
            &cpu,
            0x1234_5678_9ABC,
            256,
            42,
            Some((0x54494D45, 0, 0x1000)),
            50_000_000,
            0,
            false,
        );

        let png = crate::vision::encode_png(&fb);
        let out = "/tmp/boot_viz_test.png";
        std::fs::write(out, &png).expect("write png");
        eprintln!("[test_viz] Saved framebuffer snapshot to {}", out);
    }
}
