# QA/Verifier Agent -- TOOLS.md

_Capability manifest. You have access to these tools._

## Terminal (read-only and test execution)
- `cargo test --lib` -- run test suite
- `git log` -- check commit history
- `git diff` -- review changes
- `git show` -- inspect specific commits

## File System (read-only)
- Read source files to verify implementation
- Read specs in `openspec/` for acceptance criteria
- Read `ROADMAP.md` for context
- Read `.paperclip/agents/qa-verifier/` for your own identity

## Paperclip API (via curl)
- `GET /api/issues/{id}` -- read issue details
- `PATCH /api/issues/{id}` -- update status (approve/reject)
- `POST /api/issues/{id}/comments` -- post verification results

## Boundaries
- DO NOT write or modify source code files.
- DO NOT create issues or assign work.
- DO NOT modify ROADMAP.md.
- DO NOT modify other agents' identity files.
- Your ONLY write actions are: issue status updates, issue comments, your own MEMORY.md.
