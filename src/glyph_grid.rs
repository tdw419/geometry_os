// glyph_grid.rs -- Bidirectional glyph abstraction layer over the pixel framebuffer
//
// The GlyphGrid is the fundamental Layer 1 abstraction: a 32×32 grid of
// character cells, each owning an 8×8 pixel block on the 256×256 framebuffer.
//
// Architecture:
//   Layer 3: Semantic (facts, tokens, commands)    ← assembly code
//   Layer 2: Token Map (groupings, callbacks)       ← GlyphGrid.tokens[]
//   Layer 1: Glyph Grid (char cells, colors)        ← GlyphGrid.cells[][]
//   Layer 0: Pixel Framebuffer (256×256 RGBA)       ← Vm.screen[]
//
// Communication protocol (RAM-based mailbox, processed on FRAME):
//   RAM[0x7B00] = command (0=nop, 1=put, 2=get, 3=scan, 4=bind_token, 5=clear)
//   RAM[0x7B01] = cell_x (0-31)
//   RAM[0x7B02] = cell_y (0-31)
//   RAM[0x7B03] = char_code (ASCII 0-127)
//   RAM[0x7B04] = fg_color (foreground RGBA)
//   RAM[0x7B05] = bg_color (background RGBA)
//   RAM[0x7B06] = token_id (for bind operations)
//   RAM[0x7B07] = token_start_x (cell coords)
//   RAM[0x7B08] = token_start_y
//   RAM[0x7B09] = token_end_x
//   RAM[0x7B0A] = token_end_y
//   RAM[0x7B0B] = token_callback_addr (callback address in VM RAM)
//   RAM[0x7B0C] = status (0=idle, 1=done, 0xFFFF=error — written by FRAME handler)
//   RAM[0x7B0D] = auto_clear (set 1 to zero the command field after processing)
//
// Change event buffer (written by scan on each FRAME):
//   RAM[0x7B40] = event_count (0 = no events)
//   RAM[0x7B41] = event[0].token_id
//   RAM[0x7B42] = event[0].cell_x
//   RAM[0x7B43] = event[0].cell_y
//   RAM[0x7B44] = event[0].new_char (ASCII value detected at this cell)
//   ... up to 48 events (4 words each, 0x7B40-0x7BFF)
//   (Increased from 16 to 48 to prevent event dropping during large spatial ops.)
//
// Token callback protocol (FRAME-cycle call/return):
//   Activating a token (external pixel change in its territory) triggers a
//   callback to the VM assembly address stored in token.callback_addr.
//
//   Call flow:
//     1. FRAME handler scans events, finds matching token with callback_addr
//     2. Saves self.pc to RAM[0x7B50]  (return address)
//     3. Sets self.pc = callback_addr  (next step executes callback)
//
//   Return flow:
//     1. Callback assembly writes 1 to RAM[0x7B52] (return request)
//     2. Next FRAME opcode checks RAM[0x7B52], restores PC from RAM[0x7B50]
//     3. Original code resumes where it left off
//
//   Example callback assembly:
//     my_callback:
//       LOAD r0, [0x7B41]     ; read event token_id
//       LOAD r1, [0x7B42]     ; read event cell_x
//       ; ... do work ...
//       LDI r0, 1
//       STORE r0, 0x7B52      ; request return on next FRAME
//       FRAME                  ; FRAME handler restores PC
//       HALT                   ; safety (shouldn't reach here)

use crate::font;

pub const GLYPH_COLS: usize = 32;
pub const GLYPH_ROWS: usize = 32;
pub const CELL_PX: usize = 8; // each glyph cell = 8×8 pixels
pub const CACHE_SIZE: usize = GLYPH_COLS * GLYPH_ROWS;

// RAM mailbox base address
pub const MAILBOX_BASE: usize = 0x7B00;

// Mailbox offsets (relative to MAILBOX_BASE)
pub const MB_CMD: usize = 0;
pub const MB_CELL_X: usize = 1;
pub const MB_CELL_Y: usize = 2;
pub const MB_CHAR: usize = 3;
pub const MB_FG: usize = 4;
pub const MB_BG: usize = 5;
pub const MB_TOKEN_ID: usize = 6;
pub const MB_TOKEN_SX: usize = 7;
pub const MB_TOKEN_SY: usize = 8;
pub const MB_TOKEN_EX: usize = 9;
pub const MB_TOKEN_EY: usize = 10;
pub const MB_CALLBACK: usize = 11;
pub const MB_STATUS: usize = 12;
pub const MB_AUTO_CLEAR: usize = 13;

