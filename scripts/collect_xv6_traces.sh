#!/bin/bash
# Systematic trace collection for xv6 observation training
# Captures syscall patterns, privilege transitions, block I/O

set -e

TRACE_DIR="/tmp/xv6_traces"
mkdir -p "$TRACE_DIR"

cd /home/jericho/projects/zion/projects/geometry_os/geometry_os

echo "=== Building xv6 Observation Trace Dataset ==="
echo "Timestamp: $(date)"
echo "Trace directory: $TRACE_DIR"
echo ""

# Test commands to run
TESTS=(
    "ls"
    "cat init"
    "fork_test"
    "tinycalc"
    "mkdir /tmpdir; ls /tmpdir"
    "echo TEST"
    "ls -l"
    "rm /tmpdir; ls"
)

echo "Building geos_native_boot in release mode..."
cargo build --release --bin geos_native_boot

for cmd in "${TESTS[@]}"; do
    safe_name=$(echo "$cmd" | tr ' ' '_' | tr '/' '_')
    echo "Collecting trace: $cmd"
    echo "$cmd" | timeout 15 ./target/release/geos_native_boot \
        > "$TRACE_DIR/trace_${safe_name}.log" 2>&1

    # Extract syscall traces
    grep -a -E "(ECALL_U|SRET)" "$TRACE_DIR/trace_${safe_name}.log" \
        > "$TRACE_DIR/syscalls_${safe_name}.log" || true

    # Extract block I/O traces
    grep -a -E "(virtio|disk|sector)" "$TRACE_DIR/trace_${safe_name}.log" \
        > "$TRACE_DIR/blockio_${safe_name}.log" || true

    # Extract boot traces
    grep -a -E "(binit|iinit|fsinit|namei|Entering User-mode)" \
        "$TRACE_DIR/trace_${safe_name}.log" \
        > "$TRACE_DIR/boot_${safe_name}.log" || true

    echo "  → syscalls: $(wc -l < "$TRACE_DIR/syscalls_${safe_name}.log")"
    echo "  → block I/O: $(wc -l < "$TRACE_DIR/blockio_${safe_name}.log")"
    echo "  → boot: $(wc -l < "$TRACE_DIR/boot_${safe_name}.log")"
    echo ""
done

echo "=== Summary ==="
echo "Total traces collected: ${#TESTS[@]}"
echo "Location: $TRACE_DIR"
echo ""
echo "Next step: Parse traces into structured JSON for AI training"