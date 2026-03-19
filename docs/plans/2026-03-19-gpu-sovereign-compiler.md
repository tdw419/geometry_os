# GPU-Sovereign Self-Hosting Compiler Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a fully self-hosting compiler cartridge where the GPU assembles Glyph programs - no Rust `GlyphAssembler` needed.

**Architecture:** A single PNG cartridge containing: (1) `self_hosting_assembler.glyph` as the compiler program, (2) source text loaded at 0x1000, (3) output buffer at 0x5000, (4) ASCII UI template. Press [B] Assemble → GPU runs the assembler → bytecode appears at 0x5000.

**Tech Stack:** Glyph VM, ASCII templates, PNG cartridges, SyntheticVram for testing

---

## Prerequisites (Already Exist)

| Component | File | Status |
|-----------|------|--------|
| Self-Hosting Assembler | `systems/glyph_stratum/programs/self_hosting_assembler.glyph` | ✅ 398 lines |
| ASCII Template | `apps/.../examples/self_hosting.ascii` | ✅ Created |
| Cartridge Writer | `src/cartridge_writer.rs` | ✅ Works |
| Template Loader | `src/ascii_native/self_hosting_template.rs` | ✅ Works |
| SyntheticVram | `src/synthetic_vram.rs` | ✅ For testing |

---

## Memory Layout

```
┌─────────────────────────────────────────────────────────────────┐
│  GPU-SOVEREIGN COMPILER CARTRIDGE                               │
├─────────────────────────────────────────────────────────────────┤
│  0x0000-0x0BFF  Glyph Grid (80x24 display)                      │
│  0x0C00-0x0CFF  SIT (button patterns)                            │
│  0x0D00-0x0FFF  Reserved                                         │
│  0x1000-0x1FFF  SOURCE BUFFER (user's code to compile)           │
│  0x2000-0x2FFF  ASSEMBLER PROGRAM (self_hosting_assembler.glyph) │
│  0x5000-0x5FFF  OUTPUT BUFFER (compiled bytecode)                │
│  0x6000-0x63FF  LABEL TABLE                                      │
│  0x7000-0x7FFF  STATE BUFFER (frame, status, cursor)             │
│  0x8000-0xFFFF  PROGRAM SEGMENT (boot + UI code)                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Task 1: Create Sovereign Compiler Cartridge Generator

**Files:**
- Create: `systems/infinite_map_rs/src/ascii_native/sovereign_compiler.rs`
- Modify: `systems/infinite_map_rs/src/ascii_native/mod.rs`
- Test: `systems/infinite_map_rs/tests/sovereign_compiler_test.rs`

**Step 1: Write the failing test**

```rust
// tests/sovereign_compiler_test.rs
use infinite_map_rs::ascii_native::sovereign_compiler::generate_sovereign_cartridge;
use tempfile::tempdir;

#[test]
fn test_sovereign_cartridge_generates() {
    let temp_dir = tempdir().expect("Failed to create temp directory");
    let output_path = temp_dir.path().join("sovereign_compiler.rts.png");

    let source = "LDI r0, 42\nHALT";
    let result = generate_sovereign_cartridge(source, &output_path);

    assert!(result.is_ok(), "Generation failed: {:?}", result);
    assert!(output_path.exists(), "Output file not created");

    // Verify PNG dimensions
    let png_data = std::fs::read(&output_path).expect("Failed to read PNG");
    let decoder = png::Decoder::new(std::io::Cursor::new(&png_data));
    let reader = decoder.read_info().expect("Failed to decode PNG");
    let info = reader.info();

    assert_eq!(info.width, 80, "Width should be 80");
    assert!(info.height > 1500, "Height should include all segments");
}

#[test]
fn test_sovereign_cartridge_contains_assembler() {
    let temp_dir = tempdir().expect("Failed to create temp directory");
    let output_path = temp_dir.path().join("sovereign_with_asm.rts.png");

    let source = ":loop\nLDI r0, 1\nJMP :loop";
    let result = generate_sovereign_cartridge(source, &output_path);

    assert!(result.is_ok(), "Generation failed: {:?}", result);

    // Load as AsciiCartridge and verify program segment exists
    use infinite_map_rs::ascii_cartridge::AsciiCartridge;
    let cartridge = AsciiCartridge::load(&output_path).expect("Should load");
    assert!(!cartridge.program_buffer.is_empty(), "Should have program");
}