// Change event buffer offsets
// Event buffer: ring buffer in RAM[0x7B40..0x7BFF]
//   0x7B40: head (write index)
//   0x7B41: tail (read index)
//   0x7B42-0x7BFF: up to 47 slots, 4 u32s each (188 u32s total)
pub const EV_BASE: usize = 0x7B40;
pub const EV_HEAD: usize = 0;
pub const EV_TAIL: usize = 1;
pub const EV_DATA: usize = 2; // events start here, stride 4
pub const EV_STRIDE: usize = 4;
pub const MAX_EVENTS: usize = 47; // Adjusted to fit in buffer range (384/4 = 96 words total, minus header)

// Batch command queue (ring buffer) in RAM[0x7B10..0x7B3F]
//   0x7B10: head (write index, next free slot)
//   0x7B11: tail (read index, next unprocessed slot)
//   0x7B12-0x7B3D: 11 slots, 4 u32s each
pub const BATCH_BASE: usize = 0x7B10;
pub const BATCH_HEAD: usize = 0; // offset from BATCH_BASE
pub const BATCH_TAIL: usize = 1; // offset from BATCH_BASE
pub const BATCH_DATA: usize = 2; // first data slot
pub const BATCH_SLOT_WORDS: usize = 4;
pub const BATCH_SLOTS: usize = 11; // (0x7B3F - 0x7B12 + 1) / 4 = 46/4 = 11

// Compact batch command slot layout (4 u32s per slot):
//   word 0: cmd (bits 7:0) | cell_x (bits 15:8) | cell_y (bits 23:16) | flags (bits 31:24)
//   word 1: char_code (bits 7:0) | fg (bits 31:8)
//   word 2: bg (full color)
//   word 3: token_id_or_callback (cmd=BIND: low 16=token_id, high 16=callback_addr_lowbits)
pub const BB_CMD_SHIFT: u32 = 0;
pub const BB_CELL_X_SHIFT: u32 = 8;
pub const BB_CELL_Y_SHIFT: u32 = 16;
pub const BB_FLAGS_SHIFT: u32 = 24;
pub const BB_CHAR_SHIFT: u32 = 0;
pub const BB_FG_SHIFT: u32 = 8;

// Batch command flags
pub const BB_AUTO_CLEAR: u32 = 0x01; // auto-clear batch slot after processing

// Commands
pub const CMD_NOP: u32 = 0;
pub const CMD_PUT: u32 = 1; // write glyph to cell
pub const CMD_GET: u32 = 2; // read glyph from cell → MB_RESULT
pub const CMD_SCAN: u32 = 3; // force scan for external changes
pub const CMD_BIND: u32 = 4; // bind token to cell range
pub const CMD_CLEAR: u32 = 5; // clear entire grid
pub const CMD_CLEAR_TOKEN: u32 = 6; // remove a token binding

// Max tokens
pub const MAX_TOKENS: usize = 32;

/// A single glyph cell — the fundamental unit of the abstraction layer.
#[derive(Clone, Copy, Debug)]
pub struct GlyphCell {
    /// ASCII character code (0 = empty/unclaimed cell)
    pub char_code: u8,
    /// Foreground color (the pen color for font pixels)
    pub fg: u32,
    /// Background color (the paper color)
    pub bg: u32,
    /// Token that owns this cell (0xFFFF = unowned)
    pub token_id: u16,
    /// Dirty flag: needs re-render to pixel framebuffer
    pub dirty: bool,
}

impl Default for GlyphCell {
    fn default() -> Self {
        Self {
            char_code: 0,
            fg: 0xFFFFFF,
            bg: 0,
            token_id: 0xFFFF,
            dirty: false,
        }
    }
}

/// A token represents a semantic group of glyph cells.
/// Tokens are defined by cell membership (cell.token_id == token.id)
/// rather than a bounding box, enabling non-contiguous spatial groups.
/// Each token can have a callback that fires when its cells change externally.
#[derive(Clone, Copy, Debug)]
pub struct Token {
    pub id: u16,
    /// VM RAM address to call when an external change is detected.
    /// 0 = no callback.
    pub callback_addr: u32,
    pub active: bool,
}

impl Default for Token {
    fn default() -> Self {
        Self {
            id: 0xFFFF,
            callback_addr: 0,
            active: false,
        }
    }
}

/// The Glyph Grid — Layer 1 abstraction over the pixel framebuffer.
#[derive(Clone, Debug)]
pub struct GlyphGrid {
    pub cells: [[GlyphCell; GLYPH_COLS]; GLYPH_ROWS],
    pub tokens: [Token; MAX_TOKENS],
    pub enabled: bool,
    /// Pending token callback: Some(VM_address) to jump to.
    /// Set by on_frame() when a change event matches a token with callback_addr != 0.
    /// Read and consumed by the FRAME opcode handler in vm/mod.rs.
    pub callback_pending: Option<u32>,
}

