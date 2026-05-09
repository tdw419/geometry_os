#!/usr/bin/env python3
"""Geometry OS Metrics Collector — Observer layer for recursive self-improvement.

Lightweight (<10s). Pulls from existing data sources, does NOT re-run tests or benchmarks.
Writes one JSONL row per invocation to .autodev/metrics_history.jsonl.

Usage:
    python3 scripts/collect_metrics.py
    python3 scripts/collect_metrics.py --summary     # print trend analysis
    python3 scripts/collect_metrics.py --json         # raw JSON output
"""
import json
import os
import re
import subprocess
import sys
from datetime import datetime, timedelta
from pathlib import Path

WORKDIR = Path(__file__).resolve().parent.parent
METRICS_LOG = WORKDIR / ".autodev" / "metrics_history.jsonl"
ROADMAP_PATH = WORKDIR / "ROADMAP.md"
PERF_DOC_PATH = WORKDIR / "docs" / "PERFORMANCE_BENCHMARK.md"


def _run(cmd, timeout=15):
    """Run a shell command, return stdout or empty string."""
    try:
        r = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=WORKDIR)
        return r.stdout.strip()
    except Exception:
        return ""


def get_git_metrics():
    """Velocity: commits, phases completed, lines changed."""
    commits_24h = _run(["git", "log", "--since=24 hours ago", "--oneline"])
    commit_count = len([l for l in commits_24h.splitlines() if l.strip()])

    # Lines changed in last 24h
    diffstat = _run(["git", "diff", "--stat", "@{24 hours ago}", "HEAD"])
    lines_added = 0
    lines_removed = 0
    for line in diffstat.splitlines():
        m = re.search(r"(\d+) insertion", line)
        if m:
            lines_added += int(m.group(1))
        m = re.search(r"(\d+) deletion", line)
        if m:
            lines_removed += int(m.group(1))

    # Last commit timestamp (to detect staleness)
    last_ts = _run(["git", "log", "-1", "--format=%ci"])

    return {
        "commits_24h": commit_count,
        "lines_added_24h": lines_added,
        "lines_removed_24h": lines_removed,
        "last_commit": last_ts,
    }


def get_roadmap_metrics():
    """Parse ROADMAP.md for phase progress."""
    if not ROADMAP_PATH.exists():
        return {"total_phases": 0, "completed_phases": 0}

    content = ROADMAP_PATH.read_text()

    # Count phases: lines like "## [x] phase-NNN" or "## phase-NNN"
    all_phases = re.findall(r"^## \[.\] (phase-\S+)", content, re.MULTILINE)
    completed = re.findall(r"^## \[x\] (phase-\S+)", content, re.MULTILINE)

    # Count tasks
    total_tasks = content.count("- [ ]") + content.count("- [x]")
    done_tasks = content.count("- [x]")

    # Extract progress line if present
    progress_match = re.search(r"\*\*Progress:\*\* (\d+)/(\d+) phases complete", content)
    if progress_match:
        total_phases = int(progress_match.group(2))
        completed_phases = int(progress_match.group(1))
    else:
        total_phases = len(all_phases)
        completed_phases = len(completed)

    return {
        "total_phases": total_phases,
        "completed_phases": completed_phases,
        "total_tasks": total_tasks,
        "done_tasks": done_tasks,
        "pct_phases": round(100 * completed_phases / max(total_phases, 1), 1),
        "pct_tasks": round(100 * done_tasks / max(total_tasks, 1), 1),
    }


def get_cached_perf():
    """Read last benchmark report (NOT re-run)."""
    if not PERF_DOC_PATH.exists():
        return {}

    content = PERF_DOC_PATH.read_text()
    # Parse Criterion-style table: | bench_name | 10.7 µs | 93.3 M ops/s |
    rows = re.findall(
        r"\|\s*([\w_/]+)\s*\|\s*([\d.]+)\s*(ns|µs|us|μs|ms|s)\s*\|",
        content,
    )
    perf = {}
    for name, val, unit in rows:
        perf[name] = {"median": float(val), "unit": unit}
    return perf


def get_health():
    """Fast health check: cargo check (NOT cargo test)."""
    try:
        r = subprocess.run(
            ["cargo", "check", "--quiet"],
            capture_output=True, text=True, timeout=60, cwd=WORKDIR,
        )
        return {"compiles": r.returncode == 0, "errors": r.returncode != 0}
    except subprocess.TimeoutExpired:
        return {"compiles": "timeout", "errors": False}
    except Exception as e:
        return {"compiles": False, "errors": True, "error": str(e)}


