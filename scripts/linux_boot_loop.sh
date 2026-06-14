#!/usr/bin/env bash
# linux_boot_loop.sh -- Automated Linux boot debugging loop
#
# 1. Builds the GeOS example
# 2. Boots Linux, captures SBI + UART output
# 3. Feeds crash output to Ollama for diagnosis
# 4. Saves diagnosis + suggested fix to a state file
# 5. Hermes cron picks up the fix and applies it
#
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

STATE_DIR="$PROJECT_ROOT/.geometry_os/boot_loop"
mkdir -p "$STATE_DIR"

LOG="$STATE_DIR/loop.log"
DIAGNOSIS="$STATE_DIR/diagnosis.md"
BOOT_OUTPUT="$STATE_DIR/boot_output.txt"
ITERATION_FILE="$STATE_DIR/iteration"
FIX_FILE="$STATE_DIR/suggested_fix.txt"

# Read iteration counter
ITERATION=$(cat "$ITERATION_FILE" 2>/dev/null || echo "0")
ITERATION=$((ITERATION + 1))
echo "$ITERATION" > "$ITERATION_FILE"

log() { echo "[$(date '+%H:%M:%S')] [iter=$ITERATION] $*" | tee -a "$LOG"; }

log "=== Linux Boot Debug Loop - Iteration $ITERATION ==="

# ── Step 1: Build ──────────────────────────────────────────────────────
log "Building..."
if ! cargo build --example boot_full_output 2>&1 | tail -3; then
    log "BUILD FAILED"
    echo "BUILD_FAILURE" > "$STATE_DIR/status"
    exit 1
fi

# ── Step 2: Boot and capture output ────────────────────────────────────
log "Booting Linux (200M instructions)..."
timeout 300 cargo run --example boot_full_output >"$BOOT_OUTPUT" 2>&1 || true

# Extract the relevant sections
SBI_OUTPUT=$(sed -n '/=== SBI OUTPUT/,/=== UART/p' "$BOOT_OUTPUT" | head -200)
UART_OUTPUT=$(sed -n '/=== UART OUTPUT/,/=== END/p' "$BOOT_OUTPUT" | head -100)
COMBINED=$(sed -n '/=== SBI OUTPUT/,/=== END/p' "$BOOT_OUTPUT" | head -300)

# Quick success check
if echo "$COMBINED" | grep -q "Hello from /init\|login:\|Welcome\|/init started"; then
    log "*** LINUX BOOTED SUCCESSFULLY ***"
    echo "SUCCESS" > "$STATE_DIR/status"
    echo "$COMBINED" > "$STATE_DIR/success_output.txt"
    exit 0
fi

# Check for panic/crash
if echo "$COMBINED" | grep -q "Kernel panic\|Oops\|load access fault\|BUG:"; then
    log "Kernel crash detected"
    echo "CRASH" > "$STATE_DIR/status"
elif echo "$COMBINED" | grep -q "tty0.*enabled\|arch_cpu_idle"; then
    log "Kernel reached idle (no init)"
    echo "IDLE_NO_INIT" > "$STATE_DIR/status"
elif [ -z "$COMBINED" ]; then
    log "No output captured"
    echo "NO_OUTPUT" > "$STATE_DIR/status"
else
    log "Unknown state"
    echo "UNKNOWN" > "$STATE_DIR/status"
fi

# ── Step 3: Extract crash details ──────────────────────────────────────
# Get the last 80 lines of kernel output (the crash part)
CRASH_SECTION=$(echo "$COMBINED" | grep -A80 'Oops\|panic\|Fatal\|Call trace\|badaddr' | head -80)

if [ -z "$CRASH_SECTION" ]; then
    # No crash -- get the last 20 lines of output to see where it stopped
    CRASH_SECTION=$(echo "$COMBINED" | tail -20)
fi

# Also grab the last register dump
REGS=$(echo "$COMBINED" | grep -E '(epc|status|badaddr|cause|a[0-7]|s[0-9]|t[0-6])' | tail -20)

# ── Step 4: Feed to Ollama for diagnosis ───────────────────────────────
log "Sending to Ollama for diagnosis..."

# Build the prompt
PROMPT="You are debugging a Linux 6.14 RV32 kernel boot inside a RISC-V emulator (Geometry OS).

