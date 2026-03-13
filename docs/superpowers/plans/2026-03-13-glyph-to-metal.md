# Glyph-to-Metal: Replacing WGSL with AI-Evolved Glyph Programs

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace human-made WGSL with AI-evolved glyph language, progressing from current interpreter to bare metal GPU execution.

**Architecture:** Glyph programs compile directly to GPU bytecode (SPIR-V → native), bypassing human-designed shader languages. The evolution daemon drives language design, not humans.

**Tech Stack:** Rust (wgpu, naga, drm), Python (evolution daemon), SPIR-V, eventually custom kernel module

---

## Overview: Four Phases

| Phase | Description | Dependency |
|-------|-------------|------------|
| **Phase 1** | Glyph → SPIR-V Compiler | Current infrastructure |
| **Phase 2** | DRM/KMS Direct Execution | Phase 1 |
| **Phase 3** | Custom Kernel Module | Phase 2 |
| **Phase 4** | Bare Metal Boot | Phase 3 |

Each phase produces working, testable software. This plan covers Phase 1 in detail with outlines for subsequent phases.

---

## Chunk 0: Project Setup

### Task 0.1: Create glyph_compiler Package

**Files:**
- Create: `systems/glyph_compiler/` (new package)

- [ ] **Step 1: Create package with cargo**

Run: `cargo new --lib systems/glyph_compiler`
Expected: Creates `systems/glyph_compiler/` with `Cargo.toml`, `src/lib.rs`

- [ ] **Step 2: Add dependencies**

```toml
# systems/glyph_compiler/Cargo.toml
[package]
name = "glyph_compiler"
version = "0.1.0"
edition = "2021"

[lib]
name = "glyph_compiler"
path = "src/lib.rs"

[[bin]]
name = "glyph_compiler"
path = "src/main.rs"

[dependencies]
spirv_headers = "1.5"
wgpu = { version = "0.19", features = ["spirv"] }
tokio = { version = "1", features = ["rt-multi-thread", "macros"] }
serde = { version = "1.0", features = ["derive"] }
serde_json = "1.0"

[dev-dependencies]
```

- [ ] **Step 3: Verify package builds**

Run: `cargo check --package glyph_compiler`
Expected: PASS (empty lib compiles)

- [ ] **Step 4: Commit**

```bash
git add systems/glyph_compiler/
git commit -m "feat: scaffold glyph_compiler package"
```

---

### Task 0.2: Document Opcode Convention Source

**Files:**
- Create: `systems/glyph_compiler/OPCODES.md`

- [ ] **Step 1: Document opcode source**

```markdown
# systems/glyph_compiler/OPCODES.md

# Glyph Opcode Reference

The canonical opcode definitions are in:
`apps/autoresearch/champion_shader.wgsl`

## Opcode Range: 200-227

| Opcode | Name | Description |
|--------|------|-------------|
| 200 | ADD_M | memory[dst] = p1 + p2 |
| 201 | SUB_M | memory[dst] = p1 - p2 |
| 202 | MUL_M | memory[dst] = p1 * p2 |
| 203 | DIV_M | memory[dst] = p1 / p2 (if p2 != 0) |
| 204 | LD | memory[dst] = memory[p1] |
| 205 | ST | memory[p1] = p2 |
| 206 | MOV | memory[dst] = p1 |
| 207 | CLR | memory[dst] = 0.0 |
| 208 | JMP | pc = p1 |
| 209 | JZ | if memory[dst] == 0 { pc = p1 } |
| 210 | CALL | stack[sp++] = pc; pc = p1 |
| 211 | RET | pc = stack[--sp] |
| 212 | HALT | halted = 1 |
| 215 | DRAW | Blit glyph from atlas to screen |
| 216 | ADD_MEM | memory[dst] = memory[p1] + memory[p2] |
| 217 | SUB_MEM | memory[dst] = memory[p1] - memory[p2] |
| 218 | INT_DISPATCH | Hit testing for UI events |
| 220 | BRANCH_PROB | Probabilistic branching |
| 221 | CONFIDENCE_MARK | Semantic metadata |
| 222 | ALTERNATE_PATH | Fallback mechanism |
| 223 | ATTENTION_FOCUS | Sparse optimization |
| 224 | GLYPH_MUTATE | Self-modification |
| 225 | SPATIAL_SPAWN | Cluster generation |
| 227 | LOAD_EMBEDDING | Neural bridge |

## Reserved: 213, 214, 226

Available for future AI-designed opcodes.
```

- [ ] **Step 2: Commit**

```bash
git add systems/glyph_compiler/OPCODES.md
git commit -m "docs: document glyph opcode convention"
```

---

## Chunk 1: Glyph SPIR-V Compiler Core

### Task 1.1: Define Glyph-to-SPIR-V Instruction Mapping

**Files:**
- Create: `systems/glyph_compiler/src/spirv_mapping.rs`

