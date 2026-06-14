#!/usr/bin/env python3
"""boot_milestones.py -- Parse kernel boot output and extract structured milestones.

Usage: python3 scripts/boot_milestones.py [boot_output_file]
       (reads from stdin if no file given)

Output: JSON with milestone status, boot score, crash info, and regression detection.

This is called by linux_boot_once.sh (or standalone) to produce BOOT_STATE.json.
The Hermes agent/cron reads BOOT_STATE.json to understand current boot progress
without re-reading raw logs.
"""

import json
import sys
import re
from datetime import datetime

# Ordered milestones. Each has a pattern to search for in the kernel log.
# The "score" is cumulative -- reaching milestone N means all prior N-1 passed.
MILESTONES = [
    {"id": "m01_kernel_entry",    "pattern": r"Linux version 6\.\d+",                  "label": "Kernel entry",            "score": 10},
    {"id": "m02_sbi_detected",    "pattern": r"SBI specification v2\.0 detected",     "label": "SBI v2.0 detected",       "score": 15},
    {"id": "m03_bootconsole",     "pattern": r"bootconsole \[sbi0\] enabled",         "label": "Bootconsole enabled",     "score": 20},
    {"id": "m04_memory_setup",    "pattern": r"Initmem setup node",                   "label": "Memory setup",            "score": 25},
    {"id": "m05_zones",           "pattern": r"Zone ranges",                          "label": "Zone ranges",             "score": 30},
    {"id": "m06_sched_clock",     "pattern": r"sched_clock:",                         "label": "Scheduler clock",         "score": 35},
    {"id": "m07_console_color",   "pattern": r"Console: colour dummy device",         "label": "Console init",            "score": 40},
    {"id": "m08_memory_report",   "pattern": r"Memory: \d+K/\d+K available",          "label": "Memory available",        "score": 45},
    {"id": "m09_devtmpfs",        "pattern": r"devtmpfs: initialized",                "label": "devtmpfs",                "score": 50},
    {"id": "m10_clocksource",     "pattern": r"clocksource: jiffies:",                "label": "Clocksource",             "score": 55},
    {"id": "m11_futex",           "pattern": r"futex hash table",                     "label": "Futex",                   "score": 58},
    {"id": "m12_bootconsole_off", "pattern": r"bootconsole \[sbi0\] disabled",        "label": "Bootconsole disabled",    "score": 60},
    {"id": "m13_asid",            "pattern": r"ASID allocator",                       "label": "ASID allocator",          "score": 65},
    {"id": "m14_dma_pool",        "pattern": r"dma_atomic_pool_init\|DMA",            "label": "DMA pool init",           "score": 70},
    {"id": "m15_irq_setup",       "pattern": r"NR_IRQS:",                             "label": "IRQ setup",               "score": 72},
    {"id": "m16_timer_irq",       "pattern": r"clockevent|timer.*registered",         "label": "Timer events",            "score": 75},
    {"id": "m17_scheduler",       "pattern": r"sched_clock|scheduler.*running",       "label": "Scheduler running",       "score": 80},
    {"id": "m18_vfs",             "pattern": r"VFS: Mounted root",                    "label": "VFS root mounted",        "score": 85},
    {"id": "m19_init",            "pattern": r"Run /sbin/init|init started|Hello.*init", "label": "Userspace init",       "score": 90},
    {"id": "m20_shell",           "pattern": r"login:|Welcome|Please press Enter",    "label": "Login prompt",            "score": 100},
]

# Crash indicators
CRASH_PATTERNS = [
    (r"Kernel panic - not syncing: (.+)",           "kernel_panic"),
    (r"Oops - (.+) \[#\d+\]",                       "oops"),
    (r"Call trace:",                                 "call_trace"),
    (r"---\[ end trace",                             "end_trace"),
]

# Key register extractions
REGISTER_PATTERNS = {
    "epc":      r"epc\s*:\s*([0-9a-fx]+)",
    "ra":       r"ra\s*:\s*([0-9a-fx]+)",
    "badaddr":  r"badaddr:\s*([0-9a-fx]+)",
    "cause":    r"cause:\s*([0-9a-fx]+)",
    "status":   r"status:\s*([0-9a-fx]+)",
    "sp":       r"sp\s*:\s*([0-9a-fx]+)",
}

# EPC function name extraction
EPC_FUNC_PATTERN = r"epc\s*:\s+(\S+)"
CALL_TRACE_PATTERN = r"\[<([0-9a-f]+)>\]\s+(\S+)"


