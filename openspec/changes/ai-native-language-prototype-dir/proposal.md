# AI-Native Language Proposal: GlyphStratum

## Problem Statement
AI has never successfully built a complex software system end-to-end without human architects holding the whole system in mind. This is not merely a capability issue but a representation mismatch - human languages require human working memory patterns.

## Core Insight
Geometry OS already contains the seeds of an AI-native language through its:
- Visual computation substrate (WebGPU/SPIR-V)
- Font rendering systems (FreeType + fontdue)
- "State as Text" philosophy
- Dual-audience design (human/AI readable)
- Evolution daemon (self-observation/repair)
- Visual shell (topological rendering)

## Solution: GlyphStratum
A stratified, self-describing visual programming language where:
1. Programs exist as layered glyph arrangements
2. Each glyph carries executable semantics AND metadata
3. Layers enforce incremental commitment
4. Metadata enables self-observation/queryability

### Architecture Layers (Bottom to Top)

#### Layer 0: Visual Substrate (Existing)
- Geometry OS font atlas as executable canvas
- Each cell = 64x64 pixel glyph slot
- GPU-native rendering via existing WGPU pipeline
- **Current**: `systems/infinite_map_rs/src/font_atlas.rs`

#### Layer 1: Glyph Opcodes (New)
Each rendered glyph encodes both:
- Visual opcode (executable instruction)
- Embedded metadata (self-description)

```
Glyph Structure:
├── Visual Pattern (64x64 RGBA)
├── Opcode ID (uint8): Maps to GPU compute shader
├── Dependencies (glyph_ids[]): Explicit data/control flow
├── Invariants (constraints): e.g., "memory < 100MB"
├── Provenance (session_id, timestamp)
└── Rationale (natural language): Human-readable intent
```

#### Layer 2: Semantic Strata (New)
Program organization by concern:
- **Stratum 0: Substrate** - Raw pixel/glyph operations
- **Stratum 1: Memory** - Allocation, layout, types
- **Stratum 2: Logic** - Control flow, computation
- **Stratum 3: Spec** - Component interfaces, contracts
- **Stratum 4: Intent** - Goals, requirements, rationale

AI works one stratum at a time but always sees adjacent context.

#### Layer 3: Query Interface (New)
Self-description via introspection:
- `query(glyph_id, "dependencies")` → affected glyphs
- `query("all", "invariant:memory")` → memory-constrained ops
- `query(stratum=3, "modified_after:t")` → recent spec changes
- Visual highlighting of query results in compositor

### Implementation Path

#### Phase 1: Extend Font Atlas (Week 1-2)
- Modify `FontAtlas` to carry opcode/metadata per glyph
- Add GPU shader that interprets glyph patterns as opcodes
- Create opcode → compute shader mapping (ALLOC, FREE, LOOP, etc.)

#### Phase 2: Stratum Enforcement (Week 3-4)
- Build stratum-aware editor/layer system
- Enforce bottom-up construction (can't add logic stratum without memory stratum)
- Visual layer toggling in Infinite Map compositor

#### Phase 3: Self-Annotation System (Week 5-6)
- Embed metadata in glyph rendering
- Build query API for introspection
- Create visualization of dependencies/invariants

#### Phase 4: Evolution Integration (Week 7-8)
- Connect to evolution daemon for:
  - Automatic rollback when invariants violated
  - Visual fracture detection in stratum transitions
  - Self-modification via glyph replacement

### OpenSpec Workflow Integration
1. **Proposal**: This document (`openspec/changes/ai-native-language-prototype-dir/proposal.md`)
2. **Tasks**: Break down implementation phases
3. **Apply**: `/openspec:apply ai-native-language-prototype-dir`
4. **Archive**: `/openspec:archive ai-native-language-prototype-dir` when complete

### Initial Glyph Opcode Set
Based on Geometry OS's visual computation strengths:

| Glyph Pattern | Opcode | Semantics | Visual Example |
|---------------|--------|-----------|----------------|
| ◼ (solid)     | ALLOC  | Allocate memory block | ■ |
| ◻ (hollow)    | FREE   | Release memory block | □ |
| ◆ (diamond)   | LOOP   | Begin iteration construct | ◇ |
| ◈ (lozenge)   | BRANCH | Conditional execution | ◇ |
| ○ (circle)    | CALL   | Function/subroutine invocation | ○ |
| ● (filled)    | RETURN | Exit current scope | ● |
| ░ (light)     | DATA   | Literal/constant value | ░ |
| ▓ (medium)    | TYPE   | Type declaration/constraint | ▓ |
| █ (dark)      | MODULE | Encapsulation boundary | █ |

### Dual-Audience Preservation
- **AI Reads**: Structured metadata, query interface, stratified execution
- **Humans See**: Visual programs with optional metadata overlays
- **Both Can**: Modify programs (AI via stratum editing, humans via visual arrangement)

### Solving the Core Problems

1. **Representation Mismatch** → Spatial/visual representation matches AI's pattern recognition strengths. Whole program visible in single "glance" via GPU render.

2. **Missing Reflection** → Every glyph is self-describing. AI can query "what does this program do?" and get accurate answers from the program itself.

3. **No Incremental Commitment** → Stratum system forces bottom-up construction. Can't build logic stratum without verified memory stratum. Each glyph addition is atomic and visually verifiable.

4. **Context Exhaustion** → Work in strata (chunks that fit in context). Adjacent strata always visible for cross-layer awareness.

## Files to Modify/Create
- `systems/infinite_map_rs/src/font_atlas.rs` - Extend for opcode/metadata
- `systems/infinite_map_rs/src/lib.rs` - Add stratum rendering system
- New: `systems/glyph_stratum/` - Core language implementation
- New: `shaders/glyph_opcodes.wgsl` - GPU interpreter for glyphs
- New: `openspec/specs/glyph-stratum/spec.md` - Full specification

## First Experiment
Create a "Hello World" equivalent:
1. Allocate memory stratum (█░░░░)
2. Store string data stratum (█▓▓▓░)
3. Call render function stratum (█○○○░)
4. Return stratum (█●●●░)

Visual: 
```
█░░░░
█▓▓▓░
█○○○░
█●●●░
```

Where AI can query each glyph for its dependencies, invariants, and rationale while seeing the exact visual program structure.

This approach leverages Geometry OS's existing visual computation infrastructure while addressing the fundamental limitation that prevents AI from building complex systems: lack of native, observable, stratified representation that matches AI cognition patterns.