use super::trace::*;
use super::types::*;
use super::Vm;

#[cfg(test)]
mod tests {
    use super::*;

    fn temp_path(name: &str) -> std::path::PathBuf {
        std::env::temp_dir().join(name)
    }

    fn cleanup(path: &std::path::Path) {
        let _ = std::fs::remove_file(path);
    }

    // --- save_to_file / load_from_file round-trip tests ---

    #[test]
    fn test_save_load_roundtrip_empty_vm() {
        let path = temp_path("geos_test_empty.bin");
        let vm = Vm::new();

        vm.save_to_file(&path).expect("save should succeed");
        let loaded = Vm::load_from_file(&path).expect("load should succeed");

        assert_eq!(loaded.pc, vm.pc);
        assert_eq!(loaded.regs, vm.regs);
        assert_eq!(loaded.ram.len(), vm.ram.len());
        assert_eq!(loaded.screen.len(), vm.screen.len());
        assert_eq!(loaded.halted, vm.halted);
        assert_eq!(loaded.rand_state, vm.rand_state);
        assert_eq!(loaded.frame_count, vm.frame_count);

        cleanup(&path);
    }

    #[test]
    fn test_save_load_roundtrip_with_data() {
        let path = temp_path("geos_test_data.bin");
        let mut vm = Vm::new();
        vm.pc = 0x1000;
        vm.halted = true;
        vm.regs[1] = 0xDEADBEEF;
        vm.regs[30] = 0xFF00; // SP
        vm.regs[31] = 0x2000; // LR
        vm.ram[0x1000] = 0x10; // LDI opcode
        vm.ram[0x1001] = 5;
        vm.ram[0x1002] = 42;
        vm.screen[0] = 0xFF0000;
        vm.screen[255] = 0x00FF00;
        vm.screen[256 * 255] = 0x0000FF;
        vm.rand_state = 0x12345678;
        vm.frame_count = 9999;

        vm.save_to_file(&path).expect("save should succeed");
        let loaded = Vm::load_from_file(&path).expect("load should succeed");

        assert_eq!(loaded.pc, 0x1000);
        assert!(loaded.halted);
        assert_eq!(loaded.regs[1], 0xDEADBEEF);
        assert_eq!(loaded.regs[30], 0xFF00);
        assert_eq!(loaded.regs[31], 0x2000);
        assert_eq!(loaded.ram[0x1000], 0x10);
        assert_eq!(loaded.ram[0x1001], 5);
        assert_eq!(loaded.ram[0x1002], 42);
        assert_eq!(loaded.screen[0], 0xFF0000);
        assert_eq!(loaded.screen[255], 0x00FF00);
        assert_eq!(loaded.screen[256 * 255], 0x0000FF);
        assert_eq!(loaded.rand_state, 0x12345678);
        assert_eq!(loaded.frame_count, 9999);

        cleanup(&path);
    }

    #[test]
    fn test_save_load_preserves_all_ram() {
        let path = temp_path("geos_test_ram.bin");
        let mut vm = Vm::new();
        // Write to scattered RAM locations
        vm.ram[0] = 1;
        vm.ram[100] = 2;
        vm.ram[1000] = 3;
        vm.ram[0x8000] = 4;
        vm.ram[0xFFFF] = 5;

        vm.save_to_file(&path).expect("save should succeed");
        let loaded = Vm::load_from_file(&path).expect("load should succeed");

        assert_eq!(loaded.ram[0], 1);
        assert_eq!(loaded.ram[100], 2);
        assert_eq!(loaded.ram[1000], 3);
        assert_eq!(loaded.ram[0x8000], 4);
        assert_eq!(loaded.ram[0xFFFF], 5);
        // Verify untouched cells are still 0
        assert_eq!(loaded.ram[50], 0);
        assert_eq!(loaded.ram[0x7FFF], 0);

        cleanup(&path);
    }

    #[test]
    fn test_save_load_preserves_all_screen() {
        let path = temp_path("geos_test_screen.bin");
        let mut vm = Vm::new();
        // Write to screen corners
        vm.screen[0] = 0xFF0000; // top-left
        vm.screen[255] = 0x00FF00; // top-right
        vm.screen[256 * 255] = 0x0000FF; // bottom-left
        vm.screen[256 * 256 - 1] = 0xFFFFFF; // bottom-right
        vm.screen[128 * 256 + 128] = 0x808080; // center

        vm.save_to_file(&path).expect("save should succeed");
        let loaded = Vm::load_from_file(&path).expect("load should succeed");

        assert_eq!(loaded.screen[0], 0xFF0000);
        assert_eq!(loaded.screen[255], 0x00FF00);
        assert_eq!(loaded.screen[256 * 255], 0x0000FF);
        assert_eq!(loaded.screen[256 * 256 - 1], 0xFFFFFF);
        assert_eq!(loaded.screen[128 * 256 + 128], 0x808080);

        cleanup(&path);
    }

    #[test]
    fn test_save_load_preserves_all_registers() {
        let path = temp_path("geos_test_regs.bin");
        let mut vm = Vm::new();
        for i in 0..NUM_REGS {
            vm.regs[i] = (i as u32).wrapping_mul(0x11111111);
        }

        vm.save_to_file(&path).expect("save should succeed");
        let loaded = Vm::load_from_file(&path).expect("load should succeed");

        for i in 0..NUM_REGS {
            assert_eq!(
                loaded.regs[i],
                (i as u32).wrapping_mul(0x11111111),
                "register {} mismatch after round-trip",
                i
            );
        }

        cleanup(&path);
    }

