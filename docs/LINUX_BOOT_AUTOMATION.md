# Linux Boot Automation

How the autonomous Linux boot debugging system works.

---

## The Problem

We are booting Linux 6.14 (RV32) inside the Geometry OS RISC-V emulator. The
kernel crashes somewhere during boot, and the crash is in the emulator's Rust
code (MMU page table walk, bus routing, etc.), not in the kernel itself.

Each boot attempt takes ~90 seconds (build + run 200M instructions). Finding
the right fix requires reading crash output, understanding the Sv32 MMU logic,
and making a precise code change. This is slow and repetitive to do by hand.

The automation solves three problems:

1. **Context loss** -- Every new session starts fresh and has to re-read raw logs
2. **No measurement** -- There's no way to tell if a fix helped, hurt, or did nothing
3. **Slow iteration** -- A human has to trigger each build/boot/analyze cycle

---

## The System

```
                    linux_boot_once.sh
                          |
                    build + boot Linux
                    decode DBCN byte stream -> kernel_log.txt
                    classify status (CRASH / SUCCESS / IDLE / NO_OUTPUT)
                          |
                   boot_milestones.py
                          |
                    parse kernel_log.txt against 20 milestones
                    extract crash info, registers, call trace
                    compare with previous BOOT_STATE.json
                    write BOOT_STATE.json + BOOT_STATUS.md
                          |
                    Hermes agent (cron or interactive)
                          |
                    read BOOT_STATUS.md (instant context)
                    decide: fix helped? fix hurt? new approach?
                    read mmu.rs / bus.rs / boot.rs
                    apply code fix
                          |
                    loop back to linux_boot_once.sh
```

---

## Scripts

### `scripts/linux_boot_once.sh`

The main script. Called by both interactive sessions and the cron job.

What it does:
1. Build the emulator (`cargo build --example boot_full_output`)
2. Boot Linux with a 5-minute timeout
3. Decode the DBCN byte stream into readable kernel messages
4. Classify the boot status
5. Run `boot_milestones.py` to score the boot and write structured state
6. Generate `BOOT_STATUS.md` for quick human/agent consumption

Usage:
```bash
cd /home/jericho/projects/zion/projects/geometry_os/geometry_os
bash scripts/linux_boot_once.sh
```

Takes ~60-90 seconds. All output goes to `.geometry_os/boot_loop/`.

### `scripts/linux_boot_auto.sh`

The same pipeline plus an Ollama diagnosis step. After extracting the crash,
it feeds the crash output to the local Ollama model (qwen2.5-coder:14b) for
analysis. The Ollama diagnosis is saved to `ollama_diagnosis.md`.

The Ollama diagnosis is useful for identifying WHERE the crash is (which file,
which address, which function) but the fix suggestions are often generic or
hallucinated. The cloud model (Hermes) does the actual code fix.

### `scripts/linux_boot_loop.sh`

An earlier version of linux_boot_auto.sh. Kept for reference.

### `scripts/boot_milestones.py`

The scoring engine. Parses a kernel log against 20 ordered milestones and
produces structured JSON.

Usage:
```bash
python3 scripts/boot_milestones.py .geometry_os/boot_loop/kernel_log.txt
```

Output goes to stdout as JSON. The scripts pipe it to `BOOT_STATE.json`.

---

## Boot Scoring

The 20 milestones are ordered by when they appear in a normal Linux boot.
Each has a score. The boot score is the score of the highest milestone that
passed. This gives a rough progress percentage.

| ID   | Milestone              | Score | What it means                    |
|------|------------------------|-------|----------------------------------|
| m01  | Kernel entry           | 10    | Kernel started executing         |
| m02  | SBI v2.0 detected      | 15    | SBI handshake works              |
| m03  | Bootconsole enabled    | 20    | Early console output             |
| m04  | Memory setup           | 25    | memblock initialized             |
| m05  | Zone ranges            | 30    | Memory zones configured          |
| m06  | Scheduler clock        | 35    | sched_clock registered           |
| m07  | Console init           | 40    | Color console initialized        |
| m08  | Memory available       | 45    | Memory report printed            |
| m09  | devtmpfs               | 50    | Device filesystem ready          |
| m10  | Clocksource            | 55    | Jiffies clocksource registered   |
| m11  | Futex                  | 58    | Futex hash table allocated       |
| m12  | Bootconsole disabled   | 60    | Switched to proper console       |
| m13  | ASID allocator         | 65    | ASID bits allocated              |
| m14  | DMA pool init          | 70    | DMA coherent pool created        |
| m15  | IRQ setup              | 72    | Interrupt controllers mapped      |
| m16  | Timer events           | 75    | Clockevent device registered     |
| m17  | Scheduler running      | 80    | Scheduler fully initialized      |
| m18  | VFS root mounted       | 85    | Root filesystem mounted          |
| m19  | Userspace init         | 90    | /init or /sbin/init executing    |
| m20  | Login prompt           | 100   | Shell / login prompt visible     |

