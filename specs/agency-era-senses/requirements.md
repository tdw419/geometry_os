---
spec: agency-era-senses
phase: requirements
created: 2026-02-23T12:00:00Z
generated: auto
---

# Requirements: Agency Era Phase 2 - Broad Senses

## Summary

Enable Guild agents to interact with external resources through sandboxed FilesystemSense and rate-limited WebSense mixins.

## User Stories

### US-1: Agent reads configuration file
As a Guild agent, I want to read config files so that I can use project settings.

**Acceptance Criteria**:
- AC-1.1: Read files only from whitelisted directories
- AC-1.2: Return structured SenseResult with success/error status
- AC-1.3: Timeout after configurable seconds (default 5s)

### US-2: Agent writes data file
As a Guild agent, I want to write output files so that I can persist results.

**Acceptance Criteria**:
- AC-2.1: Write only to whitelisted directories
- AC-2.2: Validate path doesn't escape sandbox (no `../`)
- AC-2.3: Return error on permission denied

### US-3: Agent fetches documentation
As a Guild agent, I want to fetch web docs so that I can research solutions.

**Acceptance Criteria**:
- AC-3.1: HTTP GET with configurable timeout (default 10s)
- AC-3.2: Rate limited to N requests per minute
- AC-3.3: Return error on network failure, not exception

### US-4: Agent calls external API
As a Guild agent, I want to call APIs so that I can integrate external services.

**Acceptance Criteria**:
- AC-4.1: Support GET and POST methods
- AC-4.2: Custom headers support
- AC-4.3: JSON response parsing

### US-5: Guild agent gains senses
As a developer, I want to add senses to agents via mixin so that agents gain capabilities declaratively.

**Acceptance Criteria**:
- AC-5.1: Mixin pattern: `class MyAgent(SwarmAgent, FilesystemSense)`
- AC-5.2: Senses configurable per-agent via constructor
- AC-5.3: No breaking changes to existing SwarmAgent

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | FilesystemSense.read_file(path) with whitelist validation | Must | US-1 |
| FR-2 | FilesystemSense.write_file(path, content) with sandbox check | Must | US-2 |
| FR-3 | FilesystemSense.list_dir(path) for directory enumeration | Should | US-1 |
| FR-4 | WebSense.fetch(url, method, headers, timeout) | Must | US-3, US-4 |
| FR-5 | WebSense rate limiting (configurable requests/min) | Must | US-3 |
| FR-6 | SenseResult dataclass with success, data, error fields | Must | All |
| FR-7 | Mixin integration with SwarmAgent | Must | US-5 |
| FR-8 | Configurable allowed_paths list | Must | FR-1, FR-2 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | All I/O operations have timeout (default 10s) | Reliability |
| NFR-2 | No arbitrary code execution (no exec/eval/subprocess) | Security |
| NFR-3 | Path traversal blocked (no `../` in user paths) | Security |
| NFR-4 | Rate limiting enforced (default 60 req/min) | Performance |

## Out of Scope

- File deletion operations (safety)
- Arbitrary shell commands
- File system watching/events
- WebSocket connections
- Authentication/OAuth flows

## Dependencies

- Python 3.10+ (dataclasses, asyncio)
- httpx or aiohttp (already in project)
- SwarmAgent from `systems/swarm/swarm_agent.py`
