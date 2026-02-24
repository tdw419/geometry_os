# Foundational Synthesis - Requirements

**Goal:** Create foundational documentation that provides clear direction, architecture understanding, and operational protocol for Geometry OS.

---

## REQ-001: NORTH_STAR.md - Vision Document

**Priority:** Critical

| Requirement | Description |
|-------------|-------------|
| REQ-001.1 | Define "Prime Directive" - The Screen is the Hard Drive |
| REQ-001.2 | Explain what Geometry OS is in 3 bullet points |
| REQ-001.3 | Reference ASCII Exposed Computing philosophy |
| REQ-001.4 | Define success criteria (Definition of Done) |
| REQ-001.5 | List non-goals (what we're NOT building) |
| REQ-001.6 | Show core loop diagram |
| REQ-001.7 | Include current phase indicator |
| REQ-001.8 | List key metrics with targets |

**Acceptance Criteria:**
- [ ] New developer can understand project purpose in <5 minutes
- [ ] All decisions can trace back to this document
- [ ] Length ~100 lines, scannable format

---

## REQ-002: ARCHITECTURE.md - System Structure

**Priority:** Critical

| Requirement | Description |
|-------------|-------------|
| REQ-002.1 | ASCII diagram showing system overview |
| REQ-002.2 | Document each core component with table |
| REQ-002.3 | Show data flow between components |
| REQ-002.4 | List key abstractions (NEBSignal, Task, Experience) |
| REQ-002.5 | Document topic namespaces for NEB |
| REQ-002.6 | List test locations and run commands |
| REQ-002.7 | List external dependencies |
| REQ-002.8 | Include code examples for key patterns |

**Acceptance Criteria:**
- [ ] Developer can understand system structure in <10 minutes
- [ ] All major components documented
- [ ] Data flow is clear from diagram
- [ ] Length ~250 lines

---

## REQ-003: OPERATIONS.md - Working Protocol

**Priority:** Critical

| Requirement | Description |
|-------------|-------------|
| REQ-003.1 | Define autonomy levels (Propose & Wait, Execute & Report) |
| REQ-003.2 | Document commit protocol with examples |
| REQ-003.3 | List testing requirements before commit |
| REQ-003.4 | Define "Definition of Done" checklist |
| REQ-003.5 | Document code style conventions |
| REQ-003.6 | Show file organization patterns |
| REQ-003.7 | Document review process |
| REQ-003.8 | Include emergency protocols |
| REQ-003.9 | Provide quick reference commands |

**Acceptance Criteria:**
- [ ] Clear guidance on when to ask vs execute
- [ ] Commit format is unambiguous
- [ ] Testing requirements are specific
- [ ] Length ~250 lines

---

## REQ-004: Memory Reorganization

**Priority:** High

| Requirement | Description |
|-------------|-------------|
| REQ-004.1 | Trim MEMORY.md to <50 line index |
| REQ-004.2 | Create memory/neb.md for NEB details |
| REQ-004.3 | Create memory/swarm-guilds.md for guild details |
| REQ-004.4 | Create memory/senses.md for senses details |
| REQ-004.5 | Create memory/memory-growth.md for memory system |
| REQ-004.6 | Create memory/evolution.md for evolution daemon |
| REQ-004.7 | Create memory/visual-shell.md for visual shell |
| REQ-004.8 | Each topic file has: Status, Location, Components, Usage |

**Acceptance Criteria:**
- [ ] MEMORY.md loads completely (no truncation)
- [ ] Each topic file is self-contained
- [ ] Index links to all topic files
- [ ] No duplicate information

---

## REQ-005: AGENTS.md Update

**Priority:** Medium

| Requirement | Description |
|-------------|-------------|
| REQ-005.1 | Add reference to NORTH_STAR.md at top |
| REQ-005.2 | Add reference to ARCHITECTURE.md |
| REQ-005.3 | Add reference to OPERATIONS.md |
| REQ-005.4 | Maintain existing content |

**Acceptance Criteria:**
- [ ] New foundational docs are discoverable from AGENTS.md
- [ ] Reading order is clear

---

## Non-Functional Requirements

### NFR-001: Readability
- All documents use scannable markdown format
- Tables for structured information
- Code blocks for examples
- Headers for navigation

### NFR-002: Maintainability
- "Last updated" date on each document
- Links to source material where appropriate
- Version info where relevant

### NFR-003: Completeness
- No TODO placeholders
- All sections filled in
- All examples runnable

---

## Out of Scope

- Updating individual spec files
- Creating new system components
- Modifying test files
- Code implementation