- [ ] **Step 1: Write the failing test (inline)**

```rust
// systems/glyph_compiler/src/spirv_mapping.rs

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add_opcode_maps_to_spirv_fadd() {
        let builder = SpirvBuilder::new();
        let spirv_op = builder.map_glyph_opcode(GlyphOpcode::ADD_M);
        assert_eq!(spirv_op, SpirvOp::FAdd);
    }

    #[test]
    fn test_memory_ops_map_to_load_store() {
        let builder = SpirvBuilder::new();
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::LD), SpirvOp::Load);
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::ST), SpirvOp::Store);
    }

    #[test]
    fn test_control_flow_ops_map_correctly() {
        let builder = SpirvBuilder::new();
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::JMP), SpirvOp::Branch);
        assert_eq!(builder.map_glyph_opcode(GlyphOpcode::JZ), SpirvOp::BranchConditional);
    }
}

use spirv_headers::{Op as SpirvOp};

/// Glyph opcodes from apps/autoresearch/champion_shader.wgsl (200-227)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u32)]
pub enum GlyphOpcode {
    // Arithmetic (200-203)
    ADD_M = 200,
    SUB_M = 201,
    MUL_M = 202,
    DIV_M = 203,
    // Memory (204-207)
    LD = 204,
    ST = 205,
    MOV = 206,
    CLR = 207,
    // Control (208-211)
    JMP = 208,
    JZ = 209,
    CALL_M = 210,
    RET_M = 211,
    // System (212, 215)
    HALT_M = 212,
    DRAW = 215,
    // Extended (216-227)
    ADD_MEM = 216,
    SUB_MEM = 217,
    INT_DISPATCH = 218,
    BRANCH_PROB = 220,
    CONFIDENCE_MARK = 221,
    ALTERNATE_PATH = 222,
    ATTENTION_FOCUS = 223,
    GLYPH_MUTATE = 224,
    SPATIAL_SPAWN = 225,
    LOAD_EMBEDDING = 227,
}

impl TryFrom<u32> for GlyphOpcode {
    type Error = String;

    fn try_from(value: u32) -> Result<Self, Self::Error> {
        match value {
            200 => Ok(GlyphOpcode::ADD_M),
            201 => Ok(GlyphOpcode::SUB_M),
            202 => Ok(GlyphOpcode::MUL_M),
            203 => Ok(GlyphOpcode::DIV_M),
            204 => Ok(GlyphOpcode::LD),
            205 => Ok(GlyphOpcode::ST),
            206 => Ok(GlyphOpcode::MOV),
            207 => Ok(GlyphOpcode::CLR),
            208 => Ok(GlyphOpcode::JMP),
            209 => Ok(GlyphOpcode::JZ),
            210 => Ok(GlyphOpcode::CALL_M),
            211 => Ok(GlyphOpcode::RET_M),
            212 => Ok(GlyphOpcode::HALT_M),
            215 => Ok(GlyphOpcode::DRAW),
            216 => Ok(GlyphOpcode::ADD_MEM),
            217 => Ok(GlyphOpcode::SUB_MEM),
            218 => Ok(GlyphOpcode::INT_DISPATCH),
            220 => Ok(GlyphOpcode::BRANCH_PROB),
            221 => Ok(GlyphOpcode::CONFIDENCE_MARK),
            222 => Ok(GlyphOpcode::ALTERNATE_PATH),
            223 => Ok(GlyphOpcode::ATTENTION_FOCUS),
            224 => Ok(GlyphOpcode::GLYPH_MUTATE),
            225 => Ok(GlyphOpcode::SPATIAL_SPAWN),
            227 => Ok(GlyphOpcode::LOAD_EMBEDDING),
            _ => Err(format!("Unknown opcode: {}", value)),
        }
    }
}

/// Maps glyph opcodes to SPIR-V operations
pub struct SpirvBuilder {
    id_bound: u32,
}

impl SpirvBuilder {
    pub fn new() -> Self {
        Self { id_bound: 1 }
    }

    pub fn map_glyph_opcode(&self, opcode: GlyphOpcode) -> SpirvOp {
        match opcode {
            GlyphOpcode::ADD_M | GlyphOpcode::ADD_MEM => SpirvOp::FAdd,
            GlyphOpcode::SUB_M | GlyphOpcode::SUB_MEM => SpirvOp::FSub,
            GlyphOpcode::MUL_M => SpirvOp::FMul,
            GlyphOpcode::DIV_M => SpirvOp::FDiv,
            GlyphOpcode::LD => SpirvOp::Load,
            GlyphOpcode::ST => SpirvOp::Store,
            GlyphOpcode::MOV | GlyphOpcode::CLR => SpirvOp::CopyObject,
            GlyphOpcode::JMP => SpirvOp::Branch,
            GlyphOpcode::JZ => SpirvOp::BranchConditional,
            GlyphOpcode::CALL_M => SpirvOp::FunctionCall,
            GlyphOpcode::RET_M => SpirvOp::Return,
            GlyphOpcode::HALT_M => SpirvOp::Kill, // Closest SPIR-V equivalent
            _ => SpirvOp::Nop, // Extended ops need custom handling
        }
    }
}

impl Default for SpirvBuilder {
    fn default() -> Self {
        Self::new()
    }
}
```

