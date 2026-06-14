// riscv/mmu_heatmap.rs -- Live MMU Page Table Heatmap Renderer
//
// Reads the current SATP page directory from guest RAM and renders a spatial
// visualization of the Sv32 page table state into the MMIO framebuffer.
//
// Framebuffer layout (256x256):
//   Rows 0-127:   L1 page directory heatmap (32x32 grid, scaled 4x)
//     Each pixel = one L1 PTE. Color = PPN hue + flag brightness.
//     X = VPN1[4:0] (low 5 bits), Y = VPN1[9:5] (high 5 bits)
//   Rows 128-159: Legend / status bar
//   Rows 160-255: L2 detail panels (up to 6 tracked L2 pages, 32x16 each)
//
// Color encoding:
//   Hue        = PPN[19:12] (which 4MB region the entry points to)
//   Brightness = flags (V=1 makes it bright, R/W/X add saturation)
//   Special:
//     Black     = unmapped (PTE = 0 or V=0)
//     Red       = megapage leaf (R/W/X != 0 at L1)
//     Blue      = L2 pointer (R=W=X=0, V=1)
//     Yellow    = fault marker (tracked in mmu_log)
//     Green     = user page (U=1)

use super::mmu::{pte_ppn, satp_mode_enabled, satp_ppn};
use crate::riscv::bus::Bus;
use crate::riscv::framebuf::{FB_HEIGHT, FB_WIDTH};

const PTE_V: u32 = 1 << 0;
const PTE_R: u32 = 1 << 1;
const PTE_W: u32 = 1 << 2;
const PTE_X: u32 = 1 << 3;
const PTE_U: u32 = 1 << 4;
#[allow(dead_code)]
const PTE_G: u32 = 1 << 5;
#[allow(dead_code)]
const PTE_A: u32 = 1 << 6;
#[allow(dead_code)]
const PTE_D: u32 = 1 << 7;

/// RGBA pixel packing (0xRRGGBBAA format used by GeOS framebuffer)
fn rgba(r: u8, g: u8, b: u8) -> u32 {
    ((r as u32) << 24) | ((g as u32) << 16) | ((b as u32) << 8) | 0xFF
}

/// Record of instruction fetch frequency across the kernel address space.
/// Mapped spatially as a 1024x1024 or 2048x1024 grid.
#[derive(Clone)]
pub struct InstructionHeatmap {
    /// Hit counts per 4-byte word.
    /// Index = (addr - kernel_base) / 4.
    pub hits: Vec<u32>,
    /// Base address of the kernel in guest memory (usually 0x0 or 0x8000_0000).
    pub base: u64,
}

impl InstructionHeatmap {
    pub fn new(base: u64, size_bytes: usize) -> Self {
        Self {
            hits: vec![0; size_bytes / 4],
            base,
        }
    }

    /// Record a fetch at the given address.
    #[inline]
    pub fn record(&mut self, addr: u32) {
        let offset = (addr as u64).wrapping_sub(self.base);
        let idx = (offset / 4) as usize;
        if idx < self.hits.len() {
            // Saturating add to avoid overflow in long boot sessions
            self.hits[idx] = self.hits[idx].saturating_add(1);
        }
    }

