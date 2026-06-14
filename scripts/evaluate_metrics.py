#!/usr/bin/env python3
"""Evaluator — reads metrics history and produces a Process Improvement Proposal.

This is Layer 2 of the recursive self-improvement loop.
Runs periodically, analyzes trends, and outputs a structured PIP.

Usage:
    python3 scripts/evaluate_metrics.py
    python3 scripts/evaluate_metrics.py --auto-apply   # also write PIP for actuator
"""
import json
import sys
from datetime import datetime
from pathlib import Path

WORKDIR = Path(__file__).resolve().parent.parent
METRICS_LOG = WORKDIR / ".autodev" / "metrics_history.jsonl"
PIP_DIR = WORKDIR / ".autodev" / "pips"


def load_history(max_entries=50):
    if not METRICS_LOG.exists():
        return []
    lines = METRICS_LOG.read_text().strip().splitlines()
    return [json.loads(l) for l in lines[-max_entries:]]


def compute_summary(entries):
    """Compute summary stats from history."""
    if not entries:
        return None

    n = len(entries)
    first = entries[0]
    last = entries[-1]

    # Normalize key names (Gemini used 'timestamp', we use 'ts')
    for e in entries:
        if "timestamp" in e and "ts" not in e:
            e["ts"] = e.pop("timestamp")

    # Health
    health_ok = sum(1 for e in entries if e.get("health", {}).get("compiles") is True)
    health_rate = round(100 * health_ok / n, 1)

    # Velocity trend: split into halves
    mid = n // 2
    first_half = entries[:mid] if mid > 0 else entries
    second_half = entries[mid:] if mid > 0 else entries

    def avg_commits(subset):
        return sum(e.get("git", {}).get("commits_24h", 0) for e in subset) / max(len(subset), 1)

    commits_first = avg_commits(first_half)
    commits_second = avg_commits(second_half)

    # Phase progress delta
    phases_first = first.get("roadmap", {}).get("completed_phases", 0)
    phases_last = last.get("roadmap", {}).get("completed_phases", 0)
    tasks_first = first.get("roadmap", {}).get("done_tasks", 0)
    tasks_last = last.get("roadmap", {}).get("done_tasks", 0)

    # Dirty tree frequency
    dirty_count = sum(1 for e in entries if not e.get("autodev", {}).get("clean_tree", True))

    # LOC trend
    loc_first = first.get("loc", {}).get("src_loc", 0)
    loc_last = last.get("loc", {}).get("src_loc", 0)

    return {
        "period": f"{first['ts'][:16]} -> {last['ts'][:16]}",
        "samples": n,
        "health_rate": health_rate,
        "commits_trend": {
            "first_half_avg": round(commits_first, 1),
            "second_half_avg": round(commits_second, 1),
            "direction": "up" if commits_second > commits_first * 1.1 else ("down" if commits_second < commits_first * 0.9 else "stable"),
        },
        "phases_completed": phases_last - phases_first,
        "tasks_completed": tasks_last - tasks_first,
        "dirty_tree_rate": round(100 * dirty_count / n, 1),
        "loc_delta": loc_last - loc_first,
        "latest": last,
    }


def detect_bottlenecks(summary):
    """Identify the top bottleneck from summary stats."""
    if not summary:
        return []

    bottlenecks = []

    # Low health
    if summary["health_rate"] < 90:
        bottlenecks.append({
            "severity": "critical",
            "signal": f"Build health at {summary['health_rate']}% (target: >95%)",
            "hypothesis": "Recent commits introduced compile errors. Check last N commits for breakage.",
            "target": "src/ (code quality)",
        })

    # Stalling velocity
    ct = summary["commits_trend"]
    if ct["direction"] == "down" and ct["second_half_avg"] < 5:
        bottlenecks.append({
            "severity": "high",
            "signal": f"Commit velocity declining: {ct['first_half_avg']} -> {ct['second_half_avg']} commits/24h avg",
            "hypothesis": "Drafter may be stuck on a hard phase, or preflight gates are too strict.",
            "target": "autodev drafter prompt or preflight gates",
        })

    # No phase progress
    if summary["phases_completed"] == 0 and summary["samples"] > 5:
        bottlenecks.append({
            "severity": "high",
            "signal": f"Zero phases completed over {summary['samples']} samples",
            "hypothesis": "Phases may be too large, or drafter is doing implementation without closing phases.",
            "target": "ROADMAP.md (phase granularity) or drafter prompt",
        })

    # Dirty tree
    if summary["dirty_tree_rate"] > 50:
        bottlenecks.append({
            "severity": "medium",
            "signal": f"Tree dirty {summary['dirty_tree_rate']}% of the time",
            "hypothesis": "Reviewer/shipper not committing work promptly, or drafter leaving uncommitted artifacts.",
            "target": "reviewer/shipper prompt",
        })

    # No bottlenecks = system is healthy
    if not bottlenecks:
        bottlenecks.append({
            "severity": "none",
            "signal": "System operating normally",
            "hypothesis": None,
            "target": None,
        })

    return bottlenecks