    #[test]
    fn test_load_invalid_magic() {
        let path = temp_path("geos_test_bad_magic.bin");
        // Need full-size file to pass size check, but with wrong magic
        let min_size = 4 + 4 + 1 + 4 + NUM_REGS * 4 + RAM_SIZE * 4 + SCREEN_SIZE * 4 + 4 + 4;
        let mut data = vec![0u8; min_size];
        data[0..4].copy_from_slice(b"BAD!");
        data[4..8].copy_from_slice(&SAVE_VERSION.to_le_bytes());
        std::fs::write(&path, &data).expect("write should succeed");

        let result = Vm::load_from_file(&path);
        assert!(result.is_err());
        let err = result.unwrap_err().to_string();
        assert!(
            err.contains("invalid magic"),
            "error should mention invalid magic: {}",
            err
        );

        cleanup(&path);
    }

    #[test]
    fn test_load_too_small() {
        let path = temp_path("geos_test_too_small.bin");
        // Valid magic but way too short
        let data = b"GEOS\x02\x00\x00\x00"; // magic + version, nothing else
        std::fs::write(&path, data).expect("write should succeed");

        let result = Vm::load_from_file(&path);
        assert!(result.is_err());
        let err = result.unwrap_err().to_string();
        assert!(
            err.contains("too small"),
            "error should mention too small: {}",
            err
        );

        cleanup(&path);
    }

    #[test]
    fn test_load_unsupported_version() {
        let path = temp_path("geos_test_bad_version.bin");
        // Write valid magic with a future version number
        let min_size = 4 + 4 + 1 + 4 + NUM_REGS * 4 + RAM_SIZE * 4 + SCREEN_SIZE * 4;
        let mut data = vec![0u8; min_size];
        data[0..4].copy_from_slice(SAVE_MAGIC);
        // Write version 999 (way beyond SAVE_VERSION)
        data[4..8].copy_from_slice(&999u32.to_le_bytes());
        std::fs::write(&path, &data).expect("write should succeed");

        let result = Vm::load_from_file(&path);
        assert!(result.is_err());
        let err = result.unwrap_err().to_string();
        assert!(
            err.contains("unsupported save version"),
            "error should mention unsupported version: {}",
            err
        );

        cleanup(&path);
    }

    #[test]
    fn test_load_empty_file() {
        let path = temp_path("geos_test_empty.bin");
        std::fs::write(&path, &[]).expect("write should succeed");

        let result = Vm::load_from_file(&path);
        assert!(result.is_err());

        cleanup(&path);
    }

    #[test]
    fn test_load_missing_file() {
        let path = temp_path("geos_test_nonexistent.bin");
        cleanup(&path); // ensure it doesn't exist

        let result = Vm::load_from_file(&path);
        assert!(result.is_err());
    }

    #[test]
    fn test_load_truncated_at_ram() {
        let path = temp_path("geos_test_trunc_ram.bin");
        // Write header + halted + pc + some regs, but not enough RAM
        let header_size = 4 + 4 + 1 + 4; // magic + version + halted + pc
        let mut data = vec![0u8; header_size + NUM_REGS * 4 + 100]; // only 100 words of RAM
        data[0..4].copy_from_slice(SAVE_MAGIC);
        data[4..8].copy_from_slice(&SAVE_VERSION.to_le_bytes());
        std::fs::write(&path, &data).expect("write should succeed");

        let result = Vm::load_from_file(&path);
        assert!(result.is_err());
        let err = result.unwrap_err().to_string();
        assert!(
            err.contains("too small"),
            "error should mention too small: {}",
            err
        );

        cleanup(&path);
    }

    #[test]
    fn test_save_creates_file() {
        let path = temp_path("geos_test_create.bin");
        cleanup(&path);

        let vm = Vm::new();
        vm.save_to_file(&path).expect("save should succeed");

        assert!(path.exists(), "save should create the file");
        let metadata = std::fs::metadata(&path).expect("should read metadata");
        assert!(metadata.len() > 0, "file should not be empty");

        // Expected size: magic(4) + version(4) + halted(1) + pc(4) + regs(128) + ram(65536*4) + screen(65536*4) + rand(4) + frame(4) + bm_count(4) + coord_count(4) + bldg_count(4)
        let expected =
            4 + 4 + 1 + 4 + NUM_REGS * 4 + RAM_SIZE * 4 + SCREEN_SIZE * 4 + 4 + 4 + 4 + 4 + 4;
        assert_eq!(
            metadata.len() as usize,
            expected,
            "file size should match expected"
        );

        cleanup(&path);
    }

    #[test]
    fn test_save_overwrites_existing() {
        let path = temp_path("geos_test_overwrite.bin");
        let mut vm = Vm::new();
        vm.pc = 111;
        vm.save_to_file(&path).expect("first save should succeed");

        vm.pc = 222;
        vm.save_to_file(&path)
            .expect("overwrite save should succeed");

        let loaded = Vm::load_from_file(&path).expect("load should succeed");
        assert_eq!(loaded.pc, 222, "should get the second save, not the first");

        cleanup(&path);
    }

    // --- read_string_static tests ---

