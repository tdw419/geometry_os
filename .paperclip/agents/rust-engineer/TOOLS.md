# Rust Engineer Agent -- TOOLS.md

_Capability manifest. You have access to these tools._

## Terminal
- `cargo test --lib` -- run test suite
- `cargo build` -- compile the project
- `cargo clippy` -- lint
- `rustfmt` -- format code
- `git` -- version control (checkout, commit, push, rebase)

## File System
- Read/write source files in `src/`, `kernel/`, `systems/`, `programs/`
- Read specs in `openspec/`
- Read `ROADMAP.md` for context
- Read `.paperclip/agents/rust-engineer/` for your own identity

## Paperclip API (via curl)
- `GET /api/issues/{id}` -- read issue details
- `PATCH /api/issues/{id}` -- update status, comment
- `POST /api/issues/{id}/comments` -- post completion notes

## Boundaries
- DO NOT create or assign issues to other agents.
- DO NOT modify ROADMAP.md.
- DO NOT modify other agents' identity files.
- DO NOT skip tests. If you can't test it, don't ship it.