def build_evaluator_prompt(summary, bottlenecks):
    """Build the prompt that an LLM evaluator would receive."""
    return f"""You are the Process Evaluator for Geometry OS autodev. Analyze these metrics and produce ONE Process Improvement Proposal (PIP).

## Metrics Summary
- Period: {summary['period']}
- Samples: {summary['samples']}
- Build health: {summary['health_rate']}%
- Commit velocity: {summary['commits_trend']['first_half_avg']} -> {summary['commits_trend']['second_half_avg']} avg commits/24h ({summary['commits_trend']['direction']})
- Phases completed: {summary['phases_completed']}
- Tasks completed: {summary['tasks_completed']}
- Dirty tree rate: {summary['dirty_tree_rate']}%
- LOC delta: {summary['loc_delta']:+d}

## Detected Bottlenecks
{chr(10).join(f"- [{b['severity'].upper()}] {b['signal']}" + (f" -- Hypothesis: {b['hypothesis']}" if b['hypothesis'] else "") for b in bottlenecks)}

## Latest Snapshot
{json.dumps(summary['latest'], indent=2)}

## Instructions
If severity is "none", output: {{"action": "none", "reason": "system healthy"}}
Otherwise, produce a structured PIP:
```json
{{
  "action": "modify_file",
  "target": "path/to/file",
  "description": "What to change and why",
  "hypothesis": "Expected improvement",
  "risk": "low|medium|high",
  "apply_cmd": "bash command to make the edit (e.g. sed, python script)",
  "validate_cmd": "bash command to verify health (e.g. cargo check or test)"
}}
```"""


def main():
    auto_apply = "--auto-apply" in sys.argv

    entries = load_history()
    summary = compute_summary(entries)
    bottlenecks = detect_bottlenecks(summary)

    print("=== PROCESS EVALUATION ===")
    if not summary:
        print("No metrics data. Run collect_metrics.py first.")
        return

    print(f"Period: {summary['period']} ({summary['samples']} samples)")
    print(f"Health: {summary['health_rate']}%")
    print(f"Velocity: {summary['commits_trend']['direction']} ({summary['commits_trend']['first_half_avg']} -> {summary['commits_trend']['second_half_avg']})")
    print(f"Phases done: {summary['phases_completed']}, Tasks done: {summary['tasks_completed']}")
    print(f"Dirty tree: {summary['dirty_tree_rate']}%")
    print()

    print("Bottlenecks:")
    for b in bottlenecks:
        print(f"  [{b['severity'].upper()}] {b['signal']}")
        if b['hypothesis']:
            print(f"    -> {b['hypothesis']}")
            print(f"    -> Target: {b['target']}")
    print()

    if auto_apply and bottlenecks[0]["severity"] != "none":
        PIP_DIR.mkdir(parents=True, exist_ok=True)
        pip = {
            "timestamp": datetime.now().isoformat(),
            "summary": summary,
            "bottlenecks": bottlenecks,
            "evaluator_prompt": build_evaluator_prompt(summary, bottlenecks),
        }
        pip_path = PIP_DIR / f"pip_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        pip_path.write_text(json.dumps(pip, indent=2))
        print(f"PIP written to {pip_path}")
        print("(Feed evaluator_prompt to an LLM to get the actual improvement proposal)")
    else:
        print("Run with --auto-apply to write a PIP file for the actuator.")


if __name__ == "__main__":
    main()