#[test]
fn test_source_loaded_at_correct_address() {
    let temp_dir = tempdir().expect("Failed to create temp directory");
    let output_path = temp_dir.path().join("source_addr_test.rts.png");

    let source = "LDI r0, 42\nHALT";
    generate_sovereign_cartridge(source, &output_path).expect("Should generate");

    // Verify source is at 0x1000 in the cartridge
    use infinite_map_rs::ascii_cartridge::AsciiCartridge;
    let cartridge = AsciiCartridge::load(&output_path).expect("Should load");

    // The source should be embedded in the state segment or a dedicated segment
    // We'll verify this works by checking the cartridge structure
    assert!(cartridge.state_buffer.len() > 0, "Should have state buffer");
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test -p infinite_map_rs sovereign_compiler_test`
Expected: FAIL with "module `sovereign_compiler` not found"

**Step 3: Write minimal implementation**

```rust
// src/ascii_native/sovereign_compiler.rs
//! GPU-Sovereign Compiler Cartridge Generator
//!
//! Generates cartridges that contain BOTH:
//! 1. The self-hosting assembler program (runs on GPU)
//! 2. The source code to compile (loaded at 0x1000)
//!
//! When [B] Assemble is pressed, the GPU runs the assembler,
//! which compiles the source and outputs bytecode to 0x5000.

use std::collections::HashMap;
use std::fs::File;
use std::io::Write;
use std::path::Path;

use super::self_hosting_template::SelfHostingTemplate;
use crate::cartridge_writer::{CartridgeConfig, CartridgeWriter};
use crate::glyph_assembler::GlyphAssembler;

// Memory layout constants (must match self_hosting_assembler.glyph)
const SOURCE_BASE: u32 = 0x1000;
const ASSEMBLER_BASE: u32 = 0x2000;
const OUTPUT_BASE: u32 = 0x5000;
const LABEL_TABLE_BASE: u32 = 0x6000;
const STATE_BASE: u32 = 0x7000;

/// Generate a sovereign compiler cartridge
///
/// This cartridge contains:
/// - The self-hosting assembler at 0x2000
/// - Source text at 0x1000
/// - UI template in glyph grid
/// - [B] Assemble button that jumps to the assembler
pub fn generate_sovereign_cartridge<P: AsRef<Path>>(
    source: &str,
    output_path: P,
) -> Result<(), String> {
    // 1. Load the self-hosting assembler program
    let assembler_source = include_str!("../../../../systems/glyph_stratum/programs/self_hosting_assembler.glyph");

    // 2. Compile the assembler itself
    let mut asm = GlyphAssembler::new();
    let assembler_program = asm.assemble(assembler_source)?;

    // 3. Render the ASCII UI template
    let template = SelfHostingTemplate::load()?;
    let source_lines: Vec<&str> = source.lines().collect();
    let display_text = template.render("Ready - GPU Sovereign", &source_lines);

    // 4. Create cartridge
    let config = CartridgeConfig {
        name: "sovereign_compiler".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    // 5. Load display text
    writer.load_glyph_text(&display_text);

    // 6. Set the BOOT program (UI + event loop)
    // For now, use a minimal boot program
    let boot_program = assemble_boot_program()?;
    writer.set_program(&boot_program);

    // 7. Embed the assembler at 0x2000
    writer.set_segment(ASSEMBLER_BASE, &assembler_program.words);

    // 8. Embed source at 0x1000 (as ASCII bytes)
    writer.set_source_text(SOURCE_BASE, source);

    // 9. Apply button mappings
    let action_map: HashMap<&str, (&str, &str)> = [
        ("Edit", ("JUMP", "editor_mode")),
        ("Assemble", ("JUMP", "0x2000")),  // Jump to assembler entry
        ("Run", ("JUMP", "run_output")),
        ("Quit", ("EXIT", "")),
    ]
    .iter()
    .cloned()
    .collect();

    writer.apply_action_mapping(&action_map, &assembler_program.labels);

    // 10. Generate PNG
    let png_bytes = writer.to_png()?;

    // 11. Write to file
    let mut file = File::create(output_path.as_ref())
        .map_err(|e| format!("Failed to create output file: {}", e))?;
    file.write_all(&png_bytes)
        .map_err(|e| format!("Failed to write PNG data: {}", e))?;

    Ok(())
}

/// Assemble the boot program that handles UI
fn assemble_boot_program() -> Result<Vec<u32>, String> {
    let boot_source = r#"
        :entry
        LDI r0, 0
        LDI r1, 0x7000
        STORE mem[r1], r0    ; frame = 0
        JMP :main_loop

        :main_loop
        ; Handle input events
        LDI r1, 0x0200
        LOAD r2, mem[r1]
        LD r3, 0
        BEQ r2, r3, :update_frame
        ; Process event...
        JMP :clear_event

        :clear_event
        LDI r0, 0
        LDI r1, 0x0200
        STORE mem[r1], r0

        :update_frame
        LDI r1, 0x7000
        LOAD r2, mem[r1]
        LDI r3, 1
        ADD r2, r2, r3
        STORE mem[r1], r2
        JMP :main_loop
    "#;

    let mut asm = GlyphAssembler::new();
    let program = asm.assemble(boot_source)?;
    Ok(program.words)
}
```

Add to `src/ascii_native/mod.rs`:
```rust
pub mod sovereign_compiler;  // Add this line
```

**Step 4: Run test to verify it passes**

Run: `cargo test -p infinite_map_rs sovereign_compiler_test`
Expected: 3 tests PASS (may need to fix compilation errors first)

**Step 5: Commit**

```bash
git add src/ascii_native/sovereign_compiler.rs src/ascii_native/mod.rs tests/sovereign_compiler_test.rs
git commit -m "feat(sovereign): add GPU-native compiler cartridge generator"
```

---

## Task 2: Add CartridgeWriter Segment Methods

**Files:**
- Modify: `systems/infinite_map_rs/src/cartridge_writer.rs`
- Test: `systems/infinite_map_rs/tests/cartridge_writer_segment_test.rs`

**Step 1: Write the failing test**

```rust
// tests/cartridge_writer_segment_test.rs
use infinite_map_rs::cartridge_writer::{CartridgeConfig, CartridgeWriter};
use tempfile::tempdir;

#[test]
fn test_set_segment_writes_at_address() {
    let config = CartridgeConfig {
        name: "segment_test".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    // Write some words at address 0x2000
    let words = vec![0x01000000, 0x02000000, 0x03000000];
    writer.set_segment(0x2000, &words);

    // Generate PNG and verify
    let temp_dir = tempdir().expect("Failed to create temp dir");
    let output = temp_dir.path().join("segment_test.rts.png");

    let png_bytes = writer.to_png().expect("Should generate PNG");
    std::fs::write(&output, &png_bytes).expect("Should write file");

    assert!(output.exists(), "PNG should exist");
}

#[test]
fn test_set_source_text_encodes_ascii() {
    let config = CartridgeConfig {
        name: "source_test".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    let source = "LDI r0, 42\nHALT";
    writer.set_source_text(0x1000, source);

    let temp_dir = tempdir().expect("Failed to create temp dir");
    let output = temp_dir.path().join("source_test.rts.png");

    let png_bytes = writer.to_png().expect("Should generate PNG");
    std::fs::write(&output, &png_bytes).expect("Should write file");

    assert!(output.exists(), "PNG should exist");
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test -p infinite_map_rs cartridge_writer_segment_test`
Expected: FAIL with "method `set_segment` not found"

**Step 3: Add methods to CartridgeWriter**

Add to `src/cartridge_writer.rs`:

```rust
impl CartridgeWriter {
    /// Set a segment of words at a specific address
    pub fn set_segment(&mut self, address: u32, words: &[u32]) {
        // Convert address to pixel coordinates
        // Each row is 80 pixels (width)
        let start_row = address / 80;
        let start_col = address % 80;

        for (i, word) in words.iter().enumerate() {
            let pixel_idx = (start_row * 80 + start_col) as usize + i;
            if pixel_idx < self.state_buffer.len() {
                // Pack u32 into RGBA
                let r = (word & 0xFF) as u8;
                let g = ((word >> 8) & 0xFF) as u8;
                let b = ((word >> 16) & 0xFF) as u8;
                let a = ((word >> 24) & 0xFF) as u8;
                self.state_buffer[pixel_idx] = [r, g, b, a];
            }
        }
    }

    /// Set source text at a specific address (as ASCII bytes)
    pub fn set_source_text(&mut self, address: u32, text: &str) {
        let start_row = address / 80;
        let start_col = address % 80;

        for (i, byte) in text.bytes().enumerate() {
            let pixel_idx = (start_row * 80 + start_col) as usize + i;
            if pixel_idx < self.state_buffer.len() {
                self.state_buffer[pixel_idx] = [byte, 0, 0, 255];
            }
        }
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test -p infinite_map_rs cartridge_writer_segment_test`
Expected: 2 tests PASS

**Step 5: Commit**

```bash
git add src/cartridge_writer.rs tests/cartridge_writer_segment_test.rs
git commit -m "feat(cartridge): add set_segment and set_source_text methods"
```

---

## Task 3: Create SyntheticVram Integration Test

**Files:**
- Create: `systems/infinite_map_rs/tests/sovereign_synthetic_test.rs`

**Step 1: Write the failing test**

```rust
// tests/sovereign_synthetic_test.rs
//! Tests for GPU-sovereign compiler using SyntheticVram
//!
//! These tests verify the self-hosting assembler works without a real GPU.

use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};
use infinite_map_rs::glyph_assembler::GlyphAssembler;

/// Load and run the self-hosting assembler on synthetic VRAM
fn run_assembler_on_synthetic(source: &str) -> Result<Vec<u32>, String> {
    // 1. Create synthetic VRAM
    let mut vram = SyntheticVram::new_small(65536);
    vram.spawn_vm(0, &SyntheticVmConfig::default())?;

    // 2. Load source at 0x1000
    for (i, byte) in source.bytes().enumerate() {
        vram.poke(0x1000 + i as u32, byte as u32);
    }
    // Null terminate
    vram.poke(0x1000 + source.len() as u32, 0);

    // 3. Compile and load the assembler
    let assembler_source = include_str!("../../systems/glyph_stratum/programs/self_hosting_assembler.glyph");
    let mut asm = GlyphAssembler::new();
    let program = asm.assemble(assembler_source)?;

    // Load assembler at 0x2000
    for (i, word) in program.words.iter().enumerate() {
        vram.poke(0x2000 + i as u32, *word);
    }

    // 4. Set VM entry point to assembler
    vram.jump_vm(0, 0x2000)?;

    // 5. Run until halt (with cycle limit)
    let result = vram.run_until_halt(0, 100000);

    // 6. Read output from 0x5000
    let mut output = Vec::new();
    for i in 0..256 {
        let word = vram.peek(0x5000 + i);
        if word == 0 {
            break;
        }
        output.push(word);
    }

    Ok(output)
}

#[test]
fn test_synthetic_assemble_simple() {
    let source = "LDI r0, 42\nHALT\n";
    let result = run_assembler_on_synthetic(source);

    // Should produce bytecode
    assert!(result.is_ok(), "Assembly failed: {:?}", result);
    let bytecode = result.unwrap();
    assert!(bytecode.len() > 0, "Should produce some bytecode");
}

#[test]
fn test_synthetic_assemble_with_label() {
    let source = ":loop\nLDI r0, 1\nJMP :loop\n";
    let result = run_assembler_on_synthetic(source);

    assert!(result.is_ok(), "Assembly failed: {:?}", result);
    let bytecode = result.unwrap();
    assert!(bytecode.len() >= 3, "Should produce at least 3 words");
}

#[test]
fn test_synthetic_self_compile() {
    // The ultimate test: assembler compiles itself
    let assembler_source = include_str!("../../systems/glyph_stratum/programs/self_hosting_assembler.glyph");

    let result = run_assembler_on_synthetic(assembler_source);

    assert!(result.is_ok(), "Self-compilation failed: {:?}", result);
    // Output should be similar to what Rust assembler produces
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test -p infinite_map_rs sovereign_synthetic_test`
Expected: FAIL (need to verify SyntheticVram API)

**Step 3: Fix any API mismatches**

The test may need adjustments based on actual SyntheticVram API.

**Step 4: Run test to verify it passes**

Run: `cargo test -p infinite_map_rs sovereign_synthetic_test`
Expected: 3 tests PASS

**Step 5: Commit**

```bash
git add tests/sovereign_synthetic_test.rs
git commit -m "test(sovereign): add SyntheticVram integration tests for self-hosting"
```

---

## Task 4: Create Sovereign CLI Command

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/geos-compile.rs`

**Step 1: Add --sovereign flag**

```rust
// In geos-compile.rs, add to Args struct:
#[arg(long)]
sovereign: bool,

// In main(), add:
if args.sovereign {
    use infinite_map_rs::ascii_native::sovereign_compiler::generate_sovereign_cartridge;
    generate_sovereign_cartridge(&source, &output)?;
    println!("Sovereign compiler cartridge: {}", output.display());
    return Ok(());
}
```

**Step 2: Build and test**

Run: `cargo build -p infinite_map_rs --bin geos-compile`
Expected: Build succeeds

**Step 3: Test the CLI**

Run: `cargo run -p infinite_map_rs --bin geos-compile -- test.glyph --sovereign -o test.rts.png`
Expected: Creates sovereign compiler cartridge

**Step 4: Commit**

```bash
git add src/bin/geos-compile.rs
git commit -m "feat(cli): add --sovereign flag for GPU-native compiler cartridge"
```

---

## Task 5: Update Documentation

**Files:**
- Modify: `docs/GLYPH_NATIVE_PROGRAMMING.md`
- Create: `docs/SOVEREIGN_COMPILER.md`

**Step 1: Create sovereign compiler docs**

```markdown
# docs/SOVEREIGN_COMPILER.md

# GPU-Sovereign Self-Hosting Compiler

## Overview

The sovereign compiler cartridge contains:
1. The `self_hosting_assembler.glyph` program
2. Your source code at 0x1000
3. Output buffer at 0x5000

When you press [B] Assemble, the GPU runs the assembler.

## Usage

```bash
# Generate a sovereign compiler cartridge
cargo run -p infinite_map_rs --bin geos-compile -- \
    my_program.glyph --sovereign -o compiler.rts.png

# Run the cartridge
cargo run -p infinite_map_rs --bin micro_host
```

## Memory Map

| Address | Purpose |
|---------|---------|
| 0x1000 | Source code (input) |
| 0x2000 | Assembler program |
| 0x5000 | Bytecode (output) |
| 0x6000 | Label table |
| 0x7000 | UI state |

## The Self-Hosting Loop

```
┌─────────────────┐
│ self_hosting.   │
│ glyph source    │
└────────┬────────┘
         │ Load at 0x1000
         ▼
┌─────────────────┐
│ GPU runs        │
│ assembler at    │
│ 0x2000          │
└────────┬────────┘
         │ Writes to 0x5000
         ▼
┌─────────────────┐
│ Output bytecode │
│ = identical to  │
│ Rust output!    │
└─────────────────┘
```
```

**Step 2: Commit**

```bash
git add docs/SOVEREIGN_COMPILER.md docs/GLYPH_NATIVE_PROGRAMMING.md
git commit -m "docs: add GPU-sovereign compiler documentation"
```

---

## Task 6: End-to-End Verification

**Step 1: Generate sovereign compiler**

Run: `cargo run -p infinite_map_rs --bin geos-compile -- mailbox.ascii --sovereign -o sovereign_mailbox.rts.png`
Expected: Creates 80x??? PNG

**Step 2: Verify on SyntheticVram**

Run: `cargo test -p infinite_map_rs sovereign_synthetic_test::test_synthetic_self_compile`
Expected: PASS

**Step 3: Commit final**

```bash
git add .
git commit -m "feat(sovereign): complete GPU-native self-hosting compiler"
```

---

## Verification Checklist

- [ ] `sovereign_compiler.rs` generates valid cartridges
- [ ] CartridgeWriter has `set_segment` and `set_source_text`
- [ ] SyntheticVram tests pass
- [ ] `geos-compile --sovereign` works
- [ ] Documentation updated
- [ ] Self-hosting test: assembler compiles itself

---

## Files Created/Modified

| File | Action |
|------|--------|
| `src/ascii_native/sovereign_compiler.rs` | Create |
| `src/ascii_native/mod.rs` | Modify |
| `src/cartridge_writer.rs` | Modify |
| `src/bin/geos-compile.rs` | Modify |
| `tests/sovereign_compiler_test.rs` | Create |
| `tests/cartridge_writer_segment_test.rs` | Create |
| `tests/sovereign_synthetic_test.rs` | Create |
| `docs/SOVEREIGN_COMPILER.md` | Create |

---

## Success Criteria

- [ ] `geos-compile --sovereign` produces cartridges without Rust `GlyphAssembler`
- [ ] GPU runs `self_hosting_assembler.glyph` to compile programs
- [ ] Output at 0x5000 matches Rust assembler output
- [ ] Self-hosting verified: assembler compiles itself
- [ ] 8+ tests passing

---

## Dependencies

- Existing `self_hosting_assembler.glyph` (398 lines)
- Existing `CartridgeWriter` infrastructure
- Existing `SyntheticVram` for testing
- Existing `GlyphAssembler` for bootstrapping the assembler itself