    #[test]
    fn test_read_string_static_basic() {
        let mut ram = vec![0u32; 100];
        // Write "Hello" + null
        for (i, ch) in b"Hello\0".iter().enumerate() {
            ram[i] = *ch as u32;
        }

        let result = Vm::read_string_static(&ram, 0);
        assert_eq!(result, Some("Hello".to_string()));
    }

    #[test]
    fn test_read_string_static_empty() {
        let ram = vec![0u32; 100]; // all zeros
        let result = Vm::read_string_static(&ram, 0);
        assert_eq!(
            result,
            Some("".to_string()),
            "null-terminated empty returns Some(\"\")"
        );
    }

    #[test]
    fn test_read_string_static_mid_buffer() {
        let mut ram = vec![0u32; 100];
        for (i, ch) in b"World\0".iter().enumerate() {
            ram[50 + i] = *ch as u32;
        }

        let result = Vm::read_string_static(&ram, 50);
        assert_eq!(result, Some("World".to_string()));
    }

    #[test]
    fn test_read_string_static_single_char() {
        let mut ram = vec![0u32; 100];
        ram[0] = 'A' as u32;
        ram[1] = 0;

        let result = Vm::read_string_static(&ram, 0);
        assert_eq!(result, Some("A".to_string()));
    }

    #[test]
    fn test_read_string_static_max_length() {
        let mut vm = Vm::new();
        // Write a string at address 100, 200 chars long
        for i in 0..200 {
            vm.ram[100 + i] = (b'A' as u32 + ((i % 26) as u32));
        }
        vm.ram[300] = 0; // null terminator

        let result = vm.read_ram_string(100, 50);
        assert_eq!(result.unwrap().len(), 50, "should cap at max_len");
    }

    #[test]
    fn test_read_ram_string_null_at_end() {
        let mut vm = Vm::new();
        // Write a string without explicit null but at end of useful RAM
        vm.ram[100] = 'X' as u32;
        vm.ram[101] = 'Y' as u32;

        let result = vm.read_ram_string(100, 10);
        assert_eq!(result, Some("XY".to_string()));
    }
}

impl Vm {
    /// Read a null-terminated string from RAM (one char per u32 word).
    pub(super) fn read_string_static(ram: &[u32], addr: usize) -> Option<String> {
        let mut s = String::new();
        let mut a = addr;
        while a < ram.len() {
            let ch = (ram[a] & 0xFF) as u8;
            if ch == 0 {
                return Some(s);
            }
            s.push(ch as char);
            a += 1;
        }
        if s.is_empty() {
            None
        } else {
            Some(s)
        }
    }

    /// Read a null-terminated string from self.ram with max length cap.
    pub(super) fn read_ram_string(&self, addr: usize, max_len: usize) -> Option<String> {
        let mut s = String::new();
        let mut a = addr;
        while a < self.ram.len() && s.len() < max_len {
            let ch = (self.ram[a] & 0xFF) as u8;
            if ch == 0 {
                break;
            }
            s.push(ch as char);
            a += 1;
        }
        if s.is_empty() {
            None
        } else {
            Some(s)
        }
    }
}

impl Vm {
    pub(super) fn fetch(&mut self) -> u32 {
        #[cfg(feature = "gpu")]
        if self.substrate_execution {
            if let Some(ref mut substrate) = self.active_substrate {
                let addr = self.pc as usize;
                if addr < substrate.substrate.len() {
                    let val = substrate.substrate[addr];
                    self.pc += 1;
                    // Mask out Taxonomy (bits 28-31) AND Hot Bit (bit 23)
                    // (0xF0000000 | 0x00800000) = 0xF0800000
                    return val & !0xF0800000;
                }
            }
        }

        // Fast path: kernel mode (no page directory) uses identity mapping.
        // Avoids Option match + virtual address translation per instruction word.
        let phys = if self.current_page_dir.is_none() {
            let addr = self.pc as usize;
            if addr >= self.ram.len() {
                self.trigger_segfault();
                return 0;
            }
            addr
        } else {
            match self.translate_va(self.pc) {
                Some(addr) if addr < self.ram.len() => addr,
                _ => {
                    self.trigger_segfault();
                    return 0;
                },
            }
        };
        let val = self.ram[phys];
        self.pc += 1;
        val
    }

    /// Fetch a register argument and validate it's in 0..NUM_REGS range.
    /// Returns Some(valid_index) if the register is valid, None if out of range.
    /// On invalid register, sets r0 = geos_errno(GEOS_EREG) for program error detection.
    pub(super) fn fetch_reg(&mut self) -> Option<usize> {
        let reg = self.fetch() as usize;
        if reg < NUM_REGS {
            Some(reg)
        } else {
            self.regs[0] = geos_errno(GEOS_EREG);
            None
        }
    }

    /// Draw a character to the screen buffer (tiny 5x7 inline font for TEXT opcode)
    pub(super) fn draw_char(&mut self, ch: u8, x: usize, y: usize, color: u32) {
        self.draw_char_with_bg(ch, x, y, color, None);
    }

    /// Get the current process's font mode (0-3).
    /// 0 = fixed 5x7 (default), 1 = variable-width 8x8, 2 = tiny 3x5, 3 = medium 5x7.
    pub fn get_font_mode(&self) -> u8 {
        if self.processes.is_empty() {
            self.kernel_font_mode
        } else if self.current_pid == 0 {
            self.processes.first().map(|p| p.font_mode).unwrap_or(0)
        } else {
            self.processes
                .iter()
                .find(|p| p.pid == self.current_pid)
                .map(|p| p.font_mode)
                .unwrap_or(0)
        }
    }

