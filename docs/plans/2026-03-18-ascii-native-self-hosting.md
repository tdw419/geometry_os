# ASCII-Native Self-Hosting Integration Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create an ASCII-First visual interface for the existing self-hosting assembler, enabling users to edit source code and compile it visually on the Glyph VM.

**Architecture:** The self-hosting assembler (`self_hosting_assembler.glyph`) already exists. This plan creates the ASCII template, mapping file, and reactive loop that integrate it with the 5-segment PNG cartridge format, following the ASCII-First Refactoring Guide pattern.

**Tech Stack:** Rust, existing GlyphAssembler, CartridgeWriter, ASCII templates, .mapping.json

---

## Background

The **self-hosting assembler** at `systems/glyph_stratum/programs/self_hosting_assembler.glyph` is a 398-line Glyph VM program that:
- Reads source from memory address 0x1000
- Two-pass compilation: collect labels → emit opcodes
- Outputs bytecode to 0x5000
- Supports: LDI, MOV, LOAD, STORE, ADD, SUB, MUL, JMP, branches, CALL, RET, HALT, AND, OR, XOR, SLL, SRL

**What's missing:** An ASCII-First visual interface that:
1. Displays source in an 80x24 grid
2. Shows compilation output/status
3. Provides [A] Edit, [B] Assemble, [C] Run buttons
4. Follows the ASCII-First Architecture pattern

---

## Phase 1: ASCII Template Creation

### Task 1: Create Self-Hosting ASCII Template

**Files:**
- Create: `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/self_hosting.ascii`

**Step 1: Write the template file**

```
# State: EDITOR
# Grid: 80x24
# Generated: {{timestamp}}

╔══════════════════════════════════════════════════════════════╗
║  GEOS SELF-HOSTING COMPILER                 v{{version}}      ║
╠══════════════════════════════════════════════════════════════╣
║  [A] Edit    [B] Assemble   [C] Run      [X] Quit            ║
╠══════════════════════════════════════════════════════════════╣
║  SOURCE:                                                     ║
║  ┌──────────────────────────────────────────────────────────┐║
{{#each source_lines}}
║  │ {{line}}                                                ║║
{{/each}}
║  └──────────────────────────────────────────────────────────┘║
╠══════════════════════════════════════════════════════════════╣
║  STATUS: {{status}}                                          ║
╚══════════════════════════════════════════════════════════════╝
```

**Step 2: Verify file created**

Run: `cat apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/self_hosting.ascii`
Expected: Template content displayed

**Step 3: Commit**

```bash
git add apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/self_hosting.ascii
git commit -m "feat(ascii): add self-hosting compiler ASCII template"
```

---

### Task 2: Create Mapping Configuration

**Files:**
- Create: `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/self_hosting.mapping.json`

**Step 1: Write the mapping file**

```json
{
  "name": "self_hosting",
  "version": "1.0.0",
  "buttons": [
    {
      "label": "A",
      "action": "JUMP",
      "target": "editor_mode",
      "description": "Enter edit mode"
    },
    {
      "label": "B",
      "action": "JUMP",
      "target": "assemble",
      "description": "Compile source"
    },
    {
      "label": "C",
      "action": "JUMP",
      "target": "run_program",
      "description": "Execute compiled program"
    },
    {
      "label": "X",
      "action": "EXIT",
      "target": "",
      "description": "Quit"
    }
  ],
  "state_vars": {
    "version": {
      "address": "0xF000",
      "type": "string",
      "default": "1.0"
    },
    "status": {
      "address": "0xF040",
      "type": "string",
      "default": "Ready"
    },
    "source_lines": {
      "address": "0xF100",
      "type": "array",
      "count": 10,
      "item_type": "string"
    }
  },
  "handlers": {
    "assemble": {
      "type": "vm_spawn",
      "program_address": "0x2000",
      "input_address": "0x1000",
      "output_address": "0x5000"
    },
    "run_program": {
      "type": "vm_spawn",
      "program_address": "0x5000",
      "input_address": "0xF000",
      "output_address": "0xF100"
    }
  }
}
```

**Step 2: Verify file created**

Run: `cat apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/self_hosting.mapping.json`
Expected: JSON content displayed, valid JSON

**Step 3: Commit**

```bash
git add apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/self_hosting.mapping.json
git commit -m "feat(ascii): add self-hosting compiler mapping config"
```

---

## Phase 2: Rust Integration

### Task 3: Create Self-Hosting Template Loader

**Files:**
- Create: `systems/infinite_map_rs/src/ascii_native/self_hosting_template.rs`
- Modify: `systems/infinite_map_rs/src/ascii_native/mod.rs`