def parse_boot_output(text: str) -> dict:
    """Parse kernel boot output and return structured state."""
    result = {
        "timestamp": datetime.now().isoformat(),
        "milestones": [],
        "milestones_passed": 0,
        "boot_score": 0,
        "farthest_milestone": None,
        "status": "UNKNOWN",
        "crash": None,
        "registers": {},
        "call_trace": [],
        "epc_function": None,
        "kernel_version": None,
        "memory_available": None,
        "raw_tail": None,
    }

    # Extract kernel version
    m = re.search(r"Linux version ([^\s]+)", text)
    if m:
        result["kernel_version"] = m.group(1)

    # Extract memory info
    m = re.search(r"Memory: (\d+K)/(\d+K) available", text)
    if m:
        result["memory_available"] = m.group(1)
        result["memory_total"] = m.group(2)

    # Check milestones in order
    for ms in MILESTONES:
        passed = bool(re.search(ms["pattern"], text, re.IGNORECASE))
        entry = {
            "id": ms["id"],
            "label": ms["label"],
            "passed": passed,
            "score": ms["score"],
        }
        result["milestones"].append(entry)
        if passed:
            result["milestones_passed"] += 1
            result["boot_score"] = ms["score"]
            result["farthest_milestone"] = ms["id"]

    # Detect crash
    for pattern, crash_type in CRASH_PATTERNS:
        m = re.search(pattern, text, re.IGNORECASE)
        if m:
            if result["crash"] is None:
                result["crash"] = {"type": crash_type}
            try:
                result["crash"]["detail"] = m.group(1).strip()
            except IndexError:
                pass

    # Extract registers
    for name, pattern in REGISTER_PATTERNS.items():
        m = re.search(pattern, text, re.IGNORECASE)
        if m:
            result["registers"][name] = m.group(1)

    # Extract EPC function name
    m = re.search(EPC_FUNC_PATTERN, text)
    if m:
        epc_val = m.group(1)
        # Look for function name on same line (format: "epc : func_name+offset/total")
        m2 = re.search(r"epc\s*:\s+(\S+)\+0x([0-9a-f]+)/0x([0-9a-f]+)", text)
        if m2:
            result["epc_function"] = m2.group(1)

    # Extract call trace
    for m in re.finditer(CALL_TRACE_PATTERN, text):
        addr = m.group(1)
        func = m.group(2)
        result["call_trace"].append({"addr": addr, "func": func})

    # Determine overall status
    if result["crash"]:
        result["status"] = "CRASH"
    elif any(ms["id"] == "m20_shell" and ms["passed"] for ms in result["milestones"]):
        result["status"] = "SUCCESS"
    elif any(ms["id"] == "m17_scheduler" and ms["passed"] for ms in result["milestones"]):
        result["status"] = "IDLE_NO_INIT"
    elif not text.strip():
        result["status"] = "NO_OUTPUT"
    else:
        result["status"] = "UNKNOWN"

    # Keep last 5 lines of output for quick context
    lines = text.strip().split("\n")
    if lines:
        result["raw_tail"] = lines[-5:]

    return result


def compare_with_previous(current: dict, previous: dict | None) -> dict:
    """Compare current boot with previous to detect regression or progress."""
    if previous is None:
        return {"comparison": "first_run", "delta_score": 0, "regression": False}

    delta = current["boot_score"] - previous.get("boot_score", 0)
    comp = {
        "comparison": "progress" if delta > 0 else ("regression" if delta < 0 else "no_change"),
        "previous_score": previous.get("boot_score", 0),
        "delta_score": delta,
        "regression": delta < 0,
        "previous_farthest": previous.get("farthest_milestone"),
        "previous_crash_func": previous.get("epc_function"),
    }
    return comp


def main():
    # Read input
    if len(sys.argv) > 1:
        with open(sys.argv[1], "r") as f:
            text = f.read()
    else:
        text = sys.stdin.read()

    # Parse
    state = parse_boot_output(text)

    # Load previous state for comparison
    prev_path = ".geometry_os/boot_loop/BOOT_STATE.json"
    previous = None
    try:
        with open(prev_path, "r") as f:
            previous = json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        pass

    state["comparison"] = compare_with_previous(state, previous)

    # Output JSON
    print(json.dumps(state, indent=2))


if __name__ == "__main__":
    main()
