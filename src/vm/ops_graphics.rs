use super::types::*;
use super::Vm;

/// Log a render op when render_logging is enabled.
macro_rules! rlog {
    ($self:expr, $opcode:expr, $name:expr, $($arg:expr),* $(,)?) => {
        if $self.render_logging {
            $self.log_render_op($opcode, $name, &[$($arg),*]);
        }
    };
}

impl Vm {
    /// Handle graphics and pixel opcodes (0x40-0x51).
    /// Returns false if halted (user-mode IKEY), true otherwise.
    #[allow(unreachable_patterns)]
    pub(super) fn step_graphics(&mut self, opcode: u32) -> bool {
        match opcode {
            // PSET x_reg, y_reg, color_reg  -- set pixel on screen (respects clip rect)
            0x40 => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let cr = self.fetch() as usize;
                if xr < NUM_REGS && yr < NUM_REGS && cr < NUM_REGS {
                    let x = self.regs[xr] as usize;
                    let y = self.regs[yr] as usize;
                    let color = self.regs[cr];
                    rlog!(self, 0x40, "PSET", x as u32, y as u32, color);
                    self.set_pixel_clipped(x, y, color);
                    if self.trace_recording {
                        if x < 256 && y < 256 {
                            self.pixel_write_log.push(
                                x as u16,
                                y as u16,
                                self.trace_buffer.step_counter().saturating_sub(1),
                                0x40,
                                color,
                            );
                        }
                    }
                }
            }

            // PSETI x, y, color  -- set pixel with immediate values (respects clip rect)
            0x41 => {
                let x = self.fetch() as usize;
                let y = self.fetch() as usize;
                let color = self.fetch();
                rlog!(self, 0x41, "PSETI", x as u32, y as u32, color);
                self.set_pixel_clipped(x, y, color);
                if self.trace_recording {
                    if x < 256 && y < 256 {
                        self.pixel_write_log.push(
                            x as u16,
                            y as u16,
                            self.trace_buffer.step_counter().saturating_sub(1),
                            0x41,
                            color,
                        );
                    }
                }
            }

            // FILL color_reg  -- fill entire screen (respects clip rect)
            0x42 => {
                let cr = self.fetch() as usize;
                if cr < NUM_REGS {
                    let color = self.regs[cr];
                    rlog!(self, 0x42, "FILL", color);
                    if let Some((cx, cy, cw, ch)) = self.clip_rect {
                        // Fill only the clip rectangle
                        let cx = cx as usize;
                        let cy = cy as usize;
                        let cw = cw.min(256) as usize;
                        let ch = ch.min(256) as usize;
                        for dy in cy..(cy + ch).min(256) {
                            for dx in cx..(cx + cw).min(256) {
                                self.screen[dy * 256 + dx] = color;
                            }
                        }
                    } else {
                        for pixel in self.screen.iter_mut() {
                            *pixel = color;
                        }
                    }
                }
            }

            // RECTF x_reg, y_reg, w_reg, h_reg, color_reg  -- filled rectangle (respects clip rect)
            0x43 => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let wr = self.fetch() as usize;
                let hr = self.fetch() as usize;
                let cr = self.fetch() as usize;
                if xr < NUM_REGS && yr < NUM_REGS && wr < NUM_REGS && hr < NUM_REGS && cr < NUM_REGS
                {
                    let x0 = self.regs[xr] as usize;
                    let y0 = self.regs[yr] as usize;
                    let w = self.regs[wr] as usize;
                    let h = self.regs[hr] as usize;
                    let color = self.regs[cr];
                    rlog!(self, 0x43, "RECTF", x0 as u32, y0 as u32, w as u32, h as u32, color);
                    for dy in 0..h {
                        for dx in 0..w {
                            let px = x0 + dx;
                            let py = y0 + dy;
                            self.set_pixel_clipped(px, py, color);
                        }
                    }
                }
            }