    /// Set the current process's font mode (clamped to 0-3).
    pub fn set_font_mode(&mut self, mode: u8) {
        let mode = mode & 0x3;
        if self.processes.is_empty() {
            self.kernel_font_mode = mode;
        } else if self.current_pid == 0 {
            if let Some(p) = self.processes.first_mut() {
                p.font_mode = mode;
            }
        } else if let Some(p) = self
            .processes
            .iter_mut()
            .find(|p| p.pid == self.current_pid)
        {
            p.font_mode = mode;
        }
    }

    /// Draw a character with optional background color
    pub(super) fn draw_char_with_bg(
        &mut self,
        ch: u8,
        x: usize,
        y: usize,
        fg: u32,
        bg: Option<u32>,
    ) {
        const MINI_FONT: [[u8; 7]; 96] = include!("../mini_font.in");
        const EXT_FONT: [[u8; 7]; 30] = include!("../ext_font.in");
        let idx = ch as usize;

        // Check if current process has a custom font (Phase 98)
        // Custom font overrides the built-in mini font with 8x8 glyphs
        let custom_font = if self.current_pid == 0 {
            self.processes.first().and_then(|p| p.custom_font.as_ref())
        } else {
            self.processes
                .iter()
                .find(|p| p.pid == self.current_pid)
                .and_then(|p| p.custom_font.as_ref())
        };

        if let Some(font) = custom_font {
            // Use custom 8x8 font (only supports 0-255 if font has 256 entries)
            if idx >= font.len() {
                return;
            }
            let glyph = &font[idx];
            for (row, &glyph_row) in glyph.iter().enumerate().take(8usize) {
                for col in 0..8usize {
                    let px = x + col;
                    let py = y + row;
                    if px < 256 && py < 256 {
                        let on = glyph_row & (1 << (7 - col)) != 0;
                        if on {
                            self.screen[py * 256 + px] = fg;
                        } else if let Some(bg_color) = bg {
                            self.screen[py * 256 + px] = bg_color;
                        }
                    }
                }
            }
        } else if (32..=127).contains(&idx) {
            // Use built-in 5x7 mini font
            let glyph = &MINI_FONT[idx - 32];
            for (row, &glyph_row) in glyph.iter().enumerate().take(7usize) {
                for col in 0..5usize {
                    let px = x + col;
                    let py = y + row;
                    if px < 256 && py < 256 {
                        let on = glyph_row & (1 << (4 - col)) != 0;
                        if on {
                            self.screen[py * 256 + px] = fg;
                        } else if let Some(bg_color) = bg {
                            self.screen[py * 256 + px] = bg_color;
                        }
                    }
                }
            }
        } else if (128..=157).contains(&idx) {
            // Extended box-drawing characters
            let glyph = &EXT_FONT[idx - 128];
            for (row, &glyph_row) in glyph.iter().enumerate().take(7usize) {
                for col in 0..5usize {
                    let px = x + col;
                    let py = y + row;
                    if px < 256 && py < 256 {
                        let on = glyph_row & (1 << (4 - col)) != 0;
                        if on {
                            self.screen[py * 256 + px] = fg;
                        } else if let Some(bg_color) = bg {
                            self.screen[py * 256 + px] = bg_color;
                        }
                    }
                }
            }
        }
    }

    /// Draw a character using the medium 5x7 font (for MEDTEXT opcode).
    /// Advance is 6 pixels (5 wide + 1 spacing), giving 42 columns in 256px.
    /// Supports ASCII 32-127 plus extended box-drawing chars 128-157.
    pub(super) fn draw_char_medium(
        &mut self,
        ch: u8,
        x: usize,
        y: usize,
        fg: u32,
        bg: Option<u32>,
    ) {
        const MED_FONT: [[u8; 7]; 96] = include!("../med_font.in");
        const EXT_FONT: [[u8; 7]; 30] = include!("../ext_font.in");
        let idx = ch as usize;
        let glyph: &[u8; 7] = if (32..=127).contains(&idx) {
            &MED_FONT[idx - 32]
        } else if (128..=157).contains(&idx) {
            &EXT_FONT[idx - 128]
        } else {
            return;
        };
        for (row, &glyph_row) in glyph.iter().enumerate().take(7usize) {
            for col in 0..5usize {
                let px = x + col;
                let py = y + row;
                if px < 256 && py < 256 {
                    let on = glyph_row & (1 << (4 - col)) != 0;
                    if on {
                        self.screen[py * 256 + px] = fg;
                    } else if let Some(bg_color) = bg {
                        self.screen[py * 256 + px] = bg_color;
                    }
                }
            }
        }
    }