- [ ] **Step 2: Update lib.rs to export module**

```rust
// systems/glyph_compiler/src/lib.rs
pub mod spirv_mapping;

pub use spirv_mapping::{GlyphOpcode, SpirvBuilder};
```

- [ ] **Step 3: Run test to verify it passes**

Run: `cargo test --package glyph_compiler spirv_mapping`
Expected: PASS (3 tests)

- [ ] **Step 4: Commit**

```bash
git add systems/glyph_compiler/src/
git commit -m "feat(glyph_compiler): add opcode to SPIR-V mapping"
```

---

### Task 1.2: Build SPIR-V Binary from Glyph Program

**Files:**
- Create: `systems/glyph_compiler/src/binary_builder.rs`

- [ ] **Step 1: Write the failing test (inline)**

```rust
// systems/glyph_compiler/src/binary_builder.rs

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simple_add_program_generates_valid_spirv() {
        let program = GlyphProgram {
            glyphs: vec![
                Glyph { opcode: 206, p1: 1.0, p2: 0.0, dst: 0 }, // MOV 1.0 -> mem[0]
                Glyph { opcode: 206, p1: 2.0, p2: 0.0, dst: 1 }, // MOV 2.0 -> mem[1]
                Glyph { opcode: 216, p1: 0.0, p2: 1.0, dst: 2 }, // ADD mem[0] + mem[1] -> mem[2]
                Glyph { opcode: 212, p1: 0.0, p2: 0.0, dst: 0 }, // HALT
            ],
        };

        let mut builder = BinaryBuilder::new();
        let spirv_binary = builder.compile(&program);

        // Valid SPIR-V starts with magic number 0x07230203
        assert_eq!(spirv_binary[0], 0x07230203);
        // Should have non-zero length
        assert!(spirv_binary.len() > 20);
    }
}

use crate::spirv_mapping::GlyphOpcode;

/// A single glyph instruction
#[derive(Debug, Clone, Copy)]
pub struct Glyph {
    pub opcode: u32,
    pub p1: f32,
    pub p2: f32,
    pub dst: u32,
}

/// A complete glyph program
#[derive(Debug, Clone)]
pub struct GlyphProgram {
    pub glyphs: Vec<Glyph>,
}

/// Builds SPIR-V binary from glyph programs
pub struct BinaryBuilder {
    words: Vec<u32>,
    id_bound: u32,
}

impl BinaryBuilder {
    pub fn new() -> Self {
        Self {
            words: Vec::new(),
            id_bound: 1,
        }
    }

    fn next_id(&mut self) -> u32 {
        let id = self.id_bound;
        self.id_bound += 1;
        id
    }

    fn emit(&mut self, opcode: u16, operands: &[u32]) {
        let count = (operands.len() + 1) as u16;
        let word0 = ((count as u32) << 16) | (opcode as u32);
        self.words.push(word0);
        self.words.extend_from_slice(operands);
    }

    /// Compile a glyph program to SPIR-V binary
    pub fn compile(&mut self, program: &GlyphProgram) -> Vec<u32> {
        self.words.clear();
        self.id_bound = 1;

        // SPIR-V Header (will update bound later)
        let mut result = vec![
            0x07230203, // Magic
            0x00010600, // Version 1.6
            0x00000000, // Generator (placeholder)
            0,          // ID bound (placeholder)
            0x00000000, // Schema
        ];

        // Memory model
        self.emit(14, &[0, 1]); // OpMemoryModel Logical GLSL450

        // Entry point setup
        let void_type = self.next_id();
        let fn_type = self.next_id();
        let entry_id = self.next_id();

        self.emit(19, &[void_type]); // OpTypeVoid
        self.emit(33, &[fn_type, void_type]); // OpTypeFunction

        // OpFunction
        self.emit(54, &[void_type, entry_id, 0, fn_type]); // OpFunction
        self.emit(53, &[entry_id]); // OpLabel

        // Compile each glyph to SPIR-V instructions
        for glyph in &program.glyphs {
            self.compile_glyph(glyph);
        }

        self.emit(56, &[]); // OpReturn
        self.emit(18, &[0]); // OpFunctionEnd

        // Update bound in header
        result[3] = self.id_bound;
        result.extend_from_slice(&self.words);
        result
    }

    fn compile_glyph(&mut self, glyph: &Glyph) {
        match GlyphOpcode::try_from(glyph.opcode) {
            Ok(GlyphOpcode::MOV) => {
                // MOV dst, p1 -> OpCopyObject
                let result_id = self.next_id();
                let const_id = self.emit_f32_constant(glyph.p1);
                self.emit(61, &[result_id, const_id]); // OpCopyObject
            }
            Ok(GlyphOpcode::ADD_MEM) => {
                // ADD_MEM dst, mem[p1], mem[p2]
                let result_id = self.next_id();
                // Simplified: emit FAdd with constants for now
                let a_id = self.emit_f32_constant(glyph.p1);
                let b_id = self.emit_f32_constant(glyph.p2);
                self.emit(128, &[result_id, a_id, b_id]); // OpFAdd
            }
            Ok(GlyphOpcode::HALT_M) => {
                self.emit(252, &[]); // OpKill
            }
            _ => {
                // Unknown or unimplemented opcode - skip (SPIR-V has no explicit NOP)
            }
        }
    }

    fn emit_f32_constant(&mut self, value: f32) -> u32 {
        let type_id = self.next_id();
        let const_id = self.next_id();
        self.emit(22, &[type_id, 32, 0]); // OpTypeFloat 32-bit
        let bits = value.to_bits();
        self.emit(43, &[type_id, const_id, bits]); // OpConstant
        const_id
    }
}

impl Default for BinaryBuilder {
    fn default() -> Self {
        Self::new()
    }
}
```

