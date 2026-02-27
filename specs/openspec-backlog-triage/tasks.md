---
spec: openspec-backlog-triage
phase: tasks
total_tasks: 19
created: 2026-02-26T00:00:00Z
---

# Tasks: OpenSpec Backlog Triage

## Execution Context

**Testing Depth**: Standard - unit + integration tests, reasonable coverage
**Deployment**: Standalone script, no deployment required
**Execution Priority**: Balanced - reasonable quality with speed

**Key Technical Decisions from Design**:
- Single Python script at `scripts/openspec_triage.py`
- Python 3.10+ with stdlib only (argparse, dataclasses, Path)
- JSON manifest format for rollback
- ASCII dashboard in `.geometry/triage_summary.txt`
- Threshold default: 15 files

---

## Phase 1: Make It Work (POC)

Focus: Validate core functionality end-to-end. Skip tests, accept hardcoded values, focus on dry-run flow.

### Task 1.1: Create script skeleton with dataclasses [DONE]

**Do**:
1. Create `scripts/openspec_triage.py`
2. Add shebang, imports, and dataclass definitions
3. Define: `DirectoryMetrics`, `ScanResult`, `ProposalCategory`, `ArchiveEntry`, `ArchiveManifest`
4. Add basic `main()` function with placeholder

**Files**:
- Create: `scripts/openspec_triage.py`

**Done when**:
- [x] Script runs with `python scripts/openspec_triage.py --help`
- [x] All dataclasses defined with type hints

**Verify**:
```bash
python scripts/openspec_triage.py --help
```

**Commit**: `feat(triage): add script skeleton with dataclasses`

_Requirements: FR-6, FR-12_
_Design: Components - Scanner, Archiver_

---

### Task 1.2: Implement Scanner component

**Do**:
1. Add `scan_changes(base_path: Path, threshold: int = 15) -> ScanResult`
2. Count files per directory in `openspec/changes/`
3. Detect SOLUTION file pattern: `SOLUTION_[A-Z0-9]+.md`
4. Filter directories by threshold
5. Return sorted noise candidates (highest file count first)

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- `scan_changes()` correctly identifies noise directories
- Returns both noise_dirs and clean_dirs lists
- SOLUTION pattern counted separately

**Verify**:
```bash
python -c "from scripts.openspec_triage import scan_changes; from pathlib import Path; r = scan_changes(Path('openspec/changes'), 15); print(f'Noise: {len(r.noise_dirs)}, Clean: {len(r.clean_dirs)}')"
```

**Commit**: `feat(triage): implement Scanner with SOLUTION detection`

_Requirements: AC-1.1, AC-1.2, AC-1.3, FR-12_
_Design: Components - Scanner_

---

### Task 1.3: Implement Categorizer component

**Do**:
1. Add `SYSTEM_KEYWORDS` dictionary with priority order
2. Implement `categorize_proposal(metrics: DirectoryMetrics, project_root: Path) -> ProposalCategory`
3. Match directory name against system keywords
4. Assign priority based on NORTH_STAR alignment (visual-shell=1, swarm=2, evolution=2, memory=3, neb=4, infra=5)
5. Add `check_git_implementation()` stub (returns "unknown" for POC)

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- System keywords correctly categorize proposals
- Priority assigned based on system match
- Status defaults to "unknown"

**Verify**:
```bash
python -c "from scripts.openspec_triage import categorize_proposal, DirectoryMetrics; from pathlib import Path; m = DirectoryMetrics(Path('test-visual-proposal'), 5, 2, True, False, ''); c = categorize_proposal(m, Path('.')); print(f'System: {c.system}, Priority: {c.priority}')"
```

**Commit**: `feat(triage): implement Categorizer with keyword matching`

_Requirements: AC-4.1, AC-4.2, AC-4.3, AC-4.4, FR-7_
_Design: Components - Categorizer_

---

### Task 1.4: Implement Archiver component (dry-run only)

