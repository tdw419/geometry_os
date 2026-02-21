---
spec: command-console
phase: requirements
created: 2026-02-21T14:00:00Z
---

# Requirements: Command Console

## Goal

Enable bidirectional human-AI collaboration where humans write WordPress posts (Directives) and AI agents read, parse, and execute them, posting results as comments.

## User Decisions

| Question | Response |
|----------|----------|
| Primary users | Both developers and AI agents |
| Priority tradeoffs | Prioritize speed of delivery |
| Success criteria | Feature works as specified |
| Phase 3 scope | Informational + Research only |

## User Stories

### US-1: Write Directive
**As a** human user
**I want** to write WordPress posts with natural language commands
**So that** I can communicate tasks to AI agents

**Acceptance Criteria:**
- [ ] AC-1.1: User can create post in "Directives" category via WordPress admin
- [ ] AC-1.2: Post title and content are preserved exactly as written
- [ ] AC-1.3: Post appears in getDirectives API response within 1 second of publishing

### US-2: Poll Directives
**As a** DirectiveAgent
**I want** to poll WordPress for unprocessed directives
**So that** I can discover new tasks to execute

**Acceptance Criteria:**
- [ ] AC-2.1: GET request to ai-publisher.php with tool=getDirectives returns list
- [ ] AC-2.2: Only posts without directive_processed meta are returned
- [ ] AC-2.3: Response includes id, title, content, date, author for each directive
- [ ] AC-2.4: Empty list returned when no unprocessed directives exist

### US-3: Parse Directive Scope
**As a** DirectiveAgent
**I want** to classify directive scope from text
**So that** I know what type of action to perform

**Acceptance Criteria:**
- [ ] AC-3.1: "explain", "how does", "describe" detected as INFORMATIONAL
- [ ] AC-3.2: "investigate", "analyze", "why is" detected as RESEARCH
- [ ] AC-3.3: "delete", "restart", "modify code" detected as out-of-scope
- [ ] AC-3.4: Unrecognized directives marked as UNKNOWN

### US-4: Execute Informational
**As a** DirectiveAgent
**I want** to answer informational queries from substrate map
**So that** users understand system components

**Acceptance Criteria:**
- [ ] AC-4.1: Component lookup returns path, description, language, entry points
- [ ] AC-4.2: Unknown component returns NEEDS_CLARIFICATION status
- [ ] AC-4.3: Response formatted as Markdown with section headers

### US-5: Execute Research
**As a** DirectiveAgent
**I want** to provide analysis for research queries
**So that** users can investigate system behavior

**Acceptance Criteria:**
- [ ] AC-5.1: Research response includes component location and analysis
- [ ] AC-5.2: Investigation suggestions generated based on component type
- [ ] AC-5.3: Response includes potential investigation points

### US-6: Reject Out-of-Scope
**As a** DirectiveAgent
**I want** to reject dangerous or modifying directives
**So that** Phase 3 safety is maintained

**Acceptance Criteria:**
- [ ] AC-6.1: OUT_OF_SCOPE status returned for delete/restart/modify patterns
- [ ] AC-6.2: Response explains Phase 3 limitations
- [ ] AC-6.3: No code modifications or system operations executed

### US-7: Post Response
**As a** DirectiveAgent
**I want** to post execution results as WordPress comments
**So that** users see the agent's response

**Acceptance Criteria:**
- [ ] AC-7.1: Comment posted with "Geometry OS Agent" as author
- [ ] AC-7.2: Comment content includes status and response body
- [ ] AC-7.3: Comment is auto-approved (no moderation)

### US-8: Mark Processed
**As a** DirectiveAgent
**I want** to mark directives as processed
**So that** they are not re-processed on next poll

**Acceptance Criteria:**
- [ ] AC-8.1: directive_processed meta set to true
- [ ] AC-8.2: directive_processed_at meta set to current timestamp
- [ ] AC-8.3: Directive excluded from subsequent getDirectives calls

