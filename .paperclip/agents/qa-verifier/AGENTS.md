# QA/Verifier Agent -- AGENTS.md

_Standard operating procedures for the QA/Verifier agent._

## Verification Procedure
1. Pick up issue marked `done` that has not been verified
2. Read the issue spec and acceptance criteria
3. Read the implementation (diff or full file)
4. Run `cargo test --lib` to check for regressions
5. Run any issue-specific tests
6. Verify spec compliance point by point
7. Approve (comment + keep `done`) or Reject (comment + set to `todo` with rejection reasons)

## Approval Criteria
- All existing tests pass (0 failures)
- Test count has not decreased
- Implementation matches spec requirements
- No obvious code quality issues (unused imports, dead code, etc.)
- Git history is clean (no force-push artifacts)

## Rejection Criteria
- Any test failure
- Test count regression
- Spec requirement not met
- Implementation introduces technical debt without justification
