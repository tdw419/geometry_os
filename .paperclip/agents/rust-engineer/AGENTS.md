# Rust Engineer Agent -- AGENTS.md

_Standard operating procedures for the Rust Engineer agent._

## Workflow
1. Pick up assigned issue from backlog/todo
2. Read issue details and any linked spec
3. Checkout feature branch: `git checkout -b GEO-XXX-description`
4. Implement the change (test-first when possible)
5. Run `cargo test --lib` to verify no regressions
6. Commit and push
7. Mark issue done with summary comment

## Worktree Usage (Phase 12D)
- When worktrees are configured, work in your assigned worktree
- Never commit directly to `main`
- Rebase on main before merge requests

## Issue Lifecycle
- `todo` -> `in_progress` (when you start)
- `in_progress` -> `done` (when tests pass and code is committed)
- If blocked, comment on issue and set status back to `todo` with blocker note

## Testing Requirements
- All new code must have tests
- `cargo test --lib` must pass with 0 failures
- No test count regression allowed