    /// Render the fetch heatmap into the framebuffer.
    /// Each pixel represents one or more words.
    pub fn render(&self, fb: &mut [u32]) {
        // Clear background
        for pixel in fb.iter_mut() {
            *pixel = rgba(10, 10, 15);
        }

        let num_words = self.hits.len();
        // 256x256 view: each pixel represents (num_words / 65536) words
        let words_per_pixel = (num_words / (FB_WIDTH * FB_HEIGHT)).max(1);

        for y in 0..FB_HEIGHT {
            for x in 0..FB_WIDTH {
                let pixel_idx = y * FB_WIDTH + x;
                let start_word = pixel_idx * words_per_pixel;
                let end_word = (start_word + words_per_pixel).min(num_words);

                let mut sum = 0u64;
                for i in start_word..end_word {
                    sum += self.hits[i] as u64;
                }

                if sum > 0 {
                    // Logarithmic scale for better dynamic range visibility
                    let intensity = ((sum as f64).log2() * 20.0).min(255.0) as u32;
                    // Hot color: Blue (rare) -> Green -> Red (very hot)
                    let r = if intensity > 128 {
                        (intensity - 128) * 2
                    } else {
                        0
                    } as u8;
                    let g = if intensity < 128 {
                        intensity * 2
                    } else {
                        255 - (intensity - 128) * 2
                    } as u8;
                    let b = if intensity < 128 {
                        255 - intensity * 2
                    } else {
                        0
                    } as u8;

                    fb[pixel_idx] = rgba(r, g, b);
                }
            }
        }
    }
}

/// Map a PTE to a heatmap color.
fn pte_to_color(pte: u32) -> u32 {
    if pte & PTE_V == 0 {
        return rgba(0, 0, 0); // unmapped
    }

    let ppn = pte_ppn(pte);
    let rwx = pte & (PTE_R | PTE_W | PTE_X);
    let is_leaf = rwx != 0;
    let is_user = pte & PTE_U != 0;

    if is_leaf {
        // Megapage: brightness from PPN magnitude + minimum for valid
        let ppn_brightness = ((ppn >> 4) & 0xFF).max(80) as u8;
        let flags_byte = ((pte >> 0) & 0xFF).max(40) as u8;
        if is_user {
            // User megapage: greenish (user space)
            rgba(ppn_brightness / 4, ppn_brightness, ppn_brightness / 4)
        } else {
            // Kernel megapage: reddish
            rgba(ppn_brightness, flags_byte / 4, 0)
        }
    } else {
        // L2 pointer: blue channel with minimum brightness for valid entries
        let blue = ((ppn >> 4) & 0xFF).max(100) as u8;
        let purple = blue / 3;
        rgba(purple, purple / 2, blue)
    }
}

/// Draw a filled rectangle into the framebuffer.
fn fill_rect(fb: &mut [u32], x: usize, y: usize, w: usize, h: usize, color: u32) {
    for dy in 0..h {
        if y + dy >= FB_HEIGHT {
            break;
        }
        for dx in 0..w {
            if x + dx >= FB_WIDTH {
                break;
            }
            fb[(y + dy) * FB_WIDTH + (x + dx)] = color;
        }
    }
}

/// Draw a single pixel.
fn set_pixel(fb: &mut [u32], x: usize, y: usize, color: u32) {
    if x < FB_WIDTH && y < FB_HEIGHT {
        fb[y * FB_WIDTH + x] = color;
    }
}

/// Render a 4-bit hex digit at the given position (3x5 pixel font).
fn draw_hex_digit(fb: &mut [u32], x: usize, y: usize, digit: u8, _color: u32) {
    // Draw colored blocks mapping 0-F to brightness
    let val = digit as u32 * 17; // 0-F → 0-255
    let c = rgba(val as u8, val as u8, val as u8);
    fill_rect(fb, x, y, 3, 5, c);
}

