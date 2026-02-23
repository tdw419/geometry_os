---
spec: agency-era-senses
phase: tasks
total_tasks: 12
created: 2026-02-23T12:00:00Z
generated: auto
---

# Tasks: Agency Era Phase 2 - Broad Senses

## Phase 1: Make It Work (POC)

Focus: Core sense classes with basic functionality. Skip rate limiting, minimal error handling.

- [x] 1.1 Create senses module structure
  - **Do**: Create `systems/swarm/senses/__init__.py` with empty exports
  - **Files**: `systems/swarm/senses/__init__.py`
  - **Done when**: Module imports without error
  - **Verify**: `python -c "from systems.swarm.senses import SenseResult"`
  - **Commit**: `feat(senses): create senses module`
  - _Requirements: FR-7_

- [x] 1.2 Implement SenseResult dataclass
  - **Do**: Create `systems/swarm/senses/base.py` with SenseResult dataclass
  - **Files**: `systems/swarm/senses/base.py`
  - **Done when**: SenseResult(success=True, data="test") works
  - **Verify**: `python -c "from systems.swarm.senses import SenseResult; r = SenseResult(True); print(r)"`
  - **Commit**: `feat(senses): add SenseResult dataclass`
  - _Requirements: FR-6_

- [x] 1.3 Implement FilesystemSense.read_file
  - **Do**: Create `systems/swarm/senses/filesystem.py` with FilesystemSense class, read_file method, path validation
  - **Files**: `systems/swarm/senses/filesystem.py`
  - **Done when**: Can read file from allowed path, error on disallowed
  - **Verify**: `python -c "from systems.swarm.senses import FilesystemSense; fs = FilesystemSense(['/tmp']); print(fs.read_file('/tmp/test.txt'))"`
  - **Commit**: `feat(senses): add FilesystemSense.read_file`
  - _Requirements: FR-1, FR-8_

- [x] 1.4 Implement FilesystemSense.write_file
  - **Do**: Add write_file method to FilesystemSense
  - **Files**: `systems/swarm/senses/filesystem.py`
  - **Done when**: Can write to allowed path, error on disallowed
  - **Verify**: Write and read back a test file
  - **Commit**: `feat(senses): add FilesystemSense.write_file`
  - _Requirements: FR-2_

- [ ] 1.5 Implement WebSense.fetch
  - **Do**: Create `systems/swarm/senses/web.py` with WebSense class, fetch method using httpx
  - **Files**: `systems/swarm/senses/web.py`
  - **Done when**: Can fetch URL and return SenseResult
  - **Verify**: `python -c "import asyncio; from systems.swarm.senses import WebSense; print(asyncio.run(WebSense().fetch('https://httpbin.org/get')))"`
  - **Commit**: `feat(senses): add WebSense.fetch`
  - _Requirements: FR-4_

- [ ] 1.6 POC Checkpoint
  - **Do**: Verify all senses work in isolation
  - **Done when**: Manual test reads file, writes file, fetches URL
  - **Verify**: Run quick integration test
  - **Commit**: `feat(senses): complete POC`

## Phase 2: Refactoring

- [ ] 2.1 Add list_dir to FilesystemSense
  - **Do**: Implement list_dir method for directory enumeration
  - **Files**: `systems/swarm/senses/filesystem.py`
  - **Done when**: Returns list of filenames in directory
  - **Verify**: List a known directory
  - **Commit**: `feat(senses): add FilesystemSense.list_dir`
  - _Requirements: FR-3_

- [ ] 2.2 Add rate limiting to WebSense
  - **Do**: Implement sliding window rate limiter
  - **Files**: `systems/swarm/senses/web.py`
  - **Done when**: Requests over limit return error
  - **Verify**: Make 70 requests with 60/min limit, verify last 10 fail
  - **Commit**: `feat(senses): add rate limiting`
  - _Requirements: FR-5_

- [ ] 2.3 Add timeout handling to all operations
  - **Do**: Wrap all I/O with asyncio.timeout or threading timeout
  - **Files**: `systems/swarm/senses/filesystem.py`, `systems/swarm/senses/web.py`
  - **Done when**: Long operations timeout gracefully
  - **Verify**: Test with slow URL
  - **Commit**: `refactor(senses): add timeout handling`
  - _Requirements: NFR-1_

## Phase 3: Testing

- [ ] 3.1 Unit tests for FilesystemSense
  - **Do**: Create test file at `systems/swarm/tests/test_senses.py`
  - **Files**: `systems/swarm/tests/test_senses.py`
  - **Done when**: Tests cover read, write, list, path validation
  - **Verify**: `pytest systems/swarm/tests/test_senses.py -v`
  - **Commit**: `test(senses): add FilesystemSense tests`
  - _Requirements: AC-1.1, AC-2.1, AC-2.2_

- [ ] 3.2 Unit tests for WebSense
  - **Do**: Add WebSense tests (mock HTTP, test rate limiting)
  - **Files**: `systems/swarm/tests/test_senses.py`
  - **Done when**: Tests cover fetch, rate limit, timeout
  - **Verify**: `pytest systems/swarm/tests/test_senses.py -v`
  - **Commit**: `test(senses): add WebSense tests`
  - _Requirements: AC-3.1, AC-3.2_

## Phase 4: Quality Gates

- [ ] 4.1 Update module exports
  - **Do**: Export all public classes from `__init__.py`
  - **Files**: `systems/swarm/senses/__init__.py`
  - **Done when**: All imports work from top-level
  - **Verify**: `python -c "from systems.swarm.senses import FilesystemSense, WebSense, SenseResult"`
  - **Commit**: `chore(senses): update exports`

- [ ] 4.2 Run quality checks
  - **Do**: Run type check and all tests
  - **Verify**: `pytest systems/swarm/tests/ -v`
  - **Done when**: All tests pass
  - **Commit**: `fix(senses): address test failures` (if needed)

## Notes

- **POC shortcuts taken**: No rate limiting, minimal timeouts, no list_dir
- **Production TODOs**: Add POST method support, add header customization, add retry logic