            // TEXT x_reg, y_reg, addr_reg  -- render text from RAM to screen
            // When font_mode != 0 (set by FONT_SELECT 0xDC), uses the selected font.
            // Default: fixed 5x7 font, 6px advance.
            0x44 => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let ar = self.fetch() as usize;
                if xr < NUM_REGS && yr < NUM_REGS && ar < NUM_REGS {
                    let mut sx = self.regs[xr] as usize;
                    let mut sy = self.regs[yr] as usize;
                    let mut addr = self.regs[ar] as usize;
                    rlog!(self, 0x44, "TEXT", sx as u32, sy as u32, addr as u32);
                    let fg = 0xFFFFFF; // white text
                    let font_mode = self.get_font_mode();
                    loop {
                        if addr >= self.ram.len() {
                            break;
                        }
                        let ch = (self.ram[addr] & 0xFF) as u8;
                        if ch == 0 {
                            break;
                        }
                        if ch == b'\n' {
                            sx = self.regs[xr] as usize;
                            let line_h = match font_mode {
                                1 => 10, // VW: 8px glyph + 2px spacing
                                2 => 6,  // tiny: 5px + 1px
                                _ => 10, // fixed/medium: 8px + 2px
                            };
                            sy += line_h;
                            addr += 1;
                            continue;
                        }
                        match font_mode {
                            1 => {
                                // Variable-width 8x8 font
                                let advance = self.draw_char_vw(ch, sx, sy, fg, None);
                                sx += advance as usize;
                            }
                            2 => {
                                // Tiny 3x5 font
                                self.draw_char_tiny(ch, sx, sy, fg, None);
                                sx += 3;
                            }
                            3 => {
                                // Medium 5x7 font
                                self.draw_char_medium(ch, sx, sy, fg, None);
                                sx += 6;
                            }
                            _ => {
                                // Default: fixed 5x7 font
                                self.draw_char(ch, sx, sy, fg);
                                sx += 6;
                            }
                        }
                        if sx > 250 {
                            sx = self.regs[xr] as usize;
                            sy += 8;
                        }
                        addr += 1;
                    }
                }
            }

            // CMP rd, rs  -- set r0 = comparison result (-1, 0, 1)
            0x50 => {
                let rd = self.fetch() as usize;
                let rs = self.fetch() as usize;
                if rd < NUM_REGS && rs < NUM_REGS {
                    let a = self.regs[rd] as i32;
                    let b = self.regs[rs] as i32;
                    self.regs[0] = if a < b {
                        0xFFFFFFFF
                    } else if a > b {
                        1
                    } else {
                        0
                    };
                }
            }

            // MOV rd, rs -- rd = rs (register copy)
            0x51 => {
                let rd = self.fetch() as usize % NUM_REGS;
                let rs = self.fetch() as usize % NUM_REGS;
                self.regs[rd] = self.regs[rs];
            }

            // SPRITE x_reg, y_reg, addr_reg, w_reg, h_reg -- blit NxM pixels from RAM to screen
            // Color 0 in RAM means transparent (skip pixel)
            0x4A => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let ar = self.fetch() as usize;
                let wr = self.fetch() as usize;
                let hr = self.fetch() as usize;
                if xr < NUM_REGS && yr < NUM_REGS && ar < NUM_REGS && wr < NUM_REGS && hr < NUM_REGS
                {
                    let sx = self.regs[xr] as usize;
                    let sy = self.regs[yr] as usize;
                    let mut addr = self.regs[ar] as usize;
                    let w = self.regs[wr] as usize;
                    let h = self.regs[hr] as usize;
                    rlog!(
                        self,
                        0x4A,
                        "SPRITE",
                        sx as u32,
                        sy as u32,
                        w as u32,
                        h as u32,
                        addr as u32
                    );
                    for dy in 0..h {
                        for dx in 0..w {
                            if addr >= self.ram.len() {
                                break;
                            }
                            let color = self.ram[addr];
                            addr += 1;
                            if color == 0 {
                                continue;
                            } // transparent
                            let px = sx + dx;
                            let py = sy + dy;
                            self.set_pixel_clipped(px, py, color);
                        }
                    }
                }
            }

            // RAND rd  -- rd = next pseudo-random u32 (LCG: state = state*1664525 + 1013904223)
            0x49 => {
                let rd = self.fetch() as usize;
                if rd < NUM_REGS {
                    self.rand_state = self
                        .rand_state
                        .wrapping_mul(1_664_525)
                        .wrapping_add(1_013_904_223);
                    self.regs[rd] = self.rand_state;
                }
            }

            // IKEY reg  -- read keyboard from ring buffer (or legacy key_port)
            // Works in both kernel and user mode (user mode used to halt here,
            // but that killed windowed apps like snake/ball that use IKEY for input).
            // Restricted to focused_pid: non-focused processes get 0 (no key).
            0x48 => {
                let rd = self.fetch() as usize;
                if rd < NUM_REGS {
                    if self.current_pid == self.focused_pid {
                        if self.key_buffer_head != self.key_buffer_tail {
                            self.regs[rd] = self.key_buffer[self.key_buffer_head];
                            self.key_buffer[self.key_buffer_head] = 0;
                            self.key_buffer_head =
                                (self.key_buffer_head + 1) % self.key_buffer.len();
                        } else {
                            self.regs[rd] = self.key_port;
                        }
                        self.key_port = 0;
                    } else {
                        // Not focused: return 0 (no key)
                        self.regs[rd] = 0;
                    }
                }
            }

            // LINE x0r, y0r, x1r, y1r, cr  -- Bresenham line
            0x45 => {
                let x0r = self.fetch() as usize;
                let y0r = self.fetch() as usize;
                let x1r = self.fetch() as usize;
                let y1r = self.fetch() as usize;
                let cr = self.fetch() as usize;
                if x0r < NUM_REGS
                    && y0r < NUM_REGS
                    && x1r < NUM_REGS
                    && y1r < NUM_REGS
                    && cr < NUM_REGS
                {
                    let color = self.regs[cr];
                    let mut x0 = self.regs[x0r] as i32;
                    let mut y0 = self.regs[y0r] as i32;
                    let x1 = self.regs[x1r] as i32;
                    let y1 = self.regs[y1r] as i32;
                    rlog!(self, 0x45, "LINE", x0 as u32, y0 as u32, x1 as u32, y1 as u32, color);
                    let dx = (x1 - x0).abs();
                    let dy = -(y1 - y0).abs();
                    let sx: i32 = if x0 < x1 { 1 } else { -1 };
                    let sy: i32 = if y0 < y1 { 1 } else { -1 };
                    let mut err = dx + dy;
                    loop {
                        self.set_pixel_clipped(x0 as usize, y0 as usize, color);
                        if x0 == x1 && y0 == y1 {
                            break;
                        }
                        let e2 = 2 * err;
                        if e2 >= dy {
                            err += dy;
                            x0 += sx;
                        }
                        if e2 <= dx {
                            err += dx;
                            y0 += sy;
                        }
                    }
                }
            }

            // CIRCLE xr, yr, rr, cr  -- midpoint circle
            0x46 => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let rr = self.fetch() as usize;
                let cr = self.fetch() as usize;
                if xr < NUM_REGS && yr < NUM_REGS && rr < NUM_REGS && cr < NUM_REGS {
                    let cx = self.regs[xr] as i32;
                    let cy = self.regs[yr] as i32;
                    let radius = self.regs[rr] as i32;
                    let color = self.regs[cr];
                    rlog!(
                        self,
                        0x46,
                        "CIRCLE",
                        cx as u32,
                        cy as u32,
                        radius as u32,
                        color
                    );
                    let mut x = radius;
                    let mut y = 0i32;
                    let mut err = 1 - radius;
                    while x >= y {
                        let pts: [(i32, i32); 8] = [
                            (cx + x, cy + y),
                            (cx - x, cy + y),
                            (cx + x, cy - y),
                            (cx - x, cy - y),
                            (cx + y, cy + x),
                            (cx - y, cy + x),
                            (cx + y, cy - x),
                            (cx - y, cy - x),
                        ];
                        for (px, py) in pts {
                            self.set_pixel_clipped(px as usize, py as usize, color);
                        }
                        y += 1;
                        if err < 0 {
                            err += 2 * y + 1;
                        } else {
                            x -= 1;
                            err += 2 * (y - x) + 1;
                        }
                    }
                }
            }

            // SCROLL nr  -- scroll screen up by regs[nr] pixels (wraps 0 in at bottom)
            0x47 => {
                let nr = self.fetch() as usize;
                if nr < NUM_REGS {
                    let n = (self.regs[nr] as usize).min(256);
                    rlog!(self, 0x47, "SCROLL", n as u32);
                    if n > 0 {
                        self.screen.copy_within(n * 256.., 0);
                        for v in self.screen[(256 - n) * 256..].iter_mut() {
                            *v = 0;
                        }
                    }
                }
            }

            // ASM src_reg, dest_reg -- assemble source text from RAM, write bytecode to RAM
            // Source: null-terminated ASCII string at ram[regs[src_reg]]
            // Dest: bytecode written starting at ram[regs[dest_reg]]
            // Result: ram[0xFFD] = bytecode word count (success) or 0xFFFFFFFF (error)
            0x4B => {
                let sr = self.fetch() as usize;
                let dr = self.fetch() as usize;
                if sr < NUM_REGS && dr < NUM_REGS {
                    let src_addr = self.regs[sr] as usize;
                    let dest_addr = self.regs[dr] as usize;
                    // Read null-terminated ASCII string from RAM
                    let mut chars = Vec::new();
                    let mut a = src_addr;
                    while a < self.ram.len() {
                        let byte = (self.ram[a] & 0xFF) as u8;
                        if byte == 0 {
                            break;
                        }
                        chars.push(byte as char);
                        a += 1;
                    }
                    let source: String = chars.into_iter().collect();
                    // Call the assembler (base_addr = dest_addr for correct label resolution)
                    match crate::assembler::assemble(&source, dest_addr) {
                        Ok(result) => {
                            for (i, &word) in result.pixels.iter().enumerate() {
                                let idx = dest_addr + i;
                                if idx < self.ram.len() {
                                    self.ram[idx] = word;
                                }
                            }
                            self.ram[0xFFD] = result.pixels.len() as u32;
                        }
                        Err(_) => {
                            self.ram[0xFFD] = 0xFFFFFFFF;
                        }
                    }
                }
            }

            // TILEMAP xr, yr, mr, tr, gwr, ghr, twr, thr -- grid blit
            0x4C => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let mr = self.fetch() as usize;
                let tr = self.fetch() as usize;
                let gwr = self.fetch() as usize;
                let ghr = self.fetch() as usize;
                let twr = self.fetch() as usize;
                let thr = self.fetch() as usize;
                if xr < NUM_REGS
                    && yr < NUM_REGS
                    && mr < NUM_REGS
                    && tr < NUM_REGS
                    && gwr < NUM_REGS
                    && ghr < NUM_REGS
                    && twr < NUM_REGS
                    && thr < NUM_REGS
                {
                    let x0 = self.regs[xr] as i32;
                    let y0 = self.regs[yr] as i32;
                    let map_base = self.regs[mr] as usize;
                    let tiles_base = self.regs[tr] as usize;
                    let gw = self.regs[gwr] as usize;
                    let gh = self.regs[ghr] as usize;
                    let tw = self.regs[twr] as usize;
                    let th = self.regs[thr] as usize;

                    if tw > 0 && th > 0 {
                        for row in 0..gh {
                            for col in 0..gw {
                                let map_idx = row * gw + col;
                                let ram_map_addr = map_base + map_idx;
                                if ram_map_addr >= self.ram.len() {
                                    continue;
                                }

                                self.log_access(ram_map_addr, MemAccessKind::Read);
                                let tile_idx = self.ram[ram_map_addr] as usize;
                                if tile_idx == 0 {
                                    continue;
                                } // skip tile 0 (empty)

                                // Tile 1 is at offset 0, tile 2 at (tw*th), etc.
                                let tile_data_offset = (tile_idx - 1) * (tw * th);

                                for ty in 0..th {
                                    for tx in 0..tw {
                                        let pixel_idx = tile_data_offset + ty * tw + tx;
                                        let ram_pixel_addr = tiles_base + pixel_idx;
                                        if ram_pixel_addr >= self.ram.len() {
                                            continue;
                                        }

                                        self.log_access(ram_pixel_addr, MemAccessKind::Read);
                                        let color = self.ram[ram_pixel_addr];
                                        if color == 0 {
                                            continue;
                                        } // transparency

                                        let px = x0 + (col * tw) as i32 + tx as i32;
                                        let py = y0 + (row * th) as i32 + ty as i32;

                                        self.set_pixel_clipped(px as usize, py as usize, color);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // SPAWN addr_reg  -- create child with isolated address space
            // Returns PID (1-based) in RAM[0xFFA], or 0xFFFFFFFF on error
            // Uses copy-on-write: shares parent's physical pages, copies on write.
            //
            // Mapping strategy:
            //  - If start_addr is in pages 0-2: identity-map pages 0-2 as COW.
            //    Virtual addr X == physical addr X, so .org label addresses resolve
            //    correctly for JMP/CALL.  Child PC = start_addr.
            //  - If start_addr is in page 3+: sequential mapping (legacy mode).
            //    vpage N -> physical page (start_page + N).  Only works for
            //    sequential code (no JMP to .org addresses).  Child PC = page_offset.
            0x4D => {
                let ar = self.fetch() as usize;
                if ar < NUM_REGS {
                    let active_count = self.processes.iter().filter(|p| !p.is_halted()).count();
                    if active_count >= MAX_PROCESSES {
                        self.ram[0xFFA] = 0xFFFFFFFF;
                    } else {
                        let start_addr = self.regs[ar];
                        let start_page = (start_addr as usize) / PAGE_SIZE;
                        let page_offset = start_addr % (PAGE_SIZE as u32);
                        let mut pd = vec![PAGE_UNMAPPED; NUM_PAGES];

                        // Determine child PC based on mapping strategy
                        let child_pc: u32;
                        let identity_map = start_page < 3;

                        if identity_map {
                            // Identity-map pages 0-2: virtual addr N == physical addr N
                            for (phys_page, pd_entry) in pd.iter_mut().enumerate().take(3) {
                                if phys_page >= NUM_RAM_PAGES {
                                    break;
                                }
                                *pd_entry = phys_page as u32;
                                if self.page_ref_count[phys_page] == 0 {
                                    self.page_ref_count[phys_page] = 1;
                                }
                                self.page_ref_count[phys_page] += 1;
                                self.page_cow |= 1u64 << phys_page;
                            }
                            child_pc = start_addr;
                        } else {
                            // Sequential mapping: vpage N -> phys page (start_page + N)
                            for (vpage, pd_entry) in pd.iter_mut().enumerate().take(PROCESS_PAGES) {
                                let parent_phys = start_page + vpage;
                                if parent_phys >= NUM_RAM_PAGES {
                                    break;
                                }
                                if vpage == 3 || parent_phys == 3 {
                                    *pd_entry = 3;
                                    self.page_ref_count[3] += 1;
                                    continue;
                                }
                                *pd_entry = parent_phys as u32;
                                self.page_ref_count[parent_phys] += 1;
                                self.page_cow |= 1u64 << parent_phys;
                            }
                            child_pc = page_offset;
                        }

                        // Page 3 (0xC00-0xFFF): shared region, identity-mapped, NOT COW
                        if !identity_map {
                            // Already handled in loop above for sequential mode
                            // but ensure it's set
                        }
                        // For identity_map mode, page 3 needs explicit setup since
                        // the loop only covers pages 0-2
                        if identity_map {
                            pd[3] = 3;
                            if self.page_ref_count[3] == 0 {
                                self.page_ref_count[3] = 1;
                            }
                            self.page_ref_count[3] += 1;
                        }

                        // Page 63 (hardware ports / syscall table) - always identity-mapped
                        pd[63] = 63;

                        let pid = (self.processes.len() + 1) as u32;
                        self.processes.push(SpawnedProcess {
                            pc: child_pc,
                            regs: [0; NUM_REGS],
                            state: ProcessState::Ready,
                            pid,
                            mode: CpuMode::User,
                            page_dir: Some(pd),
                            segfaulted: false,
                            priority: 1,
                            slice_remaining: 0,
                            sleep_until: 0,
                            yielded: false,
                            kernel_stack: Vec::new(),
                            msg_queue: Vec::new(),
                            exit_code: 0,
                            parent_pid: self.current_pid,
                            pending_signals: Vec::new(),
                            signal_handlers: [0; 4],
                            vmas: Process::default_vmas_for_process(),
                            brk_pos: PAGE_SIZE as u32,
                            custom_font: None,
                            font_mode: 0,
                            capabilities: None,
                            data_base: 0,
                        });
                        self.ram[0xFFA] = pid;
                    }
                }
            }

            // KILL pid_reg  -- halt child, free its pages
            // Returns 1 in RAM[0xFFA] on success, 0 if not found
            0x4E => {
                let pr = self.fetch() as usize;
                if pr < NUM_REGS {
                    let target_pid = self.regs[pr];
                    let mut found = false;
                    let mut free_pd: Option<Vec<u32>> = None;
                    for proc in &mut self.processes {
                        if proc.pid == target_pid {
                            free_pd = proc.page_dir.take();
                            proc.state = ProcessState::Zombie;
                            found = true;
                            break;
                        }
                    }
                    if let Some(ref pd) = free_pd {
                        self.free_page_dir(pd);
                    }
                    self.ram[0xFFA] = if found { 1 } else { 0 };
                }
            }

            // PEEK rx, ry, rd  -- read screen pixel at (rx,ry) into rd
            // Out-of-bounds coordinates return 0
            0x4F => {
                let rx = self.fetch() as usize % NUM_REGS;
                let ry = self.fetch() as usize % NUM_REGS;
                let rd = self.fetch() as usize % NUM_REGS;
                let x = self.regs[rx] as usize;
                let y = self.regs[ry] as usize;
                if x < 256 && y < 256 {
                    self.regs[rd] = self.screen[y * 256 + x];
                } else {
                    self.regs[rd] = 0;
                }
            }

            // VWTXT x_reg, y_reg, addr_reg, fg_reg, bg_reg  (0xDB)
            // Variable-width text rendering using per-glyph advance widths.
            // Each character advances by its own width (narrow 'i'=3px, wide 'M'=8px).
            // This produces more readable, proportional text than fixed-width fonts.
            // Line height: 10px (8px glyph + 2px spacing).
            0xDB => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let ar = self.fetch() as usize;
                let fgr = self.fetch() as usize;
                let bgr = self.fetch() as usize;
                if xr < NUM_REGS
                    && yr < NUM_REGS
                    && ar < NUM_REGS
                    && fgr < NUM_REGS
                    && bgr < NUM_REGS
                {
                    let mut sx = self.regs[xr] as usize;
                    let mut sy = self.regs[yr] as usize;
                    let mut addr = self.regs[ar] as usize;
                    let fg = self.regs[fgr];
                    let bg_val = self.regs[bgr];
                    rlog!(
                        self,
                        0xDB,
                        "VWTXT",
                        sx as u32,
                        sy as u32,
                        fg,
                        bg_val,
                        addr as u32
                    );
                    let bg = if bg_val == 0 { None } else { Some(bg_val) };
                    let mut prev_ch: u8 = 0;
                    loop {
                        if addr >= self.ram.len() {
                            break;
                        }
                        let ch = (self.ram[addr] & 0xFF) as u8;
                        if ch == 0 {
                            break;
                        }
                        if ch == b'\n' {
                            sx = self.regs[xr] as usize;
                            sy += 10;
                            prev_ch = 0;
                            addr += 1;
                            continue;
                        }
                        // Apply kerning: adjust x position based on previous character pair
                        if prev_ch != 0 {
                            let kern = crate::font::get_kerning(prev_ch, ch);
                            if kern < 0 {
                                sx = sx.saturating_sub(-kern as usize);
                            } else {
                                sx += kern as usize;
                            }
                        }
                        let advance = self.draw_char_vw(ch, sx, sy, fg, bg);
                        sx += advance as usize;
                        prev_ch = ch;
                        // Word wrap: if we're past column 248, go to next line
                        if sx > 248 {
                            sx = self.regs[xr] as usize;
                            sy += 10;
                            prev_ch = 0;
                        }
                        addr += 1;
                    }
                }
            }

            // FONT_SELECT mode_reg  (0xDC)
            // Select font mode for TEXT opcode (Phase 210).
            // r[mode_reg]: 0 = fixed 5x7 (default), 1 = variable-width 8x8,
            //   2 = tiny 3x5, 3 = medium 5x7.
            // Persists per-process until changed. Invalid values are clamped to 0-3.
            // r0 = previous font mode (for save/restore).
            0xDC => {
                let mr = self.fetch() as usize;
                if mr < NUM_REGS {
                    let old_mode = self.get_font_mode();
                    let new_mode = (self.regs[mr] & 0x3) as u8;
                    self.set_font_mode(new_mode);
                    self.regs[0] = old_mode as u32;
                }
            }

            // ── Phase 241: ROTATE opcode (0xF4) ──
            // ROTATE x_reg, y_reg, w_reg, h_reg, angle_reg
            // Rotates a rectangular screen region around its center.
            // angle_reg: fixed-point radians (value / 256.0 = radians).
            //   Example: 16384 ≈ 2π (full rotation), 4096 ≈ π/2 (90°).
            // Uses nearest-neighbor sampling. Source rect bounds the read;
            // rotated pixels outside the source rect are transparent (black).
            // Encoding: 6 words [0xF4, x_reg, y_reg, w_reg, h_reg, angle_reg]
            0xF4 => {
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                let wr = self.fetch() as usize;
                let hr = self.fetch() as usize;
                let ar = self.fetch() as usize;
                if xr < NUM_REGS && yr < NUM_REGS && wr < NUM_REGS && hr < NUM_REGS && ar < NUM_REGS
                {
                    let sx = self.regs[xr] as usize;
                    let sy = self.regs[yr] as usize;
                    let sw = self.regs[wr] as usize;
                    let sh = self.regs[hr] as usize;
                    let angle_fixed = self.regs[ar] as i32;

                    if sw == 0 || sh == 0 || sw > 256 || sh > 256 {
                        // Degenerate or oversized rect -- no-op
                    } else {
                        // Convert fixed-point angle to radians (f32)
                        let angle_rad = angle_fixed as f32 / 256.0;
                        let cos_a = angle_rad.cos();
                        let sin_a = angle_rad.sin();

                        // Center of source rect (for rotation)
                        let _cx = sx + sw / 2;
                        let _cy = sy + sh / 2;

                        // Capture source pixels into a temp buffer
                        let mut src_buf = vec![0u32; sw * sh];
                        for dy in 0..sh {
                            for dx in 0..sw {
                                let px = sx + dx;
                                let py = sy + dy;
                                if px < 256 && py < 256 {
                                    src_buf[dy * sw + dx] = self.screen[py * 256 + px];
                                }
                            }
                        }

                        // Write rotated pixels back to screen
                        for dy in 0..sh {
                            for dx in 0..sw {
                                // Point relative to center
                                let rx = dx as f32 - (sw / 2) as f32 + 0.5;
                                let ry = dy as f32 - (sh / 2) as f32 + 0.5;

                                // Inverse rotate to find source pixel
                                let src_x = rx * cos_a + ry * sin_a + (sw / 2) as f32 - 0.5;
                                let src_y = -rx * sin_a + ry * cos_a + (sh / 2) as f32 - 0.5;

                                // Nearest-neighbor sampling
                                let sx_i = src_x.round() as isize;
                                let sy_i = src_y.round() as isize;

                                let color = if sx_i >= 0
                                    && sx_i < sw as isize
                                    && sy_i >= 0
                                    && sy_i < sh as isize
                                {
                                    src_buf[sy_i as usize * sw + sx_i as usize]
                                } else {
                                    0 // out of bounds = black/transparent
                                };

                                let px = sx + dx;
                                let py = sy + dy;
                                self.set_pixel_clipped(px, py, color);
                            }
                        }
                    }
                    if self.render_logging {
                        self.log_render_op(
                            0xF4,
                            "ROTATE",
                            &[
                                sx as u32,
                                sy as u32,
                                sw as u32,
                                sh as u32,
                                angle_fixed as u32,
                            ],
                        );
                    }
                }
            }

            // ── Phase 241: SCALE opcode (0xF5) ──
            // SCALE sx_reg, sy_reg, sw_reg, sh_reg, dx_reg, dy_reg, dw_reg, dh_reg
            // Scales a rectangular screen region from source to destination.
            // Source rect: (sx, sy, sw, sh) -- where to read from.
            // Dest rect:   (dx, dy, dw, dh) -- where to write to.
            // Uses nearest-neighbor sampling. Dest can be larger or smaller than source.
            // Encoding: 9 words [0xF5, sx_reg, sy_reg, sw_reg, sh_reg, dx_reg, dy_reg, dw_reg, dh_reg]
            0xF5 => {
                let sxr = self.fetch() as usize;
                let syr = self.fetch() as usize;
                let swr = self.fetch() as usize;
                let shr = self.fetch() as usize;
                let dxr = self.fetch() as usize;
                let dyr = self.fetch() as usize;
                let dwr = self.fetch() as usize;
                let dhr = self.fetch() as usize;
                if sxr < NUM_REGS
                    && syr < NUM_REGS
                    && swr < NUM_REGS
                    && shr < NUM_REGS
                    && dxr < NUM_REGS
                    && dyr < NUM_REGS
                    && dwr < NUM_REGS
                    && dhr < NUM_REGS
                {
                    let sx = self.regs[sxr] as usize;
                    let sy = self.regs[syr] as usize;
                    let sw = self.regs[swr] as usize;
                    let sh = self.regs[shr] as usize;
                    let dx = self.regs[dxr] as usize;
                    let dy = self.regs[dyr] as usize;
                    let dw = self.regs[dwr] as usize;
                    let dh = self.regs[dhr] as usize;

                    if sw == 0 || sh == 0 || dw == 0 || dh == 0 {
                        // Degenerate -- no-op
                    } else {
                        // Capture source pixels
                        let src_w = sw.min(256);
                        let src_h = sh.min(256);
                        let mut src_buf = vec![0u32; src_w * src_h];
                        for row in 0..src_h {
                            for col in 0..src_w {
                                let px = (sx + col).min(255);
                                let py = (sy + row).min(255);
                                src_buf[row * src_w + col] = self.screen[py * 256 + px];
                            }
                        }

                        // Write scaled pixels to destination
                        let dst_w = dw.min(256);
                        let dst_h = dh.min(256);
                        for row in 0..dst_h {
                            for col in 0..dst_w {
                                // Map dest pixel to source pixel (nearest neighbor)
                                let src_col = (col as u64 * src_w as u64 / dst_w as u64) as usize;
                                let src_row = (row as u64 * src_h as u64 / dst_h as u64) as usize;
                                let color = src_buf
                                    [src_row.min(src_h - 1) * src_w + src_col.min(src_w - 1)];

                                let px = dx + col;
                                let py = dy + row;
                                self.set_pixel_clipped(px, py, color);
                            }
                        }
                    }
                    if self.render_logging {
                        self.log_render_op(
                            0xF5,
                            "SCALE",
                            &[
                                sx as u32, sy as u32, sw as u32, sh as u32, dx as u32, dy as u32,
                                dw as u32, dh as u32,
                            ],
                        );
                    }
                }
            }

            _ => {}
        }
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::types::*;

    /// Helper: create a VM, load bytecode at addr, set registers, execute one step.
    fn step_one(bytecode: &[u32], addr: u32) -> Vm {
        let mut vm = Vm::new();
        for (i, &w) in bytecode.iter().enumerate() {
            let a = addr as usize + i;
            if a < vm.ram.len() {
                vm.ram[a] = w;
            }
        }
        vm.pc = addr;
        vm.halted = false;
        vm.step();
        vm
    }

    /// Helper: clone a VM (with pre-set registers/RAM), load bytecode, execute one step.
    fn step_from(vm: &Vm, bytecode: &[u32], addr: u32) -> Vm {
        let mut vm2 = Vm::new();
        vm2.regs.copy_from_slice(&vm.regs);
        let ram_len = vm.ram.len().min(vm2.ram.len());
        vm2.ram[..ram_len].copy_from_slice(&vm.ram[..ram_len]);
        vm2.screen.copy_from_slice(&vm.screen);
        vm2.current_pid = vm.current_pid;
        vm2.focused_pid = vm.focused_pid;
        vm2.mode = vm.mode;
        vm2.clip_rect = vm.clip_rect;
        vm2.key_port = vm.key_port;
        vm2.key_buffer.copy_from_slice(&vm.key_buffer);
        vm2.key_buffer_head = vm.key_buffer_head;
        vm2.key_buffer_tail = vm.key_buffer_tail;
        vm2.rand_state = vm.rand_state;
        for (i, &w) in bytecode.iter().enumerate() {
            let a = addr as usize + i;
            if a < vm2.ram.len() {
                vm2.ram[a] = w;
            }
        }
        vm2.pc = addr;
        vm2.halted = false;
        vm2.step();
        vm2
    }

    /// Helper: write a null-terminated string into RAM.
    fn write_string(vm: &mut Vm, addr: usize, s: &str) {
        for (i, &byte) in s.as_bytes().iter().enumerate() {
            if addr + i < vm.ram.len() {
                vm.ram[addr + i] = byte as u32;
            }
        }
        if addr + s.len() < vm.ram.len() {
            vm.ram[addr + s.len()] = 0;
        }
    }

    // ══════════════════════════════════════════════════════════════════
    // PSET (0x40) -- set pixel with register args
    // Encoding: [0x40, x_reg, y_reg, color_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_pset_basic() {
        let mut vm = Vm::new();
        vm.regs[1] = 10; // x
        vm.regs[2] = 20; // y
        vm.regs[3] = 0xFF0000; // color = red
        let vm = step_from(&vm, &[0x40, 1, 2, 3], 0);
        assert_eq!(vm.screen[20 * 256 + 10], 0xFF0000);
    }

    #[test]
    fn test_pset_zero_coords() {
        let mut vm = Vm::new();
        vm.regs[1] = 0;
        vm.regs[2] = 0;
        vm.regs[3] = 0x00FF00;
        let vm = step_from(&vm, &[0x40, 1, 2, 3], 0);
        assert_eq!(vm.screen[0], 0x00FF00);
    }

    #[test]
    fn test_pset_max_valid_coords() {
        let mut vm = Vm::new();
        vm.regs[1] = 255;
        vm.regs[2] = 255;
        vm.regs[3] = 0x0000FF;
        let vm = step_from(&vm, &[0x40, 1, 2, 3], 0);
        assert_eq!(vm.screen[255 * 256 + 255], 0x0000FF);
    }

    #[test]
    fn test_pset_out_of_bounds_x() {
        let mut vm = Vm::new();
        vm.regs[1] = 256; // out of bounds
        vm.regs[2] = 10;
        vm.regs[3] = 0xFFFFFF;
        let vm = step_from(&vm, &[0x40, 1, 2, 3], 0);
        // set_pixel_clipped silently discards -- no crash, pixel not set
        // Check a nearby pixel to confirm no write happened
        assert_eq!(vm.screen[10 * 256 + 10], 0);
    }

    #[test]
    fn test_pset_out_of_bounds_y() {
        let mut vm = Vm::new();
        vm.regs[1] = 10;
        vm.regs[2] = 300; // out of bounds
        vm.regs[3] = 0xFFFFFF;
        let vm = step_from(&vm, &[0x40, 1, 2, 3], 0);
        assert_eq!(vm.screen[10], 0);
    }

    #[test]
    fn test_pset_with_clip_rect() {
        // Test via CLIPSET opcode (0xC4) to set clip, then PSET
        // CLIPSET: [0xC4, x_reg, y_reg, w_reg, h_reg] (5 words)
        let mut vm = Vm::new();
        vm.regs[1] = 50; // x
        vm.regs[2] = 50; // y
        vm.regs[3] = 10; // w
        vm.regs[4] = 10; // h
        // CLIPSET r1, r2, r3, r4
        let vm = step_from(&vm, &[0xC4, 1, 2, 3, 4], 0);
        assert!(vm.clip_rect.is_some());
        let (cx, cy, cw, ch) = vm.clip_rect.unwrap();
        assert_eq!(cx, 50);
        assert_eq!(cy, 50);
        assert_eq!(cw, 10);
        assert_eq!(ch, 10);
    }

    #[test]
    fn test_clipclr_clears_rect() {
        let mut vm = Vm::new();
        vm.clip_rect = Some((10, 10, 50, 50));
        // CLIPCLR: [0xC5] (1 word)
        let vm = step_from(&vm, &[0xC5], 0);
        assert!(vm.clip_rect.is_none());
    }

    #[test]
    fn test_pset_invalid_register() {
        // Register index >= NUM_REGS (32) should be silently ignored
        let vm = step_one(&[0x40, 33, 2, 3], 0);
        assert_eq!(vm.screen[0], 0); // no crash, no write
    }

    // ══════════════════════════════════════════════════════════════════
    // PSETI (0x41) -- set pixel with immediate values
    // Encoding: [0x41, x_imm, y_imm, color_imm]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_pseti_basic() {
        let vm = step_one(&[0x41, 5, 15, 0x00FF00], 0);
        assert_eq!(vm.screen[15 * 256 + 5], 0x00FF00);
    }

    #[test]
    fn test_pseti_origin() {
        let vm = step_one(&[0x41, 0, 0, 0xFFFFFF], 0);
        assert_eq!(vm.screen[0], 0xFFFFFF);
    }

    #[test]
    fn test_pseti_corner() {
        let vm = step_one(&[0x41, 255, 255, 0x123456], 0);
        assert_eq!(vm.screen[255 * 256 + 255], 0x123456);
    }

    #[test]
    fn test_pseti_out_of_bounds() {
        let vm = step_one(&[0x41, 256, 256, 0xFFFFFF], 0);
        // Should not crash
        assert_eq!(vm.screen[255 * 256 + 255], 0);
    }

    #[test]
    fn test_pseti_black() {
        let mut vm = Vm::new();
        // First set a pixel to white, then overwrite with black
        vm.screen[10 * 256 + 20] = 0xFFFFFF;
        vm.regs[0] = 0; // not used by PSETI
        let vm = step_from(&vm, &[0x41, 20, 10, 0x000000], 0);
        assert_eq!(vm.screen[10 * 256 + 20], 0x000000);
    }

    // ══════════════════════════════════════════════════════════════════
    // FILL (0x42) -- fill screen
    // Encoding: [0x42, color_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_fill_blue() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x0000FF;
        let vm = step_from(&vm, &[0x42, 1], 0);
        // Check several pixels across the screen
        assert_eq!(vm.screen[0], 0x0000FF);
        assert_eq!(vm.screen[128 * 256 + 128], 0x0000FF);
        assert_eq!(vm.screen[255 * 256 + 255], 0x0000FF);
    }

    #[test]
    fn test_fill_black() {
        let mut vm = Vm::new();
        // Pre-fill with white
        for p in vm.screen.iter_mut() {
            *p = 0xFFFFFF;
        }
        vm.regs[1] = 0;
        let vm = step_from(&vm, &[0x42, 1], 0);
        assert_eq!(vm.screen[0], 0);
        assert_eq!(vm.screen[255 * 256 + 255], 0);
    }

    #[test]
    fn test_fill_with_clip_rect() {
        let mut vm = Vm::new();
        vm.clip_rect = Some((10, 10, 20, 20));
        vm.regs[1] = 0xFF0000;
        let vm = step_from(&vm, &[0x42, 1], 0);
        // Inside clip: should be red
        assert_eq!(vm.screen[15 * 256 + 15], 0xFF0000);
        // Outside clip: should remain black
        assert_eq!(vm.screen[0], 0);
        assert_eq!(vm.screen[5 * 256 + 5], 0);
        assert_eq!(vm.screen[200 * 256 + 200], 0);
    }

    #[test]
    fn test_fill_invalid_register() {
        let vm = step_one(&[0x42, 33], 0);
        // Should not crash, screen remains all zeros
        assert_eq!(vm.screen[0], 0);
    }

    // ══════════════════════════════════════════════════════════════════
    // RECTF (0x43) -- filled rectangle
    // Encoding: [0x43, x_reg, y_reg, w_reg, h_reg, color_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_rectf_basic() {
        let mut vm = Vm::new();
        vm.regs[1] = 10; // x
        vm.regs[2] = 20; // y
        vm.regs[3] = 30; // w
        vm.regs[4] = 40; // h
        vm.regs[5] = 0x00FF00; // color = green
        let vm = step_from(&vm, &[0x43, 1, 2, 3, 4, 5], 0);
        // Top-left corner
        assert_eq!(vm.screen[20 * 256 + 10], 0x00FF00);
        // Bottom-right corner (x=39, y=59)
        assert_eq!(vm.screen[59 * 256 + 39], 0x00FF00);
        // Just outside
        assert_eq!(vm.screen[20 * 256 + 9], 0);
        assert_eq!(vm.screen[60 * 256 + 10], 0);
    }

    #[test]
    fn test_rectf_zero_size() {
        let mut vm = Vm::new();
        vm.regs[1] = 50;
        vm.regs[2] = 50;
        vm.regs[3] = 0; // w=0
        vm.regs[4] = 10;
        vm.regs[5] = 0xFF0000;
        let vm = step_from(&vm, &[0x43, 1, 2, 3, 4, 5], 0);
        // No pixels should be set
        assert_eq!(vm.screen[50 * 256 + 50], 0);
    }

    #[test]
    fn test_rectf_single_pixel() {
        let mut vm = Vm::new();
        vm.regs[1] = 100;
        vm.regs[2] = 100;
        vm.regs[3] = 1;
        vm.regs[4] = 1;
        vm.regs[5] = 0xFFFFFF;
        let vm = step_from(&vm, &[0x43, 1, 2, 3, 4, 5], 0);
        assert_eq!(vm.screen[100 * 256 + 100], 0xFFFFFF);
        assert_eq!(vm.screen[100 * 256 + 101], 0);
    }

    #[test]
    fn test_rectf_full_screen() {
        let mut vm = Vm::new();
        vm.regs[1] = 0;
        vm.regs[2] = 0;
        vm.regs[3] = 256;
        vm.regs[4] = 256;
        vm.regs[5] = 0x123456;
        let vm = step_from(&vm, &[0x43, 1, 2, 3, 4, 5], 0);
        assert_eq!(vm.screen[0], 0x123456);
        assert_eq!(vm.screen[255 * 256 + 255], 0x123456);
    }

    #[test]
    fn test_rectf_with_clip() {
        let mut vm = Vm::new();
        vm.clip_rect = Some((20, 20, 10, 10)); // 20,20 to 29,29
        vm.regs[1] = 0;
        vm.regs[2] = 0;
        vm.regs[3] = 256;
        vm.regs[4] = 256;
        vm.regs[5] = 0xFF0000;
        let vm = step_from(&vm, &[0x43, 1, 2, 3, 4, 5], 0);
        // Inside clip
        assert_eq!(vm.screen[25 * 256 + 25], 0xFF0000);
        // Outside clip
        assert_eq!(vm.screen[0], 0);
        assert_eq!(vm.screen[10 * 256 + 10], 0);
    }

    // ══════════════════════════════════════════════════════════════════
    // LINE (0x45) -- Bresenham line
    // Encoding: [0x45, x0_reg, y0_reg, x1_reg, y1_reg, color_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_line_horizontal() {
        let mut vm = Vm::new();
        vm.regs[1] = 10; // x0
        vm.regs[2] = 20; // y0
        vm.regs[3] = 50; // x1
        vm.regs[4] = 20; // y1 (same y = horizontal)
        vm.regs[5] = 0xFFFFFF;
        let vm = step_from(&vm, &[0x45, 1, 2, 3, 4, 5], 0);
        for x in 10..=50 {
            assert_eq!(vm.screen[20 * 256 + x], 0xFFFFFF, "pixel at ({}, 20)", x);
        }
        // Pixel above the line should be untouched
        assert_eq!(vm.screen[19 * 256 + 30], 0);
    }

    #[test]
    fn test_line_vertical() {
        let mut vm = Vm::new();
        vm.regs[1] = 30; // x0
        vm.regs[2] = 10; // y0
        vm.regs[3] = 30; // x1 (same x = vertical)
        vm.regs[4] = 60; // y1
        vm.regs[5] = 0x00FF00;
        let vm = step_from(&vm, &[0x45, 1, 2, 3, 4, 5], 0);
        for y in 10..=60 {
            assert_eq!(vm.screen[y * 256 + 30], 0x00FF00, "pixel at (30, {})", y);
        }
    }

    #[test]
    fn test_line_diagonal() {
        let mut vm = Vm::new();
        vm.regs[1] = 0; // x0
        vm.regs[2] = 0; // y0
        vm.regs[3] = 10; // x1
        vm.regs[4] = 10; // y1
        vm.regs[5] = 0xFF0000;
        let vm = step_from(&vm, &[0x45, 1, 2, 3, 4, 5], 0);
        for i in 0..=10 {
            assert_eq!(vm.screen[i * 256 + i], 0xFF0000, "pixel at ({}, {})", i, i);
        }
    }

    #[test]
    fn test_line_single_point() {
        let mut vm = Vm::new();
        vm.regs[1] = 42;
        vm.regs[2] = 42;
        vm.regs[3] = 42; // same start and end
        vm.regs[4] = 42;
        vm.regs[5] = 0xFFFFFF;
        let vm = step_from(&vm, &[0x45, 1, 2, 3, 4, 5], 0);
        assert_eq!(vm.screen[42 * 256 + 42], 0xFFFFFF);
    }

    #[test]
    fn test_line_steep() {
        // More vertical than horizontal
        let mut vm = Vm::new();
        vm.regs[1] = 50;
        vm.regs[2] = 0;
        vm.regs[3] = 53;
        vm.regs[4] = 100;
        vm.regs[5] = 0x0000FF;
        let vm = step_from(&vm, &[0x45, 1, 2, 3, 4, 5], 0);
        // Start and end points must be drawn
        assert_eq!(vm.screen[0 * 256 + 50], 0x0000FF);
        assert_eq!(vm.screen[100 * 256 + 53], 0x0000FF);
        // Should have multiple pixels in between
        let count = (0..256)
            .flat_map(|y| (0..256).map(move |x| (x, y)))
            .filter(|&(x, y)| vm.screen[y * 256 + x] == 0x0000FF)
            .count();
        assert!(count >= 10, "steep line should have >= 10 pixels, got {}", count);
    }

    // ══════════════════════════════════════════════════════════════════
    // CIRCLE (0x46) -- midpoint circle
    // Encoding: [0x46, x_reg, y_reg, radius_reg, color_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_circle_basic() {
        let mut vm = Vm::new();
        vm.regs[1] = 128; // cx
        vm.regs[2] = 128; // cy
        vm.regs[3] = 20;  // radius
        vm.regs[4] = 0xFFFFFF;
        let vm = step_from(&vm, &[0x46, 1, 2, 3, 4], 0);
        // Cardinal points must be set
        assert_eq!(vm.screen[128 * 256 + 148], 0xFFFFFF); // right (cx+r, cy)
        assert_eq!(vm.screen[128 * 256 + 108], 0xFFFFFF); // left
        assert_eq!(vm.screen[108 * 256 + 128], 0xFFFFFF); // top
        assert_eq!(vm.screen[148 * 256 + 128], 0xFFFFFF); // bottom
        // Center should NOT be set (circle outline only)
        assert_eq!(vm.screen[128 * 256 + 128], 0);
    }

    #[test]
    fn test_circle_radius_zero() {
        let mut vm = Vm::new();
        vm.regs[1] = 50;
        vm.regs[2] = 50;
        vm.regs[3] = 0;
        vm.regs[4] = 0xFF0000;
        let vm = step_from(&vm, &[0x46, 1, 2, 3, 4], 0);
        // Radius 0: should draw a single pixel at center
        assert_eq!(vm.screen[50 * 256 + 50], 0xFF0000);
    }

    #[test]
    fn test_circle_screen_edge_clipping() {
        let mut vm = Vm::new();
        vm.regs[1] = 0;   // cx at left edge
        vm.regs[2] = 0;   // cy at top edge
        vm.regs[3] = 30;  // radius extends past edges
        vm.regs[4] = 0x00FF00;
        let vm = step_from(&vm, &[0x46, 1, 2, 3, 4], 0);
        // Should not crash; some pixels on right/bottom should be set
        let count = vm.screen.iter().filter(|&&p| p == 0x00FF00).count();
        assert!(count > 0, "circle at edge should produce pixels, got {}", count);
    }

    #[test]
    fn test_circle_symmetry() {
        let mut vm = Vm::new();
        vm.regs[1] = 100;
        vm.regs[2] = 100;
        vm.regs[3] = 15;
        vm.regs[4] = 0xFFFFFF;
        let vm = step_from(&vm, &[0x46, 1, 2, 3, 4], 0);
        // Check 8-fold symmetry: top-right pixel should have matching counterparts
        // For a small circle, (cx+15, cy) and (cx, cy+15) should both be set
        assert_eq!(vm.screen[100 * 256 + 115], 0xFFFFFF); // right
        assert_eq!(vm.screen[115 * 256 + 100], 0xFFFFFF); // bottom
    }

    // ══════════════════════════════════════════════════════════════════
    // SPRITE (0x4A) -- blit NxM pixels from RAM
    // Encoding: [0x4A, x_reg, y_reg, addr_reg, w_reg, h_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_sprite_basic() {
        let mut vm = Vm::new();
        // Set up a 2x2 sprite at RAM[0x2000]: red, green, blue, white
        vm.ram[0x2000] = 0xFF0000;
        vm.ram[0x2001] = 0x00FF00;
        vm.ram[0x2002] = 0x0000FF;
        vm.ram[0x2003] = 0xFFFFFF;
        vm.regs[1] = 10;     // x
        vm.regs[2] = 20;     // y
        vm.regs[3] = 0x2000; // addr
        vm.regs[4] = 2;      // w
        vm.regs[5] = 2;      // h
        let vm = step_from(&vm, &[0x4A, 1, 2, 3, 4, 5], 0);
        assert_eq!(vm.screen[20 * 256 + 10], 0xFF0000);
        assert_eq!(vm.screen[20 * 256 + 11], 0x00FF00);
        assert_eq!(vm.screen[21 * 256 + 10], 0x0000FF);
        assert_eq!(vm.screen[21 * 256 + 11], 0xFFFFFF);
    }

    #[test]
    fn test_sprite_transparent_pixels() {
        let mut vm = Vm::new();
        // Sprite: red, transparent (0), green
        vm.ram[0x2000] = 0xFF0000;
        vm.ram[0x2001] = 0; // transparent
        vm.ram[0x2002] = 0x00FF00;
        // Pre-fill screen with white at the sprite location
        vm.screen[10 * 256 + 10] = 0xFFFFFF;
        vm.screen[10 * 256 + 11] = 0xFFFFFF;
        vm.screen[10 * 256 + 12] = 0xFFFFFF;
        vm.regs[1] = 10;
        vm.regs[2] = 10;
        vm.regs[3] = 0x2000;
        vm.regs[4] = 3;
        vm.regs[5] = 1;
        let vm = step_from(&vm, &[0x4A, 1, 2, 3, 4, 5], 0);
        assert_eq!(vm.screen[10 * 256 + 10], 0xFF0000);  // red
        assert_eq!(vm.screen[10 * 256 + 11], 0xFFFFFF);  // transparent = unchanged
        assert_eq!(vm.screen[10 * 256 + 12], 0x00FF00);  // green
    }

    #[test]
    fn test_sprite_out_of_bounds() {
        let mut vm = Vm::new();
        vm.ram[0x2000] = 0xFF0000;
        vm.ram[0x2001] = 0x00FF00;
        vm.regs[1] = 255;     // x at right edge
        vm.regs[2] = 0;
        vm.regs[3] = 0x2000;
        vm.regs[4] = 2;       // extends past screen
        vm.regs[5] = 1;
        let vm = step_from(&vm, &[0x4A, 1, 2, 3, 4, 5], 0);
        // First pixel should be drawn, second clipped
        assert_eq!(vm.screen[0 * 256 + 255], 0xFF0000);
        // No crash from out-of-bounds write
    }

    #[test]
    fn test_sprite_all_transparent() {
        let mut vm = Vm::new();
        vm.ram[0x2000] = 0;
        vm.ram[0x2001] = 0;
        vm.ram[0x2002] = 0;
        vm.ram[0x2003] = 0;
        vm.regs[1] = 10;
        vm.regs[2] = 10;
        vm.regs[3] = 0x2000;
        vm.regs[4] = 2;
        vm.regs[5] = 2;
        let vm = step_from(&vm, &[0x4A, 1, 2, 3, 4, 5], 0);
        assert_eq!(vm.screen[10 * 256 + 10], 0);
    }

    #[test]
    fn test_sprite_tile_zero_skip() {
        // In TILEMAP context, tile index 0 means empty (skip).
        // SPRITE doesn't have tile indices, but color 0 = transparent.
        // This test verifies the transparent=0 convention is consistent.
        let mut vm = Vm::new();
        vm.ram[0x2000] = 0; // transparent
        vm.screen[10 * 256 + 10] = 0x123456; // pre-existing pixel
        vm.regs[1] = 10;
        vm.regs[2] = 10;
        vm.regs[3] = 0x2000;
        vm.regs[4] = 1;
        vm.regs[5] = 1;
        let vm = step_from(&vm, &[0x4A, 1, 2, 3, 4, 5], 0);
        assert_eq!(vm.screen[10 * 256 + 10], 0x123456); // unchanged
    }

    // ══════════════════════════════════════════════════════════════════
    // CMP (0x50) -- compare registers
    // Encoding: [0x50, rd, rs]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_cmp_less_than() {
        let mut vm = Vm::new();
        vm.regs[1] = 5;
        vm.regs[2] = 10;
        let vm = step_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // -1 = less
    }

    #[test]
    fn test_cmp_equal() {
        let mut vm = Vm::new();
        vm.regs[1] = 42;
        vm.regs[2] = 42;
        let vm = step_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0); // equal
    }

    #[test]
    fn test_cmp_greater_than() {
        let mut vm = Vm::new();
        vm.regs[1] = 100;
        vm.regs[2] = 50;
        let vm = step_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 1); // greater
    }

    #[test]
    fn test_cmp_zero_zero() {
        let vm = step_one(&[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0); // 0 == 0
    }

    #[test]
    fn test_cmp_signed() {
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFFF; // -1 as i32
        vm.regs[2] = 1;           // 1
        let vm = step_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // -1 < 1
    }

    // ══════════════════════════════════════════════════════════════════
    // MOV (0x51) -- register copy
    // Encoding: [0x51, rd, rs]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_mov_basic() {
        let mut vm = Vm::new();
        vm.regs[1] = 0xDEADBEEF;
        let vm = step_from(&vm, &[0x51, 2, 1], 0);
        assert_eq!(vm.regs[2], 0xDEADBEEF);
        assert_eq!(vm.regs[1], 0xDEADBEEF); // source unchanged
    }

    #[test]
    fn test_mov_zero() {
        let mut vm = Vm::new();
        vm.regs[1] = 42;
        let vm = step_from(&vm, &[0x51, 1, 0], 0); // copy r0 (which is 0) to r1
        assert_eq!(vm.regs[1], 0);
    }

    #[test]
    fn test_mov_to_self() {
        let mut vm = Vm::new();
        vm.regs[5] = 12345;
        let vm = step_from(&vm, &[0x51, 5, 5], 0);
        assert_eq!(vm.regs[5], 12345);
    }

    #[test]
    fn test_mov_max_value() {
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFFF;
        let vm = step_from(&vm, &[0x51, 2, 1], 0);
        assert_eq!(vm.regs[2], 0xFFFFFFFF);
    }

    // ══════════════════════════════════════════════════════════════════
    // RAND (0x49) -- pseudo-random number generator
    // Encoding: [0x49, rd]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_rand_deterministic() {
        let mut vm = Vm::new();
        vm.rand_state = 42; // fixed seed
        let vm = step_from(&vm, &[0x49, 1], 0);
        let val1 = vm.regs[1];
        // Same seed should produce same value
        let mut vm2 = Vm::new();
        vm2.rand_state = 42;
        let vm2 = step_from(&vm2, &[0x49, 1], 0);
        assert_eq!(vm2.regs[1], val1);
    }

    #[test]
    fn test_rand_changes() {
        let mut vm = Vm::new();
        vm.rand_state = 42;
        let vm = step_from(&vm, &[0x49, 1], 0);
        let val1 = vm.regs[1];
        // Run again -- should produce different value
        let vm2 = step_from(&vm, &[0x49, 1], 0);
        assert_ne!(vm2.regs[1], val1, "consecutive RAND calls should differ");
    }

    #[test]
    fn test_rand_nonzero_seed() {
        let mut vm = Vm::new();
        vm.rand_state = 0;
        let vm = step_from(&vm, &[0x49, 1], 0);
        // LCG with state 0 should produce a non-zero value
        assert_ne!(vm.regs[1], 0, "RAND with state 0 should produce non-zero");
    }

    // ══════════════════════════════════════════════════════════════════
    // SCROLL (0x47) -- scroll screen up
    // Encoding: [0x47, n_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_scroll_basic() {
        let mut vm = Vm::new();
        // Put a marker at row 5
        vm.screen[5 * 256 + 10] = 0xFF0000;
        vm.regs[1] = 3; // scroll up 3 pixels
        let vm = step_from(&vm, &[0x47, 1], 0);
        // Row 5 moved to row 2
        assert_eq!(vm.screen[2 * 256 + 10], 0xFF0000);
        // Row 5 is now empty
        assert_eq!(vm.screen[5 * 256 + 10], 0);
        // Bottom rows should be zero
        assert_eq!(vm.screen[255 * 256 + 10], 0);
    }

    #[test]
    fn test_scroll_zero() {
        let mut vm = Vm::new();
        vm.screen[10 * 256 + 10] = 0x00FF00;
        vm.regs[1] = 0;
        let vm = step_from(&vm, &[0x47, 1], 0);
        // No change
        assert_eq!(vm.screen[10 * 256 + 10], 0x00FF00);
    }

    #[test]
    fn test_scroll_bottom_fills_black() {
        let mut vm = Vm::new();
        // Fill entire screen with white
        for p in vm.screen.iter_mut() {
            *p = 0xFFFFFF;
        }
        vm.regs[1] = 1;
        let vm = step_from(&vm, &[0x47, 1], 0);
        // Last row should be black
        for x in 0..256 {
            assert_eq!(vm.screen[255 * 256 + x], 0, "bottom row pixel {} should be black", x);
        }
    }

    // ══════════════════════════════════════════════════════════════════
    // PEEK (0x4F) -- read screen pixel
    // Encoding: [0x4F, x_reg, y_reg, dest_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_peek_basic() {
        let mut vm = Vm::new();
        vm.screen[20 * 256 + 30] = 0x123456;
        vm.regs[1] = 30; // x
        vm.regs[2] = 20; // y
        let vm = step_from(&vm, &[0x4F, 1, 2, 3], 0);
        assert_eq!(vm.regs[3], 0x123456);
    }

    #[test]
    fn test_peek_out_of_bounds() {
        let mut vm = Vm::new();
        vm.regs[1] = 300; // x out of bounds
        vm.regs[2] = 10;
        let vm = step_from(&vm, &[0x4F, 1, 2, 3], 0);
        assert_eq!(vm.regs[3], 0);
    }

    #[test]
    fn test_peek_origin() {
        let mut vm = Vm::new();
        vm.screen[0] = 0xFF00FF;
        vm.regs[1] = 0;
        vm.regs[2] = 0;
        let vm = step_from(&vm, &[0x4F, 1, 2, 3], 0);
        assert_eq!(vm.regs[3], 0xFF00FF);
    }

    // ══════════════════════════════════════════════════════════════════
    // IKEY (0x48) -- keyboard input
    // Encoding: [0x48, rd]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_ikey_no_key() {
        let vm = step_one(&[0x48, 1], 0);
        // No key pressed, key_buffer empty, key_port = 0
        assert_eq!(vm.regs[1], 0);
    }

    #[test]
    fn test_ikey_from_key_port() {
        let mut vm = Vm::new();
        vm.key_port = 65; // 'A'
        let vm = step_from(&vm, &[0x48, 1], 0);
        assert_eq!(vm.regs[1], 65);
        assert_eq!(vm.key_port, 0); // consumed
    }

    #[test]
    fn test_ikey_from_buffer() {
        let mut vm = Vm::new();
        vm.key_buffer[0] = 66; // 'B'
        vm.key_buffer_head = 0;
        vm.key_buffer_tail = 1;
        let vm = step_from(&vm, &[0x48, 1], 0);
        assert_eq!(vm.regs[1], 66);
        assert_eq!(vm.key_buffer_head, 1); // advanced
    }

    // ══════════════════════════════════════════════════════════════════
    // ROTATE (0xF4) -- rotate screen region
    // Encoding: [0xF4, x_reg, y_reg, w_reg, h_reg, angle_reg]
    // angle in fixed-point radians (value / 256.0)
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_rotate_zero_angle() {
        let mut vm = Vm::new();
        // Draw a red pixel in the region
        vm.screen[10 * 256 + 10] = 0xFF0000;
        vm.regs[1] = 10; // x
        vm.regs[2] = 10; // y
        vm.regs[3] = 20; // w
        vm.regs[4] = 20; // h
        vm.regs[5] = 0;  // angle = 0 (no rotation)
        let vm = step_from(&vm, &[0xF4, 1, 2, 3, 4, 5], 0);
        // Pixel should remain in place
        assert_eq!(vm.screen[10 * 256 + 10], 0xFF0000);
    }

    #[test]
    fn test_rotate_180_degrees() {
        let mut vm = Vm::new();
        // Fill region with red
        for y in 10..30 {
            for x in 10..30 {
                vm.screen[y * 256 + x] = 0xFF0000;
            }
        }
        // Set a green marker at top-left of region
        vm.screen[10 * 256 + 10] = 0x00FF00;
        vm.regs[1] = 10;
        vm.regs[2] = 10;
        vm.regs[3] = 20;
        vm.regs[4] = 20;
        vm.regs[5] = 8192; // ~π radians (180 degrees): 8192 / 256 ≈ 32 ≈ 10.04 rad ≈ π*3.2
        let vm = step_from(&vm, &[0xF4, 1, 2, 3, 4, 5], 0);
        // After rotation, total non-zero pixels in region should still be 400 (20x20)
        let mut pixel_count = 0u32;
        for y in 10..30u32 {
            for x in 10..30u32 {
                if vm.screen[(y * 256 + x) as usize] != 0 {
                    pixel_count += 1;
                }
            }
        }
        assert!(pixel_count >= 300, "region should have >= 300 pixels after rotation, got {}", pixel_count);
    }

    #[test]
    fn test_rotate_degenerate_size() {
        let mut vm = Vm::new();
        vm.screen[10 * 256 + 10] = 0xFF0000;
        vm.regs[1] = 10;
        vm.regs[2] = 10;
        vm.regs[3] = 0; // w=0 -> degenerate, no-op
        vm.regs[4] = 20;
        vm.regs[5] = 4096;
        let vm = step_from(&vm, &[0xF4, 1, 2, 3, 4, 5], 0);
        // No-op: pixel unchanged
        assert_eq!(vm.screen[10 * 256 + 10], 0xFF0000);
    }

    // ══════════════════════════════════════════════════════════════════
    // SCALE (0xF5) -- scale screen region
    // Encoding: [0xF5, sx_reg, sy_reg, sw_reg, sh_reg, dx_reg, dy_reg, dw_reg, dh_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_scale_up_2x() {
        let mut vm = Vm::new();
        // Draw a 2x2 red square at (0,0)
        vm.screen[0] = 0xFF0000;
        vm.screen[1] = 0xFF0000;
        vm.screen[256] = 0xFF0000;
        vm.screen[257] = 0xFF0000;
        vm.regs[1] = 0;  // sx
        vm.regs[2] = 0;  // sy
        vm.regs[3] = 2;  // sw
        vm.regs[4] = 2;  // sh
        vm.regs[5] = 10; // dx
        vm.regs[6] = 10; // dy
        vm.regs[7] = 4;  // dw (2x)
        vm.regs[8] = 4;  // dh (2x)
        let vm = step_from(&vm, &[0xF5, 1, 2, 3, 4, 5, 6, 7, 8], 0);
        // Destination 4x4 should be all red
        for dy in 0..4 {
            for dx in 0..4 {
                assert_eq!(
                    vm.screen[(10 + dy) * 256 + (10 + dx)],
                    0xFF0000,
                    "pixel at ({}, {}) should be red",
                    10 + dx,
                    10 + dy
                );
            }
        }
    }

    #[test]
    fn test_scale_down() {
        let mut vm = Vm::new();
        // Fill a 4x4 region with blue
        for y in 0..4 {
            for x in 0..4 {
                vm.screen[y * 256 + x] = 0x0000FF;
            }
        }
        vm.regs[1] = 0;  // sx
        vm.regs[2] = 0;  // sy
        vm.regs[3] = 4;  // sw
        vm.regs[4] = 4;  // sh
        vm.regs[5] = 20; // dx
        vm.regs[6] = 20; // dy
        vm.regs[7] = 2;  // dw (half)
        vm.regs[8] = 2;  // dh (half)
        let vm = step_from(&vm, &[0xF5, 1, 2, 3, 4, 5, 6, 7, 8], 0);
        // Destination 2x2 should be blue (nearest-neighbor from top-left)
        assert_eq!(vm.screen[20 * 256 + 20], 0x0000FF);
        assert_eq!(vm.screen[20 * 256 + 21], 0x0000FF);
        assert_eq!(vm.screen[21 * 256 + 20], 0x0000FF);
        assert_eq!(vm.screen[21 * 256 + 21], 0x0000FF);
    }

    #[test]
    fn test_scale_degenerate() {
        let mut vm = Vm::new();
        vm.screen[0] = 0xFF0000;
        vm.regs[1] = 0;
        vm.regs[2] = 0;
        vm.regs[3] = 0; // sw=0 -> degenerate
        vm.regs[4] = 1;
        vm.regs[5] = 10;
        vm.regs[6] = 10;
        vm.regs[7] = 2;
        vm.regs[8] = 2;
        let vm = step_from(&vm, &[0xF5, 1, 2, 3, 4, 5, 6, 7, 8], 0);
        // No-op
        assert_eq!(vm.screen[10 * 256 + 10], 0);
    }

    #[test]
    fn test_scale_identity() {
        let mut vm = Vm::new();
        vm.screen[5 * 256 + 5] = 0x00FF00;
        vm.regs[1] = 5;  // sx
        vm.regs[2] = 5;  // sy
        vm.regs[3] = 1;  // sw
        vm.regs[4] = 1;  // sh
        vm.regs[5] = 20; // dx
        vm.regs[6] = 20; // dy
        vm.regs[7] = 1;  // dw (same size)
        vm.regs[8] = 1;  // dh
        let vm = step_from(&vm, &[0xF5, 1, 2, 3, 4, 5, 6, 7, 8], 0);
        assert_eq!(vm.screen[20 * 256 + 20], 0x00FF00);
    }

    // ══════════════════════════════════════════════════════════════════
    // FONT_SELECT (0xDC) -- font mode selection
    // Encoding: [0xDC, mode_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_font_select_default() {
        let mut vm = Vm::new();
        vm.regs[1] = 0; // default mode
        let vm = step_from(&vm, &[0xDC, 1], 0);
        // r0 should contain previous mode (0 by default)
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_font_select_vw() {
        let mut vm = Vm::new();
        vm.regs[1] = 1; // variable-width
        let vm = step_from(&vm, &[0xDC, 1], 0);
        assert_eq!(vm.regs[0], 0); // previous was 0 (default)
        // FONT_SELECT returns previous mode in r0, now mode is 1
    }

    #[test]
    fn test_font_select_clamp() {
        let mut vm = Vm::new();
        vm.regs[1] = 99; // should be clamped to 99 & 3 = 3
        let vm = step_from(&vm, &[0xDC, 1], 0);
        assert_eq!(vm.regs[0], 0); // previous was default 0
        // FONT_SELECT returns previous mode in r0, now mode is 3
    }

    // ══════════════════════════════════════════════════════════════════
    // VWTXT (0xDB) -- variable-width text rendering
    // Encoding: [0xDB, x_reg, y_reg, addr_reg, fg_reg, bg_reg]
    // ══════════════════════════════════════════════════════════════════

    #[test]
    fn test_vwtxt_basic() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x2000, "A");
        vm.regs[1] = 10;     // x
        vm.regs[2] = 10;     // y
        vm.regs[3] = 0x2000; // addr
        vm.regs[4] = 0xFFFFFF; // fg
        vm.regs[5] = 0;      // bg = 0 (no background)
        let vm = step_from(&vm, &[0xDB, 1, 2, 3, 4, 5], 0);
        // At least one pixel should be white near (10, 10)
        let mut has_white = false;
        for y in 10..18 {
            for x in 10..20 {
                if vm.screen[y * 256 + x] == 0xFFFFFF {
                    has_white = true;
                    break;
                }
            }
            if has_white {
                break;
            }
        }
        assert!(
            has_white,
            "VWTXT should render at least one white pixel for 'A'"
        );
    }

    #[test]
    fn test_vwtxt_empty_string() {
        let mut vm = Vm::new();
        vm.ram[0x2000] = 0; // null terminator immediately
        vm.regs[1] = 10;
        vm.regs[2] = 10;
        vm.regs[3] = 0x2000;
        vm.regs[4] = 0xFFFFFF;
        vm.regs[5] = 0;
        let vm = step_from(&vm, &[0xDB, 1, 2, 3, 4, 5], 0);
        // No pixels should be set
        let any_set = vm.screen.iter().any(|&p| p != 0);
        assert!(!any_set, "empty string should render nothing");
    }
}
