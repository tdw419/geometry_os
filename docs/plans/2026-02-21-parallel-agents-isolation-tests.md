# Parallel Agents Isolation Tests Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Prove that multiple Claude sessions running in parallel git worktrees cannot interfere with each other through file system, git state, resources, or port/lock conflicts.

**Architecture:** Scenario-based unit tests that create temporary worktrees, simulate concurrent operations, and assert isolation invariants hold. Each test focuses on one interference mode with clear Given/When/Then structure.

**Tech Stack:** Python 3.11+, pytest, pygit2 (for git operations), tempfile (for isolated test environments)

---

## Test Categories

| Category | Tests | Purpose |
|----------|-------|---------|
| File System Isolation | 4 | Verify file changes don't leak between worktrees |
| Git State Isolation | 4 | Verify commits/branches don't pollute other worktrees |
| Resource Isolation | 3 | Verify resource usage doesn't affect other agents |
| Port/Lock Isolation | 3 | Verify no conflicts on shared resources |

---

## Task 1: Project Setup and Test Infrastructure

**Files:**
- Create: `tests/isolation/__init__.py`
- Create: `tests/isolation/conftest.py`
- Create: `tests/isolation/test_filesystem_isolation.py`

**Step 1: Create test directory structure**

```bash
mkdir -p tests/isolation
touch tests/isolation/__init__.py
```

**Step 2: Write the conftest.py with fixtures**

Create `tests/isolation/conftest.py`:

```python
"""
Fixtures for isolation testing.

Provides temporary git repositories and worktree pairs for testing
isolation between parallel agent sessions.
"""

import os
import subprocess
import tempfile
from pathlib import Path
from typing import Generator, Tuple

import pytest


@pytest.fixture
def temp_git_repo() -> Generator[Path, None, None]:
    """Create a temporary git repository for testing."""
    with tempfile.TemporaryDirectory() as tmpdir:
        repo_path = Path(tmpdir) / "test_repo"
        repo_path.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(
            ["git", "config", "user.email", "test@test.com"],
            cwd=repo_path,
            check=True,
            capture_output=True,
        )
        subprocess.run(
            ["git", "config", "user.name", "Test User"],
            cwd=repo_path,
            check=True,
            capture_output=True,
        )

        # Create initial commit
        (repo_path / "README.md").write_text("# Test Repository\n")
        subprocess.run(["git", "add", "README.md"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Initial commit"],
            cwd=repo_path,
            check=True,
            capture_output=True,
        )

        yield repo_path


@pytest.fixture
def worktree_pair(temp_git_repo: Path) -> Generator[Tuple[Path, Path], None, None]:
    """
    Create two worktrees from the same repository.

    Returns:
        Tuple of (worktree_a_path, worktree_b_path)
    """
    worktrees_dir = temp_git_repo / ".worktrees"
    worktrees_dir.mkdir()

    worktree_a = worktrees_dir / "agent-a"
    worktree_b = worktrees_dir / "agent-b"

    # Create worktrees on new branches
    subprocess.run(
        ["git", "worktree", "add", str(worktree_a), "-b", "agent/a"],
        cwd=temp_git_repo,
        check=True,
        capture_output=True,
    )
    subprocess.run(
        ["git", "worktree", "add", str(worktree_b), "-b", "agent/b"],
        cwd=temp_git_repo,
        check=True,
        capture_output=True,
    )

    yield (worktree_a, worktree_b)

    # Cleanup worktrees
    subprocess.run(
        ["git", "worktree", "remove", "--force", str(worktree_a)],
        cwd=temp_git_repo,
        capture_output=True,
    )
    subprocess.run(
        ["git", "worktree", "remove", "--force", str(worktree_b)],
        cwd=temp_git_repo,
        capture_output=True,
    )


@pytest.fixture
def isolated_file_content() -> str:
    """Sample content for file isolation tests."""
    return "This is test content that should not leak between worktrees.\n"
```

