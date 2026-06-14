#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# run_sandboxed.sh — Launch Geometry OS under systemd-run resource limits
#
# This prevents GeOS from crashing your host system via OOM or CPU starvation.
# Uses cgroups (same mechanism as Docker) with zero container overhead.
#
# Usage:
#   ./run_sandboxed.sh              # GUI mode (default, native feature)
#   ./run_sandboxed.sh --cli        # Headless REPL mode (no X11)
#   ./run_sandboxed.sh --cli < asm  # Pipe assembly into headless mode
#   ./run_sandboxed.sh --build      # Build first, then run in sandbox
#
# Presets (via -p flag):
#   ./run_sandboxed.sh -p light     # 1 CPU, 1GB RAM  — assembly only
#   ./run_sandboxed.sh -p medium    # 2 CPU, 2GB RAM  — bare-metal C apps
#   ./run_sandboxed.sh -p heavy     # 4 CPU, 4GB RAM  — Linux guest / QEMU
#   ./run_sandboxed.sh -p debug     # 4 CPU, 8GB RAM  — debugging sessions
# ─────────────────────────────────────────────────────────────────────────────
set -euo pipefail

cd "$(dirname "$0")"

# ── Defaults ─────────────────────────────────────────────────────────────────
PRESET="${GEO_SANDBOX_PRESET:-medium}"
BINARY=""
EXTRA_ARGS=()
BUILD_FIRST=false

# ── Presets ──────────────────────────────────────────────────────────────────
declare -A PRESET_CPU PRESET_MEM PRESET_TASKS
PRESET_CPU[light]=100%   PRESET_MEM[light]=1G   PRESET_TASKS[light]=50
PRESET_CPU[medium]=200%  PRESET_MEM[medium]=2G   PRESET_TASKS[medium]=100
PRESET_CPU[heavy]=400%   PRESET_MEM[heavy]=4G   PRESET_TASKS[heavy]=200
PRESET_CPU[debug]=400%   PRESET_MEM[debug]=8G   PRESET_TASKS[debug]=300

# ── Parse args ──────────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        -p|--preset)
            PRESET="$2"; shift 2 ;;
        --build)
            BUILD_FIRST=true; shift ;;
        -h|--help)
            head -25 "$0" | grep '^#' | sed 's/^# \?//'
            exit 0 ;;
        *)
            EXTRA_ARGS+=("$1"); shift ;;
    esac
done

# ── Resolve preset ──────────────────────────────────────────────────────────
CPU="${PRESET_CPU[$PRESET]:-${PRESET_CPU[medium]}}"
MEM="${PRESET_MEM[$PRESET]:-${PRESET_MEM[medium]}}"
TASKS="${PRESET_TASKS[$PRESET]:${PRESET_TASKS[medium]}}"

# ── Determine mode and binary ──────────────────────────────────────────────
HAS_NATIVE=false
if ldd target/release/geometry_os 2>/dev/null | grep -q minifb; then
    HAS_NATIVE=true
fi

# Check if --cli or headless is requested
IS_HEADLESS=false
for arg in "${EXTRA_ARGS[@]}"; do
    [[ "$arg" == "--cli" ]] && IS_HEADLESS=true
done

# ── Build if requested ─────────────────────────────────────────────────────
if [[ "$BUILD_FIRST" == true ]]; then
    echo "[sandbox] Building geometry_os..."
    if [[ "$IS_HEADLESS" == true ]]; then
        cargo build --release --no-default-features 2>&1
    else
        cargo build --release 2>&1
    fi
fi

# ── Pick binary ────────────────────────────────────────────────────────────
if [[ -x target/release/geometry_os ]]; then
    BINARY="$(pwd)/target/release/geometry_os"
elif [[ -x target/debug/geometry_os ]]; then
    BINARY="$(pwd)/target/debug/geometry_os"
else
    echo "[sandbox] ERROR: No geometry_os binary found. Run with --build first."
    exit 1
fi

# ── Summary ────────────────────────────────────────────────────────────────
MODE_LABEL="GUI"
[[ "$IS_HEADLESS" == true ]] && MODE_LABEL="Headless CLI"
echo "╭───────────────────────────────────────────╮"
echo "│  Geometry OS — Sandboxed Launch           │"
echo "├───────────────────────────────────────────┤"
echo "│  Mode:     $MODE_LABEL"
echo "│  Preset:   $PRESET"
echo "│  CPU cap:  $CPU"
echo "│  Mem cap:  $MEM"
echo "│  Tasks:    $TASKS"
echo "│  Binary:   $(basename "$BINARY")"
echo "╰───────────────────────────────────────────╯"

# ── Launch under systemd-run ──────────────────────────────────────────────
exec systemd-run --user --scope \
    --property="MemoryMax=$MEM" \
    --property="MemorySwapMax=$MEM" \
    --property="CPUQuota=$CPU" \
    --property="TasksMax=$TASKS" \
    --property="OOMPolicy=stop" \
    --description="geometry_os [$PRESET]" \
    "$BINARY" "${EXTRA_ARGS[@]}"
