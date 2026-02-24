# Foundational Synthesis - Tasks

**Plan Reference:** `docs/plans/2026-02-24-foundational-synthesis.md`
**Team:** documentation-synthesis-team

---

## Task 1: Create NORTH_STAR.md - Vision Document

**Agent:** synthesis-lead
**Files:** Create `NORTH_STAR.md`

- [ ] Write document header and Prime Directive
- [ ] Add "What Is Geometry OS?" section
- [ ] Add Core Philosophy table (ASCII Exposed Computing)
- [ ] Add Success Criteria checklist
- [ ] Add Non-Goals section
- [ ] Add Core Loop ASCII diagram
- [ ] Add Current Phase indicator
- [ ] Add Key Metrics table
- [ ] Verify document renders correctly
- [ ] Commit: `docs: add NORTH_STAR.md - definitive vision document`

---

## Task 2: Create ARCHITECTURE.md - System Structure

**Agent:** codebase-analyst
**Files:** Create `ARCHITECTURE.md`

- [ ] Write document header
- [ ] Create system overview ASCII diagram
- [ ] Document Visual Shell component (table + details)
- [ ] Document Neural Event Bus component (table + details)
- [ ] Document Swarm Agents component (table + details)
- [ ] Document Task Board component (table + details)
- [ ] Document Evolution Daemon component (table + details)
- [ ] Document Intelligence System component (table + details)
- [ ] Add Data Persistence table
- [ ] Add Key Abstractions with code blocks
- [ ] Add Testing section with commands
- [ ] Add External Dependencies table
- [ ] Verify document renders correctly
- [ ] Commit: `docs: add ARCHITECTURE.md - system structure and connections`

---

## Task 3: Create OPERATIONS.md - Working Protocol

**Agent:** doc-writer
**Files:** Create `OPERATIONS.md`

- [ ] Write document header
- [ ] Add Autonomy Levels table
- [ ] Add Commit Protocol section with examples
- [ ] Add Testing Requirements section
- [ ] Add Definition of Done checklist
- [ ] Add Code Style section (Python + JavaScript)
- [ ] Add File Organization patterns
- [ ] Add Review Process section
- [ ] Add Memory Management guidelines
- [ ] Add Emergency Protocols section
- [ ] Add Quick Reference commands
- [ ] Verify document renders correctly
- [ ] Commit: `docs: add OPERATIONS.md - working protocol and conventions`

---

## Task 4: Reorganize MEMORY.md into Topic Files

**Agent:** memory-organizer
**Files:**
- Modify `memory/MEMORY.md`
- Create `memory/neb.md`
- Create `memory/swarm-guilds.md`
- Create `memory/senses.md`
- Create `memory/memory-growth.md`
- Create `memory/evolution.md`
- Create `memory/visual-shell.md`

- [ ] Read current MEMORY.md content
- [ ] Create `memory/neb.md` with NEB details
- [ ] Create `memory/swarm-guilds.md` with guild details
- [ ] Create `memory/senses.md` with senses details
- [ ] Create `memory/memory-growth.md` with memory system details
- [ ] Create `memory/evolution.md` with evolution daemon details
- [ ] Create `memory/visual-shell.md` with visual shell details
- [ ] Create new MEMORY.md as index (<50 lines)
- [ ] Verify all topic files have required sections
- [ ] Verify MEMORY.md links to all topic files
- [ ] Commit: `refactor: reorganize MEMORY.md into topic files`

---

## Task 5: Update AGENTS.md with Doc References

**Agent:** doc-writer
**Files:** Modify `AGENTS.md`

- [ ] Read current AGENTS.md content
- [ ] Add "Foundational Documents" section at top
- [ ] Add numbered list with links to three docs
- [ ] Verify links work correctly
- [ ] Commit: `docs: add foundational doc references to AGENTS.md`

---

## Task 6: Final Verification

**Agent:** synthesis-lead
**Files:** None (verification only)

- [ ] Verify `NORTH_STAR.md` exists
- [ ] Verify `ARCHITECTURE.md` exists
- [ ] Verify `OPERATIONS.md` exists
- [ ] Verify `memory/MEMORY.md` < 50 lines
- [ ] Verify all 6 topic files exist in `memory/`
- [ ] Verify `AGENTS.md` has foundational docs section
- [ ] Run: `pytest systems/swarm/ -v --tb=short` (expect 180 tests passing)
- [ ] Check git status is clean or committed
- [ ] Report completion status

---

## Summary

| Task | Files | Commits |
|------|-------|---------|
| 1 | NORTH_STAR.md | 1 |
| 2 | ARCHITECTURE.md | 1 |
| 3 | OPERATIONS.md | 1 |
| 4 | memory/*.md (7 files) | 1 |
| 5 | AGENTS.md | 1 |
| 6 | Verification | 0 |

**Total:** 10 files, 5 commits