/// Render the full MMU heatmap into the framebuffer.
///
/// Call this from the boot loop at progress checkpoints to get a live view
/// of the page table state as the kernel boots.
impl Bus {
    /// Render the current Sv32 page directory as a heatmap into the framebuffer.
    ///
    /// Layout:
    /// - Top 128 rows: L1 directory (32x32 grid, each cell = 4x4 pixels)
    /// - Row 128-159: status bar with SATP, instruction count, stats
    /// - Row 160-255: L2 detail panels
    pub fn render_mmu_heatmap(&mut self, satp: u32, instruction_count: u64, fault_count: u64) {
        let fb = &mut self.framebuf.pixels;
        let dir_ppn = satp_ppn(satp);
        let dir_pa = (dir_ppn as u64) << 12;

        // Clear framebuffer to dark gray
        for pixel in fb.iter_mut() {
            *pixel = rgba(20, 20, 30);
        }

        // === L1 HEATMAP (rows 0-127) ===
        // 32x32 grid, each cell 4x4 pixels = 128x128, centered at (64, 0)
        let grid_size = 4; // pixels per cell
        let grid_offset_x = 64;
        let grid_offset_y = 0;

        // Read all 1024 L1 PTEs
        let mut l1_stats = L1Stats::default();
        let mut l2_pointers: Vec<(usize, u32, u64)> = Vec::new(); // (vpn1, pte, l2_pa)

        for vpn1 in 0..1024u32 {
            let pte_addr = dir_pa + (vpn1 as u64) * 4;
            let pte = match self.mem.read_word(pte_addr) {
                Ok(v) => v,
                Err(_) => 0,
            };

            // Count stats
            if pte & PTE_V != 0 {
                l1_stats.valid += 1;
                let rwx = pte & (PTE_R | PTE_W | PTE_X);
                if rwx != 0 {
                    l1_stats.leaves += 1;
                } else {
                    l1_stats.l2_pointers += 1;
                    let l2_ppn = pte_ppn(pte);
                    let l2_pa = (l2_ppn as u64) << 12;
                    l2_pointers.push((vpn1 as usize, pte, l2_pa));
                }
                if pte & PTE_U != 0 {
                    l1_stats.user += 1;
                }
            }

            // Map VPN1 to grid position: X = vpn1[4:0], Y = vpn1[9:5]
            let gx = (vpn1 & 0x1F) as usize;
            let gy = ((vpn1 >> 5) & 0x1F) as usize;
            let color = pte_to_color(pte);

            // Draw 4x4 cell
            let px = grid_offset_x + gx * grid_size;
            let py = grid_offset_y + gy * grid_size;
            fill_rect(fb, px, py, grid_size, grid_size, color);

            // Draw grid lines (dark) for every 8 entries (VPN1 boundary)
            if vpn1 % 32 == 0 {
                // Vertical separator at VPN1 multiples of 32
                for row in 0..128 {
                    set_pixel(fb, px, grid_offset_y + row, rgba(60, 60, 80));
                }
            }
            if (vpn1 & 0x1F) == 0 && vpn1 > 0 {
                // Horizontal separator
                for col in 0..128 {
                    set_pixel(fb, grid_offset_x + col, py, rgba(60, 60, 80));
                }
            }
        }

        // Draw labels around the grid
        // VPN1 range labels on left side
        for row in 0..32 {
            if row % 8 == 0 {
                // Draw a tick mark
                for dx in 0..8 {
                    set_pixel(
                        fb,
                        grid_offset_x - 10 + dx,
                        grid_offset_y + row * grid_size + 1,
                        rgba(150, 150, 200),
                    );
                }
            }
        }

        // === STATUS BAR (rows 128-159) ===
        // Draw background
        fill_rect(fb, 0, 128, 256, 32, rgba(10, 10, 20));

        // SATP info as colored bars
        let satp_color = if satp_mode_enabled(satp) {
            rgba(0, 200, 0) // green = MMU enabled
        } else {
            rgba(200, 0, 0) // red = MMU off
        };

        // Draw SATP PPN as a 22-bit bar (each bit = 1 pixel wide)
        let bar_y = 130;
        let bar_x = 10;
        for bit in 0..22 {
            let is_set = (dir_ppn >> (21 - bit)) & 1 != 0;
            let color = if is_set { satp_color } else { rgba(40, 40, 50) };
            fill_rect(fb, bar_x + bit * 5, bar_y, 4, 8, color);
        }

        // ASID as a 9-bit bar
        let asid = (satp >> 22) & 0x1FF;
        let asid_color = rgba(200, 200, 0);
        for bit in 0..9 {
            let is_set = (asid >> (8 - bit)) & 1 != 0;
            let color = if is_set { asid_color } else { rgba(40, 40, 50) };
            fill_rect(fb, bar_x + bit * 5, bar_y + 12, 4, 6, color);
        }

        // Stats as numeric bars (simple histogram-style)
        // Valid entries bar
        let stats_y = 150;
        let valid_ratio = if l1_stats.valid > 0 {
            (l1_stats.valid as f32 / 1024.0 * 200.0) as usize
        } else {
            0
        };
        fill_rect(fb, 10, stats_y, valid_ratio, 3, rgba(0, 180, 0));
        fill_rect(
            fb,
            10,
            stats_y + 4,
            (l1_stats.leaves as f32 / 1024.0 * 200.0) as usize,
            3,
            rgba(200, 60, 0),
        );
        fill_rect(
            fb,
            10,
            stats_y + 8,
            (l1_stats.l2_pointers as f32 / 1024.0 * 200.0) as usize,
            3,
            rgba(60, 60, 200),
        );

        // Instruction count as brightness gradient
        let progress = ((instruction_count as f64 / 100_000_000.0).min(1.0) * 200.0) as usize;
        fill_rect(fb, 10, stats_y + 13, progress, 3, rgba(100, 100, 255));

        // Fault count indicator (red dot, size proportional to fault count)
        if fault_count > 0 {
            let fault_size = ((fault_count as f64).log2().max(1.0).min(20.0)) as usize;
            fill_rect(fb, 230, 130, fault_size, fault_size, rgba(255, 0, 0));
        }

        // === L2 DETAIL PANELS (rows 160-255) ===
        // Show up to 6 L2 page tables in a 3x2 grid, each 80x48 pixels
        fill_rect(fb, 0, 160, 256, 96, rgba(15, 15, 25));

        let l2_panel_w = 80;
        let l2_panel_h = 48;
        let l2_cols = 3;
        let l2_rows = 2;
        let l2_max = l2_cols * l2_rows;

        // Sort L2 pointers by VPN1 to get consistent ordering
        l2_pointers.sort_by_key(|&(vpn1, _, _)| vpn1);

        for (idx, &(vpn1, _pte, l2_pa)) in l2_pointers.iter().take(l2_max).enumerate() {
            let col = idx % l2_cols;
            let row = idx / l2_cols;
            let panel_x = col * l2_panel_w + 8;
            let panel_y = 160 + row * l2_panel_h + 4;

            // Draw panel border
            fill_rect(
                fb,
                panel_x - 1,
                panel_y - 1,
                l2_panel_w + 2,
                1,
                rgba(60, 60, 100),
            );
            fill_rect(
                fb,
                panel_x - 1,
                panel_y + l2_panel_h,
                l2_panel_w + 2,
                1,
                rgba(60, 60, 100),
            );
            fill_rect(fb, panel_x - 1, panel_y, 1, l2_panel_h, rgba(60, 60, 100));
            fill_rect(
                fb,
                panel_x + l2_panel_w,
                panel_y,
                1,
                l2_panel_h,
                rgba(60, 60, 100),
            );

            // Read L2 entries (1024 PTEs for a full L2 page)
            // Condensed view: each L2 entry = 1 pixel, laid out row by row
            let inner_w = l2_panel_w - 2;
            let inner_h = l2_panel_h - 2;
            // Map: entry[i] -> pixel at (i % inner_w, i / inner_w), truncated to inner_h rows

            for i in 0..1024 {
                let px = i % (inner_w as u32);
                let py = i / (inner_w as u32);
                if py >= inner_h as u32 {
                    break;
                }

                let entry_addr = l2_pa + (i as u64) * 4;
                let entry = match self.mem.read_word(entry_addr) {
                    Ok(v) => v,
                    Err(_) => 0,
                };

                let color = if entry & PTE_V == 0 {
                    rgba(10, 10, 15) // unmapped
                } else {
                    let ppn = pte_ppn(entry);
                    let rwx = entry & (PTE_R | PTE_W | PTE_X);
                    if rwx != 0 {
                        // Leaf entry: color by PPN
                        let bright = ((ppn >> 4) & 0xFF) as u8;
                        if entry & PTE_U != 0 {
                            rgba(0, bright, bright / 3) // user: cyan-ish
                        } else {
                            rgba(bright, bright / 4, 0) // kernel: orange-ish
                        }
                    } else {
                        // Non-leaf in L2 (shouldn't happen in Sv32, but handle gracefully)
                        rgba(100, 0, 100)
                    }
                };

                set_pixel(
                    fb,
                    panel_x + 1 + px as usize,
                    panel_y + 1 + py as usize,
                    color,
                );
            }

            // Draw VPN1 label as a small colored block in corner
            let label_val = vpn1 as u8;
            let label_color = rgba(label_val, label_val / 2, label_val / 4);
            fill_rect(fb, panel_x, panel_y, 6, 4, label_color);
        }

        // Draw VPN1 labels on the right side of the L1 grid
        // Using colored blocks to indicate VPN1 ranges
        let legend_x = 200;
        let legend_y = 2;
        let legend_entries = [
            (rgba(200, 50, 0), "Kern"),    // Kernel megapage
            (rgba(60, 60, 200), "L2 ptr"), // L2 pointer
            (rgba(0, 200, 0), "User"),     // User page
            (rgba(200, 0, 0), "Fault"),    // Fault
        ];
        for (i, &(color, _)) in legend_entries.iter().enumerate() {
            fill_rect(fb, legend_x, legend_y + i * 10, 8, 8, color);
        }

        // Mark the present flag so the GUI knows to refresh
        self.framebuf.present_flag = true;
    }
}