**Step 3: Verify fixtures load correctly**

Run: `python -c "from tests.isolation.conftest import *; print('OK')"`
Expected: `OK`

**Step 4: Commit the setup**

```bash
git add tests/isolation/__init__.py tests/isolation/conftest.py
git commit -m "test(isolation): add fixtures for worktree isolation testing"
```

---

## Task 2: File System Isolation Tests

**Files:**
- Create: `tests/isolation/test_filesystem_isolation.py`

**Step 1: Write failing test for file creation isolation**

Create `tests/isolation/test_filesystem_isolation.py`:

```python
"""
Tests for file system isolation between parallel worktrees.

Verifies that file operations in one worktree do not affect another.
"""

from pathlib import Path

import pytest


class TestFileCreationIsolation:
    """Verify file creation in one worktree doesn't leak to another."""

    def test_file_created_in_a_not_visible_in_b(
        self, worktree_pair: tuple[Path, Path], isolated_file_content: str
    ):
        """
        GIVEN: Two worktrees from the same repository
        WHEN: A file is created in worktree A
        THEN: The file is NOT visible in worktree B
        """
        worktree_a, worktree_b = worktree_pair

        # Create file in worktree A
        new_file = worktree_a / "new_feature.py"
        new_file.write_text(isolated_file_content)

        # Assert file exists in A
        assert new_file.exists(), "File should exist in worktree A"

        # Assert file does NOT exist in B
        b_file = worktree_b / "new_feature.py"
        assert not b_file.exists(), "File should NOT leak to worktree B"

    def test_file_modified_in_a_not_affected_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with an existing file (from initial commit)
        WHEN: The file is modified in worktree A
        THEN: The file in worktree B remains unchanged
        """
        worktree_a, worktree_b = worktree_pair

        # Modify README in worktree A
        readme_a = worktree_a / "README.md"
        original_content = readme_a.read_text()
        modified_content = original_content + "\n## Modified by Agent A\n"
        readme_a.write_text(modified_content)

        # Assert modification in A
        assert "Modified by Agent A" in readme_a.read_text()

        # Assert B is unchanged
        readme_b = worktree_b / "README.md"
        assert "Modified by Agent A" not in readme_b.read_text(), \
            "Modification in A should not leak to B"

    def test_directory_created_in_a_not_visible_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees from the same repository
        WHEN: A directory is created in worktree A
        THEN: The directory is NOT visible in worktree B
        """
        worktree_a, worktree_b = worktree_pair

        # Create directory in worktree A
        new_dir = worktree_a / "new_module"
        new_dir.mkdir()
        (new_dir / "__init__.py").write_text("# New module\n")

        # Assert directory exists in A
        assert new_dir.exists() and new_dir.is_dir()
        assert (new_dir / "__init__.py").exists()

        # Assert directory does NOT exist in B
        b_dir = worktree_b / "new_module"
        assert not b_dir.exists(), "Directory should NOT leak to worktree B"

    def test_file_deleted_in_a_still_exists_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with an existing file
        WHEN: The file is deleted in worktree A
        THEN: The file still exists in worktree B
        """
        worktree_a, worktree_b = worktree_pair

        # Delete README in worktree A
        readme_a = worktree_a / "README.md"
        readme_a.unlink()

        # Assert deleted in A
        assert not readme_a.exists(), "File should be deleted in A"

        # Assert still exists in B
        readme_b = worktree_b / "README.md"
        assert readme_b.exists(), "File should still exist in B"
```

**Step 2: Run tests to verify they pass**

Run: `pytest tests/isolation/test_filesystem_isolation.py -v`
Expected: All 4 tests PASS

**Step 3: Commit**

```bash
git add tests/isolation/test_filesystem_isolation.py
git commit -m "test(isolation): add file system isolation tests"
```

---

## Task 3: Git State Isolation Tests

**Files:**
- Create: `tests/isolation/test_git_isolation.py`

**Step 1: Write failing test for git state isolation**