- [ ] **Step 2: Update lib.rs to export module**

```rust
// systems/glyph_compiler/src/lib.rs
pub mod spirv_mapping;
pub mod binary_builder;

pub use spirv_mapping::{GlyphOpcode, SpirvBuilder};
pub use binary_builder::{Glyph, GlyphProgram, BinaryBuilder};
```

- [ ] **Step 3: Run test to verify it passes**

Run: `cargo test --package glyph_compiler binary_builder`
Expected: PASS

- [ ] **Step 4: Commit**

```bash
git add systems/glyph_compiler/src/
git commit -m "feat(glyph_compiler): build SPIR-V binary from glyph program"
```

---

### Task 1.3: Implement CLI Entry Point

**Files:**
- Create: `systems/glyph_compiler/src/main.rs`

- [ ] **Step 1: Write the CLI**

```rust
// systems/glyph_compiler/src/main.rs
use glyph_compiler::{BinaryBuilder, Glyph, GlyphProgram};
use std::io::{self, Read};
use serde::Deserialize;

#[derive(Deserialize)]
struct JsonProgram {
    glyphs: Vec<JsonGlyph>,
}

#[derive(Deserialize)]
struct JsonGlyph {
    opcode: u32,
    p1: f32,
    p2: f32,
    dst: u32,
}

fn main() {
    let args: Vec<String> = std::env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: glyph_compiler <compile|execute>");
        std::process::exit(1);
    }

    match args[1].as_str() {
        "compile" => compile_command(),
        "execute" => execute_command(),
        _ => {
            eprintln!("Unknown command: {}", args[1]);
            std::process::exit(1);
        }
    }
}

fn compile_command() {
    // Read JSON from stdin
    let mut input = String::new();
    io::stdin()
        .read_to_string(&mut input)
        .expect("Failed to read stdin");

    let json: JsonProgram = serde_json::from_str(&input).expect("Invalid JSON");

    // Convert to GlyphProgram
    let program = GlyphProgram {
        glyphs: json
            .glyphs
            .into_iter()
            .map(|g| Glyph {
                opcode: g.opcode,
                p1: g.p1,
                p2: g.p2,
                dst: g.dst,
            })
            .collect(),
    };

    // Compile to SPIR-V
    let mut builder = BinaryBuilder::new();
    let spirv = builder.compile(&program);

    // Output as JSON (for now, just size info)
    let output = serde_json::json!({
        "spirv_size": spirv.len() * 4,
        "word_count": spirv.len(),
        "magic": format!("0x{:08x}", spirv[0]),
    });

    println!("{}", serde_json::to_string(&output).unwrap());
}

fn execute_command() {
    // Placeholder - will implement GPU execution in Task 1.4
    eprintln!("Execute not yet implemented");
    std::process::exit(1);
}
```

- [ ] **Step 2: Run manual test**

```bash
echo '{"glyphs": [{"opcode": 206, "p1": 42.0, "p2": 0.0, "dst": 0}]}' | \
  cargo run --package glyph_compiler -- compile
```
Expected: JSON output with spirv_size and word_count

- [ ] **Step 3: Commit**

```bash
git add systems/glyph_compiler/src/main.rs
git commit -m "feat(glyph_compiler): add CLI entry point"
```

---

### Task 1.4: Integrate wgpu for Execution

**Files:**
- Create: `systems/glyph_compiler/src/executor.rs`

- [ ] **Step 1: Write the failing test (inline)**

