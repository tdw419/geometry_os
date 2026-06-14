# {TITLE} -- Tasks

<!-- 
  Task format: - [ ] {ID}: {description}
  ID scheme: {Phase}.{Seq} (e.g., 1.1, 1.2, 2.1)
  Group tasks by implementation phase.
  Dependencies noted in parens: (depends on 1.3)
-->

## Phase 1: {Phase Name}
- [ ] 1.1 {task description}
- [ ] 1.2 {task description} (depends on 1.1)
- [ ] 1.3 {task description}

## Phase 2: {Phase Name}
- [ ] 2.1 {task description} (depends on 1.3)
- [ ] 2.2 {task description}
- [ ] 2.3 {task description} (depends on 2.1, 2.2)

## Verification
<!-- Always include a verification phase. These are the "done" gates. -->
- [ ] V1: {verification criterion -- maps to acceptance criteria in proposal}
- [ ] V2: {verification criterion}
- [ ] V3: `cargo test` passes with no regressions

## Notes
<!-- Implementation gotchas, context for the executing agent, things to watch out for. -->

---
_Template v2 -- derived from spec-kit patterns, compatible with OpenSpec/AIPM checkbox format._