def get_autodev_state():
    """Check cron-relevant state: stale phase claims, dirty tree."""
    dirty = _run(["git", "status", "--porcelain"])
    dirty_files = len([l for l in dirty.splitlines() if l.strip()])

    # Check for staged but uncommitted changes
    staged = _run(["git", "diff", "--cached", "--stat"])
    staged_lines = len([l for l in staged.splitlines() if l.strip()])

    return {
        "dirty_files": dirty_files,
        "staged_files": staged_lines,
        "clean_tree": dirty_files == 0,
    }


def get_loc():
    """Source line count for src/."""
    src_dir = WORKDIR / "src"
    if not src_dir.exists():
        return {"src_loc": 0}
    result = _run(["wc", "-l", "src/lib.rs"])  # quick proxy
    full = _run(["bash", "-c", "find src -name '*.rs' | xargs wc -l 2>/dev/null | tail -1"])
    try:
        loc = int(full.split()[0]) if full else 0
    except (IndexError, ValueError):
        loc = 0
    return {"src_loc": loc}


def collect():
    """Collect all metrics and write one JSONL row."""
    entry = {
        "ts": datetime.now().isoformat(),
        "git": get_git_metrics(),
        "roadmap": get_roadmap_metrics(),
        "performance": get_cached_perf(),
        "health": get_health(),
        "autodev": get_autodev_state(),
        "loc": get_loc(),
    }
    return entry


def print_summary(entry):
    """Human-readable one-liner."""
    r = entry["roadmap"]
    g = entry["git"]
    h = entry["health"]
    a = entry["autodev"]
    print(f"[{entry['ts']}]")
    print(f"  Roadmap: {r['completed_phases']}/{r['total_phases']} phases ({r['pct_phases']}%), "
          f"{r['done_tasks']}/{r['total_tasks']} tasks ({r['pct_tasks']}%)")
    print(f"  Velocity: {g['commits_24h']} commits/24h, "
          f"+{g['lines_added_24h']}/-{g['lines_removed_24h']} lines")
    print(f"  Health: {'PASS' if h['compiles'] is True else 'FAIL'}")
    dirty_msg = "clean" if a["clean_tree"] else f"{a['dirty_files']} dirty files"
    print(f"  Tree: {dirty_msg}")
    print(f"  LOC: {entry['loc']['src_loc']}")


def print_trend():
    """Read history and show trends."""
    if not METRICS_LOG.exists():
        print("No metrics history yet.")
        return

    lines = METRICS_LOG.read_text().strip().splitlines()
    if len(lines) < 2:
        print(f"Only {len(lines)} data point(s). Need more for trends.")
        return

    entries = [json.loads(l) for l in lines[-50:]]  # last 50 entries
    n = len(entries)

    # Simple trend: compare first half avg vs second half avg
    mid = n // 2
    first = entries[:mid]
    second = entries[mid:]

    def avg(key, subset):
        vals = [e.get(key, 0) for e in subset if isinstance(e.get(key), (int, float))]
        return sum(vals) / len(vals) if vals else 0

    commits_first = avg("commits_24h", [e["git"] for e in first])
    commits_second = avg("commits_24h", [e["git"] for e in second])
    phases_first = avg("completed_phases", [e["roadmap"] for e in first])
    phases_second = avg("completed_phases", [e["roadmap"] for e in second])

    def trend_label(old, new):
        if new > old * 1.1:
            return f"UP (+{((new - old) / max(old, 0.01) * 100):.0f}%)"
        elif new < old * 0.9:
            return f"DOWN ({((new - old) / max(old, 0.01) * 100):.0f}%)"
        return "STABLE"

    print(f"=== METRICS TREND ({n} samples, {entries[0]['ts'][:16]} -> {entries[-1]['ts'][:16]}) ===")
    print(f"  Commits/24h:  {commits_first:.1f} -> {commits_second:.1f}  {trend_label(commits_first, commits_second)}")
    print(f"  Phases done:  {phases_first:.1f} -> {phases_second:.1f}  {trend_label(phases_first, phases_second)}")
    print(f"  Health fails: {sum(1 for e in entries if not e['health'].get('compiles', True))}/{n} cycles")
    print(f"  Dirty trees:  {sum(1 for e in entries if not e['autodev'].get('clean_tree', True))}/{n} cycles")


def main():
    args = sys.argv[1:]

    if "--summary" in args:
        print_trend()
        return

    entry = collect()

    # Write to log
    METRICS_LOG.parent.mkdir(parents=True, exist_ok=True)
    with open(METRICS_LOG, "a") as f:
        f.write(json.dumps(entry) + "\n")

    if "--json" in args:
        print(json.dumps(entry, indent=2))
    else:
        print_summary(entry)


if __name__ == "__main__":
    main()
