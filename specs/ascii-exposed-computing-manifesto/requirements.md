---
spec: ascii-exposed-computing-manifesto
phase: requirements
created: 2026-02-23T16:00:00Z
generated: auto
---

# Requirements: ascii-exposed-computing-manifesto

## Summary

Write the foundational philosophy document for ASCII Exposed Computing - a design framework establishing principles, patterns, and contracts for building systems where every meaningful state is exposed as readable text for dual human/AI access.

## User Stories

### US-1: Philosophy Reference

As a **system architect**, I want a clear philosophy document so that I can justify ASCII-exposed design decisions to stakeholders.

**Acceptance Criteria**:
- AC-1.1: Document explains WHY ASCII exposure matters (historical context, AI co-working)
- AC-1.2: Document establishes "zero-cost perception" as core value proposition
- AC-1.3: Document references philosophical ancestors (Plan 9, /proc, 12-factor)

### US-2: Principle Reference

As a **developer**, I want numbered principles so that I can evaluate if my system follows ASCII-exposed design.

**Acceptance Criteria**:
- AC-2.1: Each principle has a clear title and 1-2 sentence definition
- AC-2.2: Each principle has "Good" and "Bad" examples
- AC-2.3: Principles cover state, transitions, audiences, grep-ability, diff-ability

### US-3: Dual-Audience Contract

As an **AI agent developer**, I want to know what formatting rules to follow so that my output is readable by both humans and AIs.

**Acceptance Criteria**:
- AC-3.1: Contract defines requirements for human readers (alignment, comments, hierarchy)
- AC-3.2: Contract defines requirements for AI readers (delimiters, type hints, schema markers)
- AC-3.3: Contract explains how to resolve conflicts (dual-format, comments with both values)

### US-4: Design Primitives

As a **system designer**, I want primitive building blocks so that I can compose ASCII-exposed architectures.

**Acceptance Criteria**:
- AC-4.1: Document defines "fragment" as atomic unit with rules
- AC-4.2: Document defines "schema" as explicit type contract
- AC-4.3: Document defines "hook" as change notification mechanism
- AC-4.4: Document defines "namespace" as organization scheme

### US-5: Pattern Catalog

As a **developer**, I want proven patterns so that I don't reinvent solutions.

**Acceptance Criteria**:
- AC-5.1: At least 5 patterns with problem/solution format
- AC-5.2: Each pattern includes code example (Python or pseudocode)
- AC-5.3: Patterns cover aggregation, atomicity, change streams, dual-format, inheritance

### US-6: Anti-Pattern Warnings

As a **developer**, I want to know what NOT to do so that I avoid common mistakes.

**Acceptance Criteria**:
- AC-6.1: At least 5 anti-patterns with bad/good examples
- AC-6.2: Each anti-pattern explains WHY it's harmful
- AC-6.3: Anti-patterns cover binary encoding, infinite growth, timestamp formats, coupling, inconsistency, mutable history

### US-7: Implementation Guidance

As a **team lead**, I want practical guidelines so that I can adopt ASCII exposure in my project.

**Acceptance Criteria**:
- AC-7.1: Document provides checklist for new systems (6 steps)
- AC-7.2: Document provides checklist for existing systems (5 steps)
- AC-7.3: Document provides directory structure template
- AC-7.4: Document explains when NOT to use ASCII exposure

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Document MUST contain Preamble section with historical context | Must | US-1 |
| FR-2 | Document MUST contain exactly 5 Core Principles | Must | US-2 |
| FR-3 | Document MUST contain Dual-Audience Contract with human/AI requirements | Must | US-3 |
| FR-4 | Document MUST contain 4 Design Primitives (Fragments, Schemas, Hooks, Namespaces) | Must | US-4 |
| FR-5 | Document MUST contain 5 Patterns with problem/solution/code | Must | US-5 |
| FR-6 | Document MUST contain 6 Anti-Patterns with bad/good examples | Must | US-6 |
| FR-7 | Document MUST contain Implementation Guidelines with checklists | Must | US-7 |
| FR-8 | Document MUST contain Closing section with references | Should | US-1 |
| FR-9 | Document SHOULD be ~300-400 lines of markdown | Should | - |
| FR-10 | Document SHOULD cross-reference Geometry OS ASCII Scene Graph implementation | Should | - |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Document must render correctly as GitHub-flavored markdown | Usability |
| NFR-2 | All code examples must be syntactically valid | Quality |
| NFR-3 | Tables must have consistent column counts | Usability |
| NFR-4 | Version and date must be included in document | Maintainability |

## Out of Scope

- Actual code implementation (documentation only)
- Test suite for manifesto content
- Interactive diagrams (static ASCII diagrams only)
- Translation to other languages

## Dependencies

- Existing implementation plan at `docs/plans/2026-02-23-ascii-exposed-computing-manifesto.md`
- Geometry OS ASCII Scene Graph code at `systems/visual_shell/ascii_scene/`