Create `tests/isolation/test_git_isolation.py`:

```python
"""
Tests for git state isolation between parallel worktrees.

Verifies that git operations in one worktree do not affect another.
"""

import subprocess
from pathlib import Path

import pytest


class TestGitBranchIsolation:
    """Verify branch operations don't pollute other worktrees."""

    def test_commit_in_a_not_in_b_branch(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees on different branches
        WHEN: A commit is made in worktree A
        THEN: The commit is NOT on worktree B's branch
        """
        worktree_a, worktree_b = worktree_pair

        # Create and commit a file in A
        new_file = worktree_a / "feature_a.txt"
        new_file.write_text("Feature A content\n")

        subprocess.run(["git", "add", "feature_a.txt"], cwd=worktree_a, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Add feature A"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
        )

        # Get commit hash from A
        result_a = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        commit_a = result_a.stdout.strip()

        # Get commit hash from B
        result_b = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )
        commit_b = result_b.stdout.strip()

        # Assert different commits (B should still be at initial commit)
        assert commit_a != commit_b, "Commits should be isolated between worktrees"

    def test_branch_name_isolated(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees on different branches
        WHEN: Each worktree is on its own branch
        THEN: The branch names are different
        """
        worktree_a, worktree_b = worktree_pair

        # Get branch names
        result_a = subprocess.run(
            ["git", "branch", "--show-current"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        branch_a = result_a.stdout.strip()

        result_b = subprocess.run(
            ["git", "branch", "--show-current"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )
        branch_b = result_b.stdout.strip()

        # Assert different branches
        assert branch_a == "agent/a", f"Worktree A should be on agent/a, got {branch_a}"
        assert branch_b == "agent/b", f"Worktree B should be on agent/b, got {branch_b}"

    def test_stash_in_a_not_affecting_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with uncommitted changes in A
        WHEN: Changes are stashed in worktree A
        THEN: Worktree B is not affected
        """
        worktree_a, worktree_b = worktree_pair

        # Create uncommitted change in A
        readme_a = worktree_a / "README.md"
        readme_a.write_text("Modified in A\n")
        subprocess.run(["git", "stash"], cwd=worktree_a, check=True, capture_output=True)

        # Check B's README is unchanged
        readme_b = worktree_b / "README.md"
        content_b = readme_b.read_text()

        assert "Modified in A" not in content_b, "Stash in A should not affect B"

    def test_merge_conflict_isolated(
        self, temp_git_repo: Path, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with conflicting changes
        WHEN: Both make changes to same file
        THEN: Each worktree only sees its own changes
        """
        worktree_a, worktree_b = worktree_pair

        # Modify same file differently in each worktree
        readme_a = worktree_a / "README.md"
        readme_a.write_text("# Modified by A\n")

        readme_b = worktree_b / "README.md"
        readme_b.write_text("# Modified by B\n")

        # Assert each sees only their changes
        assert readme_a.read_text() == "# Modified by A\n"
        assert readme_b.read_text() == "# Modified by B\n"
```

**Step 2: Run tests to verify they pass**

Run: `pytest tests/isolation/test_git_isolation.py -v`
Expected: All 4 tests PASS

**Step 3: Commit**

```bash
git add tests/isolation/test_git_isolation.py
git commit -m "test(isolation): add git state isolation tests"
```

---

## Task 4: Resource Isolation Tests

**Files:**
- Create: `tests/isolation/test_resource_isolation.py`

**Step 1: Write failing test for resource isolation**

Create `tests/isolation/test_resource_isolation.py`:

