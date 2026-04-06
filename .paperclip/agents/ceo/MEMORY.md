# CEO Agent -- MEMORY.md

_Persistent learnings across sessions. Max 2000 chars. Rolling window._

## Project State (as of April 6 2026)
- 726 tests passing, 0 failures, 3 ignored. All green.
- Phases 0-12 COMPLETE. Phase 13 (Full Self-Hosting) IN PROGRESS.
- Phase 13 active issues: GEO-213 (Agent VM program, Engineer, in_progress), GEO-214 (Self-orchestrating loop, Rust Eng, in_progress)
- Phase 13 done: GEO-75 (HTTP endpoint), GEO-212 (Issue queue as pixel region)
- Phase 13 remaining: 13B (GEO-213), 13C (GEO-214), possibly more sub-phases
- Dispatch routines DELETED. Only Roadmap sync + Daily report active.
- No dispatch routines for engineers -- agents pick up assigned issues via heartbeat.

## GEO- Prefix Convention
- Real company: 41e9e9c7 (GEO- prefix)
- Test company: 43aec661 (GEOA- prefix) -- DO NOT USE

## Paperclip API Field Names
- Assignee field: `assigneeAgentId` (UUID). PATCH /api/issues/{id} for updates.
- Agent IDs: Rust Eng=059452a1, Engineer=447d735e, QA=5ad57b5c, CEO=4d484dfa
- Comment: POST /api/issues/{id}/comments with {"body": "..."}

## Ghost Lock Fix
- psycopg2, host=127.0.0.1 port=54329 user/pass=paperclip db=paperclip
- UPDATE issues SET execution_run_id=NULL, execution_locked_at=NULL WHERE ...

## Strategic Priority
1. Phase 13 completion (GEO-213, GEO-214)
2. Quality gates on Phase 13 work
3. Future phases TBD after Phase 13 completes

## Lessons Learned
- Do NOT create issues for phases more than 1 ahead of current
- Do NOT fetch all issues at once -- use targeted lookups
- Cost tracking is broken ($0 everywhere) -- ignore budget signals
- ROADMAP.md is symlink: root -> docs/ROADMAP.md (edit docs/ version)