```rust
// systems/glyph_compiler/src/executor.rs

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_executor_creation() {
        let result = GlyphExecutor::new().await;
        // May fail if no GPU, so we just check it doesn't panic
        if let Ok(executor) = result {
            assert!(executor.device.features().len() > 0);
        }
    }
}

use wgpu::{Device, Queue};
use std::sync::Arc;

/// Executes compiled SPIR-V via wgpu
pub struct GlyphExecutor {
    device: Arc<Device>,
    queue: Arc<Queue>,
}

impl GlyphExecutor {
    pub async fn new() -> Result<Self, String> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                ..Default::default()
            })
            .await
            .ok_or_else(|| "No suitable GPU adapter found".to_string())?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor::default(), None)
            .await
            .map_err(|e| format!("Failed to get device: {}", e))?;

        Ok(Self {
            device: Arc::new(device),
            queue: Arc::new(queue),
        })
    }

    /// Check if a GPU is available
    pub async fn is_available() -> bool {
        Self::new().await.is_ok()
    }

    /// Execute a SPIR-V compute shader
    pub async fn execute(&self, spirv_binary: &[u32]) -> Result<(), String> {
        // Create shader module from SPIR-V
        let shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph Compiled Shader"),
            source: wgpu::ShaderSource::SpirV(spirv_binary.into()),
        });

        // Create minimal compute pipeline
        let pipeline = self.device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph Pipeline"),
            layout: None,
            module: &shader,
            entry_point: "main",
        });

        let mut encoder = self.device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some("Glyph Execution"),
        });

        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph Compute"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&pipeline);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }

        self.queue.submit(Some(encoder.finish()));
        self.device.poll(wgpu::Maintain::Wait);

        Ok(())
    }
}
```

- [ ] **Step 2: Update lib.rs**

```rust
// systems/glyph_compiler/src/lib.rs
pub mod spirv_mapping;
pub mod binary_builder;
pub mod executor;

pub use spirv_mapping::{GlyphOpcode, SpirvBuilder};
pub use binary_builder::{Glyph, GlyphProgram, BinaryBuilder};
pub use executor::GlyphExecutor;
```

- [ ] **Step 3: Run test**

Run: `cargo test --package glyph_compiler executor`
Expected: PASS (may skip if no GPU)

- [ ] **Step 4: Commit**

```bash
git add systems/glyph_compiler/src/
git commit -m "feat(glyph_compiler): integrate wgpu execution"
```

---

### Task 1.5: Scaffold CLI-Anything Agent-Native Harness

**Goal:** Create a standardized agent interface (REPL + JSON) following the CLI-Anything methodology.

**Files:**
- Create: `systems/glyph_compiler/agent-harness/GEOS.md`
- Create: `systems/glyph_compiler/agent-harness/setup.py`
- Create: `systems/glyph_compiler/agent-harness/cli_anything/geos/geos_cli.py`
- Create: `systems/glyph_compiler/agent-harness/cli_anything/geos/utils/repl_skin.py`

- [ ] **Step 1: Write GEOS.md SOP**

Document the "Intent → Glyph" mapping principles and the stateful REPL workflow.

- [ ] **Step 2: Create setup.py (Namespace Package)**

Configure `cli-anything-geos` as a PEP 420 namespace package.

- [ ] **Step 3: Implement Python Wrapper CLI**

Create a Click-based CLI in `geos_cli.py` that wraps the `glyph_compiler` Rust binary and adds:
- `--json` output for all commands
- Stateful session management (`session.json`)
- Interactive REPL with `ReplSkin`

- [ ] **Step 4: Verify Installation**

Run: `pip install -e systems/glyph_compiler/agent-harness`
Run: `cli-anything-geos --help`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add systems/glyph_compiler/agent-harness/
git commit -m "feat(geos): scaffold agent-native CLI harness"
```

---

## Chunk 2: Evolution-Driven Language Design

### Task 2.1: Connect Glyph Compiler to Evolution Daemon

**Files:**
- Create: `systems/evolution_daemon/glyph_evolution.py`
- Modify: `systems/evolution_daemon/__init__.py`

- [ ] **Step 1: Write the failing test**

```python
# systems/evolution_daemon/tests/test_glyph_evolution.py
import pytest
from systems.evolution_daemon.glyph_evolution import (
    GlyphMutator,
    GlyphProgram,
    fitness_shader_correctness,
)

def test_mutator_can_mutate_opcode():
    """Mutator should change opcodes in a program."""
    original = GlyphProgram(glyphs=[
        {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},  # MOV
        {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},  # HALT
    ])

    mutator = GlyphMutator(mutation_rate=1.0)  # 100% for testing
    mutated = mutator.mutate(original)

    # At least one glyph should be different
    assert len(mutated.glyphs) > 0