#[derive(Default)]
struct L1Stats {
    valid: u32,
    leaves: u32,
    l2_pointers: u32,
    user: u32,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pte_to_color_unmapped() {
        let color = pte_to_color(0);
        assert_eq!(color, rgba(0, 0, 0));
    }

    #[test]
    fn test_pte_to_color_valid_nonleaf() {
        // V=1, R=W=X=0 → L2 pointer (blue)
        let pte = PTE_V | PTE_A | PTE_G;
        let color = pte_to_color(pte);
        // Should have blue channel > 0
        let b = (color >> 8) & 0xFF;
        assert!(b > 0, "L2 pointer should have blue component, got b={}", b);
    }

    #[test]
    fn test_pte_to_color_leaf_kernel() {
        // V=1, R=1 → kernel megapage (red-ish)
        let pte = PTE_V | PTE_R | PTE_A | PTE_D | (0x80000 << 10);
        let color = pte_to_color(pte);
        let r = (color >> 24) & 0xFF;
        assert!(r > 0, "Kernel leaf should have red component, got r={}", r);
    }

    #[test]
    fn test_pte_to_color_leaf_user() {
        // V=1, R=1, U=1 → user page (green-ish)
        let pte = PTE_V | PTE_R | PTE_W | PTE_U | PTE_A | (0x80 << 10);
        let color = pte_to_color(pte);
        let g = (color >> 16) & 0xFF;
        assert!(g > 0, "User leaf should have green component, got g={}", g);
    }

    #[test]
    fn test_render_mmu_heatmap_doesnt_crash() {
        let mut bus = Bus::new(0x80000000, 128 * 1024 * 1024);
        // SATP pointing to page 0 (empty)
        bus.render_mmu_heatmap(0x80000000, 50_000_000, 0);
        // Should have written pixels to framebuffer
        let non_black = bus
            .framebuf
            .pixels
            .iter()
            .filter(|&&p| p != rgba(20, 20, 30))
            .count();
        // Even with empty page table, the status bar and grid lines should produce some pixels
        assert!(non_black > 0, "Heatmap should produce some visible pixels");
    }
}