**Do**:
1. Add `archive_directory()` with dry_run parameter
2. Create archive path: `archive/noise/<system>/<dir_name>/`
3. Implement `extract_valuable_content()` - read proposal.md and design.md
4. Generate `_archive_summary.md` content (don't write in dry-run)
5. Return `ArchiveEntry` with all metadata

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- Archive path correctly constructed
- Content extraction returns dict of filename -> content
- Works in dry-run mode without file moves

**Verify**:
```bash
python -c "from scripts.openspec_triage import archive_directory, DirectoryMetrics; from pathlib import Path; m = DirectoryMetrics(Path('openspec/changes/test-dir'), 20, 15, True, True, 'visual-shell'); e = archive_directory(m, Path('openspec/archive'), dry_run=True); print(f'Archive path: {e.archive_path}')"
```

**Commit**: `feat(triage): implement Archiver with content extraction`

_Requirements: AC-2.3, AC-3.1, AC-3.2, AC-3.3, FR-4, FR-5_
_Design: Components - Archiver_

---

### Task 1.5: Implement manifest generation

**Do**:
1. Add `generate_manifest(entries: List[ArchiveEntry], dry_run: bool) -> ArchiveManifest`
2. Generate unique manifest ID using timestamp
3. Serialize manifest to JSON format
4. Add `write_manifest(manifest: ArchiveManifest, output_dir: Path) -> Path`
5. Save to `openspec/manifests/archive_<timestamp>.json`

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- Manifest JSON generated with all entries
- Timestamp ID unique per run
- File written to correct location

**Verify**:
```bash
python -c "from scripts.openspec_triage import generate_manifest; from pathlib import Path; m = generate_manifest([], True); print(f'Manifest ID: {m.manifest_id}, Dry-run: {m.dry_run}')"
```

**Commit**: `feat(triage): implement manifest generation`

_Requirements: AC-2.2, FR-6_
_Design: Components - Archiver_

---

### Task 1.6: Implement Dashboard Generator

**Do**:
1. Add `format_ascii_table(rows, headers) -> str`
2. Implement `generate_dashboard()` function
3. Create ASCII output with sections: NOISE ARCHIVED, REMAINING BACKLOG, TOP 10 ACTIONABLE
4. Include system counts table
5. Write to `.geometry/triage_summary.txt`

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- ASCII table formatted correctly
- Dashboard written to output path
- Contains all required sections

**Verify**:
```bash
python -c "from scripts.openspec_triage import format_ascii_table; t = format_ascii_table([['visual-shell', '45', '1']], ['System', 'Count', 'Priority']); print(t)"
```

**Commit**: `feat(triage): implement Dashboard Generator`

_Requirements: AC-6.1, AC-6.2, AC-6.3, FR-9_
_Design: Components - Dashboard Generator_

---

### Task 1.7: Implement CLI with argparse

**Do**:
1. Add argparse setup with all required flags
2. Implement: `--dry-run`, `--interactive`, `--threshold`, `--rollback`
3. Add: `--changes-dir`, `--archive-dir`, `--output`
4. Add: `-q/--quiet`, `-v/--verbose`
5. Wire up main() to call components based on flags

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- All CLI flags work correctly
- Help text displays usage examples
- Default values applied

**Verify**:
```bash
python scripts/openspec_triage.py --help
python scripts/openspec_triage.py --dry-run --threshold 20 2>&1 | head -20
```

**Commit**: `feat(triage): implement CLI with argparse`

_Requirements: FR-1, FR-2, FR-3, FR-10_
_Design: CLI Interface_

---

### Task 1.8: Wire dry-run flow end-to-end

**Do**:
1. Connect all components in main() for dry-run mode
2. Scan -> Categorize -> Generate manifest (no moves) -> Dashboard
3. Print summary to stdout with noise candidates
4. Ensure no file modifications in dry-run mode

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- `--dry-run` produces manifest without moving files
- Dashboard generated
- Summary printed to console

**Verify**:
```bash
python scripts/openspec_triage.py --dry-run --changes-dir openspec/changes --output .geometry/triage_summary.txt
cat .geometry/triage_summary.txt | head -30
```

**Commit**: `feat(triage): wire dry-run flow end-to-end`

_Requirements: AC-2.3, FR-2_
_Design: Data Flow_

---

### Task 1.9: Implement rollback functionality

**Do**:
1. Add `rollback_manifest(manifest_path: Path, archive_base: Path) -> int`
2. Read manifest JSON
3. Move each directory from archive back to openspec/changes/
4. Move manifest to `manifests/completed/` with timestamp
5. Handle missing directories gracefully

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- Rollback restores directories to original locations
- Manifest moved to completed/
- Returns count of restored items

**Verify**:
```bash
python -c "from scripts.openspec_triage import rollback_manifest; from pathlib import Path; print('Rollback function exists')"
```

**Commit**: `feat(triage): implement rollback from manifest`

_Requirements: AC-7.1, AC-7.2, AC-7.3, FR-10_
_Design: Components - Archiver_

---

### Task 1.10: [VERIFY] Quality checkpoint: syntax + imports

**Do**:
1. Run Python syntax check
2. Verify all imports resolve
3. Check script is executable

**Verify**:
```bash
python -m py_compile scripts/openspec_triage.py && echo "Syntax OK"
python -c "import scripts.openspec_triage" && echo "Imports OK"
```

**Done when**:
- No syntax errors
- All imports resolve

**Commit**: `chore(triage): pass POC quality checkpoint`

---

### Task 1.11: POC Checkpoint - dry-run validation

**Do**:
1. Run dry-run on actual openspec/changes/ directory
2. Verify manifest generated with correct entries
3. Verify dashboard created at .geometry/triage_summary.txt
4. Verify no files moved

**Verify**:
```bash
python scripts/openspec_triage.py --dry-run --changes-dir openspec/changes
test -f .geometry/triage_summary.txt && echo "Dashboard created"
ls openspec/manifests/*.json 2>/dev/null | head -1
```

**Done when**:
- Dry-run completes without errors
- Dashboard file exists
- Manifest file exists
- No directories moved

**Commit**: `feat(triage): complete POC with dry-run validation`

_Requirements: US-1, US-2, US-6_
_Design: Data Flow_

---

## Phase 2: Refactoring

After POC validated, clean up code structure and add production features.

### Task 2.1: Implement interactive mode

**Do**:
1. Add `prompt_archive_decision()` function
2. In `--interactive` mode, prompt y/n for each directory
3. Skip directory if user declines
4. Log decisions to stdout

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- Interactive mode prompts per-directory
- Only archives on 'y' confirmation
- Skips on 'n' or other input

**Verify**:
```bash
echo "n" | python scripts/openspec_triage.py --interactive --dry-run 2>&1 | grep -i "skip\|archive"
```

**Commit**: `feat(triage): add interactive mode`

_Requirements: AC-2.4, FR-3_
_Design: CLI Interface_

---

### Task 2.2: Implement actual archive (non-dry-run)

**Do**:
1. In non-dry-run mode, actually move directories
2. Create archive subdirs by system
3. Write `_archive_summary.md` in archive directory
4. Handle edge cases: empty dirs, already archived

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- Directories moved to archive/noise/<system>/
- Summary files created
- Original directories removed from openspec/changes/

**Verify**:
```bash
python -c "from scripts.openspec_triage import archive_directory, DirectoryMetrics; from pathlib import Path; print('Archive function ready')"
```

**Commit**: `feat(triage): implement actual archive moves`

_Requirements: AC-2.1, AC-3.3, FR-4, FR-5_
_Design: Components - Archiver_

---

### Task 2.3: Add git history status inference

**Do**:
1. Implement `check_git_implementation(dir_name: str, project_root: Path) -> bool`
2. Run `git log --grep=<proposal-name> --oneline`
3. Return True if matching commits found
4. Mark as "likely-complete" if git evidence found

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- Git history checked for each proposal
- Status inferred correctly
- Graceful fallback if git unavailable

**Verify**:
```bash
python -c "from scripts.openspec_triage import check_git_implementation; from pathlib import Path; r = check_git_implementation('visual-shell', Path('.')); print(f'Git check: {r}')"
```

**Commit**: `feat(triage): add git history status inference`

_Requirements: AC-5.1, AC-5.2, AC-5.3, FR-8_
_Design: Components - Categorizer_

---

### Task 2.4: Add error handling and logging

**Do**:
1. Add try/except blocks around file operations
2. Implement logging with -v/--verbose flag
3. Handle: permission errors, missing dirs, git unavailable
4. Add audit logging for all operations

**Files**:
- Modify: `scripts/openspec_triage.py`

**Done when**:
- All file operations have error handling
- Verbose mode shows detailed logs
- Errors logged but don't crash script

**Verify**:
```bash
python scripts/openspec_triage.py --dry-run -v 2>&1 | grep -i "scanning\|categorizing\|generating"
```

**Commit**: `refactor(triage): add error handling and logging`

_Requirements: NFR-4_
_Design: Error Handling_

---

### Task 2.5: [VERIFY] Quality checkpoint: refactored code

**Do**:
1. Verify script runs without errors
2. Check all CLI flags work
3. Verify error handling catches issues

**Verify**:
```bash
python -m py_compile scripts/openspec_triage.py
python scripts/openspec_triage.py --dry-run --threshold 20 -q
python scripts/openspec_triage.py --help | grep -c "dry-run\|interactive\|threshold\|rollback"
```

**Done when**:
- No syntax errors
- All flags functional
- Help shows all options

**Commit**: `chore(triage): pass refactoring quality checkpoint`

---

## Phase 3: Testing

Add comprehensive test coverage.

### Task 3.1: Create test file and unit tests for Scanner

**Do**:
1. Create `tests/scripts/test_openspec_triage.py`
2. Add `test_scan_counts_solutions()` - verify SOLUTION pattern counted
3. Add `test_scan_threshold_filtering()` - verify threshold works
4. Add `test_scan_empty_directory()` - edge case
5. Use pytest with temp directories

**Files**:
- Create: `tests/scripts/test_openspec_triage.py`

**Done when**:
- Tests pass
- SOLUTION pattern detection verified
- Threshold filtering verified

**Verify**:
```bash
python -m pytest tests/scripts/test_openspec_triage.py::test_scan_counts_solutions -v
python -m pytest tests/scripts/test_openspec_triage.py::test_scan_threshold_filtering -v
```

**Commit**: `test(triage): add Scanner unit tests`

_Requirements: AC-1.1, AC-1.2, AC-1.3_
_Design: Test Strategy_

---

### Task 3.2: Add unit tests for Categorizer

**Do**:
1. Add `test_categorize_matches_keywords()` - verify system matching
2. Add `test_categorize_priority_order()` - verify NORTH_STAR alignment
3. Add `test_categorize_unknown_system()` - default to infrastructure

**Files**:
- Modify: `tests/scripts/test_openspec_triage.py`

**Done when**:
- All categorization tests pass
- Keyword matching verified

**Verify**:
```bash
python -m pytest tests/scripts/test_openspec_triage.py::test_categorize -v
```

**Commit**: `test(triage): add Categorizer unit tests`

_Requirements: AC-4.1, AC-4.2, AC-4.3_
_Design: Test Strategy_

---

### Task 3.3: Add unit tests for Archiver

**Do**:
1. Add `test_archive_creates_summary()` - verify extraction
2. Add `test_manifest_roundtrip()` - verify JSON serialization
3. Add `test_rollback_restores_files()` - verify rollback

**Files**:
- Modify: `tests/scripts/test_openspec_triage.py`

**Done when**:
- Archive tests pass
- Manifest serialization verified
- Rollback verified

**Verify**:
```bash
python -m pytest tests/scripts/test_openspec_triage.py::test_archive -v
python -m pytest tests/scripts/test_openspec_triage.py::test_rollback -v
```

**Commit**: `test(triage): add Archiver unit tests`

_Requirements: AC-2.1, AC-2.2, AC-3.1, AC-3.2, AC-7.1_
_Design: Test Strategy_

---

### Task 3.4: Add integration tests

**Do**:
1. Add `test_full_dry_run()` - end-to-end dry-run
2. Add `test_interactive_archive()` - simulate user input
3. Add `test_threshold_filtering_e2e()` - verify threshold in full flow

**Files**:
- Modify: `tests/scripts/test_openspec_triage.py`

**Done when**:
- Integration tests pass
- E2E flows verified

**Verify**:
```bash
python -m pytest tests/scripts/test_openspec_triage.py::test_full_dry_run -v
python -m pytest tests/scripts/test_openspec_triage.py -v
```

**Commit**: `test(triage): add integration tests`

_Requirements: US-1, US-2, US-3_
_Design: Test Strategy_

---

### Task 3.5: [VERIFY] Quality checkpoint: all tests pass

**Do**:
1. Run full test suite
2. Verify coverage meets threshold (80%+)
3. Fix any failing tests

**Verify**:
```bash
python -m pytest tests/scripts/test_openspec_triage.py -v --tb=short
```

**Done when**:
- All tests pass
- No regressions

**Commit**: `chore(triage): pass testing quality checkpoint`

---

## Phase 4: Quality Gates

Final verification and PR preparation.

### Task 4.1: Final local verification

**Do**:
1. Run syntax check
2. Run all tests
3. Run dry-run on full backlog
4. Verify output files created

**Verify**:
```bash
python -m py_compile scripts/openspec_triage.py
python -m pytest tests/scripts/test_openspec_triage.py -v
python scripts/openspec_triage.py --dry-run
test -f .geometry/triage_summary.txt
```

**Done when**:
- All checks pass
- No errors

**Commit**: `chore(triage): pass final local verification`

---

### Task 4.2: Create PR

**Do**:
1. Verify on feature branch (not main)
2. Push branch to remote
3. Create PR with gh CLI
4. Verify CI passes

**Verify**:
```bash
git branch --show-current | grep -v main
git push -u origin $(git branch --show-current)
gh pr create --title "feat(triage): OpenSpec backlog triage tool" --body "Implements automated triage for OpenSpec backlog with dry-run, interactive mode, and rollback support."
gh pr checks --watch
```

**Done when**:
- PR created
- CI checks green

**Commit**: None (PR creation)

_Requirements: All_
_Design: All_

---

## Phase 5: PR Lifecycle

Continuous PR validation and iteration.

### Task 5.1: Monitor CI and address failures

**Do**:
1. Watch CI status
2. If failures, read logs
3. Fix issues locally
4. Push fixes
5. Re-verify CI

**Verify**:
```bash
gh pr checks
```

**Done when**:
- All CI checks pass

**Commit**: `fix(triage): address CI failures` (if needed)

---

### Task 5.2: Address review comments

**Do**:
1. Check for review comments
2. Address each comment
3. Push fixes
4. Re-request review if needed

**Verify**:
```bash
gh pr view --comments
```

**Done when**:
- All comments addressed
- Review approved

**Commit**: `refactor(triage): address review feedback` (if needed)

---

### Task 5.3: Final validation

**Do**:
1. Verify zero test regressions
2. Verify code is modular/reusable
3. Run on actual backlog (dry-run)
4. Confirm all AC met

**Verify**:
```bash
python -m pytest tests/scripts/test_openspec_triage.py -v
python scripts/openspec_triage.py --dry-run --changes-dir openspec/changes
cat .geometry/triage_summary.txt | grep -c "visual-shell\|swarm\|evolution"
```

**Done when**:
- All tests pass
- Real backlog processed successfully
- All acceptance criteria verified

**Commit**: None

---

## Unresolved Questions

- Should we detect proposals with code already implemented in `systems/` (not just git history)?
- How to handle proposals that reference other proposals (dependencies)?
- Should `_archive_summary.md` include SOLUTION file counts per directory?

## Notes

**POC Shortcuts**:
- Git status inference returns "unknown" initially
- No actual file moves in POC (dry-run only)
- Minimal error handling in POC

**Production TODOs**:
- Add full git history analysis
- Handle proposal dependencies
- Add SOLUTION count to summaries
- Consider auto-scheduling (out of scope for now)