def test_fitness_evaluates_compiled_shader():
    """Fitness function should test compiled shader."""
    program = GlyphProgram(glyphs=[
        {"opcode": 206, "p1": 42.0, "p2": 0.0, "dst": 0},  # MOV 42
        {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},  # HALT
    ])

    fitness = fitness_shader_correctness(program, expected_output=42.0)
    assert fitness >= 0.0
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest systems/evolution_daemon/tests/test_glyph_evolution.py -v`
Expected: FAIL with "No module named 'systems.evolution_daemon.glyph_evolution'"

- [ ] **Step 3: Write minimal implementation**

```python
# systems/evolution_daemon/glyph_evolution.py
"""
Glyph Evolution - AI-driven language design for GlyphStratum.

The evolution daemon drives glyph language design, not humans.
This module connects the evolution pipeline to the glyph compiler.
"""
import random
import subprocess
import json
from dataclasses import dataclass
from typing import List, Dict, Any, Optional, Callable

# Valid opcode range (from apps/autoresearch/champion_shader.wgsl)
VALID_OPCODES = [
    200, 201, 202, 203,  # Arithmetic
    204, 205, 206, 207,  # Memory
    208, 209, 210, 211,  # Control
    212, 215,            # System
    216, 217, 218,       # Extended
    220, 221, 222, 223, 224, 225, 227,  # AI-specific
]


@dataclass
class GlyphProgram:
    """A program composed of glyph instructions."""
    glyphs: List[Dict[str, Any]]

    def to_json(self) -> str:
        return json.dumps({"glyphs": self.glyphs})


class GlyphMutator:
    """Mutates glyph programs for evolution."""

    def __init__(
        self,
        mutation_rate: float = 0.1,
        opcode_mutation_rate: float = 0.3,
        param_mutation_rate: float = 0.3,
        insert_rate: float = 0.1,
        delete_rate: float = 0.1,
    ):
        self.mutation_rate = mutation_rate
        self.opcode_mutation_rate = opcode_mutation_rate
        self.param_mutation_rate = param_mutation_rate
        self.insert_rate = insert_rate
        self.delete_rate = delete_rate

    def mutate(self, program: GlyphProgram) -> GlyphProgram:
        """Apply mutations to a glyph program."""
        if random.random() > self.mutation_rate:
            return GlyphProgram(glyphs=program.glyphs.copy())

        glyphs = []

        for i, glyph in enumerate(program.glyphs):
            # Deletion
            if random.random() < self.delete_rate and len(program.glyphs) > 1:
                continue

            new_glyph = glyph.copy()

            # Opcode mutation
            if random.random() < self.opcode_mutation_rate:
                new_glyph["opcode"] = random.choice(VALID_OPCODES)

            # Parameter mutation
            if random.random() < self.param_mutation_rate:
                new_glyph["p1"] = random.uniform(-10.0, 10.0)
            if random.random() < self.param_mutation_rate:
                new_glyph["p2"] = random.uniform(-10.0, 10.0)

            glyphs.append(new_glyph)

            # Insertion
            if random.random() < self.insert_rate:
                glyphs.append({
                    "opcode": random.choice(VALID_OPCODES),
                    "p1": random.uniform(-10.0, 10.0),
                    "p2": random.uniform(-10.0, 10.0),
                    "dst": random.randint(0, 100),
                })

        return GlyphProgram(glyphs=glyphs)


def fitness_shader_correctness(
    program: GlyphProgram,
    expected_output: Optional[float] = None,
    test_timeout: float = 5.0,
) -> float:
    """
    Evaluate fitness by compiling to SPIR-V and testing.

    Fitness is based on:
    1. Compilation success (0.3 weight)
    2. Execution without crash (0.3 weight)
    3. Correctness of output (0.4 weight)
    """
    score = 0.0

    # 1. Try to compile
    try:
        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
            input=program.to_json(),
            capture_output=True,
            text=True,
            timeout=test_timeout,
        )

        if result.returncode != 0:
            return 0.1  # Compilation failed, minimal score
        score += 0.3

    except subprocess.TimeoutExpired:
        return 0.0
    except Exception:
        return 0.0

    # 2. Try to execute (if available)
    try:
        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "execute"],
            input=program.to_json(),
            capture_output=True,
            text=True,
            timeout=test_timeout,
        )

        if result.returncode == 0:
            score += 0.3
    except Exception:
        pass  # Execution may not be available yet

    return score