Current best: **80/100** (DMA pool init passed, crashes in free_frozen_pages during init cleanup).

The score comparison between runs is the key signal:
- **Score went up** -- fix helped, keep going
- **Score stayed same** -- fix had no effect, different crash at same point
- **Score went down** -- fix broke something, revert immediately

---

## State Directory

All state lives in `.geometry_os/boot_loop/`. This directory persists across
sessions and cron runs.

```
.geometry_os/boot_loop/
  BOOT_STATUS.md       Quick summary for human/agent (read this first)
  BOOT_STATE.json      Full structured data (milestones, crash, registers)
  status               Single word: CRASH / SUCCESS / IDLE_NO_INIT / etc
  boot_output.txt      Raw emulator output (SBI + UART + DBCN bytes)
  kernel_log.txt       Decoded readable kernel messages
  crash_section.txt    Extracted Oops/panic section
  registers.txt        Extracted register dump
  ollama_diagnosis.md  Ollama's local analysis (if linux_boot_auto.sh was used)
  fix_history.md       Running log of all fix attempts and outcomes
  iteration            Counter (incremented each boot)
  loop.log             Timestamped log of all boot attempts
```

### BOOT_STATUS.md (example)

```markdown
# Linux Boot Status

**Score: 80/100** | Status: CRASH | Passed: 17/20

## Crash
- Type: kernel_panic
- Detail: Attempted to kill init! exitcode=0x0000000b
- EPC: free_frozen_pages
- badaddr: 206224e6

## Call Trace
  c00a10e2 free_frozen_pages+0x6c/0x37c
  c00a3c4a free_reserved_area+0x118/0x184
  c00099c8 free_initmem+0x6c/0x7e
  c021cb14 kernel_init+0x38/0x122
  c022209a ret_from_exception_end+0xe/0x18

## Milestones
- [x] Kernel entry (10pts)
- [x] SBI v2.0 detected (15pts)
- ... (17 passed, through scheduler running)
- [ ] VFS root mounted (85pts)
- [ ] Userspace init (90pts)
- [ ] Login prompt (100pts)

## Comparison: SAME SCORE, NEW CRASH
- Previous crash: __vmap_pages_range_noflush (DMA pool vmalloc OOB)
- This crash: free_frozen_pages (init cleanup, post-initramfs)
```

### BOOT_STATE.json (structure)

```json
{
  "timestamp": "2026-05-24T03:24:31",
  "boot_score": 80,
  "farthest_milestone": "m17_scheduler",
  "status": "CRASH",
  "crash": {
    "type": "kernel_panic",
    "detail": "Attempted to kill init! exitcode=0x0000000b"
  },
  "registers": {
    "epc": "c00a10e2",
    "badaddr": "206224e6",
    "cause": "0000000d"
  },
  "call_trace": [
    {"addr": "c00a10e2", "func": "free_frozen_pages+0x6c/0x37c"},
    {"addr": "c00a3c4a", "func": "free_reserved_area+0x118/0x184"}
  ],
  "epc_function": "free_frozen_pages",
  "comparison": {
    "comparison": "SAME_SCORE_NEW_CRASH",
    "previous_score": 80,
    "delta_score": 0,
    "regression": false,
    "previous_crash_func": "__vmap_pages_range_noflush"
  }
}
```

---

## Cron Job: `linux-boot-debug`

A Hermes cron job that runs the debug loop autonomously.

- Schedule: every 15 minutes
- Max runs: 10 total (then stops)
- Max iterations per run: 5
- Currently: paused
- Prompt: `~/.hermes/prompts/linux_boot_auto_debug.txt`
- Toolsets: terminal, file, web

Each cron run:

1. Calls `linux_boot_once.sh` to boot and score
2. Reads `BOOT_STATUS.md` for instant context
3. Reads the relevant Rust source file
4. Applies a code fix
5. Loops back to step 1 (up to 5 times)
6. Stops if score reaches 100 (SUCCESS) or 5 attempts fail

To activate:
```bash
hermes cron resume linux-boot-debug
```

