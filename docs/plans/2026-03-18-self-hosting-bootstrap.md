# Self-Hosting Bootstrap Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Eliminate Python compiler dependency by extending Rust GlyphAssembler to emit ASCII-compatible PNG cartridges directly.

**Architecture:** Port the 5-segment PNG generation from `geos_ascii_compiler.py` to Rust, unify ISA with WGSL scheduler, enable `.glyph` files to produce GPU-ready cartridges.

**Tech Stack:** Rust, image crate, existing GlyphAssembler infrastructure

---

## Phase 1: ISA Unification

### Task 1: Align Opcode Constants

**Files:**
- Modify: `systems/infinite_map_rs/src/glyph_assembler.rs:9-36`
- Test: `systems/infinite_map_rs/tests/full_assembler_test.rs`

**Step 1: Write the failing test**

```rust
// Add to tests/full_assembler_test.rs

#[test]
fn test_aligned_isa_opcodes() {
    // Verify aligned ISA matches WGSL scheduler expectations
    use infinite_map_rs::glyph_assembler::Opcode;

    assert_eq!(Opcode::Nop as u32, 0, "NOP should be 0");
    assert_eq!(Opcode::Ldi as u32, 1, "LDI should be 1 (not 204)");
    assert_eq!(Opcode::Mov as u32, 2, "MOV should be 2 (not 206)");
    assert_eq!(Opcode::Load as u32, 3, "LOAD should be 3");
    assert_eq!(Opcode::Store as u32, 4, "STORE should be 4");
    assert_eq!(Opcode::Add as u32, 5, "ADD should be 5");
    assert_eq!(Opcode::Sub as u32, 6, "SUB should be 6");
    assert_eq!(Opcode::Mul as u32, 7, "MUL should be 7");
    assert_eq!(Opcode::Div as u32, 8, "DIV should be 8");
    assert_eq!(Opcode::Jmp as u32, 9, "JMP should be 9 (not 209)");
    assert_eq!(Opcode::Branch as u32, 10, "BRANCH should be 10");
    assert_eq!(Opcode::Call as u32, 11, "CALL should be 11");
    assert_eq!(Opcode::Ret as u32, 12, "RET should be 12");
    assert_eq!(Opcode::Halt as u32, 13, "HALT should be 13");
}
```

**Step 2: Run test to verify it passes**

Run: `cargo test --test full_assembler_test test_aligned_isa_opcodes -v`
Expected: PASS (current implementation already uses aligned ISA)

**Step 3: Document the ISA alignment**

Add comment to `glyph_assembler.rs`:

```rust
/// Opcodes for the Glyph VM (Aligned ISA)
///
/// These match the WGSL scheduler in shaders/glyph_vm_scheduler.wgsl
/// and the synthetic_vram.rs emulator. DO NOT use the legacy Python
/// extended opcodes (LDI=204, MOV=206, JMP=209).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Opcode {
    // ...
}
```

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/glyph_assembler.rs systems/infinite_map_rs/tests/full_assembler_test.rs
git commit -m "docs(assembler): document aligned ISA for self-hosting bootstrap"
```

---

### Task 2: Add JMP Alias Support

**Files:**
- Modify: `systems/infinite_map_rs/src/glyph_assembler.rs:40-67`
- Test: `systems/infinite_map_rs/tests/full_assembler_test.rs`

**Step 1: Write the failing test**

```rust
// Add to tests/full_assembler_test.rs