The emulator runs in Rust and emulates: CPU (RV32IMAC), MMU (Sv32), UART 16550, CLINT timer, PLIC, SBI v2.0, VirtIO block.

Current boot status: $(cat "$STATE_DIR/status")
Iteration: $ITERATION

Last kernel output:
$CRASH_SECTION

Register dump:
$REGS

Previous fix attempts are in: $STATE_DIR/fix_history.md (if it exists)

Key files in the emulator:
- src/riscv/mmu.rs -- MMU page table walk, PPN fixup, TLB
- src/riscv/bus.rs -- Bus routing, UART/CLINT/PLIC, address mapping
- src/riscv/boot.rs -- Kernel loading, DTB generation, boot page tables
- src/riscv/sbi.rs -- SBI handler (timer, console, DBCN)
- src/riscv/cpu.rs -- CPU step loop, trap handling
- src/riscv/dtb.rs -- Device tree generation
- src/riscv/kernel_patches.rs -- Binary patches applied to kernel at load time

Known issues already fixed:
- ram_base changed from 0xC0000000 to 0x80000000
- MRET S-mode entry (mepc = virtual entry point)
- kernel_map.phys_addr binary patch (NOP out writes, pre-set phys_addr=0, va_pa_offset=0xC0000000)
- SBI v0.2 console putchar (a6=0 is putchar, not getchar)
- FP opcodes treated as NOPs
- TLB changed to HashMap (no capacity eviction)
- Identity mapping covers all kernel LOAD segments
- C.ADDI4SPN imm=0 is HINT (NOP), not Invalid
- initrd placement moved to after kernel_phys_end to avoid memblock overlap
- PPN fixup in mmu.rs page walk for virtual PPNs >= 0xC0000

Analyze the crash and provide:
1. ROOT_CAUSE: What's going wrong (be specific about addresses and registers)
2. FILE_AND_FUNCTION: Which Rust file and function needs to change
3. FIX: Exact Rust code change needed (show the old and new code)
4. CONFIDENCE: How sure are you (HIGH/MEDIUM/LOW)

Format your response as markdown with clear sections."

# Save the prompt for debugging
echo "$PROMPT" > "$STATE_DIR/ollama_prompt.txt"

# Call Ollama
DIAG=$(/home/jericho/zion/bin/ollama-ask -m qwen2.5-coder:14b -f "$STATE_DIR/ollama_prompt.txt" 2>/dev/null || echo "OLLAMA_FAILED")

if [ "$DIAG" = "OLLAMA_FAILED" ]; then
    log "Ollama call failed"
    echo "OLLAMA_FAILED" > "$STATE_DIR/status"
    exit 1
fi

# Save diagnosis
cat > "$DIAGNOSIS" << EOF
# Boot Loop Diagnosis - Iteration $ITERATION
- Date: $(date)
- Status: $(cat "$STATE_DIR/status")
- PC at crash: $(echo "$COMBINED" | grep -oP 'PC: 0x[0-9A-Fa-f]+' | tail -1)

## Crash Output
\`\`\`
$CRASH_SECTION
\`\`\`

## Ollama Diagnosis
$DIAG
EOF

# Extract the fix suggestion
echo "$DIAG" > "$FIX_FILE"

# Append to fix history
echo "" >> "$STATE_DIR/fix_history.md"
echo "## Iteration $ITERATION ($(date '+%Y-%m-%d %H:%M'))" >> "$STATE_DIR/fix_history.md"
echo "Status: $(cat "$STATE_DIR/status")" >> "$STATE_DIR/fix_history.md"
echo "$DIAG" >> "$STATE_DIR/fix_history.md"

log "Diagnosis saved to $DIAGNOSIS"
log "Status: $(cat "$STATE_DIR/status")"

# Show a summary
log "---"
log "Root cause summary:"
echo "$DIAG" | grep -A3 'ROOT_CAUSE\|root.*cause' | head -5 | while read line; do
    log "  $line"
done
log "Fix target:"
echo "$DIAG" | grep -A3 'FILE_AND_FUNCTION\|file.*function' | head -5 | while read line; do
    log "  $line"
done
log "---"
log "Next: Hermes should read $DIAGNOSIS and apply the fix"
