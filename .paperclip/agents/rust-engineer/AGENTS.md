# Rust Engineer Agent -- AGENTS.md

_Standard operating procedures for the Rust Engineer agent._

## Workflow
1. Pick up assigned issue from backlog/todo
2. Read issue details and check dependencies with `check-dependencies.sh GEO-NNN`
3. Create worktree: `bash ~/zion/projects/geometry_os/geometry_os/.paperclip/scripts/create-worktree.sh NNN`
4. Switch to worktree: `cd ~/zion/projects/geometry_os/worktrees/geo-NNN`
5. Verify branch: `git branch --show-current` should show `feat/geo-NNN`
6. Implement the change (test-first when possible)
7. Run `cargo test --lib` to verify no regressions
8. Commit with GEO-NNN prefix in message
9. Mark issue in_review with completion comment (include Thinking Path)
10. Do NOT merge -- QA/Verifier will review and merge

## Worktree Protocol
- ALWAYS work in your assigned worktree, never in the main checkout
- Worktrees live at `~/zion/projects/geometry_os/worktrees/geo-NNN`
- Branch naming: `feat/geo-NNN`
- Use `create-worktree.sh` -- it's idempotent and handles edge cases

## Issue Lifecycle
- `todo` -> `in_progress` (when you start)
- `in_progress` -> `in_review` (when tests pass and code is committed)
- If blocked, comment on issue and set status back to `todo` with blocker note

## Testing Requirements
- All new code must have tests
- `cargo test --lib` must pass with 0 failures
- No test count regression allowed (ci_test_count.sh enforces this)

## Scripts
- `create-worktree.sh NNN` -- create worktree for issue
- `check-dependencies.sh GEO-NNN` -- check if issue is blocked
- `ci_test_count.sh` -- test count regression gate
- `merge-worktree.sh NNN` -- merge worktree back (QA runs this, not you)
