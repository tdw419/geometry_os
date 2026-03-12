# glyph-stratum Specification

## Purpose
Define a stratified, self-describing visual programming language that enables AI to build and maintain complex software systems by providing native, observable, and incrementally commitable representation that matches AI cognition patterns.

## Requirements

### Requirement: Glyph Opcode Encoding
The system SHALL encode executable semantics in visual glyph patterns where each rendered glyph represents an opcode with embedded metadata.

#### Scenario: Basic Opcode Execution
- **WHEN** a glyph with ALLOC opcode is rendered in the font atlas
- **THEN** the GPU interpreter allocates a memory block
- **AND** the glyph's metadata records the allocation size and purpose

#### Scenario: Opcode Metadata
- **WHEN** a glyph is rendered
- **THEN** its metadata (dependencies, invariants, provenance, rationale) is accessible via query interface
- **AND** the metadata travels with the glyph through all transformations

### Requirement: Semantic Strata
The system SHALL organize programs into five semantic strata that enforce bottom-up construction and incremental commitment.

#### Scenario: Stratum Layering
- **WHEN** viewing a GlyphStratum program
- **THEN** the program is organized into strata: Substrate (0), Memory (1), Logic (2), Spec (3), Intent (4)
- **AND** each stratum builds upon the validated strata below it

#### Scenario: Stratum Enforcement
- **WHEN** attempting to place a Logic stratum glyph
- **THEN** the system verifies Memory stratum validity first
- **AND** prevents placement if Memory stratum has unresolved invariants

### Requirement: Self-Description Query Interface
The system SHALL provide a query interface for introspecting glyph properties, dependencies, and program structure.

#### Scenario: Dependency Query
- **WHEN** querying `query(glyph_id_42, "dependencies")`
- **THEN** the system returns the set of glyph IDs that glyph 42 depends on
- **AND** the result includes both data and control dependencies

#### Scenario: Invariant Query
- **WHEN** querying `query("all", "invariant:memory")`
- **THEN** the system returns all glyphs with memory-related invariants
- **AND** highlights them in the visual substrate

#### Scenario: Provenance Query
- **WHEN** querying `query(glyph_id_17, "provenance")`
- **THEN** the system returns session ID, timestamp, and modification history
- **AND** shows which AI session created/modified the glyph

### Requirement: Evolution Daemon Integration
The system SHALL integrate with the evolution daemon for self-observation, repair, and improvement.

#### Scenario: Invariant Violation Detection
- **WHEN** a glyph's invariant is violated during execution
- **THEN** the evolution daemon is notified
- **AND** triggers an Ouroboros Repair Cycle if configured

#### Scenario: Visual Fracture Detection
- **WHEN** anomalous patterns appear in stratum transitions
- **THEN** the evolution daemon detects visual fractures
- **AND** initiates analysis of recent stratum modifications

#### Scenario: Self-Modification
- **WHEN** the evolution daemon determines a program improvement
- **THEN** it safely modifies glyphs in the font atlas
- **AND** records the change in glyph provenance metadata

### Requirement: Dual-Audience Preservation
The system SHALL maintain readability for both AI and human audiences.

#### Scenario: AI Readability
- **WHEN** an AI agent examines a GlyphStratum program
- **THEN** it can query structure, dependencies, and semantics programmatically
- **AND** execute the program via GPU interpretation

#### Scenario: Human Readability
- **WHEN** a human views a GlyphStratum program
- **THEN** they see the visual glyph arrangement
- **AND** can optionally overlay metadata for detailed inspection

### Requirement: GPU-Native Execution
The system SHALL execute programs natively on the GPU via WebGPU compute shaders.

#### Scenario: Opcode Execution
- **WHEN** the render loop processes the font atlas
- **THEN** each glyph's opcode is executed by the GPU compute shader
- **AND** memory operations, control flow, and data manipulation occur in GPU memory

#### Scenario: Performance Target
- **WHEN** executing a GlyphStratum program with 1000 active glyphs
- **THEN** the system maintains 60 FPS (16.6ms per frame)
- **AND** GPU compute time per frame remains under 8ms

## OpenSpec Workflow

### Creating a New Feature
1. Work in the appropriate stratum (start with Memory for data structures)
2. Add glyphs with proper opcodes and metadata
3. Verify stratum invariants before progressing
4. Use query interface to validate program properties
5. Let evolution daemon monitor for self-improvement opportunities

### Example: Simple Memory Allocation Program
```
Stratum 1 (Memory): 
█░░░░  // ALLOC: 1024 bytes for buffer
█░░░░  // ALLOC: 512 bytes for header

Stratum 2 (Logic):
█○○○░  // CALL: memcpy(source, dest, size)
█●●●░  // RETURN: success status
```

Where AI can query each glyph to understand:
- What memory each ALLOC reserves
- What the memcpy CALL depends on
- What invariants govern the memory usage
- Which session created each glyph and why