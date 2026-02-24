# Foundational Synthesis - Technical Design

**Approach:** Synthesize existing knowledge into three foundational documents and reorganized memory structure.

---

## Document Locations

| Document | Path | Purpose |
|----------|------|---------|
| NORTH_STAR.md | `/NORTH_STAR.md` | Root level, highly visible |
| ARCHITECTURE.md | `/ARCHITECTURE.md` | Root level, next to vision |
| OPERATIONS.md | `/OPERATIONS.md` | Root level, workflow guide |
| MEMORY.md | `memory/MEMORY.md` | Claude project memory (index) |
| Topic files | `memory/*.md` | Detailed topic documentation |

---

## NORTH_STAR.md Structure

```markdown
# Geometry OS - North Star

> The definitive vision document...

## The Prime Directive
"The Screen is the Hard Drive."

## What Is Geometry OS?
[3 bullet points]

## Core Philosophy: ASCII Exposed Computing
[Table of 4 principles]

## Success Criteria (Definition of Done)
[Checklist with metrics]

## Non-Goals
[What we're NOT building]

## The Core Loop
[ASCII diagram]

## Current Phase
[Phase indicator]

## Key Metrics
[Table with targets]
```

---

## ARCHITECTURE.md Structure

```markdown
# Geometry OS - Architecture

## System Overview
[Large ASCII diagram]

## Core Components
[6 sections, each with table and details]

### 1. Visual Shell
### 2. Neural Event Bus
### 3. Swarm Agents
### 4. Task Board
### 5. Evolution Daemon
### 6. Intelligence System

## Data Persistence
[Table of .geometry/ contents]

## Key Abstractions
[Code blocks for NEBSignal, Task, Experience]

## Testing
[Test locations and commands]

## External Dependencies
[Table of key dependencies]
```

---

## OPERATIONS.md Structure

```markdown
# Geometry OS - Operations Protocol

## Autonomy Levels
[Table: Level 1-3 with when to use]

## Commit Protocol
[Format, types, examples, frequency]

## Testing Requirements
[Before committing checklist]

## Definition of Done
[Task completion checklist]

## Code Style
[Python and JavaScript conventions]

## File Organization
[New features and specs patterns]

## Review Process
[Self-review checklist]

## Memory Management
[What to remember/not remember]

## Emergency Protocols
[Tests fail, daemon misbehaves, lost context]

## Quick Reference
[Command cheat sheet]
```

---

## Memory Reorganization Design

### New Structure

```
memory/
├── MEMORY.md          # Index only (<50 lines)
├── neb.md             # Neural Event Bus details
├── swarm-guilds.md    # Guild agents details
├── senses.md          # Senses details
├── memory-growth.md   # Memory & Growth details
├── evolution.md       # Evolution Daemon details
└── visual-shell.md    # Visual Shell details
```

### MEMORY.md Template

```markdown
# Geometry OS - Memory Index

> Index only. See linked files for details.

## Active Systems
[Table: System | Status | Tests | Details link]

## Quick Stats
[Total tests, evolution cycles]

## Key Paths
[Important directory paths]

## Philosophy
[Link to manifesto]

*Last updated: YYYY-MM-DD*
```

### Topic File Template

```markdown
# [Topic Name]

**Status:** [Complete/Active/Planned]
**Location:** `path/to/files/`

## Components
[Table: Component | Tests | Description]

## Usage
[Code example]

## Architecture
[Key design notes]
```

---

## AGENTS.md Update Design

Add at top:
```markdown
## Foundational Documents

Before working on Geometry OS, read these in order:

1. **[NORTH_STAR.md](NORTH_STAR.md)** - Vision and direction
2. **[ARCHITECTURE.md](ARCHITECTURE.md)** - System structure
3. **[OPERATIONS.md](OPERATIONS.md)** - Working protocol

---
```

---

## Implementation Approach

### Phase 1: Create Documents (Tasks 1-3)
- Each document created in single task
- Complete content from plan
- Immediate commit after creation

### Phase 2: Reorganize Memory (Task 4)
- Create all topic files first
- Then trim MEMORY.md to index
- Single commit for reorganization

### Phase 3: Update References (Task 5)
- Update AGENTS.md with doc links
- Verify all links work

### Phase 4: Verification (Task 6)
- Verify all files exist
- Check line counts
- Run existing tests (ensure no breakage)

---

## Content Sources

| Content | Source |
|---------|--------|
| Prime Directive | User input + manifesto |
| Philosophy | ASCII Exposed Computing Manifesto |
| Architecture | Codebase exploration + MEMORY.md |
| Operations | Established patterns + user preferences |
| Memory topics | Current MEMORY.md content |

---

## Validation Criteria

- [ ] All three root documents exist
- [ ] MEMORY.md < 50 lines
- [ ] All topic files exist
- [ ] AGENTS.md updated
- [ ] All tests still pass
- [ ] No broken links