Or run interactively (faster, no 15-min wait):
```bash
# In a Hermes chat session:
bash scripts/linux_boot_once.sh
cat .geometry_os/boot_loop/BOOT_STATUS.md
# Read the crash, fix the code, repeat
```

---

## Division of Labor

```
+-----------------------------+    +-----------------------------+
| OLLAMA (local, free, fast)  |    | CLOUD MODEL (Hermes cron)   |
| qwen2.5-coder:14b           |    | GLM-5.1 / Claude / etc      |
|                             |    |                             |
| Identifies WHERE crash is   |    | Reads full Rust source code |
| badaddr, EPC, call trace    |    | Understands Sv32 walk logic |
| ~160 tok/s, immediate       |    | Applies precise code fix    |
|                             |    | Reads BOOT_STATUS.md first  |
| Confidence: crime scene     |    | Score comparison: did fix   |
| only, not the solution      |    | help or hurt?               |
+-----------------------------+    +-----------------------------+
         |                                    |
         v                                    v
   ollama_diagnosis.md              BOOT_STATE.json
   (saved for reference)            BOOT_STATUS.md
                                    fix_history.md
```

The local Ollama model is fast (seconds) and free but can only identify the
crash location. The cloud model is expensive and slow (15-min intervals) but
can read the Rust code and make actual fixes. The scoring system bridges them:
Ollama produces the raw crash data, boot_milestones.py scores it, and the
cloud model gets a compact summary instead of raw logs.

---

## The Cron Prompt

The prompt at `~/.hermes/prompts/linux_boot_auto_debug.txt` includes:

1. **Architecture context** -- RV32IMAC, Sv32, RAM layout, vmalloc range
2. **The bug pattern** -- vmalloc PPN handling in mmu.rs, megapage OOB redirect
3. **Already-fixed issues** -- 13 items the model should NOT re-fix
4. **Safety rules** -- max 5 iterations, revert on regression, stop on double
   build failure, never overwrite logs
5. **Boot score awareness** -- read BOOT_STATUS.md first, use score to decide
   whether to keep or revert the last fix

The prompt is the "brain" of the automation. It needs to be updated when:
- A new issue is fixed (add to the "already fixed" list)
- The crash location changes (update the "key insight" section)
- New milestones are needed (edit boot_milestones.py and add them)

---

## Adding New Milestones

If the kernel gets past the current crash and fails at a new point, add a
milestone for the new failure point in `scripts/boot_milestones.py`:

```python
MILESTONES = [
    # ... existing milestones ...
    {"id": "m14_dma_pool", "pattern": r"dma_atomic_pool_init", "label": "DMA pool init", "score": 70},
    # Add new milestone here with a pattern that appears in the kernel log
    # just BEFORE the new crash point
]
```

The pattern should be a regex that appears in the kernel log output. The score
should be between the last passing milestone and the next failing one.

---

## Workflow: Fixing a Crash Interactively

```bash
# 1. Boot and score
cd /home/jericho/projects/zion/projects/geometry_os/geometry_os
bash scripts/linux_boot_once.sh

# 2. Read the summary
cat .geometry_os/boot_loop/BOOT_STATUS.md

# 3. If crash, read the relevant Rust file
# (BOOT_STATUS.md tells you which file based on the crash pattern)

# 4. Apply fix (manually or via Hermes)
# Edit src/riscv/mmu.rs or wherever the bug is

# 5. Reboot and compare
bash scripts/linux_boot_once.sh
cat .geometry_os/boot_loop/BOOT_STATUS.md
# Look at the "Comparison" section -- did the score change?

# 6. If score went down, revert
git checkout -- src/riscv/mmu.rs
# Try a different fix

# 7. Repeat until score = 100
```

---

## Files

| File | What it does |
|------|-------------|
| `scripts/linux_boot_once.sh` | Build + boot + decode + score + status |
| `scripts/linux_boot_auto.sh` | Same + Ollama diagnosis |
| `scripts/boot_milestones.py` | Parse kernel log into milestones + JSON |
| `.geometry_os/boot_loop/BOOT_STATUS.md` | Quick handoff summary |
| `.geometry_os/boot_loop/BOOT_STATE.json` | Full structured state |
| `.geometry_os/boot_loop/fix_history.md` | Audit trail of all fix attempts |
| `~/.hermes/prompts/linux_boot_auto_debug.txt` | Cron job prompt |
| `docs/LINUX_BOOT_JOURNEY.md` | Technical history of the boot effort |
| `docs/LINUX_BOOT_AUTOMATION.md` | This document |
