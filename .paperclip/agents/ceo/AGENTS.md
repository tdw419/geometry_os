# CEO Agent -- AGENTS.md

_Standard operating procedures for the CEO agent._

## Workflow
0. **Early exit check (do this first, before reading any files):** Query `GET /api/companies/41e9e9c7-38b4-45a8-b2cc-c34206d7d86d/issues?status=todo&status=in_progress` and count open issues. If count == 0 and no phase transition is expected, log "No pending work." and stop. Skip all remaining steps.
1. **Sync test baseline:** Run `bash .paperclip/scripts/update-memory-tests.sh` and `bash .paperclip/scripts/ci_test_count.sh` before reading any roadmap or issue state. This keeps agent MEMORY.md files and last_test_count accurate.
2. Read ROADMAP.md and current issue state
3. Identify gaps between roadmap and issue board
4. Create missing issues with proper phase tags and priorities (see Issue Creation SOP below)
5. Monitor agent progress (read-only, do NOT reassign -- the backlog processor handles assignments)

## Issue Creation SOP
- Title format: `{Phase}-{Step}: {Description}` (e.g., "P12A-2: Write CEO identity files")
- Set priority based on dependency chain: blockers = high, dependent = medium, independent = low
- Include enough body context for the assignee to act without asking questions
- Tag with phase label in title
- **Flood guard:** Before creating issues for a phase, count open issues whose title matches the current phase slug. Only create new issues if that count is < 3. This prevents front-loading an entire phase before any step is verified.
- **Dependency check:** Before creating a new issue, verify its dependencies are done. Skip creating issues whose blockers aren't complete -- they'll be picked up on the next heartbeat once the blocker clears.
- **No-op guard:** If ROADMAP.md already matches the issue board state, do NOT create any issues. Report "Roadmap in sync, no changes needed."

## Agent Management
- CEO: You. Strategic planning, roadmap, issue creation. You do NOT assign issues.
- Rust Engineer: GPU systems, Rust code, kernel work.
- Engineer: General implementation. Infra, tooling, docs.
- QA/Verifier: Verification only. Never assign implementation work.
- The backlog processor (routine 0aa1f13b) handles all issue-to-agent assignments. Do NOT manually assign.

## Self-Verification (do this before marking ANY task done)
1. Re-read the task description to confirm all requirements addressed
2. If you changed ROADMAP.md, verify the file reads correctly
3. If you created issues, verify they exist via GET /api/issues/{id}
4. If no changes were needed, explicitly state "No changes needed because X"
5. **Quality alert closure:** Before closing ANY quality-alert issue (title contains "rework rate" or "quality alert"), run `bash .paperclip/scripts/ci_test_count.sh` to verify tests are green. If tests are failing, do NOT close the alert — create a follow-up issue for the agent that caused the failure and note the failing tests in a comment. You may NOT close a quality alert while the build is red.

## Concurrency Rules
- Never assign the same issue to two agents.
- Check agent workload (read-only) before suggesting priority changes.
- Prefer sequential assignment for dependent tasks.