impl Default for GlyphGrid {
    fn default() -> Self {
        Self {
            cells: [[GlyphCell::default(); GLYPH_COLS]; GLYPH_ROWS],
            tokens: [Token::default(); MAX_TOKENS],
            enabled: true,
            callback_pending: None,
        }
    }
}

impl GlyphGrid {
    /// Create new glyph grid (enabled by default)
    pub fn new() -> Self {
        Self::default()
    }

    /// Get the pixel block (px, py, w, h) that a glyph cell owns
    #[inline]
    pub fn cell_pixel_rect(cx: usize, cy: usize) -> (usize, usize, usize, usize) {
        (cx * CELL_PX, cy * CELL_PX, CELL_PX, CELL_PX)
    }

    /// Write a glyph to a cell — sets dirty flag so it re-renders on next frame
    pub fn put_cell(&mut self, cx: usize, cy: usize, char_code: u8, fg: u32, bg: u32) {
        if cx >= GLYPH_COLS || cy >= GLYPH_ROWS {
            return;
        }
        let cell = &mut self.cells[cy][cx];
        cell.char_code = char_code;
        cell.fg = fg;
        cell.bg = bg;
        cell.dirty = true;
    }

    /// Read glyph data from a cell, packed as: bits[7:0]=char, bits[23:8]=fg_low16
    pub fn get_cell(&self, cx: usize, cy: usize) -> u32 {
        if cx >= GLYPH_COLS || cy >= GLYPH_ROWS {
            return 0;
        }
        let cell = &self.cells[cy][cx];
        (cell.char_code as u32) | ((cell.fg & 0xFFFF) << 8)
    }

    /// Bind a range of cells to a token.
    /// Accepts range parameters for convenience (marks cells with token_id)
    /// but the token itself does not store a bounding box —
    /// membership is per-cell via cell.token_id.
    pub fn bind_token(
        &mut self,
        id: u16,
        sx: u8,
        sy: u8,
        ex: u8,
        ey: u8,
        callback_addr: u32,
    ) -> bool {
        if id as usize >= MAX_TOKENS {
            return false;
        }
        let token = &mut self.tokens[id as usize];
        token.id = id;
        token.callback_addr = callback_addr;
        token.active = true;

        // Mark all cells in the specified range as owned by this token
        for cy in sy as usize..=ey.min((GLYPH_ROWS - 1) as u8) as usize {
            for cx in sx as usize..=ex.min((GLYPH_COLS - 1) as u8) as usize {
                self.cells[cy][cx].token_id = id;
            }
        }
        true
    }

    /// Remove a token binding — clears token_id from all cells that
    /// match this id (linear scan of 1024 cells, fast enough for the grid).
    pub fn clear_token(&mut self, id: u16) {
        if id as usize >= MAX_TOKENS {
            return;
        }
        let token = &self.tokens[id as usize];
        if !token.active {
            return;
        }
        // Clear ownership on all cells with matching token_id
        for cy in 0..GLYPH_ROWS {
            for cx in 0..GLYPH_COLS {
                if self.cells[cy][cx].token_id == id {
                    self.cells[cy][cx].token_id = 0xFFFF;
                }
            }
        }
        self.tokens[id as usize].active = false;
    }

    /// Clear all glyph cells (reset to empty)
    pub fn clear_all(&mut self) {
        for row in self.cells.iter_mut() {
            for cell in row.iter_mut() {
                cell.char_code = 0;
                cell.dirty = false;
                cell.token_id = 0xFFFF;
            }
        }
        for token in self.tokens.iter_mut() {
            token.active = false;
        }
    }

    /// Render all dirty cells to the pixel framebuffer.
    /// Uses crate::font::GLYPHS bitmap font (8×8 per char).
    pub fn render_to_screen(&mut self, screen: &mut [u32]) {
        if !self.enabled {
            return;
        }
        for cy in 0..GLYPH_ROWS {
            for cx in 0..GLYPH_COLS {
                let cell = &self.cells[cy][cx];
                if !cell.dirty {
                    continue;
                }
                let ch = cell.char_code as usize;
                if ch >= 128 {
                    continue;
                }
                let (px, py, w, h) = Self::cell_pixel_rect(cx, cy);
                let glyph = &font::GLYPHS[ch];
                for row in 0..h {
                    for col in 0..w {
                        let sx = px + col;
                        let sy = py + row;
                        if sx >= 256 || sy >= 256 {
                            continue;
                        }
                        let on = (glyph[row] & (1 << (7 - col))) != 0;
                        screen[sy * 256 + sx] = if on { cell.fg } else { cell.bg };
                    }
                }
            }
        }
        // Clear all dirty flags after rendering
        for cy in 0..GLYPH_ROWS {
            for cx in 0..GLYPH_COLS {
                // Use direct field write to avoid borrow issues
                let cell = &mut self.cells[cy][cx];
                cell.dirty = false;
            }
        }
    }

