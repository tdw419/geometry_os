#!/usr/bin/env bash
# merge-worktree.sh N -- Merge feat/geo-N into master, test, rollback on failure
# Usage: ./merge-worktree.sh 112
set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "ERROR: Usage: $0 <issue-number>" >&2
    exit 1
fi

ISSUE_NUM="$1"
REPO_ROOT="$(git rev-parse --show-toplevel)"
WORKTREE_BASE="${REPO_ROOT}/../worktrees"
WORKTREE_DIR="${WORKTREE_BASE}/geo-${ISSUE_NUM}"
BRANCH="feat/geo-${ISSUE_NUM}"

# Resolve path for comparison
WORKTREE_RESOLVED="$(readlink -f "${WORKTREE_DIR}" 2>/dev/null || echo "")"

# Verify worktree exists
if [[ -z "${WORKTREE_RESOLVED}" ]] || ! git worktree list --porcelain | grep -q "worktree ${WORKTREE_RESOLVED}"; then
    echo "ERROR: No worktree found at ${WORKTREE_DIR}" >&2
    echo "       Run create-worktree.sh ${ISSUE_NUM} first" >&2
    exit 1
fi

# Verify branch exists
if ! git rev-parse --verify "${BRANCH}" >/dev/null 2>&1; then
    echo "ERROR: Branch ${BRANCH} does not exist" >&2
    exit 1
fi

# Record current master revision for rollback
MASTER_BEFORE="$(git rev-parse master)"

echo "Merging ${BRANCH} into master..."

# Switch to master and merge
git checkout master

if git merge --no-ff "${BRANCH}" -m "Merge ${BRANCH}: issue GEO-${ISSUE_NUM}"; then
    echo "Merge succeeded. Running cargo test..."
    if cargo test 2>&1; then
        echo "OK: All tests passed. Merge of ${BRANCH} into master complete."
    else
        echo "FAIL: Tests failed after merge. Rolling back..."
        git reset --hard "${MASTER_BEFORE}"
        echo "Rolled back master to ${MASTER_BEFORE}"
        exit 1
    fi
else
    echo "FAIL: Merge conflict detected. Aborting merge." >&2
    git merge --abort
    echo "Merge aborted. master is unchanged at ${MASTER_BEFORE}"
    exit 1
fi
