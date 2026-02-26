---
spec: geometric-font-terminal
phase: requirements
created: 2026-02-26T06:00:00Z
generated: auto
---

# Requirements: geometric-font-terminal

## Summary
Geometric Terminal that executes morphological code on GPU via Geometry OS fonts. Each typed glyph carries visual + instruction data processed by WebGPU compute shader.

## User Stories

### US-1: Execute Morphological Code
As a user, I want to type morphological instructions and see them execute on the GPU in real-time.

**Acceptance Criteria**:
- AC-1.1: Terminal accepts single-line commands with opcodes (+, -, !, #, ?, >, =)
- AC-1.2: Commands compile to glyph texture within 100ms
- AC-1.3: GPU executes compiled texture via FontExecutor.wgsl
- AC-1.4: Results display in terminal output within 200ms

### US-2: Visualize Execution State
As a user, I want to see the current execution state (PC, accumulator, halted status).

**Acceptance Criteria**:
- AC-2.1: State panel shows PC (program counter) value
- AC-2.2: State panel shows accumulator value
- AC-2.3: State panel shows halted boolean
- AC-2.4: State updates after each execution

### US-3: View Output Results
As a user, I want to see output from the PRINT opcode.

**Acceptance Criteria**:
- AC-3.1: PRINT opcode (!) writes accumulator to output buffer
- AC-3.2: Output values display in terminal history
- AC-3.3: Multiple PRINT calls accumulate in output

### US-4: See Glyph Rendering
As a user, I want to see my typed code rendered as geometric glyphs.

**Acceptance Criteria**:
- AC-4.1: Each character renders using GeometryFont atlas
- AC-4.2: Executable glyphs have distinct visual treatment
- AC-4.3: Glyph display updates as user types

### US-5: Use All 8 Opcodes
As a user, I want access to all 8 opcodes for computation.

**Acceptance Criteria**:
- AC-5.1: NOP (implicit for non-code text)
- AC-5.2: LOAD (? operand) - load from memory to accumulator
- AC-5.3: STORE (= operand) - store accumulator to memory
- AC-5.4: ADD (+ operand) - add operand to accumulator
- AC-5.5: SUB (- operand) - subtract operand from accumulator
- AC-5.6: JUMP (> address) - set PC to address
- AC-5.7: PRINT (!) - output accumulator
- AC-5.8: HALT (#) - stop execution

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Terminal UI with command input and history | Must | US-1 |
| FR-2 | GeometryFont integration for glyph rendering | Must | US-4 |
| FR-3 | FontExecutionSystem integration for GPU execution | Must | US-1 |
| FR-4 | State display panel (PC, accumulator, halted) | Must | US-2 |
| FR-5 | Output buffer display for PRINT results | Must | US-3 |
| FR-6 | All 8 opcodes supported via morphological syntax | Must | US-5 |
| FR-7 | Real-time glyph visualization | Should | US-4 |
| FR-8 | Multi-line program support | Should | US-1 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Command execution < 200ms end-to-end | Performance |
| NFR-2 | Works in Chrome/Edge 113+ (WebGPU) | Compatibility |
| NFR-3 | Clear visual distinction between code and output | Usability |

## Out of Scope
- WebGPU polyfill for unsupported browsers
- Custom opcode definitions
- Save/load programs to filesystem
- Multiple concurrent executions

## Dependencies
- PixiJS v8.1.0 (CDN)
- WebGPU API
- Universal Font Atlas assets
- FontExecutor.wgsl shader
