---
spec: ascii-exposed-computing-manifesto
phase: tasks
total_tasks: 8
created: 2026-02-23T16:00:00Z
generated: auto
---

# Tasks: ascii-exposed-computing-manifesto

## Phase 1: Make It Work (POC)

Focus: Create the complete manifesto document with all sections. Accept iterative refinement.

- [x] 1.1 Create manifesto file with Preamble
  - **Do**: Create `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md` with preamble section including historical context, AI perception model, definition, and zero-cost perception concept
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: File exists with header and ~30 line preamble
  - **Verify**: `head -40 docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md | grep -c "Preamble"`
  - **Commit**: `docs(manifesto): begin ASCII Exposed Computing Manifesto with preamble`
  - _Requirements: FR-1_
  - _Design: Section 1_

- [x] 1.2 Add Core Principles section
  - **Do**: Append 5 principles (State as Text, Transition as Edit, Dual-Audience, Grep-ability, Diff-ability) with Good/Bad examples
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: `grep -c "### Principle" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md` returns 5
  - **Verify**: `grep "### Principle" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Commit**: `docs(manifesto): add core principles to ASCII manifesto`
  - _Requirements: FR-2, AC-2.1, AC-2.2, AC-2.3_
  - _Design: Section 2_

- [x] 1.3 Add Dual-Audience Contract section
  - **Do**: Append contract with Human requirements table, AI requirements table, and Tension resolution section
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: Two tables present with 5+ rows each
  - **Verify**: `grep -c "|.*|.*|" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md` returns 10+
  - **Commit**: `docs(manifesto): add dual-audience contract to ASCII manifesto`
  - _Requirements: FR-3, AC-3.1, AC-3.2, AC-3.3_
  - _Design: Section 3_

- [x] 1.4 Add Design Primitives section
  - **Do**: Append 4 primitives (Fragments, Schemas, Hooks, Namespaces) with definitions, rules, and code examples
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: All 4 primitives documented with code blocks
  - **Verify**: `grep "### Fragments\|### Schemas\|### Hooks\|### Namespaces" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Commit**: `docs(manifesto): add design primitives to ASCII manifesto`
  - _Requirements: FR-4, AC-4.1, AC-4.2, AC-4.3, AC-4.4_
  - _Design: Section 4_

- [x] 1.5 Add Patterns section
  - **Do**: Append 5 patterns (Scene Graph Aggregation, Atomic File Writes, Change Streams, Dual-Format Fragments, Fragment Inheritance) with Problem/Solution/Code format
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: 5 patterns with `### Pattern:` headers
  - **Verify**: `grep -c "### Pattern:" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Commit**: `docs(manifesto): add design patterns to ASCII manifesto`
  - _Requirements: FR-5, AC-5.1, AC-5.2, AC-5.3_
  - _Design: Section 5_

- [x] 1.6 Add Anti-Patterns section
  - **Do**: Append 6 anti-patterns (Binary in ASCII Clothing, Infinite Fragments, Timestamps Without Meaning, Fragment Coupling, Inconsistent Delimiters, Mutable History) with Bad/Good/Why format
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: 6 anti-patterns with `### Anti-Pattern:` headers
  - **Verify**: `grep -c "### Anti-Pattern:" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Commit**: `docs(manifesto): add anti-patterns to ASCII manifesto`
  - _Requirements: FR-6, AC-6.1, AC-6.2, AC-6.3_
  - _Design: Section 6_

- [x] 1.7 Add Implementation Guidelines section
  - **Do**: Append checklists for new/existing systems, directory structure template, performance table, and "When NOT to use" section
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: Both checklists present, directory tree visible
  - **Verify**: `grep "### Starting a New\|### Adding to Existing" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Commit**: `docs(manifesto): add implementation guidelines to ASCII manifesto`
  - _Requirements: FR-7, AC-7.1, AC-7.2, AC-7.3, AC-7.4_
  - _Design: Section 7_

- [ ] 1.8 Add Closing and References section
  - **Do**: Append Closing summary, References list (Plan 9, /proc, 12-factor, Geometry OS), Contributors, and version footer
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: Document has complete closing with version info
  - **Verify**: `grep -c "## Closing\|## References\|Version" docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Commit**: `docs(manifesto): complete ASCII Exposed Computing Manifesto v1.0`
  - _Requirements: FR-8, FR-10_
  - _Design: Section 8_

## Phase 2: Refactoring

After POC validated, clean up and refine.

- [ ] 2.1 Validate markdown rendering
  - **Do**: Check document renders correctly in GitHub markdown, fix any syntax issues
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: No markdown lint errors
  - **Verify**: `pandoc docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md -o /tmp/test.html 2>&1` (no errors)
  - **Commit**: `fix(manifesto): correct markdown syntax`
  - _Design: NFR-1, NFR-3_

- [ ] 2.2 Verify code examples
  - **Do**: Ensure all Python code examples are syntactically valid
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: All fenced code blocks with `python` label parse
  - **Verify**: Extract and run `python -m py_compile` on each block
  - **Commit**: `fix(manifesto): correct code example syntax`
  - _Design: NFR-2_

## Phase 3: Testing

- [ ] 3.1 Document structure validation
  - **Do**: Verify all 8 sections present and properly ordered
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: Section headers match design spec
  - **Verify**: `grep "^## " docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md | wc -l` = 8
  - **Commit**: `test(manifesto): verify document structure`
  - _Requirements: All FRs_

- [ ] 3.2 Cross-reference validation
  - **Do**: Ensure internal references to sections work
  - **Files**: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`
  - **Done when**: All `###` references resolve
  - **Verify**: Manual review of section links
  - **Commit**: `test(manifesto): verify cross-references`

## Phase 4: Quality Gates

- [ ] 4.1 Final document review
  - **Do**: Complete read-through for clarity, consistency, completeness
  - **Verify**: `wc -l docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md` shows ~300-400 lines
  - **Done when**: Document meets FR-9 line count, all NFRs satisfied
  - **Commit**: `docs(manifesto): finalize v1.0 for release`

- [ ] 4.2 Create PR and verify
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr view` shows clean diff
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: Single commit per section, may combine if needed
- **Production TODOs**: Consider adding diagrams if document grows, translate to other formats (HTML, PDF) for distribution