    /// Scan the framebuffer for cells whose pixels don't match what we'd render.
    /// Returns a list of change events: (token_id, cell_x, cell_y, detected_char_code).
    ///
    /// This is the KEY bidirectional mechanism: external code (another agent,
    /// a script, a socket write) can modify pixels on the framebuffer, and
    /// this scan detects those changes and propagates them upward through
    /// the token layer.
    pub fn scan_for_changes(&self, screen: &[u32]) -> Vec<(u16, usize, usize, u8)> {
        if !self.enabled {
            return Vec::new();
        }
        let mut events = Vec::new();
        for cy in 0..GLYPH_ROWS {
            for cx in 0..GLYPH_COLS {
                let cell = &self.cells[cy][cx];
                if cell.char_code == 0 {
                    continue; // empty cell — nothing expected
                }
                if cell.token_id == 0xFFFF {
                    continue; // unowned — no one to notify
                }
                let ch = cell.char_code as usize;
                if ch >= 128 {
                    continue;
                }
                let (px, py, w, h) = Self::cell_pixel_rect(cx, cy);
                let glyph = &font::GLYPHS[ch];
                let mut changed = false;
                'pixel_check: for row in 0..h {
                    for col in 0..w {
                        let sx = px + col;
                        let sy = py + row;
                        if sx >= 256 || sy >= 256 {
                            continue;
                        }
                        let actual = screen[sy * 256 + sx];
                        let on = (glyph[row] & (1 << (7 - col))) != 0;
                        let expected = if on { cell.fg } else { cell.bg };
                        if actual != expected {
                            changed = true;
                            break 'pixel_check;
                        }
                    }
                }
                if changed {
                    // Detect what char is now at this cell (simple heuristic)
                    let new_char = Self::detect_char_in_block(screen, px, py);
                    events.push((cell.token_id, cx, cy, new_char));
                }
            }
        }
        events
    }

    /// Simple character detector: check which glyph bitmap best matches
    /// the actual pixel block. Returns ASCII of best match (or space).
    fn detect_char_in_block(screen: &[u32], px: usize, py: usize) -> u8 {
        let mut best_ch = b' ';
        let mut best_score = i32::MAX;

        for ch in 0x20..0x7F {
            // printable ASCII only
            let glyph = &font::GLYPHS[ch];
            let mut score = 0i32;

            for row in 0..CELL_PX {
                for col in 0..CELL_PX {
                    let sx = px + col;
                    let sy = py + row;
                    if sx >= 256 || sy >= 256 {
                        continue;
                    }
                    let actual = screen[sy * 256 + sx];
                    let on = (glyph[row] & (1 << (7 - col))) != 0;
                    // Score: darkness comparison (crude but fast)
                    let actual_brightness = (actual >> 16) & 0xFF; // red channel as proxy
                    if on && actual_brightness < 128 {
                        score += 16; // expected bright, found dark
                    } else if !on && actual_brightness >= 128 {
                        score += 8; // expected dark, found bright
                    }
                }
            }

            if score < best_score {
                best_score = score;
                best_ch = ch as u8;
            }
        }
        best_ch
    }

    /// Process the RAM mailbox: read commands from RAM, execute them,
    /// write results back to RAM.
    ///
    /// Called from the FRAME opcode handler.
    pub fn process_mailbox(&mut self, ram: &mut [u32], screen: &mut [u32]) {
        if !self.enabled || ram.len() <= MAILBOX_BASE + 16 {
            return;
        }

        let base = MAILBOX_BASE;
        let cmd = ram[base + MB_CMD];
        if cmd == CMD_NOP {
            return;
        }

        match cmd {
            CMD_PUT => {
                let cx = ram[base + MB_CELL_X] as usize;
                let cy = ram[base + MB_CELL_Y] as usize;
                let char_code = (ram[base + MB_CHAR] & 0xFF) as u8;
                let fg = ram[base + MB_FG];
                let bg = ram[base + MB_BG];
                self.put_cell(cx, cy, char_code, fg, bg);
                ram[base + MB_STATUS] = 1; // success
            },
            CMD_GET => {
                let cx = ram[base + MB_CELL_X] as usize;
                let cy = ram[base + MB_CELL_Y] as usize;
                let result = self.get_cell(cx, cy);
                ram[base + MB_CHAR] = result & 0xFF;
                ram[base + MB_FG] = result >> 8;
                ram[base + MB_STATUS] = 1;
            },
            CMD_SCAN => {
                // Force a scan even if nothing is dirty
                let events = self.scan_for_changes(screen);
                let ev_base = EV_BASE;
                if ev_base < ram.len() {
                    let mut head = ram[ev_base + EV_HEAD] as usize % MAX_EVENTS;
                    let tail = ram[ev_base + EV_TAIL] as usize % MAX_EVENTS;
                    for (tid, cx, cy, new_char) in events {
                        let next_head = (head + 1) % MAX_EVENTS;
                        if next_head == tail {
                            break;
                        }
                        let off = ev_base + EV_DATA + head * EV_STRIDE;
                        if off + 3 < ram.len() {
                            ram[off] = tid as u32;
                            ram[off + 1] = cx as u32;
                            ram[off + 2] = cy as u32;
                            ram[off + 3] = new_char as u32;
                        }
                        head = next_head;
                    }
                    ram[ev_base + EV_HEAD] = head as u32;
                }
                ram[base + MB_STATUS] = 1;
            },
            CMD_BIND => {
                let id = (ram[base + MB_TOKEN_ID] & 0xFFFF) as u16;
                let sx = (ram[base + MB_TOKEN_SX] & 0xFF) as u8;
                let sy = (ram[base + MB_TOKEN_SY] & 0xFF) as u8;
                let ex = (ram[base + MB_TOKEN_EX] & 0xFF) as u8;
                let ey = (ram[base + MB_TOKEN_EY] & 0xFF) as u8;
                let cb = ram[base + MB_CALLBACK];
                if self.bind_token(id, sx, sy, ex, ey, cb) {
                    ram[base + MB_STATUS] = 1;
                } else {
                    ram[base + MB_STATUS] = 0xFFFFFFFF;
                }
            },
            CMD_CLEAR => {
                self.clear_all();
                ram[base + MB_STATUS] = 1;
            },
            CMD_CLEAR_TOKEN => {
                let id = (ram[base + MB_TOKEN_ID] & 0xFFFF) as u16;
                self.clear_token(id);
                ram[base + MB_STATUS] = 1;
            },
            _ => {
                ram[base + MB_STATUS] = 0xFFFFFFFF; // unknown command
            },
        }

        // Auto-clear the command field if requested
        if ram[base + MB_AUTO_CLEAR] != 0 {
            ram[base + MB_CMD] = CMD_NOP;
        }
    }

    /// Process the batch command queue ring buffer at 0x7B10-0x7B3D.
    ///
    /// The batch queue allows up to 11 commands per frame, solving the
    /// single-mailbox-slot bottleneck. Multiple agents can write to different
    /// queue slots simultaneously (head/tail are the only shared addresses).
    ///
    /// Format (each slot = 4 u32s):
    ///   word 0: cmd (7:0) | cell_x (15:8) | cell_y (23:16) | flags (31:24)
    ///   word 1: char_code (7:0) | fg (31:8)
    ///   word 2: bg
    ///   word 3: token_id_or_callback (BIND: low=token_id, high=callback_low)
    pub fn process_batch_queue(&mut self, ram: &mut [u32], screen: &mut [u32]) {
        if !self.enabled || ram.len() <= BATCH_BASE + BATCH_DATA {
            return;
        }
        let base = BATCH_BASE;

        let head = ram.get(base + BATCH_HEAD).copied().unwrap_or(0) as usize % BATCH_SLOTS;
        let tail = ram.get(base + BATCH_TAIL).copied().unwrap_or(0) as usize % BATCH_SLOTS;

        if head == tail {
            return; // empty queue
        }

        // Process slots from tail to head (wrapping)
        let mut pos = tail;
        while pos != head {
            let slot_base = base + BATCH_DATA + pos * BATCH_SLOT_WORDS;
            if slot_base + 3 >= ram.len() {
                break;
            }

            let w0 = ram[slot_base];
            let w1 = ram[slot_base + 1];
            let w2 = ram[slot_base + 2];
            let w3 = ram[slot_base + 3];

            let cmd = (w0 >> BB_CMD_SHIFT) & 0xFF;
            let cell_x = ((w0 >> BB_CELL_X_SHIFT) & 0xFF) as usize;
            let cell_y = ((w0 >> BB_CELL_Y_SHIFT) & 0xFF) as usize;
            let flags = (w0 >> BB_FLAGS_SHIFT) & 0xFF;
            let auto_clear_batch = (flags & BB_AUTO_CLEAR) != 0;

            match cmd {
                CMD_PUT => {
                    let char_code = (w1 & 0xFF) as u8;
                    let fg = w1 >> BB_FG_SHIFT;
                    let bg = w2;
                    self.put_cell(cell_x, cell_y, char_code, fg, bg);
                },
                CMD_BIND => {
                    let id = (w3 & 0xFFFF) as u16;
                    let callback_addr = w3 >> 16;
                    // For batch bind, cells must already have token_id set
                    // (e.g. via prior batch PUT or memory-mapped write).
                    if (id as usize) < MAX_TOKENS {
                        let token = &mut self.tokens[id as usize];
                        token.id = id;
                        token.callback_addr = callback_addr;
                        token.active = true;
                    }
                },
                CMD_CLEAR => {
                    self.clear_all();
                },
                _ => {}, // CMD_NOP, CMD_GET, CMD_SCAN not supported in batch
            }

            if auto_clear_batch {
                ram[slot_base] = 0;
                ram[slot_base + 1] = 0;
                ram[slot_base + 2] = 0;
                ram[slot_base + 3] = 0;
            }

            // Advance tail
            pos = (pos + 1) % BATCH_SLOTS;
        }

        // Update tail to consumed position
        ram[base + BATCH_TAIL] = pos as u32;
    }

    /// Full frame processing: render + scan + write events
    /// Called from the FRAME opcode handler.
    pub fn on_frame(&mut self, ram: &mut [u32], screen: &mut [u32]) {
        if !self.enabled {
            return;
        }
        // 0. Process batch command queue (multi-command ring buffer)
        //    Processed BEFORE the single mailbox to allow high-throughput
        //    bulk operations (e.g. filling a 32x32 window) without
        //    being gated by frame timing.
        self.process_batch_queue(ram, screen);

        // 1. Process single mailbox command (legacy path)
        self.process_mailbox(ram, screen);

        // 2. Render dirty glyph cells to screen
        self.render_to_screen(screen);

        // 3. Scan for external changes and write to event buffer
        //    Uses ring buffer with Head/Tail pointers.
        let events = self.scan_for_changes(screen);
        let ev_base = EV_BASE;
        if ev_base < ram.len() {
            let mut head = ram[ev_base + EV_HEAD] as usize % MAX_EVENTS;
            let tail = ram[ev_base + EV_TAIL] as usize % MAX_EVENTS;

            for &(tid, cx, cy, new_char) in &events {
                let next_head = (head + 1) % MAX_EVENTS;
                if next_head == tail {
                    break; // buffer full, drop rest
                }
                let off = ev_base + EV_DATA + head * EV_STRIDE;
                if off + 3 < ram.len() {
                    ram[off] = tid as u32;
                    ram[off + 1] = cx as u32;
                    ram[off + 2] = cy as u32;
                    ram[off + 3] = new_char as u32;
                }
                head = next_head;
            }
            ram[ev_base + EV_HEAD] = head as u32;
        }

        // 4. Check if any event's token has a callback address -> set pending
        // Only the first matching event fires a callback per frame to keep things simple.
        self.callback_pending = None;
        for (tid, _cx, _cy, _new_char) in &events {
            if let Some(token) = self.tokens.get(*tid as usize) {
                if token.active && token.callback_addr != 0 && self.callback_pending.is_none() {
                    self.callback_pending = Some(token.callback_addr);
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Helper: create a VM-like screen buffer
    fn make_screen() -> Vec<u32> {
        vec![0x000000; 256 * 256]
    }

    fn make_ram() -> Vec<u32> {
        vec![0; 0x8000]
    }

    /// Test downward path: write 'X' to glyph cell, render to pixels, verify font bitmap
    #[test]
    fn test_glyph_grid_downward_render() {
        let mut grid = GlyphGrid::new();
        grid.enabled = true;

        // Write 'X' (ASCII 0x58) to cell (0, 0) with white on black
        grid.put_cell(0, 0, b'X', 0xFFFFFF, 0x000000);
        assert!(grid.cells[0][0].dirty);

        let mut screen = make_screen();
        grid.render_to_screen(&mut screen);

        // Verify: the font bitmap for 'X' should be rendered at pixel (0..8, 0..8)
        let glyph = &font::GLYPHS[b'X' as usize];
        for row in 0..8 {
            for col in 0..8 {
                let pixel = screen[row * 256 + col];
                let on = (glyph[row] & (1 << (7 - col))) != 0;
                assert_eq!(
                    pixel,
                    if on { 0xFFFFFF } else { 0x000000 },
                    "Pixel ({}, {}) for 'X' mismatch",
                    col,
                    row
                );
            }
        }

        // Cell should no longer be dirty after render
        assert!(!grid.cells[0][0].dirty);
    }

    /// Test upward path: render a glyph, manually change a pixel, scan detects it
    #[test]
    fn test_glyph_grid_upward_detect() {
        let mut grid = GlyphGrid::new();
        grid.enabled = true;

        // Write 'O' (ASCII 0x4F) to cell (1, 1) — pixel block at (8..16, 8..16)
        grid.put_cell(1, 1, b'O', 0xFFFFFF, 0x000000);

        let mut screen = make_screen();
        grid.render_to_screen(&mut screen);

        // Bind a token to this cell so it's "owned"
        grid.bind_token(0, 1, 1, 1, 1, 0);
        assert_eq!(grid.cells[1][1].token_id, 0);

        // Manually change pixel (10, 10) inside the cell's territory to red
        screen[10 * 256 + 10] = 0xFF0000;

        // Scan should detect the change
        let events = grid.scan_for_changes(&screen);
        assert!(!events.is_empty(), "Should detect the pixel change");

        // The event should reference token 0 at cell (1, 1)
        let found = events
            .iter()
            .any(|(tid, cx, cy, _)| *tid == 0 && *cx == 1 && *cy == 1);
        assert!(found, "Event should report token 0 at cell (1,1)");
    }

    /// Test mailbox protocol: write via FRAME-cycle commands
    #[test]
    fn test_glyph_grid_mailbox_protocol() {
        let mut grid = GlyphGrid::new();
        grid.enabled = true;
        let mut ram = make_ram();
        let mut screen = make_screen();

        let base = MAILBOX_BASE;

        // Set mailbox: put 'A' at cell (2, 3), white on blue
        ram[base + MB_CMD] = CMD_PUT;
        ram[base + MB_CELL_X] = 2;
        ram[base + MB_CELL_Y] = 3;
        ram[base + MB_CHAR] = b'A' as u32;
        ram[base + MB_FG] = 0xFFFFFF;
        ram[base + MB_BG] = 0x0000FF;
        ram[base + MB_AUTO_CLEAR] = 1;

        // Process the mailbox
        grid.process_mailbox(&mut ram, &mut screen);

        // Command should be auto-cleared
        assert_eq!(ram[base + MB_CMD], CMD_NOP);
        assert_eq!(ram[base + MB_STATUS], 1);

        // Cell should be rendered
        let cell = &grid.cells[3][2];
        assert_eq!(cell.char_code, b'A');
        assert_eq!(cell.fg, 0xFFFFFF);
        assert_eq!(cell.bg, 0x0000FF);

        // Test GET via mailbox
        ram[base + MB_CMD] = CMD_GET;
        ram[base + MB_CELL_X] = 2;
        ram[base + MB_CELL_Y] = 3;
        ram[base + MB_AUTO_CLEAR] = 1;

        grid.process_mailbox(&mut ram, &mut screen);

        assert_eq!(ram[base + MB_CHAR], b'A' as u32);
        assert_eq!(ram[base + MB_STATUS], 1);
    }

    /// Test full bidirectional: mailbox → render → pixel change → scan event
    #[test]
    fn test_glyph_grid_bidirectional_full() {
        let mut grid = GlyphGrid::new();
        grid.enabled = true;
        let mut ram = make_ram();
        let mut screen = make_screen();
        let base = MAILBOX_BASE;

        // Step 1: Put 'X' at cell (0, 0) via mailbox
        ram[base + MB_CMD] = CMD_PUT;
        ram[base + MB_CELL_X] = 0;
        ram[base + MB_CELL_Y] = 0;
        ram[base + MB_CHAR] = b'X' as u32;
        ram[base + MB_FG] = 0xFFFFFF;
        ram[base + MB_BG] = 0x000000;

        // Process the PUT command (1st frame)
        ram[base + MB_AUTO_CLEAR] = 1;
        grid.on_frame(&mut ram, &mut screen);
        assert_eq!(ram[base + MB_CMD], CMD_NOP, "PUT should auto-clear");
        assert_eq!(ram[base + MB_STATUS], 1);

        // Step 2: Bind token 0 to cell (0,0)-(0,0)
        ram[base + MB_CMD] = CMD_BIND;
        ram[base + MB_TOKEN_ID] = 0;
        ram[base + MB_TOKEN_SX] = 0;
        ram[base + MB_TOKEN_SY] = 0;
        ram[base + MB_TOKEN_EX] = 0;
        ram[base + MB_TOKEN_EY] = 0;

        // Step 3: on_frame processes BIND command + re-renders
        grid.on_frame(&mut ram, &mut screen);

        // Verify 'X' rendered correctly at pixel (0..8, 0..8)
        let glyph = &font::GLYPHS[b'X' as usize];
        for row in 0..8 {
            for col in 0..8 {
                let pixel = screen[row * 256 + col];
                let on = (glyph[row] & (1 << (7 - col))) != 0;
                assert_eq!(pixel, if on { 0xFFFFFF } else { 0x000000 });
            }
        }

        // Step 3: break the pixel — change pixel (4, 4) to red
        screen[4 * 256 + 4] = 0xFF0000;

        // Step 4: on_frame again should detect the change
        ram[base + MB_CMD] = CMD_NOP; // no new command
        grid.on_frame(&mut ram, &mut screen);

        // Check event buffer at 0x7B40
        let head = ram[EV_BASE + EV_HEAD];
        let tail = ram[EV_BASE + EV_TAIL];
        assert_ne!(
            head, tail,
            "Should have detected pixel change (ring buffer not empty)"
        );

        // First event should reference token 0 at cell (0, 0)
        let off = EV_BASE + EV_DATA + (tail as usize) * EV_STRIDE;
        let tid = ram[off];
        let cx = ram[off + 1];
        let cy = ram[off + 2];
        assert_eq!(tid, 0, "Event token ID should be 0");
        assert_eq!(cx, 0, "Event cell X should be 0");
        assert_eq!(cy, 0, "Event cell Y should be 0");

        // Advance tail to consume
        ram[EV_BASE + EV_TAIL] = (tail + 1) % MAX_EVENTS as u32;
    }

    /// Test non-dirty cells aren't re-rendered
    #[test]
    fn test_glyph_grid_no_unnecessary_renders() {
        let mut grid = GlyphGrid::new();
        let mut screen = make_screen();

        // Put two cells
        grid.put_cell(0, 0, b'A', 0xFF0000, 0x000000);
        grid.put_cell(1, 0, b'B', 0x00FF00, 0x000000);
        grid.render_to_screen(&mut screen);

        // Clear dirty flags
        assert!(!grid.cells[0][0].dirty);
        assert!(!grid.cells[1][0].dirty);

        // Modify one cell
        grid.put_cell(0, 0, b'C', 0x0000FF, 0x000000);

        // Only cell (0,0) should be dirty
        assert!(grid.cells[0][0].dirty);
        assert!(!grid.cells[1][0].dirty);

        // Re-render
        grid.render_to_screen(&mut screen);

        // Cell (0,0) should now be 'C' in blue
        let glyph_c = &font::GLYPHS[b'C' as usize];
        for row in 0..8 {
            for col in 0..8 {
                let pixel = screen[row * 256 + col];
                let on = (glyph_c[row] & (1 << (7 - col))) != 0;
                assert_eq!(pixel, if on { 0x0000FF } else { 0x000000 });
            }
        }

        // Cell (1,0) should still be 'B' in green
        let glyph_b = &font::GLYPHS[b'B' as usize];
        for row in 0..8 {
            for col in 0..8 {
                let pixel = screen[row * 256 + (8 + col)];
                let on = (glyph_b[row] & (1 << (7 - col))) != 0;
                assert_eq!(pixel, if on { 0x00FF00 } else { 0x000000 });
            }
        }
    }

    /// Test multiple changes detected
    #[test]
    fn test_glyph_grid_multiple_changes() {
        let mut grid = GlyphGrid::new();
        grid.enabled = true;
        let mut screen = make_screen();

        // Write to two cells
        grid.put_cell(0, 0, b'A', 0xFFFFFF, 0x000000);
        grid.put_cell(1, 0, b'B', 0xFFFFFF, 0x000000);

        // Bind tokens
        grid.bind_token(0, 0, 0, 0, 0, 0);
        grid.bind_token(1, 1, 0, 1, 0, 0);

        grid.render_to_screen(&mut screen);

        // Modify both cells' pixels
        screen[0 * 256 + 0] = 0xFF0000; // cell (0,0)
        screen[0 * 256 + 8] = 0x00FF00; // cell (1,0)

        let events = grid.scan_for_changes(&screen);

        assert_eq!(events.len(), 2);
        let ids: Vec<u16> = events.iter().map(|(id, _, _, _)| *id).collect();
        assert!(ids.contains(&0));
        assert!(ids.contains(&1));
    }

    /// Test: empty/unowned cells are not scanned
    #[test]
    fn test_glyph_grid_unowned_cells_skipped() {
        let mut grid = GlyphGrid::new();
        grid.enabled = true;
        let mut screen = make_screen();

        // Write to cell but DON'T bind a token
        grid.put_cell(5, 5, b'Z', 0xFFFFFF, 0x000000);
        grid.render_to_screen(&mut screen);

        // Modify pixel — should NOT be detected because cell is unowned
        screen[5 * 256 + 40] = 0xFF0000; // pixel (40, 40) is in cell (5, 5)'s block

        let events = grid.scan_for_changes(&screen);
        assert!(events.is_empty(), "Unowned cells should not trigger events");
    }
}
