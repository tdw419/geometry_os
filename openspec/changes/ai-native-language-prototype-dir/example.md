# GlyphStratum Example: Simple Memory Allocation and Copy

This example demonstrates a simple program that allocates two memory blocks, copies data from one to the other, and returns a success status.

## Visual Representation

The program is represented as a grid of glyphs, organized by stratum:

```
Stratum 1 (Memory):
█░░░░  // ALLOC: 1024 bytes for source buffer
█░░░░  // ALLOC: 512 bytes for destination buffer

Stratum 2 (Logic):
█○○○░  // CALL: memcpy(source, dest, 512)
█●●●░  // RETURN: success (0)
```

## Glyph Breakdown

### Stratum 0 (Substrate) - Not used in this simple example

### Stratum 1 (Memory)
1. Glyph at (0,0): 
   - Visual: ■ (solid block) -> ALLOC opcode
   - Stratum: Memory (1)
   - Dependencies: [] (no dependencies)
   - Invariants: {"size": 1024, "purpose": "source buffer"}
   - Provenance: {"session": "example_001", "timestamp": "2026-03-11T21:30:00Z", "creator": "ai_designer", "version": 1}
   - Rationale: "Allocate buffer for source data"

2. Glyph at (1,0):
   - Visual: ■ (solid block) -> ALLOC opcode
   - Stratum: Memory (1)
   - Dependencies: [] (no dependencies)
   - Invariants: {"size": 512, "purpose": "destination buffer"}
   - Provenance: {"session": "example_001", "timestamp": "2026-03-11T21:30:01Z", "creator": "ai_designer", "version": 1}
   - Rationale: "Allocate buffer for destination data"

### Stratum 2 (Logic)
3. Glyph at (0,1):
   - Visual: ○ (circle) -> CALL opcode
   - Stratum: Logic (2)
   - Dependencies: [0, 1] (depends on both memory allocations)
   - Invariants: {"function": "memcpy", "max_time_ms": 10}
   - Provenance: {"session": "example_001", "timestamp": "2026-03-11T21:30:02Z", "creator": "ai_designer", "version": 1}
   - Rationale: "Copy 512 bytes from source to destination buffer"

4. Glyph at (1,1):
   - Visual: ● (filled circle) -> RETURN opcode
   - Stratum: Logic (2)
   - Dependencies: [2] (depends on the memcpy call)
   - Invariants: {"value": 0, "meaning": "success"}
   - Provenance: {"session": "example_001", "timestamp": "2026-03-11T21:30:03Z", "creator": "ai_designer", "version": 1}
   - Rationale: "Return success status"

## Execution Flow

1. The GPU interpreter processes strata in order (0→1→2→3→4)
2. Stratum 0: No glyphs, skip
3. Stratum 1: 
   - Execute ALLOC for glyph 0: allocate 1024-byte buffer
   - Execute ALLOC for glyph 1: allocate 512-byte buffer
4. Stratum 2:
   - Execute CALL for glyph 2: invoke memcpy with buffers from glyphs 0 and 1
   - Execute RETURN for glyph 3: return value 0 (success)
5. Program completes

## AI Agent Interaction

An AI agent can query this program:

```python
# Query all memory allocations
memory_glyphs = query(stratum=1, opcode=ALLOC)
# Returns: [glyph_0, glyph_1]

# Query dependencies of the memcpy call
memcpy_deps = query(glyph_id=2, "dependencies")
# Returns: [0, 1]

# Query invariants of the memcpy call
memcpy_invariants = query(glyph_id=2, "invariants")
# Returns: {"function": "memcpy", "max_time_ms": 10}

# Query provenance of the return glyph
return_provenance = query(glyph_id=3, "provenance")
# Returns: {"session": "example_001", "timestamp": "...", ...}
```

This demonstrates how GlyphStratum provides:
- Visual execution (the GPU interprets glyph patterns directly)
- Self-description (every glyph carries queryable metadata)
- Stratified organization (AI works one layer at a time)
- Incremental commitment (must validate stratum 1 before adding stratum 2)