    /// Draw a character using the variable-width font (for VWTXT opcode).
    /// Each glyph has an 8x8 bitmap and a per-character advance width (1-8px).
    /// Returns the advance width for cursor positioning.
    /// Supports ASCII 32-127.
    pub(super) fn draw_char_vw(
        &mut self,
        ch: u8,
        x: usize,
        y: usize,
        fg: u32,
        bg: Option<u32>,
    ) -> u32 {
        const VW_FONT: [[u8; 9]; 96] = include!("../vw_font.in");
        let idx = ch as usize;
        if !(32..=127).contains(&idx) {
            return 3; // default advance for unknown chars
        }
        let entry = &VW_FONT[idx - 32];
        let advance = entry[8] as u32;
        for (row, &glyph_row) in entry[..8].iter().enumerate() {
            for col in 0..8usize {
                let px = x + col;
                let py = y + row;
                if px < 256 && py < 256 {
                    let on = glyph_row & (1 << (7 - col)) != 0;
                    if on {
                        self.screen[py * 256 + px] = fg;
                    } else if let Some(bg_color) = bg {
                        self.screen[py * 256 + px] = bg_color;
                    }
                }
            }
        }
        advance
    }

    /// Draw a character using the tiny 3x5 font (for SMALLTEXT opcode).
    /// Advance is 3 pixels (no spacing), giving 85 columns in 256px.
    /// Supports ASCII 32-127 plus extended box-drawing chars 128-157.
    pub(super) fn draw_char_tiny(&mut self, ch: u8, x: usize, y: usize, fg: u32, bg: Option<u32>) {
        const TINY_FONT: [[u8; 5]; 96] = include!("../tiny_font.in");
        // For extended chars in tiny font, we use a simplified 3x5 representation
        let idx = ch as usize;
        if (32..=127).contains(&idx) {
            let glyph = &TINY_FONT[idx - 32];
            for (row, &glyph_row) in glyph.iter().enumerate().take(5usize) {
                for col in 0..3usize {
                    let px = x + col;
                    let py = y + row;
                    if px < 256 && py < 256 {
                        let on = glyph_row & (1 << (2 - col)) != 0;
                        if on {
                            self.screen[py * 256 + px] = fg;
                        } else if let Some(bg_color) = bg {
                            self.screen[py * 256 + px] = bg_color;
                        }
                    }
                }
            }
        } else if (128..=157).contains(&idx) {
            // For extended chars in tiny font, render directly from the 5x7 ext font
            // but sampling only 3x5 pixels (cols 1-3, rows 1-5 of the 5x7 glyph)
            const EXT_FONT: [[u8; 7]; 30] = include!("../ext_font.in");
            let glyph = &EXT_FONT[idx - 128];
            for row in 0..5usize {
                for col in 1..4usize {
                    let px = x + (col - 1);
                    let py = y + row;
                    if px < 256 && py < 256 {
                        let on = glyph[row] & (1 << (4 - col)) != 0;
                        if on {
                            self.screen[py * 256 + px] = fg;
                        } else if let Some(bg_color) = bg {
                            self.screen[py * 256 + px] = bg_color;
                        }
                    }
                }
            }
        }
    }

    /// Helper: serialize HashMap<String, String> to writer.
    /// Format: count (u32 LE) + for each entry: key_len (u32 LE) + key bytes + val_len (u32 LE) + val bytes
    fn serialize_str_map<W: std::io::Write>(
        f: &mut W,
        map: &std::collections::HashMap<String, String>,
    ) -> std::io::Result<()> {
        let count = map.len() as u32;
        f.write_all(&count.to_le_bytes())?;
        for (k, v) in map {
            let k_bytes = k.as_bytes();
            f.write_all(&(k_bytes.len() as u32).to_le_bytes())?;
            f.write_all(k_bytes)?;
            let v_bytes = v.as_bytes();
            f.write_all(&(v_bytes.len() as u32).to_le_bytes())?;
            f.write_all(v_bytes)?;
        }
        Ok(())
    }

