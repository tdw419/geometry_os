#!/usr/bin/env bash
# linux_boot_auto.sh -- Boot Linux, extract readable output, run Ollama diagnosis
#
# Usage: bash scripts/linux_boot_auto.sh [max_instructions]
#
# Output files in .geometry_os/boot_loop/:
#   boot_output.txt     -- raw emulator output (including DBCN byte-by-byte)
#   kernel_log.txt      -- extracted readable kernel messages
#   crash_section.txt   -- the crash/panic section
#   ollama_diagnosis.md -- Ollama's analysis of the crash
#   status              -- CRASH/SUCCESS/IDLE_NO_INIT/NO_OUTPUT/BUILD_FAILURE
#   registers.txt       -- extracted register dump
#
# This script is meant to be called by Hermes (cron or interactive).
# After this script finishes, Hermes reads ollama_diagnosis.md and applies fixes.

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

STATE_DIR="$PROJECT_ROOT/.geometry_os/boot_loop"
mkdir -p "$STATE_DIR"

LOG="$STATE_DIR/loop.log"
BOOT_OUTPUT="$STATE_DIR/boot_output.txt"
KERNEL_LOG="$STATE_DIR/kernel_log.txt"
CRASH_SECTION="$STATE_DIR/crash_section.txt"
DIAGNOSIS="$STATE_DIR/ollama_diagnosis.md"
REGISTERS="$STATE_DIR/registers.txt"
ITERATION_FILE="$STATE_DIR/iteration"
FIX_HISTORY="$STATE_DIR/fix_history.md"

ITERATION=$(cat "$ITERATION_FILE" 2>/dev/null || echo "0")
ITERATION=$((ITERATION + 1))
echo "$ITERATION" > "$ITERATION_FILE"

log() { echo "[$(date '+%H:%M:%S')] [iter=$ITERATION] $*" | tee -a "$LOG"; }

log "=== Linux Boot Auto - Iteration $ITERATION ==="

# ── Step 1: Build ──────────────────────────────────────────────────────
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

# ── Step 2: Boot and capture output ────────────────────────────────────
log "Booting Linux (5min timeout)..."
timeout 300 cargo run --example boot_full_output >"$BOOT_OUTPUT" 2>&1 || true

# ── Step 3: Extract readable kernel log from DBCN byte stream ──────────
log "Extracting kernel log from DBCN output..."

# Method 1: Extract the SBI OUTPUT section directly
SBI_SECTION=$(sed -n '/=== SBI OUTPUT/,/=== UART/p' "$BOOT_OUTPUT" | head -200)

# Method 2: Decode DBCN byte stream into ASCII (the byte-by-byte [dbcn] lines)
# This handles cases where the SBI section is empty but DBCN captured output
python3 -c "
import sys, re

with open('$BOOT_OUTPUT', 'r') as f:
    text = f.read()

# Extract bytes from [dbcn] lines
decoded = []
for line in text.split('\n'):
    m = re.match(r'\[dbcn\] byte: (0x[0-9A-Fa-f]+)', line)
    if m:
        b = int(m.group(1), 16)
        if 0x20 <= b < 0x7f or b == 0x0a or b == 0x0d:
            decoded.append(chr(b))
        elif b == 0x1b:
            decoded.append('')  # ESC, skip ANSI
        else:
            pass  # skip non-printable

result = ''.join(decoded)
# Strip ANSI escape sequences
result = re.sub(r'\x1b\[[0-9;]*[mGKHJF]', '', result)
print(result)
" > "$KERNEL_LOG" 2>/dev/null || true

# If kernel_log is empty, fall back to SBI section
if [ ! -s "$KERNEL_LOG" ]; then
    echo "$SBI_SECTION" > "$KERNEL_LOG"
fi

# ── Step 4: Determine status ──────────────────────────────────────────
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

# ── Step 5: Extract crash details ─────────────────────────────────────
# Get the Oops/panic section with context
CRASH=$(echo "$COMBINED" | grep -B5 -A50 'Oops\|panic\|Fatal\|badaddr\|Call trace' | head -80)
if [ -n "$CRASH" ]; then
    echo "$CRASH" > "$CRASH_SECTION"
else
    echo "$COMBINED" | tail -30 > "$CRASH_SECTION"
fi

# Extract registers
echo "$COMBINED" | grep -E '(epc|status|badaddr|cause|ra|sp|gp|tp|t[0-6]|s[0-9]|a[0-7])' | tail -25 > "$REGISTERS" 2>/dev/null || true