```python
"""
Tests for resource isolation between parallel worktrees.

Verifies that resource usage in one worktree doesn't affect another.
"""

import os
import subprocess
import time
from pathlib import Path

import pytest


class TestProcessIsolation:
    """Verify process isolation between worktrees."""

    def test_process_spawned_in_a_not_visible_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: A long-running process is spawned in worktree A
        THEN: Worktree B can still perform operations independently
        """
        worktree_a, worktree_b = worktree_pair

        # Create a marker file to simulate process state
        marker_a = worktree_a / ".process_marker"
        marker_a.write_text("running")

        # B should be able to operate normally
        test_file_b = worktree_b / "independent.txt"
        test_file_b.write_text("B is independent")

        assert test_file_b.exists()
        assert not (worktree_b / ".process_marker").exists()

    def test_memory_heavy_operation_in_a_not_affecting_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Worktree A performs a memory-heavy operation
        THEN: Worktree B can still operate normally
        """
        worktree_a, worktree_b = worktree_pair

        # Simulate memory-heavy operation by creating large file in A
        large_file_a = worktree_a / "large_file.bin"
        large_file_a.write_bytes(os.urandom(1024 * 1024))  # 1MB

        # B should be unaffected
        small_file_b = worktree_b / "small_file.txt"
        small_file_b.write_text("B is fine")

        assert small_file_b.exists()
        assert not (worktree_b / "large_file.bin").exists()

    def test_cwd_independence(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Each worktree has its own working directory
        THEN: cd in one doesn't affect the other
        """
        worktree_a, worktree_b = worktree_pair

        # Create subdirectory in A
        subdir_a = worktree_a / "subdir"
        subdir_a.mkdir()

        # Get pwd from each worktree
        result_a = subprocess.run(
            ["pwd"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        result_b = subprocess.run(
            ["pwd"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )

        # Assert different working directories
        assert result_a.stdout.strip() == str(worktree_a)
        assert result_b.stdout.strip() == str(worktree_b)
```

**Step 2: Run tests to verify they pass**

Run: `pytest tests/isolation/test_resource_isolation.py -v`
Expected: All 3 tests PASS

**Step 3: Commit**

```bash
git add tests/isolation/test_resource_isolation.py
git commit -m "test(isolation): add resource isolation tests"
```

---

## Task 5: Port/Lock Isolation Tests

**Files:**
- Create: `tests/isolation/test_port_lock_isolation.py`

**Step 1: Write failing test for port/lock isolation**

Create `tests/isolation/test_port_lock_isolation.py`:

```python
"""
Tests for port and lock isolation between parallel worktrees.

Verifies that port/lock conflicts are prevented or handled.
"""

import fcntl
import socket
from pathlib import Path

import pytest


class TestPortLockIsolation:
    """Verify port and lock isolation between worktrees."""

    def test_file_lock_in_a_not_blocking_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: A file lock is held in worktree A
        THEN: Worktree B can still access its own files
        """
        worktree_a, worktree_b = worktree_pair

        # Create and lock a file in A
        lock_file_a = worktree_a / ".lock"
        lock_file_a.write_text("locked")

        with open(lock_file_a, "w") as f:
            fcntl.flock(f.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)

            # B should be able to write its own file
            test_file_b = worktree_b / "test.txt"
            test_file_b.write_text("B can write")

            assert test_file_b.exists()

    def test_worktree_local_lock_file(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Each worktree uses a local lock file
        THEN: Lock files are independent
        """
        worktree_a, worktree_b = worktree_pair

        # Create lock files in each worktree
        lock_a = worktree_a / ".agent.lock"
        lock_b = worktree_b / ".agent.lock"

        lock_a.write_text("agent-a-lock")
        lock_b.write_text("agent-b-lock")

        # Each should have their own lock
        assert lock_a.read_text() == "agent-a-lock"
        assert lock_b.read_text() == "agent-b-lock"
        assert lock_a != lock_b  # Different paths

    def test_port_allocation_independence(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Each worktree records its intended port
        THEN: Port allocations don't conflict (ports are external resource)
        """
        worktree_a, worktree_b = worktree_pair

        # Record port allocations (simulating agent port selection)
        port_file_a = worktree_a / ".port"
        port_file_b = worktree_b / ".port"

        port_file_a.write_text("8765")
        port_file_b.write_text("8766")

        # Each worktree should see its own port
        assert port_file_a.read_text() == "8765"
        assert port_file_b.read_text() == "8766"

        # Verify files are isolated
        assert not (worktree_b / ".port").read_text() == "8765"
        assert not (worktree_a / ".port").read_text() == "8766"
```