    /// Helper: deserialize HashMap<String, String> from reader.
    fn deserialize_str_map(
        data: &[u8],
        offset: &mut usize,
    ) -> std::io::Result<std::collections::HashMap<String, String>> {
        let mut map = std::collections::HashMap::new();
        if *offset + 4 > data.len() {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                "truncated in map count",
            ));
        }
        let count = u32::from_le_bytes([
            data[*offset],
            data[*offset + 1],
            data[*offset + 2],
            data[*offset + 3],
        ]);
        *offset += 4;
        for _ in 0..count {
            if *offset + 4 > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in map key length",
                ));
            }
            let k_len = u32::from_le_bytes([
                data[*offset],
                data[*offset + 1],
                data[*offset + 2],
                data[*offset + 3],
            ]) as usize;
            *offset += 4;
            if *offset + k_len + 4 > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in map key data",
                ));
            }
            let k = String::from_utf8_lossy(&data[*offset..*offset + k_len]).to_string();
            *offset += k_len;
            let v_len = u32::from_le_bytes([
                data[*offset],
                data[*offset + 1],
                data[*offset + 2],
                data[*offset + 3],
            ]) as usize;
            *offset += 4;
            if *offset + v_len > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in map value data",
                ));
            }
            let v = String::from_utf8_lossy(&data[*offset..*offset + v_len]).to_string();
            *offset += v_len;
            map.insert(k, v);
        }
        Ok(map)
    }

    /// Save VM state to a binary file.
    /// Format: GEOS magic (4) + version u32 (4) + halted u8 (1) + pc u32 (4)
    ///         + regs [u32; 32] (128) + ram [u32; RAM_SIZE] + screen [u32; SCREEN_SIZE]
    ///         + rand_state u32 (4) + frame_count u32 (4)   [version >= 2]
    #[cfg(not(target_arch = "wasm32"))]
    pub fn save_to_file(&self, path: &std::path::Path) -> std::io::Result<()> {
        use std::io::Write;
        let mut f = std::fs::File::create(path)?;
        f.write_all(SAVE_MAGIC)?;
        f.write_all(&SAVE_VERSION.to_le_bytes())?;
        f.write_all(&[if self.halted { 1 } else { 0 }])?;
        f.write_all(&self.pc.to_le_bytes())?;
        for &r in &self.regs {
            f.write_all(&r.to_le_bytes())?;
        }
        for &v in &self.ram {
            f.write_all(&v.to_le_bytes())?;
        }
        for &v in &self.screen {
            f.write_all(&v.to_le_bytes())?;
        }
        // v2 fields: persist RNG state and frame counter
        f.write_all(&self.rand_state.to_le_bytes())?;
        f.write_all(&self.frame_count.to_le_bytes())?;
        // v3 fields: persist building_metadata and coordinate_metadata
        // building_metadata: HashMap<u32, HashMap<String, String>>
        let bm_count = self.building_metadata.len() as u32;
        f.write_all(&bm_count.to_le_bytes())?;
        for (&building_id, inner_map) in &self.building_metadata {
            f.write_all(&building_id.to_le_bytes())?;
            Self::serialize_str_map(&mut f, inner_map)?;
        }
        // coordinate_metadata: HashMap<u64, HashMap<String, String>>
        let coord_count = self.coordinate_metadata.len() as u32;
        f.write_all(&coord_count.to_le_bytes())?;
        for (&coord_key, inner_map) in &self.coordinate_metadata {
            f.write_all(&coord_key.to_le_bytes())?;
            Self::serialize_str_map(&mut f, inner_map)?;
        }
        // v4 fields: persist the buildings Vec (unlimited building capacity)
        let bldg_count = self.buildings.len() as u32;
        f.write_all(&bldg_count.to_le_bytes())?;
        for b in &self.buildings {
            f.write_all(&b.id.to_le_bytes())?;
            f.write_all(&(b.x as u32).to_le_bytes())?;
            f.write_all(&(b.y as u32).to_le_bytes())?;
            f.write_all(&b.type_color.to_le_bytes())?;
            let name_bytes = b.name.as_bytes();
            let name_len = name_bytes.len() as u32;
            f.write_all(&name_len.to_le_bytes())?;
            f.write_all(name_bytes)?;
        }
        Ok(())
    }

    /// Load VM state from a binary file. Returns None if file doesn't exist
    /// or has invalid format.
    #[cfg(not(target_arch = "wasm32"))]
    #[allow(dead_code)]
    pub fn load_from_file(path: &std::path::Path) -> std::io::Result<Self> {
        use std::io::Read;
        let mut data = Vec::new();
        let mut f = std::fs::File::open(path)?;
        f.read_to_end(&mut data)?;

        // Minimum size: magic(4) + version(4) + halted(1) + pc(4) + regs(128) = 141
        let min_size = 4 + 4 + 1 + 4 + NUM_REGS * 4 + RAM_SIZE * 4 + SCREEN_SIZE * 4;
        if data.len() < min_size {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                format!(
                    "save file too small: {} bytes (need {})",
                    data.len(),
                    min_size
                ),
            ));
        }
        if &data[0..4] != SAVE_MAGIC {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                "invalid magic bytes",
            ));
        }
        let version = u32::from_le_bytes([data[4], data[5], data[6], data[7]]);
        // Accept v1 saves (missing rand_state/frame_count) and v2
        if !(1..=SAVE_VERSION).contains(&version) {
            return Err(std::io::Error::new(
                std::io::ErrorKind::InvalidData,
                format!(
                    "unsupported save version: {} (need 1-{})",
                    version, SAVE_VERSION
                ),
            ));
        }

        let mut offset = 8usize;
        let halted = data[offset] != 0;
        offset += 1;
        let pc = u32::from_le_bytes([
            data[offset],
            data[offset + 1],
            data[offset + 2],
            data[offset + 3],
        ]);
        offset += 4;

        let mut regs = [0u32; NUM_REGS];
        for r in regs.iter_mut() {
            *r = u32::from_le_bytes([
                data[offset],
                data[offset + 1],
                data[offset + 2],
                data[offset + 3],
            ]);
            offset += 4;
        }

        let mut ram = vec![0u32; RAM_SIZE];
        for v in ram.iter_mut() {
            *v = u32::from_le_bytes([
                data[offset],
                data[offset + 1],
                data[offset + 2],
                data[offset + 3],
            ]);
            offset += 4;
        }

        let mut screen = vec![0u32; SCREEN_SIZE];
        for v in screen.iter_mut() {
            *v = u32::from_le_bytes([
                data[offset],
                data[offset + 1],
                data[offset + 2],
                data[offset + 3],
            ]);
            offset += 4;
        }

        // v2 fields: rand_state + frame_count (default if v1 save)
        let (rand_state, frame_count) = if version >= 2 && offset + 8 <= data.len() {
            let rs = u32::from_le_bytes([
                data[offset],
                data[offset + 1],
                data[offset + 2],
                data[offset + 3],
            ]);
            let fc = u32::from_le_bytes([
                data[offset + 4],
                data[offset + 5],
                data[offset + 6],
                data[offset + 7],
            ]);
            (rs, fc)
        } else {
            (0xDEADBEEF, 0) // v1 defaults
        };
        if version >= 2 && offset + 8 <= data.len() {
            offset += 8;
        }

        // v3 fields: building_metadata + coordinate_metadata (empty if v1/v2)
        let building_metadata = if version >= 3 {
            if offset + 4 > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in building_metadata count",
                ));
            }
            let bm_count = u32::from_le_bytes([
                data[offset],
                data[offset + 1],
                data[offset + 2],
                data[offset + 3],
            ]);
            offset += 4;
            let mut bm = std::collections::HashMap::new();
            for _ in 0..bm_count {
                if offset + 4 > data.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::InvalidData,
                        "truncated in building_id",
                    ));
                }
                let building_id = u32::from_le_bytes([
                    data[offset],
                    data[offset + 1],
                    data[offset + 2],
                    data[offset + 3],
                ]);
                offset += 4;
                let inner = Self::deserialize_str_map(&data, &mut offset)?;
                bm.insert(building_id, inner);
            }
            bm
        } else {
            std::collections::HashMap::new()
        };
        let coordinate_metadata = if version >= 3 {
            if offset + 4 > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in coordinate_metadata count",
                ));
            }
            let coord_count = u32::from_le_bytes([
                data[offset],
                data[offset + 1],
                data[offset + 2],
                data[offset + 3],
            ]);
            offset += 4;
            let mut coord_map = std::collections::HashMap::new();
            for _ in 0..coord_count {
                if offset + 8 > data.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::InvalidData,
                        "truncated in coord key",
                    ));
                }
                let coord_key = u64::from_le_bytes([
                    data[offset],
                    data[offset + 1],
                    data[offset + 2],
                    data[offset + 3],
                    data[offset + 4],
                    data[offset + 5],
                    data[offset + 6],
                    data[offset + 7],
                ]);
                offset += 8;
                let inner = Self::deserialize_str_map(&data, &mut offset)?;
                coord_map.insert(coord_key, inner);
            }
            coord_map
        } else {
            std::collections::HashMap::new()
        };

        // v4 fields: buildings Vec (empty if v1/v2/v3)
        let buildings = if version >= 4 {
            if offset + 4 > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in buildings count",
                ));
            }
            let bldg_count = u32::from_le_bytes([
                data[offset],
                data[offset + 1],
                data[offset + 2],
                data[offset + 3],
            ]);
            offset += 4;
            let mut bldgs = Vec::with_capacity(bldg_count as usize);
            for _ in 0..bldg_count {
                if offset + 16 > data.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::InvalidData,
                        "truncated in building data",
                    ));
                }
                let id = u32::from_le_bytes([
                    data[offset],
                    data[offset + 1],
                    data[offset + 2],
                    data[offset + 3],
                ]);
                offset += 4;
                let x = u32::from_le_bytes([
                    data[offset],
                    data[offset + 1],
                    data[offset + 2],
                    data[offset + 3],
                ]) as i32;
                offset += 4;
                let y = u32::from_le_bytes([
                    data[offset],
                    data[offset + 1],
                    data[offset + 2],
                    data[offset + 3],
                ]) as i32;
                offset += 4;
                let type_color = u32::from_le_bytes([
                    data[offset],
                    data[offset + 1],
                    data[offset + 2],
                    data[offset + 3],
                ]);
                offset += 4;
                if offset + 4 > data.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::InvalidData,
                        "truncated in building name length",
                    ));
                }
                let name_len = u32::from_le_bytes([
                    data[offset],
                    data[offset + 1],
                    data[offset + 2],
                    data[offset + 3],
                ]) as usize;
                offset += 4;
                if offset + name_len > data.len() {
                    return Err(std::io::Error::new(
                        std::io::ErrorKind::InvalidData,
                        "truncated in building name",
                    ));
                }
                let name = String::from_utf8_lossy(&data[offset..offset + name_len]).to_string();
                offset += name_len;
                bldgs.push(super::types::Building {
                    id,
                    x,
                    y,
                    type_color,
                    name,
                });
            }
            bldgs
        } else {
            Vec::new()
        };

        Ok(Vm {
            ram,
            regs,
            pc,
            screen,
            back_buffer: Vec::new(),
            back_buffer_active: false,
            sprite_layer: vec![0; SCREEN_SIZE],
            sprite_layer_active: false,
            assembler_labels: std::collections::HashMap::new(),
            halted,
            shutdown_requested: false,
            breakpoint_hit: false,
            frame_ready: false,
            rand_state,
            frame_count,
            beep: None,
            note: None,
            audio_play: None,
            audio_stop: false,
            audio_status_query: false,
            debug_mode: false,
            access_log: Vec::new(),
            processes: Vec::new(),
            mode: CpuMode::Kernel,
            kernel_stack: Vec::new(),
            allocated_pages: 0b11,
            page_ref_count: {
                let mut rc = [0u32; NUM_RAM_PAGES];
                rc[0] = 1;
                rc[1] = 1;
                rc
            },
            page_cow: 0,
            current_page_dir: None,
            current_vmas: Vec::new(),
            segfault_pid: 0,
            segfault: false,
            vfs: crate::vfs::Vfs::new(),
            inode_fs: crate::inode_fs::InodeFs::new(),
            current_pid: 0,
            current_capabilities: None,
            sched_tick: 0,
            default_time_slice: DEFAULT_TIME_SLICE,
            yielded: false,
            wants_block: false,
            pending_wakes: Vec::new(),
            sleep_frames: 0,
            new_priority: 0,
            pipes: Vec::new(),
            mutexes: Vec::new(),
            semaphores: Vec::new(),
            canvas_buffer: vec![0; CANVAS_RAM_SIZE],
            pipe_created: false,
            msg_sender: 0,
            msg_data: [0; MSG_WORDS],
            msg_recv_requested: false,
            env_vars: std::collections::HashMap::new(),
            building_metadata,
            coordinate_metadata,
            buildings,
            nav_path: Vec::new(),
            step_exit_code: None,
            step_zombie: false,
            booted: false,
            kernel_font_mode: 0,
            hypervisor_active: false,
            hypervisor_config: String::new(),
            hypervisor_mode: HypervisorMode::default(),
            hypervisor_window_id: 0,
            hypervisor_input_queue: Vec::new(),
            hypervisor_input_pending: false,
            hypervisor_mailbox: [0u32; 64],
            opcode_histogram: [0; 256],
            total_steps: 0,
            profile_regions: [0; 16],
            profile_active: [false; 16],
            profile_start: [0; 16],
            key_buffer: vec![0; 256],
            key_buffer_head: 0,
            key_buffer_tail: 0,
            key_port: 0,
            key_bitmask: 0,
            formulas: Vec::new(),
            formula_dep_index: std::collections::HashMap::new(),
            trace_recording: false,
            trace_buffer: TraceBuffer::new(DEFAULT_TRACE_CAPACITY),
            frame_checkpoints: FrameCheckBuffer::new(DEFAULT_FRAME_CHECK_CAPACITY),
            snapshots: Vec::new(),
            pixel_write_log: PixelWriteLog::new(DEFAULT_PIXEL_WRITE_CAPACITY),
            render_logging: false,
            render_log: crate::vm::trace::RenderLog::new(
                crate::vm::trace::DEFAULT_RENDER_LOG_CAPACITY,
            ),
            tcp_connections: (0..super::MAX_TCP_CONNECTIONS).map(|_| None).collect(),
            pty_slots: (0..super::ops_pty::MAX_PTY_SLOTS).map(|_| None).collect(),
            net_inbox: Vec::new(),
            hit_regions: Vec::with_capacity(super::MAX_HIT_REGIONS),
            mouse_x: 0,
            mouse_y: 0,
            mouse_button: 0,
            mouse_event_buffer: vec![0; 64],
            mouse_event_x: vec![0; 64],
            mouse_event_y: vec![0; 64],
            mouse_event_head: 0,
            mouse_event_tail: 0,
            windows: Vec::with_capacity(super::MAX_WINDOWS),
            next_window_id: 1,
            llm_mock_response: None,
            llm_config: None,
            hermes_mock_response: None,
            hermes_session_id: None,
            background_vms: Vec::new(),
            next_bg_vm_id: 1,
            live_hypervisor: None,
            segfault_addr: 0,
            pc_trace: [0; 16],
            pc_trace_idx: 0,
            crash_dialog_active: false,
            crash_dialog_pid: 0,
            mailbox_write_buf: vec![
                super::types::MailboxEntry::default();
                super::types::MAILBOX_SIZE
            ],
            mailbox_read_buf: vec![
                super::types::MailboxEntry::default();
                super::types::MAILBOX_SIZE
            ],
            host_file_handles: (0..super::types::MAX_HOST_FILES).map(|_| None).collect(),
            focused_pid: 0,
            clip_rect: None,
            clipboard: Vec::new(),
            clipboard_text: Vec::new(),
            clipboard_history: Vec::new(),
            clipboard_history_head: 0,
            clipboard_history_count: 0,
            hash_tables: Default::default(),
            hash_tables_active: 0,
            sprite_sheets: Default::default(),
            icache: vec![None; RAM_SIZE],
            icache_freq: vec![0; RAM_SIZE],
            icache_generation: 0,
            icache_hits: 0,
            icache_misses: 0,
            icache_hot_threshold: super::types::ICACHE_HOT_THRESHOLD,
            // Phase 222: wall-clock timer (new epoch on deserialize)
            epoch: std::time::Instant::now(),
            alarms: (0..super::types::MAX_ALARMS)
                .map(|_| super::types::WallAlarm {
                    target_ms: 0,
                    addr: 0,
                    value: 0,
                    active: false,
                })
                .collect(),
            // Infinite tile map (chunks loaded from separate files on disk)
            tile_store: crate::tile_store::TileStore::new(),
            // ── Phase 34: Area Agent Evolution ──────────────────────────
            area_manager: crate::kernel::area_manager::AreaManager::new(),
            pending_agent_actions: Vec::new(),
            #[cfg(feature = "gpu")]
            active_substrate: None,
            substrate_x: 0,
            substrate_y: 0,
            substrate_cmd: 0,
            substrate_arg1: 0,
            substrate_arg2: 0,
            substrate_status: 0,
            substrate_result: 0,
            // Phase P: Spatial File System
            spatial_files: std::collections::HashMap::new(),
            // Phase Glyph: Glyph Grid
            glyph_grid: crate::glyph_grid::GlyphGrid::new(),
            substrate_execution: false,
            sprite_layers: Default::default(),
        })
    }
}