# ── Step 6: Ollama diagnosis ──────────────────────────────────────────
log "Running Ollama diagnosis..."

# Build a focused prompt with just the crash info
OLLAMA_PROMPT="/tmp/linux_boot_ollama_prompt_${ITERATION}.txt"

cat > "$OLLAMA_PROMPT" << 'PROMPT_END'
You are analyzing a Linux 6.14 RV32 kernel boot crash inside a RISC-V emulator written in Rust.

The emulator emulates: CPU (RV32IMAC), MMU (Sv32 two-level page tables), UART 16550, CLINT timer, PLIC, SBI v2.0 (DBCN console), VirtIO block.
Key detail: The emulator maps guest physical RAM at PA 0x80000000 (not the Linux-default 0x80000000 with PAGE_OFFSET=0xC0000000). The kernel is compiled with PAGE_OFFSET=0xC0000000 and p_paddr=0. The emulator has a PTE fixup system that adjusts PPNs in kernel page tables to account for the VA->PA mapping.

Current crash:
PROMPT_END

echo "" >> "$OLLAMA_PROMPT"
echo '```' >> "$OLLAMA_PROMPT"
cat "$CRASH_SECTION" >> "$OLLAMA_PROMPT"
echo '```' >> "$OLLAMA_PROMPT"

echo "" >> "$OLLAMA_PROMPT"
echo "Registers:" >> "$OLLAMA_PROMPT"
echo '```' >> "$OLLAMA_PROMPT"
cat "$REGISTERS" >> "$OLLAMA_PROMPT"
echo '```' >> "$OLLAMA_PROMPT"

cat >> "$OLLAMA_PROMPT" << 'PROMPT_END'

Key emulator source files:
- src/riscv/mmu.rs -- MMU page table walk (Sv32), PPN fixup, TLB, vmalloc identity map fallback
- src/riscv/bus.rs -- Bus routing, PTE write interception, page table fixup
- src/riscv/boot.rs -- Kernel loading, DTB generation, boot page tables
- src/riscv/sbi.rs -- SBI handler (timer, console, DBCN)
- src/riscv/cpu.rs -- CPU step loop, trap handling
- src/riscv/kernel_patches.rs -- Binary patches applied to kernel at load time

The MMU (mmu.rs) has a vmalloc identity map fallback: when VA is in range 0x80000000-0xBFFFFFFF (vpn1 512-767) and the L1 entry is invalid, it computes guest_pa = ram_base + (va - 0x80000000) and returns that directly. If the result is outside RAM, it returns a scratch page at the end of RAM.

The bus (bus.rs) has PTE write interception: when auto_pte_fixup is on, writes to known page table pages are intercepted and PPNs are fixed. Leaf PTEs mapping outside RAM are invalidated (set to 0).

Analyze the crash and provide:
1. ROOT_CAUSE: What specific instruction/access is failing, and WHY
2. WHICH_RUST_FILE: Which emulator file needs to change (mmu.rs or bus.rs)
3. FIX_DESCRIPTION: Describe the exact fix in plain English (what code to add/change/remove)
4. CONFIDENCE: HIGH/MEDIUM/LOW

Keep it concise. Focus on the EMULATOR code, not the kernel code.
PROMPT_END

# Call Ollama
DIAG=$(/home/jericho/zion/bin/ollama-ask -m qwen2.5-coder:14b -f "$OLLAMA_PROMPT" 2>/dev/null || echo "OLLAMA_FAILED")

if [ "$DIAG" = "OLLAMA_FAILED" ]; then
    log "Ollama call failed"
    echo "OLLAMA_FAILED" > "$DIAGNOSIS"
else
    cat > "$DIAGNOSIS" << EOF
# Boot Loop Diagnosis - Iteration $ITERATION
- Date: $(date)
- Status: $(cat "$STATE_DIR/status")

## Crash Section
\`\`\`
$(cat "$CRASH_SECTION")
\`\`\`

## Ollama Diagnosis
$DIAG
EOF
fi

# Append to fix history
echo "" >> "$FIX_HISTORY"
echo "## Iteration $ITERATION ($(date '+%Y-%m-%d %H:%M'))" >> "$FIX_HISTORY"
echo "Status: $(cat "$STATE_DIR/status")" >> "$FIX_HISTORY"
echo "$DIAG" >> "$FIX_HISTORY"

log "Status: $(cat "$STATE_DIR/status")"
log "Diagnosis saved to $DIAGNOSIS"
log "Kernel log saved to $KERNEL_LOG"
log "Done. Hermes should read $DIAGNOSIS and apply fix."
