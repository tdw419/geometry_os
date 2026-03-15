# Pattern Extraction Method

How to extract useful patterns from external codebases without importing code baggage.

> **For theoretical foundations:** See `PATTERN_EXTRACTION_EPISTEMOLOGY.md` for the complete academic treatment including cognitive load theory, software archaeology, ADRs, and Intent-Driven Development.

## Overview

When encountering an external project, library, or experimental codebase, the goal is to capture **ideas, not implementations**. Code rots; patterns endure.

## The Process

### Step 1: Scan Documentation First

Read high-level docs before touching code:

```
README.md          → What does it do?
ARCHITECTURE.md    → How is it structured?
docs/summary.md    → What are the key concepts?
```

**Why:** Documentation captures *intent*. Code captures *accident*. Intent is what transfers.

### Step 2: Identify Extractable Categories

Look for these categories:

| Category | What to Extract | Example |
|----------|-----------------|---------|
| **Architectural Patterns** | Structural decisions | "Frozen Bootstrap" - CPU code never changes |
| **Interfaces** | Contracts between components | CPU↔GPU event ring buffer format |
| **Algorithms** | Core logic independent of context | GPU adapter selection priority |
| **Validation Logic** | Startup checks and guards | GPU capability requirements |
| **Naming Conventions** | How things are named | `*_buffer`, `*_pipeline`, `*_contract` |

**Ignore:**
- Specific implementations (they're context-bound)
- Configuration details (they're environment-bound)
- Dependencies (they're ecosystem-bound)

### Step 3: Distill to Essence

For each pattern, capture three things:

```markdown
**Rule:** [What is the pattern? - one sentence]

**Why:** [What problem does it solve? - the motivation]

**How to apply:** [When could we use this? - the trigger]
```

Example:
```markdown
**Rule:** CPU code is frozen after initial development. All new features go to GPU.

**Why:** Prevents CPU complexity growth. Forces GPU sovereignty.

**How to apply:** When building GPU-native systems, limit CPU to I/O proxy only.
```

### Step 4: Write to Memory

Save patterns to the memory system as `type: reference`:

```markdown
---
name: [Source] Patterns
description: Useful patterns from [source] for [domain]
type: reference
---

# [Source] Patterns

[Pattern 1]
[Pattern 2]
[Pattern 3]

---
*Source: [path] - extracted [date]*
```

### Step 5: Clean Up

Remove the source code once patterns are captured:

```bash
rm -rf ./external_project/
```

**Why keep it?** If the patterns are truly useful, you'll remember them. If you need the code later, you can always re-clone.

## Decision Matrix

| Situation | Action |
|-----------|--------|
| Patterns + no code needed | Extract → Remove |
| Patterns + one function needed | Extract → Copy just that function |
| Active dependency | Add to Cargo.toml/package.json |
| Fork candidate | Keep as git submodule |

## Checklist

Before removing source:

- [ ] Read all documentation files
- [ ] Identified 3+ patterns worth keeping
- [ ] Each pattern has Rule/Why/How to apply
- [ ] Written to memory as reference type
- [ ] Added to MEMORY.md index

## Example: GVPIE Bootstrap

**Source:** `gvpie_bootstrap/` (1,352 lines Rust + WGSL, October 2025)

**Patterns extracted:**
1. Frozen Bootstrap - CPU code frozen, GPU evolves
2. Non-Stop Kernel - GPU compute runs continuously
3. I/O Contract - Formal CPU↔GPU interface
4. GPU Requirements Validation - Startup capability checks
5. Smart Adapter Selection - Priority-based GPU picking

**Result:** `memory/gvpie-patterns.md` (50 lines) replaced 1,352 lines + nested git repo

---

*Principle: Code rots. Patterns don't. Extract the thinking, discard the artifact.*