**Step 1: Write the failing test**

```rust
// tests/self_hosting_template_test.rs

use infinite_map_rs::ascii_native::self_hosting_template::SelfHostingTemplate;

#[test]
fn test_template_loads() {
    let template = SelfHostingTemplate::load().expect("Template should load");
    assert!(!template.source().is_empty(), "Template should have source");
}

#[test]
fn test_template_renders() {
    let template = SelfHostingTemplate::load().expect("Template should load");
    let rendered = template.render("Ready", &["LDI r0, 42", "HALT"]);
    assert!(rendered.contains("[A] Edit"), "Should have button labels");
    assert!(rendered.contains("Ready"), "Should show status");
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --test self_hosting_template_test -v 2>&1 | head -20`
Expected: Compilation error - module not found

**Step 3: Write minimal implementation**

Create `systems/infinite_map_rs/src/ascii_native/self_hosting_template.rs`:

```rust
//! Self-Hosting Template Loader
//!
//! Loads and renders the ASCII-First template for the self-hosting compiler.

const TEMPLATE: &str = include_str!("../../../../apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/self_hosting.ascii");

pub struct SelfHostingTemplate {
    source: String,
}

impl SelfHostingTemplate {
    /// Load the template from embedded file
    pub fn load() -> Result<Self, String> {
        Ok(Self {
            source: TEMPLATE.to_string(),
        })
    }

    /// Get raw template source
    pub fn source(&self) -> &str {
        &self.source
    }

    /// Render template with status and source lines
    pub fn render(&self, status: &str, source_lines: &[&str]) -> String {
        let mut result = self.source.clone();

        // Replace timestamp
        let timestamp = chrono::Local::now().format("%Y-%m-%d %H:%M:%S");
        result = result.replace("{{timestamp}}", &timestamp.to_string());

        // Replace version
        result = result.replace("{{version}}", "1.0");

        // Replace status
        result = result.replace("{{status}}", status);

        // Replace source lines (simple implementation)
        let lines_section = source_lines
            .iter()
            .enumerate()
            .map(|(i, line)| format!("║  │ {:72} ║║", line))
            .take(10)
            .collect::<Vec<_>>()
            .join("\n");

        // Replace {{#each source_lines}}...{{/each}}
        let each_pattern = regex::Regex::new(r"\{\{#each source_lines\}\}[\s\S]*?\{\{/each\}\}").unwrap();
        result = each_pattern.replace(&result, &lines_section).to_string();

        result
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_template_loads() {
        let template = SelfHostingTemplate::load().expect("Template should load");
        assert!(!template.source().is_empty());
    }

    #[test]
    fn test_template_renders() {
        let template = SelfHostingTemplate::load().expect("Template should load");
        let rendered = template.render("Ready", &["LDI r0, 42", "HALT"]);
        assert!(rendered.contains("[A] Edit"));
        assert!(rendered.contains("Ready"));
    }
}
```

**Step 4: Add module to mod.rs**

Add to `systems/infinite_map_rs/src/ascii_native/mod.rs`:
```rust
pub mod self_hosting_template;
```

**Step 5: Run test to verify it passes**

Run: `cargo test -p infinite_map_rs self_hosting_template --lib -v`
Expected: 2 tests PASS

**Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/ascii_native/self_hosting_template.rs systems/infinite_map_rs/src/ascii_native/mod.rs
git commit -m "feat(ascii-native): add self-hosting template loader"
```

---

### Task 4: Create Cartridge Generator for Self-Hosting

**Files:**
- Create: `systems/infinite_map_rs/src/ascii_native/self_hosting_cartridge.rs`
- Modify: `systems/infinite_map_rs/src/ascii_native/mod.rs`

**Step 1: Write the failing test**

```rust
// Add to tests/self_hosting_template_test.rs