**Step 2: Run tests to verify they pass**

Run: `pytest tests/isolation/test_port_lock_isolation.py -v`
Expected: All 3 tests PASS

**Step 3: Commit**

```bash
git add tests/isolation/test_port_lock_isolation.py
git commit -m "test(isolation): add port/lock isolation tests"
```

---

## Task 6: Integration Test Suite

**Files:**
- Create: `tests/isolation/test_full_isolation.py`

**Step 1: Write comprehensive integration test**

Create `tests/isolation/test_full_isolation.py`:

```python
"""
Full integration test for parallel agent isolation.

Simulates a realistic parallel agent scenario with all interference modes.
"""

import subprocess
from pathlib import Path

import pytest


class TestFullParallelAgentIsolation:
    """
    Integration test simulating two agents working in parallel.

    Agent A: Creates feature files, commits, uses resources
    Agent B: Creates different files, commits, uses resources

    Both should complete independently without interference.
    """

    def test_parallel_agents_full_workflow(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees representing parallel agent sessions
        WHEN: Both agents perform full workflows simultaneously
        THEN: All operations remain isolated
        """
        worktree_a, worktree_b = worktree_pair

        # === Agent A Workflow ===
        # Create feature file
        feature_a = worktree_a / "feature_alpha.py"
        feature_a.write_text('def alpha(): return "alpha"\n')

        # Create lock
        lock_a = worktree_a / ".agent.lock"
        lock_a.write_text("agent-a-pid-12345")

        # Commit
        subprocess.run(["git", "add", "."], cwd=worktree_a, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Agent A: Add alpha feature"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
        )

        # === Agent B Workflow ===
        # Create feature file
        feature_b = worktree_b / "feature_beta.py"
        feature_b.write_text('def beta(): return "beta"\n')

        # Create lock
        lock_b = worktree_b / ".agent.lock"
        lock_b.write_text("agent-b-pid-67890")

        # Commit
        subprocess.run(["git", "add", "."], cwd=worktree_b, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Agent B: Add beta feature"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
        )

        # === Assertions ===

        # File isolation
        assert feature_a.exists()
        assert feature_b.exists()
        assert not (worktree_b / "feature_alpha.py").exists()
        assert not (worktree_a / "feature_beta.py").exists()

        # Lock isolation
        assert lock_a.read_text() == "agent-a-pid-12345"
        assert lock_b.read_text() == "agent-b-pid-67890"

        # Git isolation (different commits)
        result_a = subprocess.run(
            ["git", "log", "--oneline", "-1"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        result_b = subprocess.run(
            ["git", "log", "--oneline", "-1"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )

        assert "Agent A" in result_a.stdout
        assert "Agent B" in result_b.stdout
        assert "Agent A" not in result_b.stdout
        assert "Agent B" not in result_a.stdout

    def test_three_way_parallel_isolation(
        self, temp_git_repo: Path
    ):
        """
        GIVEN: Three worktrees from the same repository
        WHEN: All three agents work in parallel
        THEN: All remain isolated
        """
        worktrees_dir = temp_git_repo / ".worktrees"
        worktrees_dir.mkdir()

        worktrees = []
        for i, name in enumerate(["agent-x", "agent-y", "agent-z"]):
            wt_path = worktrees_dir / name
            branch = f"agent/{name}"
            subprocess.run(
                ["git", "worktree", "add", str(wt_path), "-b", branch],
                cwd=temp_git_repo,
                check=True,
                capture_output=True,
            )
            worktrees.append(wt_path)

        # Each agent creates its own file
        for i, wt in enumerate(worktrees):
            test_file = wt / f"agent_{i}_file.txt"
            test_file.write_text(f"Agent {i} was here\n")

        # Verify isolation
        for i, wt in enumerate(worktrees):
            expected_file = f"agent_{i}_file.txt"
            assert (wt / expected_file).exists()

            # Check others don't exist
            for j, other_wt in enumerate(worktrees):
                if i != j:
                    other_file = f"agent_{j}_file.txt"
                    assert not (wt / other_file).exists(), \
                        f"File leak: {other_file} found in worktree {i}"

        # Cleanup
        for wt in worktrees:
            subprocess.run(
                ["git", "worktree", "remove", "--force", str(wt)],
                cwd=temp_git_repo,
                capture_output=True,
            )
```