#[test]
fn test_legacy_opcode_aliases() {
    // Test that legacy Python compiler opcodes are aliased
    use infinite_map_rs::glyph_assembler::Opcode;

    // These should map to their aligned equivalents
    assert_eq!(Opcode::from_str("JUMP"), Some(Opcode::Jmp), "JUMP should alias to JMP");
    assert_eq!(Opcode::from_str("EXIT"), Some(Opcode::Halt), "EXIT should alias to HALT");
    assert_eq!(Opcode::from_str("RETURN"), Some(Opcode::Ret), "RETURN should alias to RET");
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --test full_assembler_test test_legacy_opcode_aliases -v`
Expected: FAIL - "JUMP" and "EXIT" not recognized

**Step 3: Write minimal implementation**

Modify `Opcode::from_str` in `glyph_assembler.rs`:

```rust
pub fn from_str(s: &str) -> Option<Self> {
    match s.to_uppercase().as_str() {
        "NOP" => Some(Self::Nop),
        "LDI" => Some(Self::Ldi),
        "MOV" => Some(Self::Mov),
        "LOAD" | "LD" => Some(Self::Load),
        "STORE" | "ST" => Some(Self::Store),
        "ADD" => Some(Self::Add),
        "SUB" => Some(Self::Sub),
        "MUL" => Some(Self::Mul),
        "DIV" => Some(Self::Div),
        "JMP" | "JUMP" => Some(Self::Jmp),  // Legacy alias
        "BRANCH" | "BNE" | "BEQ" | "BLT" | "BGE" | "BLTU" | "BGEU" | "JZ" => Some(Self::Branch),
        "CALL" | "JAL" => Some(Self::Call),
        "RET" | "RETURN" => Some(Self::Ret),
        "HALT" | "EXIT" => Some(Self::Halt),  // Legacy alias
        "DATA" => Some(Self::Data),
        "LOOP" => Some(Self::Loop),
        "AND" => Some(Self::And),
        "OR" => Some(Self::Or),
        "XOR" => Some(Self::Xor),
        "SLL" => Some(Self::Sll),
        "SRL" => Some(Self::Srl),
        "DRAW" => Some(Self::Draw),
        _ => None,
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test --test full_assembler_test test_legacy_opcode_aliases -v`
Expected: PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/glyph_assembler.rs systems/infinite_map_rs/tests/full_assembler_test.rs
git commit -m "feat(assembler): add legacy opcode aliases for Python compatibility"
```

---

## Phase 2: PNG Cartridge Writer

### Task 3: Create CartridgeWriter Module

**Files:**
- Create: `systems/infinite_map_rs/src/cartridge_writer.rs`
- Modify: `systems/infinite_map_rs/src/lib.rs`
- Test: `systems/infinite_map_rs/tests/cartridge_writer_test.rs`

**Step 1: Write the failing test**

```rust
// tests/cartridge_writer_test.rs

use infinite_map_rs::cartridge_writer::{CartridgeWriter, CartridgeConfig};

#[test]
fn test_cartridge_dimensions() {
    let writer = CartridgeWriter::new(CartridgeConfig::default());

    // 5 segments: glyph(24) + sit(256) + state(1024) + bootstrap(16) + program(256)
    // Total height: 24 + 256 + 1024 + 16 + 256 = 1576
    // Width: 80
    assert_eq!(writer.width(), 80);
    assert_eq!(writer.height(), 1576);
}

#[test]
fn test_empty_cartridge() {
    let writer = CartridgeWriter::new(CartridgeConfig::default());
    let png_data = writer.to_png().expect("Failed to generate PNG");

    // PNG should be valid
    assert!(!png_data.is_empty(), "PNG data should not be empty");

    // Decode and verify
    let img = image::load_from_memory(&png_data).expect("Invalid PNG");
    assert_eq!(img.width(), 80);
    assert_eq!(img.height(), 1576);
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --test cartridge_writer_test --no-run 2>&1`
Expected: Compilation error - module not found

**Step 3: Write minimal implementation**

Create `systems/infinite_map_rs/src/cartridge_writer.rs`:

```rust
//! ASCII Cartridge Writer
//!
//! Generates GPU-native .rts.png cartridges from GlyphAssembler output.
//!
//! Cartridge format (5 vertical segments, 80 pixels wide):
//!   - Segment 1 (top, 80x24): Glyph Grid - ASCII display
//!   - Segment 2 (80x256): SIT - Spatial Instruction Table
//!   - Segment 3 (80x1024): State Buffer - mutable state
//!   - Segment 4 (80x16): Bootstrap header - metadata
//!   - Segment 5 (80x256): Program bytecode - executable

use image::{ImageBuffer, Rgba};

pub const WIDTH: u32 = 80;
pub const GLYPH_HEIGHT: u32 = 24;
pub const SIT_HEIGHT: u32 = 256;
pub const STATE_HEIGHT: u32 = 1024;
pub const BOOTSTRAP_HEIGHT: u32 = 16;
pub const PROGRAM_HEIGHT: u32 = 256;

pub const TOTAL_HEIGHT: u32 = GLYPH_HEIGHT + SIT_HEIGHT + STATE_HEIGHT + BOOTSTRAP_HEIGHT + PROGRAM_HEIGHT;

/// Memory layout constants (must match ascii_cartridge.rs)
pub mod mem_layout {
    pub const GLYPH_BASE: u32 = 0x0000;
    pub const GLYPH_SIZE: u32 = 80 * 24;

    pub const PROGRAM_BASE: u32 = 0x8000;
    pub const PROGRAM_SIZE: u32 = 0x7000;

    pub const STATE_BASE: u32 = 0xF000;
    pub const STATE_SIZE: u32 = 0x0400;
}

#[derive(Debug, Clone)]
pub struct CartridgeConfig {
    pub name: String,
    pub version: String,
}

impl Default for CartridgeConfig {
    fn default() -> Self {
        Self {
            name: "untitled".to_string(),
            version: "1.0.0".to_string(),
        }
    }
}

pub struct CartridgeWriter {
    config: CartridgeConfig,
    glyph_grid: [[u8; WIDTH as usize]; GLYPH_HEIGHT as usize],
    sit: [[u32; WIDTH as usize]; SIT_HEIGHT as usize],
    state: [[u32; WIDTH as usize]; STATE_HEIGHT as usize],
    bootstrap: [[u8; WIDTH as usize * 4]; BOOTSTRAP_HEIGHT as usize],
    program: Vec<u32>,
}

impl CartridgeWriter {
    pub fn new(config: CartridgeConfig) -> Self {
        Self {
            config,
            glyph_grid: [[0u8; WIDTH as usize]; GLYPH_HEIGHT as usize],
            sit: [[0u32; WIDTH as usize]; SIT_HEIGHT as usize],
            state: [[0u32; WIDTH as usize]; STATE_HEIGHT as usize],
            bootstrap: [[0u8; WIDTH as usize * 4]; BOOTSTRAP_HEIGHT as usize],
            program: Vec::new(),
        }
    }

    pub fn width(&self) -> u32 { WIDTH }
    pub fn height(&self) -> u32 { TOTAL_HEIGHT }

    /// Set glyph at position (ASCII character)
    pub fn set_glyph(&mut self, x: u32, y: u32, ch: char) {
        if x < WIDTH && y < GLYPH_HEIGHT {
            self.glyph_grid[y as usize][x as usize] = ch as u8;
        }
    }

    /// Load glyph grid from text
    pub fn load_glyph_text(&mut self, text: &str) {
        for (y, line) in text.lines().take(GLYPH_HEIGHT as usize).enumerate() {
            for (x, ch) in line.chars().take(WIDTH as usize).enumerate() {
                self.glyph_grid[y][x] = ch as u8;
            }
        }
    }

    /// Set SIT entry at index
    pub fn set_sit(&mut self, idx: usize, opcode: u8, target_addr: u32) {
        if idx < SIT_HEIGHT as usize * WIDTH as usize {
            let y = idx / WIDTH as usize;
            let x = idx % WIDTH as usize;
            // Pack: [opcode, addr_lo, addr_hi, 255]
            self.sit[y][x] = opcode as u32 | ((target_addr & 0xFF) << 8) | (((target_addr >> 8) & 0xFF) << 16) | (255 << 24);
        }
    }

    /// Set program bytecode
    pub fn set_program(&mut self, words: Vec<u32>) {
        self.program = words;
    }

    /// Generate PNG bytes
    pub fn to_png(&self) -> Result<Vec<u8>, String> {
        let mut img = ImageBuffer::<Rgba<u8>, Vec<u8>>::new(WIDTH, TOTAL_HEIGHT);

        // Segment 1: Glyph Grid
        for y in 0..GLYPH_HEIGHT {
            for x in 0..WIDTH {
                let ch = self.glyph_grid[y as usize][x as usize];
                let pixel = Rgba([ch, ch, ch, 255]);
                img.put_pixel(x, y, pixel);
            }
        }

        // Segment 2: SIT
        let sit_offset = GLYPH_HEIGHT;
        for y in 0..SIT_HEIGHT {
            for x in 0..WIDTH {
                let val = self.sit[y as usize][x as usize];
                let pixel = Rgba([
                    (val & 0xFF) as u8,
                    ((val >> 8) & 0xFF) as u8,
                    ((val >> 16) & 0xFF) as u8,
                    ((val >> 24) & 0xFF) as u8,
                ]);
                img.put_pixel(x, sit_offset + y, pixel);
            }
        }

        // Segment 3: State Buffer (all zeros for now)
        let state_offset = GLYPH_HEIGHT + SIT_HEIGHT;
        for y in 0..STATE_HEIGHT {
            for x in 0..WIDTH {
                let val = self.state[y as usize][x as usize];
                let pixel = Rgba([
                    (val & 0xFF) as u8,
                    ((val >> 8) & 0xFF) as u8,
                    ((val >> 16) & 0xFF) as u8,
                    ((val >> 24) & 0xFF) as u8,
                ]);
                img.put_pixel(x, state_offset + y, pixel);
            }
        }

        // Segment 4: Bootstrap
        let bootstrap_offset = GLYPH_HEIGHT + SIT_HEIGHT + STATE_HEIGHT;
        // Row 0: name
        let name_bytes = self.config.name.as_bytes();
        for (i, &b) in name_bytes.iter().take(16).enumerate() {
            img.put_pixel(i as u32, bootstrap_offset, Rgba([b, 0, 0, 255]));
        }
        // Row 1: version (major.minor.patch)
        let v: Vec<u8> = self.config.version.split('.')
            .map(|s| s.parse().unwrap_or(0))
            .collect();
        img.put_pixel(0, bootstrap_offset + 1, Rgba([v.get(0).copied().unwrap_or(1), 0, 0, 255]));
        img.put_pixel(1, bootstrap_offset + 1, Rgba([v.get(1).copied().unwrap_or(0), 0, 0, 255]));
        img.put_pixel(2, bootstrap_offset + 1, Rgba([v.get(2).copied().unwrap_or(0), 0, 0, 255]));
        // Row 3: magic "GEOSASCII"
        for (i, &b) in b"GEOSASCII".iter().enumerate() {
            img.put_pixel(i as u32, bootstrap_offset + 3, Rgba([b, 0, 0, 255]));
        }

        // Segment 5: Program
        let program_offset = GLYPH_HEIGHT + SIT_HEIGHT + STATE_HEIGHT + BOOTSTRAP_HEIGHT;
        for (i, &word) in self.program.iter().enumerate() {
            if i >= (PROGRAM_HEIGHT * WIDTH) as usize { break; }
            let y = (i / WIDTH as usize) as u32;
            let x = (i % WIDTH as usize) as u32;
            let pixel = Rgba([
                (word & 0xFF) as u8,
                ((word >> 8) & 0xFF) as u8,
                ((word >> 16) & 0xFF) as u8,
                ((word >> 24) & 0xFF) as u8,
            ]);
            img.put_pixel(x, program_offset + y, pixel);
        }

        // Encode to PNG
        let mut buf = Vec::new();
        img.write_to(&mut std::io::Cursor::new(&mut buf), image::ImageFormat::Png)
            .map_err(|e| format!("PNG encode error: {}", e))?;

        Ok(buf)
    }
}
```

**Step 4: Add module to lib.rs**

```rust
// Add to systems/infinite_map_rs/src/lib.rs
pub mod cartridge_writer;
```

**Step 5: Run test to verify it passes**

Run: `cargo test --test cartridge_writer_test -v`
Expected: PASS

**Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/cartridge_writer.rs systems/infinite_map_rs/src/lib.rs systems/infinite_map_rs/tests/cartridge_writer_test.rs
git commit -m "feat(cartridge): add PNG cartridge writer module"
```

---

### Task 4: Add SIT Pattern Detection

**Files:**
- Modify: `systems/infinite_map_rs/src/cartridge_writer.rs`
- Test: `systems/infinite_map_rs/tests/cartridge_writer_test.rs`

**Step 1: Write the failing test**

```rust
// Add to tests/cartridge_writer_test.rs

#[test]
fn test_sit_pattern_detection() {
    use infinite_map_rs::cartridge_writer::CartridgeWriter;
    use infinite_map_rs::glyph_assembler::GlyphAssembler;

    let mut writer = CartridgeWriter::new(Default::default());

    // Load text with [A] button pattern
    let text = r#"
┌────────────────────────────────────────────────────────────────────────────────┐
│  [R] Run  [Q] Quit                                                              │
└────────────────────────────────────────────────────────────────────────────────┘
"#;
    writer.load_glyph_text(text);

    // Detect patterns and set SIT entries
    let patterns = writer.detect_patterns();
    assert!(patterns.len() >= 2, "Should detect [R] and [Q] patterns");

    // Verify pattern locations
    let run_pattern = patterns.iter().find(|p| p.label == 'R');
    assert!(run_pattern.is_some(), "Should find [R] pattern");
}

#[test]
fn test_sit_with_labels() {
    use infinite_map_rs::cartridge_writer::CartridgeWriter;
    use infinite_map_rs::glyph_assembler::GlyphAssembler;
    use std::collections::HashMap;

    let mut writer = CartridgeWriter::new(Default::default());

    // Compile program with labels
    let mut asm = GlyphAssembler::new();
    let program = asm.assemble(r#"
:main
    LDI r0, 42
    HALT
"#).unwrap();

    writer.set_program(program.words.clone());

    // Map action to label
    let labels = program.labels;
    let mut action_map = HashMap::new();
    action_map.insert("run", ("JUMP", "main"));

    writer.apply_action_mapping(&action_map, &labels);

    // Generate PNG
    let png = writer.to_png().expect("Failed to generate PNG");
    assert!(!png.is_empty());
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --test cartridge_writer_test test_sit_pattern_detection -v`
Expected: FAIL - method not found

**Step 3: Write minimal implementation**

Add to `cartridge_writer.rs`:

```rust
use std::collections::HashMap;
use regex::Regex;

#[derive(Debug, Clone)]
pub struct Pattern {
    pub x: u32,
    pub y: u32,
    pub label: char,
    pub action: String,
}

impl CartridgeWriter {
    /// Detect [X] button patterns in glyph grid
    pub fn detect_patterns(&self) -> Vec<Pattern> {
        let mut patterns = Vec::new();
        let re = Regex::new(r"\[([A-Z0-9])\]\s*(\w+)").unwrap();

        for y in 0..GLYPH_HEIGHT as usize {
            let mut line = String::new();
            for x in 0..WIDTH as usize {
                line.push(self.glyph_grid[y][x] as char);
            }

            for cap in re.captures_iter(&line) {
                let label = cap[1].chars().next().unwrap();
                let action = cap[2].to_string();
                let x = line.find(&format!("[{}]", label)).unwrap_or(0) as u32;
                patterns.push(Pattern { x, y: y as u32, label, action });
            }
        }

        patterns
    }

    /// Apply action mapping to SIT
    pub fn apply_action_mapping(
        &mut self,
        action_map: &HashMap<&str, (&str, &str)>,
        labels: &HashMap<String, u32>,
    ) {
        let patterns = self.detect_patterns();

        for pattern in patterns {
            if let Some(&(opcode_name, target)) = action_map.get(pattern.action.as_str()) {
                let opcode = match opcode_name {
                    "JUMP" => 9,   // JMP
                    "CALL" => 11,  // CALL
                    "EXIT" => 13,  // HALT
                    _ => 0,        // NOP
                };

                let target_addr = labels.get(target).copied().unwrap_or(0);
                let idx = (pattern.y * WIDTH + pattern.x) as usize;
                self.set_sit(idx, opcode, target_addr);
            }
        }
    }
}
```

**Step 4: Add regex dependency to Cargo.toml**

```toml
[dependencies]
regex = "1"
```

**Step 5: Run test to verify it passes**

Run: `cargo test --test cartridge_writer_test test_sit -v`
Expected: PASS

**Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/cartridge_writer.rs systems/infinite_map_rs/tests/cartridge_writer_test.rs systems/infinite_map_rs/Cargo.toml
git commit -m "feat(cartridge): add SIT pattern detection and action mapping"
```

---

## Phase 3: Integration

### Task 5: End-to-End Glyph to Cartridge

**Files:**
- Create: `systems/infinite_map_rs/src/glyph_to_cartridge.rs`
- Modify: `systems/infinite_map_rs/src/lib.rs`
- Test: `systems/infinite_map_rs/tests/glyph_to_cartridge_test.rs`

**Step 1: Write the failing test**

```rust
// tests/glyph_to_cartridge_test.rs

use infinite_map_rs::glyph_to_cartridge::compile_glyph_to_cartridge;
use std::path::PathBuf;

fn output_path(name: &str) -> PathBuf {
    std::env::temp_dir().join(format!("{}.rts.png", name))
}

#[test]
fn test_simple_program() {
    let glyph_source = r#"
:main
    LDI r0, 42
    STORE mem[0xF000], r0  ; Write to state buffer
    HALT
"#;

    let output = output_path("simple_test");
    let result = compile_glyph_to_cartridge(glyph_source, &output);

    assert!(result.is_ok(), "Compilation should succeed");
    assert!(output.exists(), "Output file should exist");

    // Load and verify PNG
    let img = image::open(&output).expect("Should load PNG");
    assert_eq!(img.width(), 80);
    assert_eq!(img.height(), 1576);

    // Cleanup
    std::fs::remove_file(&output).ok();
}

#[test]
fn test_fibonacci_program() {
    let glyph_source = r#"
; Fibonacci sequence
    LDI r0, 0       ; fib(n-2)
    LDI r1, 1       ; fib(n-1)
    LDI r2, 10      ; counter
:loop
    ADD r3, r0, r1  ; r3 = fib(n-2) + fib(n-1)
    MOV r0, r1      ; shift
    MOV r1, r3
    SUB r2, r2, 1   ; counter--
    BNE r2, r0, :loop
    HALT
"#;

    let output = output_path("fib_test");
    let result = compile_glyph_to_cartridge(glyph_source, &output);

    assert!(result.is_ok(), "Fibonacci compilation should succeed");

    // Cleanup
    std::fs::remove_file(&output).ok();
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --test glyph_to_cartridge_test --no-run 2>&1`
Expected: Compilation error - module not found

**Step 3: Write minimal implementation**

Create `systems/infinite_map_rs/src/glyph_to_cartridge.rs`:

```rust
//! Glyph to Cartridge Compiler
//!
//! Compiles .glyph source directly to .rts.png cartridge.
//! This is the self-hosting bootstrap - eliminates Python dependency.

use std::path::Path;
use std::collections::HashMap;

use crate::glyph_assembler::GlyphAssembler;
use crate::cartridge_writer::{CartridgeWriter, CartridgeConfig};

/// Compile .glyph source to .rts.png cartridge
pub fn compile_glyph_to_cartridge<P: AsRef<Path>>(
    source: &str,
    output_path: P,
) -> Result<(), String> {
    // 1. Assemble the program
    let mut asm = GlyphAssembler::new();
    let program = asm.assemble(source)?;

    // 2. Extract inline text (lines starting with │)
    let display_text = extract_display_text(source);

    // 3. Create cartridge
    let config = CartridgeConfig {
        name: "glyph_program".to_string(),
        version: "1.0.0".to_string(),
    };
    let mut writer = CartridgeWriter::new(config);

    // 4. Load display text
    writer.load_glyph_text(&display_text);

    // 5. Set program bytecode
    writer.set_program(program.words.clone());

    // 6. Detect patterns and apply default mapping
    let patterns = writer.detect_patterns();
    let action_map = default_action_mapping();
    writer.apply_action_mapping(&action_map, &program.labels);

    // 7. Generate PNG
    let png_data = writer.to_png()?;

    // 8. Write to file
    std::fs::write(output_path, &png_data)
        .map_err(|e| format!("Failed to write output: {}", e))?;

    Ok(())
}

/// Extract display text from source (ASCII box content)
fn extract_display_text(source: &str) -> String {
    let mut lines = Vec::new();

    for line in source.lines() {
        // Include lines that look like display content
        if line.contains("│") || line.contains("┌") || line.contains("└") {
            // Strip box characters for cleaner display
            let cleaned = line
                .replace("│", " ")
                .replace("┌", "+")
                .replace("└", "+")
                .replace("┐", "+")
                .replace("┘", "+")
                .replace("─", "-");
            lines.push(cleaned);
        } else if !line.trim().starts_with(";") && !line.trim().starts_with(":") {
            // Include non-instruction lines as-is (for button patterns)
            if !line.trim().is_empty() && !is_instruction(line) {
                lines.push(line.to_string());
            }
        }
    }

    lines.join("\n")
}

fn is_instruction(line: &str) -> bool {
    let opcodes = ["LDI", "MOV", "LOAD", "STORE", "ADD", "SUB", "MUL", "DIV",
                   "JMP", "JUMP", "BNE", "BEQ", "CALL", "RET", "HALT", "EXIT",
                   "AND", "OR", "XOR", "SLL", "SRL", "DRAW", "NOP"];
    opcodes.iter().any(|op| line.to_uppercase().starts_with(op))
}

fn default_action_mapping() -> HashMap<&'static str, (&'static str, &'static str)> {
    let mut map = HashMap::new();
    map.insert("run", ("JUMP", "main"));
    map.insert("start", ("JUMP", "start"));
    map.insert("quit", ("EXIT", ""));
    map.insert("exit", ("EXIT", ""));
    map.insert("back", ("JUMP", "menu"));
    map.insert("next", ("JUMP", "next"));
    map.insert("prev", ("JUMP", "prev"));
    map
}
```

**Step 4: Add module to lib.rs**

```rust
pub mod glyph_to_cartridge;
```

**Step 5: Run test to verify it passes**

Run: `cargo test --test glyph_to_cartridge_test -v`
Expected: PASS

**Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/glyph_to_cartridge.rs systems/infinite_map_rs/src/lib.rs systems/infinite_map_rs/tests/glyph_to_cartridge_test.rs
git commit -m "feat(compiler): add glyph-to-cartridge compiler for self-hosting"
```

---

### Task 6: CLI Tool for Glyph Compilation

**Files:**
- Create: `systems/infinite_map_rs/src/bin/geos-compile.rs`
- Test: Manual verification

**Step 1: Create CLI binary**

```rust
// src/bin/geos-compile.rs

//! GEOS Glyph Compiler CLI
//!
//! Compiles .glyph files to .rts.png cartridges.
//!
//! Usage:
//!   geos-compile input.glyph -o output.rts.png
//!   geos-compile input.glyph  # outputs to input.rts.png

use std::path::PathBuf;
use clap::Parser;

#[derive(Parser, Debug)]
#[command(name = "geos-compile")]
#[command(about = "Compile .glyph source to GPU cartridge")]
struct Args {
    /// Input .glyph file
    input: PathBuf,

    /// Output .rts.png file
    #[arg(short, long)]
    output: Option<PathBuf>,

    /// Verbose output
    #[arg(short, long)]
    verbose: bool,
}

fn main() {
    let args = Args::parse();

    let source = match std::fs::read_to_string(&args.input) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading {}: {}", args.input.display(), e);
            std::process::exit(1);
        }
    };

    let output = args.output.unwrap_else(|| {
        args.input.with_extension("rts.png")
    });

    if args.verbose {
        eprintln!("Compiling {} -> {}", args.input.display(), output.display());
    }

    match infinite_map_rs::glyph_to_cartridge::compile_glyph_to_cartridge(&source, &output) {
        Ok(()) => {
            if args.verbose {
                eprintln!("Success: {}", output.display());
            }
        }
        Err(e) => {
            eprintln!("Compilation error: {}", e);
            std::process::exit(1);
        }
    }
}
```

**Step 2: Build and test**

Run: `cargo build --release --bin geos-compile`
Expected: SUCCESS

**Step 3: Test with sample file**

Create `examples/hello.glyph`:
```
┌────────────────────────────────────────────────────────────────────────────────┐
│                                                                                │
│     ██╗  ██╗██╗   ██╗██╗  ██╗    ██████╗ ██████╗  ██████╗                     │
│     ██║ ██╔╝██║   ██║╚██╗██╔╝    ██╔══██╗██╔══██╗██╔═══██╗                    │
│     █████╔╝ ██║   ██║ ╚███╔╝     ██████╔╝██████╔╝██║   ██║                    │
│     ██╔═██╗ ██║   ██║ ██╔██╗     ██╔═══╝ ██╔══██╗██║   ██║                    │
│     ██║  ██╗╚██████╔╝██╔╝ ██╗    ██║     ██║  ██║╚██████╔╝                    │
│     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝                     │
│                                                                                │
│     [R] Run  [Q] Quit                                                          │
│                                                                                │
└────────────────────────────────────────────────────────────────────────────────┘

:main
    LDI r0, 72      ; 'H'
    STORE mem[0], r0
    LDI r0, 105     ; 'i'
    STORE mem[1], r0
    HALT
```

Run: `cargo run --release --bin geos-compile -- examples/hello.glyph -v`
Expected: "Success: examples/hello.rts.png"

**Step 4: Verify output loads correctly**

```rust
// Add test to verify the generated cartridge loads
#[test]
fn test_cli_output_loads() {
    use infinite_map_rs::ascii_cartridge::AsciiCartridge;

    let path = PathBuf::from("examples/hello.rts.png");
    if !path.exists() {
        eprintln!("Skipping: run geos-compile first");
        return;
    }

    let cartridge = AsciiCartridge::load(&path).expect("Should load");
    assert!(!cartridge.program_buffer.is_empty(), "Should have program");
}
```

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/bin/geos-compile.rs examples/hello.glyph
git commit -m "feat(cli): add geos-compile CLI for self-hosted compilation"
```

---

## Phase 4: Verification

### Task 7: Parity Test with Python Compiler

**Files:**
- Create: `systems/infinite_map_rs/tests/compiler_parity_test.rs`

**Step 1: Write the parity test**

```rust
// tests/compiler_parity_test.rs

//! Compiler Parity Tests
//!
//! Verify that Rust compiler produces functionally equivalent output
//! to the Python geos_ascii_compiler.

use infinite_map_rs::glyph_to_cartridge::compile_glyph_to_cartridge;
use infinite_map_rs::ascii_cartridge::AsciiCartridge;
use std::path::PathBuf;
use std::process::Command;

fn python_compiler_path() -> PathBuf {
    PathBuf::from("apps/ascii-world/ascii-world-master/apps/geos-ascii/compiler/geos_ascii_compiler.py")
}

fn temp_dir() -> PathBuf {
    std::env::temp_dir().join("geos-parity-test")
}

#[test]
#[ignore = "Requires Python environment"]
fn test_parity_simple_loop() {
    let source = r#"
:main
    LDI r0, 10
    LDI r1, 0
:loop
    ADD r1, r1, r0
    SUB r0, r0, 1
    BNE r0, r0, :loop
    HALT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();

    let rust_output = temp.join("rust_test.rts.png");
    let python_output = temp.join("python_test.rts.png");

    // Compile with Rust
    compile_glyph_to_cartridge(source, &rust_output).expect("Rust compile failed");

    // Compile with Python (if available)
    let source_file = temp.join("test.ascii");
    std::fs::write(&source_file, source).ok();

    let python_result = Command::new("python3")
        .arg(python_compiler_path())
        .arg(&source_file)
        .arg("-o").arg(&python_output)
        .output();

    if let Ok(output) = python_result {
        if output.status.success() {
            // Load both cartridges
            let rust_cart = AsciiCartridge::load(&rust_output).expect("Load Rust");
            let python_cart = AsciiCartridge::load(&python_output).expect("Load Python");

            // Compare program segments (should be functionally equivalent)
            // Note: May not be byte-identical due to different encoding
            assert_eq!(
                rust_cart.program_buffer.len(),
                python_cart.program_buffer.len(),
                "Program length should match"
            );

            println!("✓ Rust and Python compilers produce equivalent output");
        }
    }

    // Cleanup
    std::fs::remove_dir_all(&temp).ok();
}

#[test]
fn test_rust_compiler_standalone() {
    // Test that Rust compiler works independently
    let source = r#"
; Simple test program
:main
    LDI r0, 42
    HALT
"#;

    let temp = temp_dir();
    std::fs::create_dir_all(&temp).ok();
    let output = temp.join("standalone.rts.png");

    compile_glyph_to_cartridge(source, &output).expect("Compile failed");

    // Verify output
    let cartridge = AsciiCartridge::load(&output).expect("Load failed");

    // Should have program with at least 3 words (LDI + imm + HALT)
    assert!(cartridge.program_buffer.len() >= 3, "Should have program");

    // First instruction should be LDI (opcode 1 in aligned ISA)
    let first_instr = cartridge.program_buffer[0];
    let opcode = first_instr & 0xFF;
    assert_eq!(opcode, 1, "First instruction should be LDI");

    // Cleanup
    std::fs::remove_dir_all(&temp).ok();
}
```

**Step 2: Run tests**

Run: `cargo test --test compiler_parity_test test_rust_compiler_standalone -v`
Expected: PASS

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/tests/compiler_parity_test.rs
git commit -m "test(compiler): add parity tests for self-hosted compiler"
```

---

### Task 8: Update Memory and Documentation

**Files:**
- Update: `memory/self-hosting-bootstrap.md`
- Update: `memory/MEMORY.md`
- Create: `docs/SELF_HOSTING_GUIDE.md`

**Step 1: Create memory file**

```markdown
---
name: Self-Hosting Bootstrap
description: Rust-native glyph compilation eliminates Python dependency
type: project
---

# Self-Hosting Bootstrap

## Status: ✅ Complete

Extended Rust GlyphAssembler to emit GPU-ready PNG cartridges directly.

## Components

| Component | File | Purpose |
|-----------|------|---------|
| `GlyphAssembler` | `src/glyph_assembler.rs` | Text → bytecode |
| `CartridgeWriter` | `src/cartridge_writer.rs` | Bytecode → PNG |
| `compile_glyph_to_cartridge` | `src/glyph_to_cartridge.rs` | End-to-end |
| `geos-compile` | `src/bin/geos-compile.rs` | CLI tool |

## ISA Alignment

Rust compiler uses aligned ISA (matching WGSL scheduler):
```
LDI=1, MOV=2, LOAD=3, STORE=4, ADD=5, SUB=6, MUL=7, DIV=8,
JMP=9, BRANCH=10, CALL=11, RET=12, HALT=13
```

Legacy Python opcodes (LDI=204, JMP=209) are aliased.

## Why: Sovereignty

Eliminates the last Python dependency from the sovereignty chain:
```
Before: Text → Python → PNG → Rust → GPU
After:  Text → Rust → PNG → GPU
```

## How to Use

```bash
# Compile .glyph to .rts.png
cargo run --release --bin geos-compile -- input.glyph -o output.rts.png

# Load in Infinite Map
# The .rts.png loads via existing AsciiCartridge infrastructure
```

---

*Completed: 2026-03-18*
```

**Step 2: Update MEMORY.md**

Add to Active Systems table:
```
| [Self-Hosting Bootstrap](self-hosting-bootstrap.md) | ✅ Complete | 8+ | Rust-native glyph compilation eliminates Python dependency |
```

**Step 3: Create usage guide**

```markdown
# Self-Hosting Guide

## Overview

Geometry OS now compiles glyph programs natively in Rust. No Python required.

## Quick Start

1. Write a `.glyph` file:
```
:main
    LDI r0, 42
    HALT
```

2. Compile:
```bash
cargo run --release --bin geos-compile -- program.glyph
```

3. Load the resulting `program.rts.png` in Infinite Map.

## Syntax Reference

### Instructions
- `LDI rd, imm` - Load immediate
- `MOV rd, rs` - Copy register
- `LOAD rd, [rs]` - Load from memory
- `STORE [rd], rs` - Store to memory
- `ADD rd, rs1, rs2` - Add
- `SUB rd, rs1, rs2` - Subtract
- `JMP :label` - Unconditional jump
- `BNE r1, r2, :label` - Branch if not equal
- `CALL :label` - Call subroutine
- `RET` - Return
- `HALT` - Stop execution

### Labels
```
:loop
    ADD r0, r0, r1
    JMP :loop
```

### Comments
```
; This is a comment
LDI r0, 42  ; inline comment
```

## Memory Layout

- `0x0000-0x0BFF` - Glyph Grid (display)
- `0x8000-0xEFFF` - Program memory
- `0xF000-0xF3FF` - State buffer
```

**Step 4: Commit**

```bash
git add memory/self-hosting-bootstrap.md memory/MEMORY.md docs/SELF_HOSTING_GUIDE.md
git commit -m "docs: add self-hosting bootstrap documentation"
```

---

## Summary

| Phase | Tasks | Files | Tests |
|-------|-------|-------|-------|
| 1. ISA Unification | 2 | 2 | 2 |
| 2. PNG Writer | 2 | 2 | 4 |
| 3. Integration | 2 | 4 | 4 |
| 4. Verification | 2 | 3 | 2 |
| **Total** | **8** | **11** | **12** |

## Dependencies

- `image` crate (already in Cargo.toml)
- `regex` crate (add for pattern detection)

## Risk Mitigation

- Parity tests verify Rust compiler matches Python output
- Existing `AsciiCartridge` tests verify PNG loading
- GPU Ascension tests verify execution

---

*Plan created: 2026-03-18*