### US-9: Control Daemon
**As a** developer
**I want** a control script for the directive agent
**So that** I can start/stop/status the daemon easily

**Acceptance Criteria:**
- [ ] AC-9.1: `start` launches daemon in background with PID file
- [ ] AC-9.2: `stop` terminates daemon and removes PID file
- [ ] AC-9.3: `status` shows running state and recent log entries
- [ ] AC-9.4: `process-once` runs single poll cycle and exits

## Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-1 | ai-publisher.php directive handlers | High | getDirectives, markDirectiveProcessed, postDirectiveResponse endpoints work |
| FR-2 | DirectiveAgent Python class | High | Polls, parses, executes, responds in < 5s per directive |
| FR-3 | Scope detection | High | Correctly classifies INFORMATIONAL, RESEARCH, OUT_OF_SCOPE, UNKNOWN |
| FR-4 | Substrate map cache | Medium | .geometry/substrate_map.json exists with component data |
| FR-5 | WordPress Directives category | Medium | Category auto-created if missing |
| FR-6 | Control script | Medium | directive_ctl.sh start/stop/status/process-once work |
| FR-7 | Unit tests | Medium | 90%+ coverage on DirectiveAgent methods |
| FR-8 | E2E tests | Low | Full directive lifecycle test passes |

## Non-Functional Requirements

| ID | Requirement | Metric | Target |
|----|-------------|--------|--------|
| NFR-1 | API latency | Response time | < 500ms per request |
| NFR-2 | Poll interval | Seconds | 30s default, configurable |
| NFR-3 | Security | Access control | localhost-only for ai-publisher.php |
| NFR-4 | Reliability | Error recovery | Continue on API failure, log error |
| NFR-5 | Observability | Logging | All directive processing logged |

## Glossary

| Term | Definition |
|------|------------|
| Directive | WordPress post in "Directives" category representing a human command |
| DirectiveAgent | Python agent that polls, parses, and executes directives |
| Substrate Map | JSON cache of system components with metadata |
| Phase 3 | Current scope: informational + research only, no code modifications |
| Scope | Directive classification: INFORMATIONAL, RESEARCH, or OUT_OF_SCOPE |

## Out of Scope

- Code modifications or generation
- System operations (restart, shutdown, deploy)
- File system writes outside .geometry cache
- Multi-agent dispatch (single agent only)
- WebSocket real-time push (polling only)
- Embedding-based semantic matching (keyword only)

## Dependencies

| Dependency | Status | Notes |
|------------|--------|-------|
| WordPress on localhost:8080 | Required | ai-publisher.php must be accessible |
| ai-publisher.php | Exists | Needs directive handlers added |
| ArchitectAgent | Exists | Provides substrate map export |
| Python 3.12 | Required | requests library |
| .geometry directory | Required | For cache and logs |

## Risk Identification

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| WordPress unavailable | Medium | High | Graceful degradation, log errors, retry |
| Out-of-scope bypass | Low | High | Regex pattern matching, explicit blocklist |
| Substrate map stale | Medium | Medium | ArchitectAgent refresh on each crawl |
| Comment spam | Low | Low | Auto-approve only for agent email |

## Success Criteria

| Metric | Target | Verification |
|--------|--------|--------------|
| E2E test | Pass | pytest tests/test_directive_console_e2e.py |
| Unit test coverage | 90%+ | pytest --cov |
| Informational query | Returns component info | Manual test with "Explain Evolution Daemon" |
| Out-of-scope rejection | Returns error message | Manual test with "Delete files" |
| Daemon stability | Runs 1 hour without crash | Process monitoring |

## Unresolved Questions

- Should multiple agents process directives in parallel? (Default: single agent for Phase 3)
- Should directives support priority levels? (Default: FIFO processing)
- Should responses support rich formatting beyond Markdown? (Default: HTML in comments)

## Next Steps

1. User approves requirements.md
2. Run design phase for technical specification
3. Run tasks phase for implementation breakdown
4. Implement using existing plan at docs/plans/2026-02-21-command-console.md