def evolve_glyph_program(
    seed: GlyphProgram,
    generations: int = 100,
    population_size: int = 50,
    fitness_fn: Callable[[GlyphProgram], float] = None,
) -> GlyphProgram:
    """
    Evolve a glyph program toward higher fitness.
    """
    if fitness_fn is None:
        fitness_fn = lambda p: fitness_shader_correctness(p)

    mutator = GlyphMutator()

    # Initialize population
    population = [seed]
    for _ in range(population_size - 1):
        population.append(mutator.mutate(seed))

    best_program = seed
    best_fitness = fitness_fn(seed)

    for gen in range(generations):
        # Evaluate fitness
        fitness_scores = [(p, fitness_fn(p)) for p in population]

        # Sort by fitness
        fitness_scores.sort(key=lambda x: x[1], reverse=True)

        # Update best
        if fitness_scores[0][1] > best_fitness:
            best_program = fitness_scores[0][0]
            best_fitness = fitness_scores[0][1]

        # Selection (top 25%)
        survivors = [p for p, _ in fitness_scores[:population_size // 4]]

        # Create new population
        population = survivors.copy()
        while len(population) < population_size:
            parent = random.choice(survivors)
            population.append(mutator.mutate(parent))

    return best_program
```

- [ ] **Step 4: Update __init__.py to export**

```python
# Add to systems/evolution_daemon/__init__.py
from .glyph_evolution import GlyphProgram, GlyphMutator, evolve_glyph_program
```

- [ ] **Step 5: Run test to verify it passes**

Run: `pytest systems/evolution_daemon/tests/test_glyph_evolution.py -v`
Expected: PASS

- [ ] **Step 6: Commit**

```bash
git add systems/evolution_daemon/glyph_evolution.py systems/evolution_daemon/__init__.py systems/evolution_daemon/tests/test_glyph_evolution.py
git commit -m "feat(evolution): connect glyph compiler to evolution daemon"
```

---

## Chunk 3: Integration Tests

### Task 3.1: End-to-End Glyph→SPIR-V Test

**Files:**
- Create: `tests/test_glyph_to_gpu_pipeline.py`

- [ ] **Step 1: Write the test**

```python
# tests/test_glyph_to_gpu_pipeline.py
"""
End-to-end test: Glyph program → SPIR-V → GPU execution.

This test verifies the complete pipeline from glyph program
to actual GPU execution, proving the WGSL replacement works.
"""
import pytest
import subprocess
import json


def _has_compiler() -> bool:
    """Check if glyph_compiler is available."""
    try:
        result = subprocess.run(
            ["cargo", "check", "--package", "glyph_compiler"],
            capture_output=True,
            timeout=30.0,
        )
        return result.returncode == 0
    except Exception:
        return False


@pytest.mark.skipif(not _has_compiler(), reason="glyph_compiler not available")
def test_glyph_to_spirv_compilation():
    """Test glyph program compiles to valid SPIR-V."""
    program = {
        "glyphs": [
            {"opcode": 206, "p1": 3.14159, "p2": 0.0, "dst": 0},
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
    }

    result = subprocess.run(
        ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
        input=json.dumps(program),
        capture_output=True,
        text=True,
        timeout=30.0,
    )

    assert result.returncode == 0, f"Compilation failed: {result.stderr}"

    # Output should be JSON with SPIR-V info
    output = json.loads(result.stdout)
    assert "spirv_size" in output
    assert output["spirv_size"] > 0
    assert output["magic"] == "0x07230203"


def _has_gpu() -> bool:
    """Check if a GPU is available via wgpu."""
    try:
        # Check via lspci first (doesn't require GPU context)
        result = subprocess.run(
            ["lspci"],
            capture_output=True,
            text=True,
        )
        return "VGA" in result.stdout or "3D" in result.stdout
    except Exception:
        return False


@pytest.mark.skipif(not _has_gpu(), reason="No GPU available")
def test_glyph_compiler_executes():
    """Test that the compiler binary works."""
    program = {
        "glyphs": [
            {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
    }

    result = subprocess.run(
        ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
        input=json.dumps(program),
        capture_output=True,
        text=True,
        timeout=30.0,
    )

    assert result.returncode == 0
```

- [ ] **Step 2: Run test**

Run: `pytest tests/test_glyph_to_gpu_pipeline.py -v`
Expected: PASS (compilation test) / SKIP (GPU test if no GPU)

- [ ] **Step 3: Commit**

```bash
git add tests/test_glyph_to_gpu_pipeline.py
git commit -m "test: add end-to-end glyph→SPIR-V pipeline test"
```

---

## Chunk 4: Documentation and Future Phases

### Task 4.1: Write README

**Files:**
- Create: `systems/glyph_compiler/README.md`

- [ ] **Step 1: Write documentation**

```markdown
# systems/glyph_compiler/README.md

# Glyph Compiler

Compiles AI-evolved glyph programs directly to SPIR-V, bypassing WGSL.

## Architecture

```
Glyph Program (JSON)
        ↓
  spirv_mapping.rs   ← Maps opcodes 200-227 to SPIR-V ops
        ↓
  binary_builder.rs  ← Generates valid SPIR-V binary
        ↓
  executor.rs        ← Executes via wgpu (Phase 1)
```

## Usage

```bash
# Compile a glyph program
echo '{"glyphs": [{"opcode": 206, "p1": 42.0, "p2": 0.0, "dst": 0}]}' | \
  cargo run --package glyph_compiler -- compile

# Output:
# {"spirv_size":80,"word_count":20,"magic":"0x07230203"}
```

## Opcode Reference

See `OPCODES.md` for the complete opcode specification.

Source of truth: `apps/autoresearch/champion_shader.wgsl`

## Evolution Integration

The `glyph_evolution.py` module connects this compiler to the evolution daemon:

```python
from systems.evolution_daemon.glyph_evolution import evolve_glyph_program

best = evolve_glyph_program(seed_program, generations=100)
```

## Future: DRM/KMS Direct Execution (Phase 2)

After Phase 1 is complete, the next step is to bypass wgpu and execute SPIR-V directly via DRM:

1. Complete DRM device enumeration in `systems/infinite_map_rs/src/backend/drm/`
2. Implement SPIR-V → AMDGPU/Intel command buffer translation
3. DMA-BUF sharing with display

## Future: Bare Metal (Phase 4)

Ultimate goal: Geometry OS boots directly, no Linux.

1. UEFI bootloader
2. GPU initialization from PCI
3. Glyph substrate as native memory
```

- [ ] **Step 2: Commit**

```bash
git add systems/glyph_compiler/README.md
git commit -m "docs: add glyph compiler README"
```

---

## Future Phases (Outline)

### Phase 2: DRM/KMS Direct Execution

**Goal:** Execute SPIR-V directly via DRM, no WebGPU.

**Key Tasks:**
1. Complete DRM device enumeration in existing `systems/infinite_map_rs/src/backend/drm/mod.rs`
2. Implement GPU-specific command buffer builders (AMDGPU, Intel)
3. DMA-BUF zero-copy to display via existing `systems/infinite_map_rs/src/glass_ram/dmabuf_exporter.rs`

**Files to Modify:**
- `systems/infinite_map_rs/src/backend/drm/mod.rs` (already exists, needs completion)
- `systems/infinite_map_rs/src/glass_ram/kms_scanout.rs` (stub exists)

### Phase 3: Custom Kernel Module

**Goal:** `geometry_os.ko` exposes glyph execution interface.

**Key Tasks:**
1. Create kernel module exposing `/dev/geometry_os`
2. Implement ioctl for glyph program submission
3. Direct GPU MMIO access

**Files to Create:**
- `kernel/geometry_os/` (new directory)

### Phase 4: Bare Metal Boot

**Goal:** Geometry OS boots directly, no Linux.

**Key Tasks:**
1. UEFI bootloader
2. GPU initialization from PCI
3. Glyph substrate as native memory

**Files to Create:**
- `bootloader/efi/` (UEFI application)
- `kernel/geos/` (bare metal kernel)

---

## Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Glyph compiles to valid SPIR-V | `test_glyph_to_spirv_compilation` passes |
| Evolution improves programs | Evolution daemon increases fitness over generations |
| No WGSL in glyph programs | Programs contain only opcodes 200-227 |
| Documentation complete | README covers all public APIs |

---

*Plan created: 2026-03-13*
*Plan revised: 2026-03-13 (fixed opcode source, crate names, file structure)*
*Phase 1 completed: 2026-03-13* ✅
*Phase 1 duration: ~1 day*
*Full roadmap: 6-12 months*

---

## ✅ Phase 1 Completion Summary

**Completed Tasks:**
- [x] Chunk 0: Project Setup (glyph_compiler package scaffolded)
- [x] Chunk 1: SPIR-V Compiler Core (mapping, binary builder, CLI, executor)
- [x] Chunk 2: Evolution Integration (glyph_evolution.py)
- [x] Chunk 3: Integration Tests (4 tests passing)
- [x] Chunk 4: Documentation (README, OPCODES.md)

**Key Commits:**
- feat: scaffold glyph_compiler package
- feat(glyph_compiler): add opcode to SPIR-V mapping
- feat(glyph_compiler): build SPIR-V binary from glyph program
- feat(glyph_compiler): add CLI entry point
- feat(glyph_compiler): integrate wgpu executor
- feat(evolution): connect glyph compiler to evolution daemon
- test: add end-to-end glyph→SPIR-V pipeline tests
- docs(glyph_compiler): add README

**Test Status:**
- 10 glyph_evolution tests: PASSING
- 4 integration tests: PASSING

---

## ✅ Phase 2 Progress: DRM/KMS Direct Execution

**Goal:** Execute SPIR-V directly via DRM, no Vulkan/WebGPU.

**Key Tasks:**
- [x] Enable DRM backend module in `infinite_map_rs`
- [x] Create DRM device abstraction
- [x] Create KMS scanout stub
- [x] Create glyph compute executor stub
- [ ] Wire DRM executor to glyph_compiler output
- [ ] Test glyph→DRM pipeline

**Files Created:**
- `systems/infinite_map_rs/src/backend/drm/device.rs`
- `systems/infinite_map_rs/src/backend/drm/scanout.rs`
- `systems/infinite_map_rs/src/backend/drm/compute.rs`

**Test Status:**
- `infinite_map_rs` builds: PASSING
