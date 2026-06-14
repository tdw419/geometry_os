#!/usr/bin/env bash
# linux_boot_once.sh -- Single boot attempt, saves raw output for Hermes to analyze
#
# Usage: bash scripts/linux_boot_once.sh
# Output: .geometry_os/boot_loop/boot_output.txt (raw)
#         .geometry_os/boot_loop/status (CRASH/SUCCESS/IDLE_NO_INIT/NO_OUTPUT)
#
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

STATE_DIR="$PROJECT_ROOT/.geometry_os/boot_loop"
mkdir -p "$STATE_DIR"

LOG="$STATE_DIR/loop.log"
BOOT_OUTPUT="$STATE_DIR/boot_output.txt"
KERNEL_LOG="$STATE_DIR/kernel_log.txt"
ITERATION_FILE="$STATE_DIR/iteration"

ITERATION=$(cat "$ITERATION_FILE" 2>/dev/null || echo "0")
ITERATION=$((ITERATION + 1))
echo "$ITERATION" > "$ITERATION_FILE"

log() { echo "[$(date '+%H:%M:%S')] [iter=$ITERATION] $*" | tee -a "$LOG"; }

log "=== Boot Attempt $ITERATION ==="

# ── Build ──────────────────────────────────────────────────────────────
log "Building..."
BUILD_OUT=$(cargo build --example boot_full_output 2>&1)
if ! echo "$BUILD_OUT" | tail -1 | grep -q 'Finished\|Compiling geometry_os'; then
    if echo "$BUILD_OUT" | grep -q 'error\['; then
        log "BUILD FAILED"
        echo "BUILD_FAILURE" > "$STATE_DIR/status"
        echo "$BUILD_OUT" > "$STATE_DIR/build_error.txt"
        exit 1
    fi
fi

# ── Boot ───────────────────────────────────────────────────────────────
log "Booting Linux..."
timeout 300 cargo run --example boot_full_output >"$BOOT_OUTPUT" 2>&1 || true

# ── Analyze output ────────────────────────────────────────────────────
COMBINED=$(cat "$BOOT_OUTPUT")

# Extract readable kernel log from DBCN byte stream
python3 -c "
import sys, re
with open('$BOOT_OUTPUT', 'r') as f:
    text = f.read()
decoded = []
for line in text.split('\n'):
    m = re.match(r'\[dbcn\] byte: (0x[0-9A-Fa-f]+)', line)
    if m:
        b = int(m.group(1), 16)
        if 0x20 <= b < 0x7f or b == 0x0a or b == 0x0d:
            decoded.append(chr(b))
result = ''.join(decoded)
result = re.sub(r'\x1b\[[0-9;]*[mGKHJF]', '', result)
print(result)
" > "$KERNEL_LOG" 2>/dev/null || true

# If kernel_log is empty, fall back to raw boot output
if [ ! -s "$KERNEL_LOG" ]; then
    cp "$BOOT_OUTPUT" "$KERNEL_LOG"
fi

COMBINED=$(cat "$KERNEL_LOG")

# Success check
if echo "$COMBINED" | grep -qi "Hello from /init\|login:\|Welcome\|/init started\|Please press Enter\|run-init"; then
    log "*** LINUX BOOTED SUCCESSFULLY ***"
    echo "SUCCESS" > "$STATE_DIR/status"
    exit 0
fi

# Crash check
if echo "$COMBINED" | grep -qi "Kernel panic\|Oops\|load access fault\|BUG:"; then
    log "Kernel crash detected"
    echo "CRASH" > "$STATE_DIR/status"
elif echo "$COMBINED" | grep -qi "tty0.*enabled\|arch_cpu_idle\|console.*enabled"; then
    log "Kernel reached idle (no init)"
    echo "IDLE_NO_INIT" > "$STATE_DIR/status"
elif [ -z "$COMBINED" ]; then
    log "No output captured"
    echo "NO_OUTPUT" > "$STATE_DIR/status"
else
    log "Unknown state"
    echo "UNKNOWN" > "$STATE_DIR/status"
fi

# Extract crash details for easy reading
CRASH_SECTION=$(echo "$COMBINED" | grep -B2 -A60 'Oops\|panic\|Fatal\|badaddr' | head -80)
if [ -n "$CRASH_SECTION" ]; then
    echo "$CRASH_SECTION" > "$STATE_DIR/crash_section.txt"
fi

log "Status: $(cat "$STATE_DIR/status")"
log "Output saved to $BOOT_OUTPUT"

# ── Extract milestones and structured state ──────────────────────
log "Extracting boot milestones..."
INPUT_FILE="$KERNEL_LOG"
[ ! -s "$INPUT_FILE" ] && INPUT_FILE="$BOOT_OUTPUT"
if [ -s "$INPUT_FILE" ]; then
    python3 "$PROJECT_ROOT/scripts/boot_milestones.py" "$INPUT_FILE" \
        > "$STATE_DIR/BOOT_STATE.json" 2>/dev/null || true
fi

# Generate human-readable BOOT_STATUS.md for quick handoff
if [ -f "$STATE_DIR/BOOT_STATE.json" ]; then
    python3 -c "
import json, sys
with open('$STATE_DIR/BOOT_STATE.json') as f:
    s = json.load(f)

lines = []
lines.append('# Linux Boot Status')
lines.append('')
lines.append(f'**Score: {s[\"boot_score\"]}/100** | Status: {s[\"status\"]} | Passed: {s[\"milestones_passed\"]}/20')
lines.append('')

# Crash info
if s.get('crash'):
    c = s['crash']
    lines.append('## Crash')
    lines.append(f'- Type: {c.get(\"type\", \"unknown\")}')
    lines.append(f'- Detail: {c.get(\"detail\", \"N/A\")}')
    if s.get('epc_function'):
        lines.append(f'- EPC: {s[\"epc_function\"]}')
    if s.get('registers', {}).get('badaddr'):
        lines.append(f'- badaddr: {s[\"registers\"][\"badaddr\"]}')
    lines.append('')

# Call trace
if s.get('call_trace'):
    lines.append('## Call Trace')
    for frame in s['call_trace'][:6]:
        lines.append(f'  {frame[\"addr\"]} {frame[\"func\"]}')
    lines.append('')

# Milestone progress
lines.append('## Milestones')
for m in s['milestones']:
    mark = 'x' if m['passed'] else ' '
    lines.append(f'- [{mark}] {m[\"label\"]} ({m[\"score\"]}pts)')
lines.append('')

# Comparison with previous
comp = s.get('comparison', {})
if comp.get('comparison', 'first_run') != 'first_run':
    delta = comp.get('delta_score', 0)
    arrow = 'PROGRESS' if delta > 0 else ('REGRESSION' if delta < 0 else 'SAME')
    lines.append(f'## Comparison: {arrow} ({delta:+d} pts from previous)')
    if comp.get('previous_crash_func'):
        lines.append(f'- Previous crash: {comp[\"previous_crash_func\"]}')
    lines.append('')

print('\n'.join(lines))
" > "$STATE_DIR/BOOT_STATUS.md" 2>/dev/null || true
    log "BOOT_STATE.json and BOOT_STATUS.md written"
fi

log "Done. Hermes should read BOOT_STATUS.md for quick context or BOOT_STATE.json for full data."