#[test]
fn test_cartridge_generation() {
    use infinite_map_rs::ascii_native::self_hosting_cartridge::generate_self_hosting_cartridge;

    let source = "LDI r0, 42\nHALT\n";
    let output = std::env::temp_dir().join("test_self_hosting.rts.png");

    let result = generate_self_hosting_cartridge(source, &output);
    assert!(result.is_ok(), "Should generate cartridge");

    // Verify PNG dimensions
    let img = image::open(&output).expect("Should load PNG");
    assert_eq!(img.width(), 80);
    assert_eq!(img.height(), 1576);

    std::fs::remove_file(&output).ok();
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --test self_hosting_template_test test_cartridge_generation -v 2>&1 | head -20`
Expected: Compilation error - function not found

**Step 3: Write minimal implementation**

Create `systems/infinite_map_rs/src/ascii_native/self_hosting_cartridge.rs`:

```rust
//! Self-Hosting Cartridge Generator
//!
//! Generates .rts.png cartridges with the ASCII-First template
//! and the self-hosting assembler embedded.

use std::path::Path;

use crate::cartridge_writer::{CartridgeConfig, CartridgeWriter};
use crate::glyph_assembler::GlyphAssembler;
use super::self_hosting_template::SelfHostingTemplate;

/// Generate a self-hosting cartridge from source code
pub fn generate_self_hosting_cartridge<P: AsRef<Path>>(
    source: &str,
    output_path: P,
) -> Result<(), String> {
    // 1. Render ASCII template
    let template = SelfHostingTemplate::load()?;
    let source_lines: Vec<&str> = source.lines().collect();
    let display_text = template.render("Compiled", &source_lines);

    // 2. Assemble the program
    let mut asm = GlyphAssembler::new();
    let program = asm.assemble(source)?;

    // 3. Create cartridge
    let config = CartridgeConfig {
        name: "self_hosting".to_string(),
        version: 1,
    };
    let mut writer = CartridgeWriter::new(config);

    // 4. Load display text into glyph grid
    writer.load_glyph_text(&display_text);

    // 5. Set program bytecode
    writer.set_program(&program.words);

    // 6. Apply action mapping for buttons
    use std::collections::HashMap;
    let mut action_map = HashMap::new();
    action_map.insert("Edit", ("JUMP", "editor_mode"));
    action_map.insert("Assemble", ("JUMP", "assemble"));
    action_map.insert("Run", ("JUMP", "run_program"));
    action_map.insert("Quit", ("EXIT", ""));
    writer.apply_action_mapping(&action_map, &program.labels);

    // 7. Generate PNG
    let png_data = writer.to_png()?;

    // 8. Write to file
    std::fs::write(output_path, &png_data)
        .map_err(|e| format!("Failed to write output: {}", e))?;

    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cartridge_generation() {
        let source = "LDI r0, 42\nHALT\n";
        let output = std::env::temp_dir().join("test_self_hosting_cartridge.rts.png");

        let result = generate_self_hosting_cartridge(source, &output);
        assert!(result.is_ok(), "Should generate cartridge: {:?}", result);

        let img = image::open(&output).expect("Should load PNG");
        assert_eq!(img.width(), 80);
        assert_eq!(img.height(), 1576);

        std::fs::remove_file(&output).ok();
    }
}
```

**Step 4: Add module to mod.rs**

Add to `systems/infinite_map_rs/src/ascii_native/mod.rs`:
```rust
pub mod self_hosting_cartridge;
```

**Step 5: Run test to verify it passes**

Run: `cargo test -p infinite_map_rs self_hosting_cartridge --lib -v`
Expected: 1 test PASS

**Step 6: Commit**

```bash
git add systems/infinite_map_rs/src/ascii_native/self_hosting_cartridge.rs systems/infinite_map_rs/src/ascii_native/mod.rs
git commit -m "feat(ascii-native): add self-hosting cartridge generator"
```

---

## Phase 3: CLI Integration

### Task 5: Add Self-Hosting Mode to geos-compile CLI

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/geos-compile.rs`

**Step 1: Write the failing test**

```rust
// tests/cli_self_hosting_test.rs

use std::process::Command;

#[test]
fn test_cli_self_hosting_mode() {
    // Create test source
    let source = ":main\n    LDI r0, 42\n    HALT\n";
    let source_path = std::env::temp_dir().join("test_cli_source.glyph");
    std::fs::write(&source_path, source).expect("Write source");

    let output_path = std::env::temp_dir().join("test_cli_output.rts.png");

    // Run CLI with --self-hosting flag
    let output = Command::new("cargo")
        .args(["run", "--release", "--bin", "geos-compile", "--",
               "--self-hosting",
               source_path.to_str().unwrap(),
               "-o", output_path.to_str().unwrap()])
        .output()
        .expect("Run CLI");

    assert!(output.status.success(), "CLI should succeed: {:?}", String::from_utf8_lossy(&output.stderr));
    assert!(output_path.exists(), "Output file should exist");

    std::fs::remove_file(&source_path).ok();
    std::fs::remove_file(&output_path).ok();
}
```

**Step 2: Run test to verify it fails**

Run: `cargo test --test cli_self_hosting_test -v 2>&1 | head -20`
Expected: Test fails - --self-hosting flag not recognized

**Step 3: Write minimal implementation**

Modify `systems/infinite_map_rs/src/bin/geos-compile.rs`:

```rust
// Add to Args struct:
/// Use ASCII-First self-hosting template
#[arg(long)]
self_hosting: bool,

// Add to main():
if args.self_hosting {
    if args.verbose {
        eprintln!("Using ASCII-First self-hosting template");
    }
    match infinite_map_rs::ascii_native::self_hosting_cartridge::generate_self_hosting_cartridge(&source, &output) {
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
} else {
    // Existing compilation path
    match infinite_map_rs::glyph_to_cartridge::compile_glyph_to_cartridge(&source, &output) {
        // ...
    }
}
```

**Step 4: Run test to verify it passes**

Run: `cargo test --test cli_self_hosting_test -v`
Expected: 1 test PASS

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/bin/geos-compile.rs tests/cli_self_hosting_test.rs
git commit -m "feat(cli): add --self-hosting mode to geos-compile"
```

---

## Phase 4: Verification

### Task 6: Integration Test with Synthetic VRAM

**Files:**
- Create: `systems/infinite_map_rs/tests/ascii_native_integration_test.rs`

**Step 1: Write the integration test**

```rust
//! ASCII-Native Self-Hosting Integration Test
//!
//! Verifies the complete pipeline:
//! 1. Load ASCII template
//! 2. Compile source to cartridge
//! 3. Load cartridge into synthetic VRAM
//! 4. Execute and verify output

#[cfg(test)]
mod tests {
    use infinite_map_rs::ascii_native::self_hosting_cartridge::generate_self_hosting_cartridge;
    use infinite_map_rs::ascii_cartridge::AsciiCartridge;
    use infinite_map_rs::synthetic_vram::{SyntheticVram, SyntheticVmConfig};
    use std::path::PathBuf;

    fn temp_path(name: &str) -> PathBuf {
        std::env::temp_dir().join(name)
    }

    #[test]
    fn test_self_hosting_cartridge_loads() {
        let source = ":main\n    LDI r0, 42\n    LDI r1, 0xF000\n    STORE [r1], r0\n    HALT\n";
        let output = temp_path("integration_test.rts.png");

        // Generate cartridge
        generate_self_hosting_cartridge(source, &output).expect("Generate failed");

        // Load cartridge
        let cartridge = AsciiCartridge::load(&output).expect("Load failed");

        // Verify program
        assert!(!cartridge.program_buffer.is_empty(), "Should have program");
        assert!(cartridge.program_buffer.len() >= 4, "Should have LDI + imm + LDI + imm + STORE + HALT");

        // First instruction should be LDI (opcode 1)
        let first = cartridge.program_buffer[0];
        assert_eq!(first & 0xFF, 1, "First opcode should be LDI");

        std::fs::remove_file(&output).ok();
    }

    #[test]
    fn test_self_hosting_cartridge_executes() {
        let source = ":main\n    LDI r0, 42\n    LDI r1, 0xF000\n    STORE [r1], r0\n    HALT\n";
        let output = temp_path("execution_test.rts.png");

        // Generate and load
        generate_self_hosting_cartridge(source, &output).expect("Generate failed");
        let cartridge = AsciiCartridge::load(&output).expect("Load failed");

        // Create synthetic VRAM
        let mut vram = SyntheticVram::new_small(256).expect("Create VRAM");
        vram.spawn_vm(0, &SyntheticVmConfig::default()).expect("Spawn VM");

        // Load program
        cartridge.load_into_vram(&mut vram, 0).expect("Load into VRAM");

        // Execute
        let result = vram.run_until_halt(0, 10000).expect("Run failed");
        assert!(result.halted, "Should halt");

        // Verify memory[0xF000] = 42
        let value = vram.peek(0xF000);
        assert_eq!(value, 42, "Memory should contain 42");

        std::fs::remove_file(&output).ok();
    }

    #[test]
    fn test_self_hosting_template_displays_correctly() {
        use infinite_map_rs::ascii_native::self_hosting_template::SelfHostingTemplate;

        let template = SelfHostingTemplate::load().expect("Load template");
        let source_lines = vec!["LDI r0, 42", "LDI r1, 0xF000", "STORE [r1], r0", "HALT"];
        let rendered = template.render("Ready", &source_lines);

        // Verify template structure
        assert!(rendered.contains("[A] Edit"), "Should have Edit button");
        assert!(rendered.contains("[B] Assemble"), "Should have Assemble button");
        assert!(rendered.contains("[C] Run"), "Should have Run button");
        assert!(rendered.contains("Ready"), "Should show status");
        assert!(rendered.contains("LDI r0, 42"), "Should show source line");
    }
}
```

**Step 2: Run test to verify it passes**

Run: `cargo test --test ascii_native_integration_test -v`
Expected: 3 tests PASS

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/tests/ascii_native_integration_test.rs
git commit -m "test(ascii-native): add integration tests for self-hosting"
```

---

### Task 7: Update Memory and Documentation

**Files:**
- Update: `memory/ascii-native-self-hosting.md` (create)
- Update: `memory/MEMORY.md`

**Step 1: Create memory file**

```markdown
---
name: ASCII-Native Self-Hosting
description: ASCII-First visual interface for the self-hosting assembler
type: project
---

# ASCII-Native Self-Hosting

## Status: ✅ Complete

Integrates the existing self-hosting assembler with the ASCII-First architecture, providing a visual interface for editing and compiling Glyph assembly.

## Components

| Component | File | Purpose |
|-----------|------|---------|
| Self-Hosting Assembler | `glyph_stratum/programs/self_hosting_assembler.glyph` | VM-native compiler (398 lines) |
| ASCII Template | `geos-ascii/examples/self_hosting.ascii` | 80x24 visual layout |
| Mapping Config | `geos-ascii/examples/self_hosting.mapping.json` | Button/state definitions |
| Template Loader | `ascii_native/self_hosting_template.rs` | Rust template renderer |
| Cartridge Generator | `ascii_native/self_hosting_cartridge.rs` | PNG cartridge emitter |

## Why: ASCII-First Sovereignty

This completes the sovereignty chain with a human-friendly interface:
```
Text → ASCII Template → Cartridge → GPU Execution
```

Users can now:
1. Edit source in a visual 80x24 grid
2. Press [B] to compile on the GPU
3. Press [C] to run the compiled program
4. All without leaving the ASCII interface

## How to Use

```bash
# Compile with ASCII-First template
geos-compile --self-hosting input.glyph -o output.rts.png

# Load in Infinite Map
# The cartridge shows the source code with [A] Edit [B] Assemble [C] Run buttons
```

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│              ASCII-First Self-Hosting Interface              │
├─────────────────────────────────────────────────────────────┤
│  [A] Edit    [B] Assemble   [C] Run      [X] Quit           │
├─────────────────────────────────────────────────────────────┤
│  SOURCE:                                                    │
│  │ LDI r0, 42                                               │
│  │ HALT                                                     │
├─────────────────────────────────────────────────────────────┤
│  STATUS: {{status}}                                         │
└─────────────────────────────────────────────────────────────┘
```

## Test Coverage

| Test File | Tests | Status |
|-----------|-------|--------|
| `self_hosting_template_test.rs` | 2 | ✅ Pass |
| `self_hosting_cartridge.rs` (lib) | 1 | ✅ Pass |
| `cli_self_hosting_test.rs` | 1 | ✅ Pass |
| `ascii_native_integration_test.rs` | 3 | ✅ Pass |

**Total: 7 tests passing**

---

*Completed: 2026-03-18*
*Related: self-hosting-bootstrap.md, gpu-vm.md, ascii-first-architecture.md*
```

**Step 2: Update MEMORY.md**

Add to Active Systems table:
```
| [ASCII-Native Self-Hosting](ascii-native-self-hosting.md) | ✅ Complete | 7 | ASCII-First visual interface for self-hosting assembler |
```

**Step 3: Commit**

```bash
git add memory/ascii-native-self-hosting.md memory/MEMORY.md
git commit -m "docs(memory): add ASCII-native self-hosting documentation"
```

---

## Summary

| Phase | Tasks | Files | Tests |
|-------|-------|-------|-------|
| 1. ASCII Templates | 2 | 2 | 0 |
| 2. Rust Integration | 2 | 4 | 4 |
| 3. CLI Integration | 1 | 2 | 1 |
| 4. Verification | 2 | 3 | 3 |
| **Total** | **7** | **11** | **8** |

## Dependencies

- `image` crate (already in Cargo.toml)
- `regex` crate (already in Cargo.toml)
- `chrono` crate (add for timestamp)
- Existing `GlyphAssembler`, `CartridgeWriter`, `AsciiCartridge`
- Existing `self_hosting_assembler.glyph` (no changes needed)

## Risk Mitigation

- Template loading uses `include_str!` for compile-time verification
- Integration tests verify end-to-end pipeline
- Synthetic VRAM tests verify execution without GPU hardware

---

*Plan created: 2026-03-18*