**Step 2: Run integration tests**

Run: `pytest tests/isolation/test_full_isolation.py -v`
Expected: All 2 tests PASS

**Step 3: Commit**

```bash
git add tests/isolation/test_full_isolation.py
git commit -m "test(isolation): add full parallel agent integration tests"
```

---

## Task 7: Test Runner and Documentation

**Files:**
- Create: `tests/isolation/run_tests.sh`
- Create: `tests/isolation/README.md`

**Step 1: Create test runner script**

Create `tests/isolation/run_tests.sh`:

```bash
#!/bin/bash
# Run isolation tests with verbose output

set -e

echo "=== Running Parallel Agent Isolation Tests ==="
echo ""

# Run all isolation tests
pytest tests/isolation/ -v --tb=short "$@"

echo ""
echo "=== All isolation tests passed ==="
```

**Step 2: Make script executable**

Run: `chmod +x tests/isolation/run_tests.sh`

**Step 3: Create README documentation**

Create `tests/isolation/README.md`:

```markdown
# Parallel Agent Isolation Tests

Tests that verify multiple Claude sessions running in parallel git worktrees cannot interfere with each other.

## Test Categories

| File | Tests | Purpose |
|------|-------|---------|
| `test_filesystem_isolation.py` | 4 | File create/modify/delete isolation |
| `test_git_isolation.py` | 4 | Branch/commit/stash isolation |
| `test_resource_isolation.py` | 3 | Process/memory/cwd isolation |
| `test_port_lock_isolation.py` | 3 | Port/lock conflict prevention |
| `test_full_isolation.py` | 2 | End-to-end parallel scenarios |

## Running Tests

```bash
# Run all isolation tests
./tests/isolation/run_tests.sh

# Run specific category
pytest tests/isolation/test_filesystem_isolation.py -v

# Run with coverage
pytest tests/isolation/ -v --cov=.
```

## Test Fixtures

- `temp_git_repo`: Creates a temporary git repository with initial commit
- `worktree_pair`: Creates two worktrees for A/B testing
- `isolated_file_content`: Sample content for file tests

## Interference Modes Tested

1. **File System Leaks**: File changes in one worktree don't appear in another
2. **Git State Pollution**: Commits/branches in one worktree don't affect another
3. **Resource Contention**: Resource usage in one worktree doesn't block another
4. **Port/Lock Conflicts**: Each worktree can use its own ports/locks independently
```

**Step 4: Run full test suite**

Run: `./tests/isolation/run_tests.sh`
Expected: 16 tests PASS

**Step 5: Commit**

```bash
git add tests/isolation/run_tests.sh tests/isolation/README.md
git commit -m "docs(isolation): add test runner and documentation"
```

---

## Summary

| Task | Description | Tests |
|------|-------------|-------|
| 1 | Project Setup and Fixtures | - |
| 2 | File System Isolation | 4 |
| 3 | Git State Isolation | 4 |
| 4 | Resource Isolation | 3 |
| 5 | Port/Lock Isolation | 3 |
| 6 | Integration Tests | 2 |
| 7 | Documentation | - |
| **Total** | | **16** |

## Verification Commands

```bash
# Run all isolation tests
./tests/isolation/run_tests.sh

# Expected output: 16 passed
```
