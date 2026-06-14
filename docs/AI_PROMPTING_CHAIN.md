# The AI Prompting Chain in Geometry OS

How AI talks to AI talks to AI inside your terminal.

## The Big Picture

Geometry OS has a three-tier AI prompting chain. You talk to one AI, it talks to another, that one talks to a third -- and the result comes back as pixels on your terminal screen. No human in the middle.

```
You (Jericho)
  |
  | type in your terminal
  v
Hermes (external agent -- Claude, GPT, Gemini)
  |
  | MCP tools: screenshot, type keys, read screen
  v
Ollama (local vision model -- llama3.2-vision:11b)
  |
  | PNG screenshot + prompt via localhost:11434
  v
Cloud AI (ZAI glm-4.6 or qwen3.5-tools)
  |
  | code generation, debugging, commands
  v
GeOS Terminal (256x256 framebuffer)
  |
  | pixels rendered in your window
  v
Your eyes
```

Three AIs, one terminal. Here's how each link works.

---

## Tier 1: You -> Hermes (External Agent)

You type in your normal terminal (Hermes CLI, Telegram, Discord -- wherever you run Hermes Agent). This is the **orchestrator AI**. It's smart, it has tool access, it can read files, run commands, search the web.

What Hermes can do to GeOS:
- `mcp_geo_vision_screenshot` -- grab the 256x256 framebuffer as a PNG
- `mcp_geo_vm_screen_ascii` -- get a 48x24 ASCII art downsample (text-only, no vision model needed)
- `mcp_geo_input_text` -- type characters into the GeOS terminal
- `mcp_geo_input_key` -- press keys (Enter, Escape, arrow keys)
- `mcp_geo_vm_run_program` -- load and execute assembly source
- `mcp_geo_vm_canvas` -- read the text content currently on the canvas

Hermes is the **brains** of the operation. It decides what to do based on your request. "Build me a snake game" or "why is this program crashing?" or "does the terminal look right?"

---

## Tier 2: Hermes -> Ollama (Local Vision Model)

When Hermes needs to SEE what's on screen, it takes a screenshot and sends it to a vision model running locally on your RTX 5090.

The pipeline (in `src/vision.rs`):

```
vm.screen (256x256, Vec<u32>, ARGB)
    |
    v
encode_png_base64()    -- zero-dep pure Rust PNG encoder
    |                      ~200KB base64 output
    v
POST /api/chat          -- Ollama local API (localhost:11434)
    |                      model: llama3.2-vision:11b
    v
Vision response         -- "I see a terminal with 5 lines of text,
                           a blinking cursor at row 12 col 40,
                           and a blue status bar at the bottom"
```

Why local? Two reasons:
1. **Speed** -- 1.9s on your GPU vs 22s sending to a cloud API
2. **Privacy** -- your terminal contents never leave the machine

The vision model can:
- Count objects on screen ("3 colored rectangles")
- Detect rendering bugs ("the text is clipped at column 80")
- Identify program state ("the program appears to be at a menu screen")
- Read visible text ("the terminal shows 'Error: division by zero'")

What it can't do well:
- Generate code (it's a vision model, not a code model)
- Execute complex multi-step reasoning
- Make architectural decisions

That's what tier 3 is for.

---

## Tier 3: Cloud AI (Code Generation)

The vision model describes what it sees. That description, combined with the program source code, VM registers, and opcode execution history, gets sent to a **code-capable** LLM for actual reasoning and code generation.

This happens inside GeOS itself via the `hermes` subsystem (`src/hermes.rs`):

```
build_hermes_context() assembles:
  - VM registers (r00-r31, PC, SP)
  - Opcode execution histogram (what instructions ran)
  - Source code currently loaded
  - Screen delta detection (how many pixels changed)
  - Pixel provenance log (who wrote what where)
    |
    v
call_ollama_vision() sends to Ollama:
  - system prompt = HERMES_SYSTEM_PROMPT + full context
  - user message = conversation history
  - image = base64 PNG of the 256x256 screen
    |
    v
Ollama responds with:
  - Code edits (new assembly source)
  - Debugging analysis
  - Next steps
    |
    v
GeOS parses the response:
  - Extracts commands from <think/> blocks (strips reasoning)
  - Types them into the VM canvas
  - Reassembles and re-runs the program
  - Loops back to step 1 (up to 10 iterations)
```

The provider routing (`provider.json`):

| Role | Default | Fallback |
|------|---------|----------|
| Code/text model | ZAI glm-4.6 (cloud) | Ollama qwen3.5-tools (local) |
| Vision model | Ollama llama3.2-vision:11b (local) | same |

The vision model is always local. The code model tries cloud first, falls back to local if ZAI is down.

---

## The Four Loops

There are four different ways this chain runs, depending on the context:

### 1. External Hermes Loop (you're using it right now)

```
You -> Hermes CLI -> MCP tools -> GeOS MCP server -> GeOS VM
```

Hermes (me) takes your request, uses MCP tools to interact with GeOS. I can take screenshots, type commands, read output. The vision model is available but optional -- I mostly work with the text interface. This is the **interactive** path.

### 2. Internal Hermes Loop (run_hermes_loop)

```
GeOS program -> Hermes subsystem -> Ollama vision -> code edits -> GeOS program
```

Started from inside GeOS (the `hermes` command in the shell). Takes the current canvas program, sends it + a screenshot to Ollama, gets back code edits, applies them, re-runs. Loops up to 10 times. This is the **self-improving program** path.

### 3. Build Loop (run_build_loop)

```
GeOS program -> Hermes build subsystem -> Ollama vision -> code edits -> assemble -> run -> verify
```

Like the hermes loop but specialized for building new programs from scratch. Has a stricter system prompt focused on "write code that produces this visual result." Loops up to 5 times.

### 4. AI_AGENT Opcode (0xB0) -- programs calling AI

```
Assembly program -> AI_AGENT opcode -> vision/code model -> response in VM registers
```

Programs running inside the VM can directly invoke AI operations:

| op | What it does |
|----|-------------|
| 0 | Screenshot to VFS as PNG |
| 1 | Canvas checksum (FNV-1a) |
| 2 | Diff screen against saved screen |
| 3 | Call vision API with screenshot + prompt, get text response |
| 4 | Specialized perception (count objects, detect anomalies) |

This is the **program-initiated** path. A running program decides it needs to see.

---

## Concrete Example

You say: "draw a Hilbert curve in the terminal"

Here's what actually happens:

```
1. You type the request
   -> Hermes (me) receives it

2. I generate Hilbert curve assembly source
   -> Based on my training, no vision needed yet

3. I send it to GeOS: mcp_geo_vm_run_program(source="...")
   -> GeOS assembler compiles it
   -> VM executes it
   -> 256x256 framebuffer now has pixels

4. I take a screenshot: mcp_geo_vision_screenshot()
   -> vision::encode_png_base64() encodes the framebuffer
   -> I get a base64 PNG

5. I send the PNG to a vision model
   -> "Does this look like a Hilbert curve? Is it symmetric?"
   -> Vision model: "Yes, I see a fractal space-filling curve,
      approximately symmetric, rendered in green on black background"

6. Based on the vision feedback, I adjust the program
   -> "The curve is missing the bottom-right quadrant"
   -> I fix the assembly source and re-run

7. Final screenshot confirms it looks right
   -> I report back to you
```

Three AIs collaborated. You just typed one sentence.

---

## Why Three Tiers?

Each AI has a different strength:

| Tier | Model | Strength | Can't do |
|------|-------|----------|----------|
| 1: Orchestrator | Claude/GPT/Gemini | Complex reasoning, tool use, multi-step planning | See pixels directly |
| 2: Vision | llama3.2-vision:11b | Understand images, spatial reasoning, color detection | Write code, make decisions |
| 3: Code | glm-4.6 / qwen3.5-tools | Generate code, debug, explain errors | See images |

No single model can do all three well. The chain lets each model work in its zone of competence.

---

## Latency Budget

A typical "look + think + act" cycle:

| Step | Time | Where |
|------|------|-------|
| Screenshot + encode PNG | ~1ms | Local (vision.rs) |
| Send to Ollama vision | ~1.9s | Local GPU (RTX 5090) |
| Vision model response | ~1.9s | Local GPU |
| Send to cloud code model | ~3-5s | ZAI API |
| Code model response | ~3-5s | ZAI API |
| Parse + apply + run | ~10ms | Local (VM) |
| **Total** | **~10-12s** | |

If the cloud is down, everything falls back to local (Ollama qwen3.5-tools), which adds ~5s but stays fully offline.

---

## What's Not Connected Yet

The vision pipeline works, but not everything is wired up:

1. **Terminal hotkey** -- ~~pressing Ctrl+Shift+V in geos-term to screenshot + describe is not built yet (the infrastructure is there, just needs a keybinding handler)~~ **CLOSED** -- Added Ctrl+Shift+D in geos-term (D=Describe, V was already paste). Spawns a background thread, sends screenshot to llama3.2-vision:11b, prints description to stderr, shows first line in status bar. Non-blocking, ~2s.

2. **Script DSL vision assert** -- ~~`assert:vision:PROMPT||EXPECTED` in --script mode would let you write visual regression tests. The checksum assert works today; the vision-LLM version doesn't yet.~~ **CLOSED** -- Added to geos-term --script. Sends the framebuffer plus PROMPT to llama3.2-vision:11b, asserts response contains EXPECTED (case-insensitive substring). `||` separator chosen so prompts can contain colons. If Ollama is unreachable the assert fails loudly rather than passing silently.

3. **External Hermes -> Ollama vision** -- ~~I (Hermes) can take screenshots via MCP, but I can't directly call your local Ollama vision model. I'd need to use the GeOS MCP server's vision tools, or you'd need to expose Ollama's API as a tool. Right now I see the terminal through the MCP screenshot tool and reason about it with my own vision capability.~~ **CLOSED** -- Added `mcp_geo_vision_describe` tool. Takes a screenshot, sends it to llama3.2-vision:11b via the GeOS MCP server's socket command `vision_describe`, returns a text description. ~2s on local GPU. One tool call, no cloud tokens burned.

4. **Terminal programs calling vision** -- host_term.asm has no ANSI escape to trigger AI_AGENT. Adding `\e]AI:prompt\x07` would let any terminal program request vision analysis.

---

## Files

| File | What it does |
|------|-------------|
| `src/vision.rs` | PNG encoder, checksum, diff (575 lines) |
| `src/hermes.rs` | All three loops + LLM calls + provider routing (3024 lines) |
| `src/vm/mod.rs` | AI_AGENT opcode handler (0xB0, ops 0-4) |
| `src/mcp_server.rs` | MCP tool registrations for external agents |
| `src/bin/vision_bench.rs` | Benchmark: text vs vision model accuracy |
| `provider.json` | Model endpoints and fallback config |
| `docs/VISION_MODEL_GUIDE.md` | Technical reference for the vision API |

---

## Tier 0: The Autonomous Build Chain

The previous sections describe how AIs interact with GeOS at runtime. This section describes how AIs **build** GeOS -- a separate prompting chain that runs 24/7 with no human in the loop.

This is the chain that shipped 140+ phases. When it breaks, development stops silently.

### The Flow

```
systemd (hermes-gateway.service)
  |
  | starts and keeps alive
  v
Hermes Gateway (--replace mode)
  |
  | embedded APScheduler, 60s tick interval
  v
Cron Scheduler
  |
  | fires based on job schedule (5m, 10m, 30m, 60m)
  v
oracle_preflight.py (pre-flight script, stdout injected into prompt)
  |
  | Phase 1: cargo test --lib (test gate)
  | Phase 2: geo_desktop_alive.py (desktop check + auto-restart)
  | Phase 3: roadmap_v2.yaml scan (phase inventory)
  | Phase 4: model_choice.generate() (LLM Oracle phase selection)
  | Phase 5: claim phase in roadmap_v2.yaml (status: in_progress)
  | Phase 6: auto-replenish if <5 planned phases remain
  |
  | outputs: STATUS: CONTINUE/HALT, PHASE_ID, PHASE, GOAL,
  |          ORACLE_REASONING, ORACLE_PLAN_STEPS, BUILD_PATH, etc.
  v
Cron Worker (fresh Hermes session, skills loaded)
  |
  | skills: geometry-os-v2, carry-forward, geometry-os-gui-control,
  |         geometry-os-desktop-verification
  v
carry_forward (decision gate before building)
  |
  | checks: thrash detection (same phase 3x), stall detection,
  |         blocker registry, max consecutive failures
  | if blocked: worker exits immediately with "CARRY_FORWARD: BLOCKED"
  | if clear: worker proceeds
  v
Hermes Agent (builds the phase)
  |
  | reads: roadmap_v2.yaml, source code, Oracle reasoning
  | does: cargo build, cargo test, socket verification
  | writes: code changes, git commits, roadmap status updates
  v
Phase marked complete -> roadmap_v2.yaml updated -> next tick picks next phase
```

Each layer can halt the chain independently:

| Layer | Halts when | Signal |
|-------|-----------|--------|
| systemd | process crashes | service restarts (if enabled) |
| Scheduler | gateway exits | no tick fires, `next_run_at` goes stale |
| preflight | tests fail | `STATUS: HALT`, worker told to fix tests first |
| preflight | no planned phases | auto-replenish via Oracle + codebase gap scan |
| carry_forward | thrash/stall detected | `CARRY_FORWARD: BLOCKED` |
| agent | phase complete or stuck | git commit + status update, or exit |

### Infrastructure Dependencies

The entire chain depends on exactly ONE process: the Hermes Gateway.

```
systemd user service: ~/.config/systemd/user/hermes-gateway.service
  runs: hermes --replace (gateway mode)
  owns: the APScheduler cron tick (60s interval)
  owns: MCP servers (geo, rag, wiki)
  state: ~/.hermes/cron/jobs.json (job definitions)
  lock:  ~/.hermes/cron/.tick.lock (stale artifact, not a real lock)
```

**Critical fact:** Only the gateway runs the scheduler. TUI sessions (`hermes --yolo`) do NOT run cron jobs. If the gateway dies and systemd doesn't restart it, every cron job stops silently.

### Failure Modes (diagnosed 2026-04-30)

#### 1. Scheduler Death (the 2-day outage)

**Symptom:** All cron jobs show `next_run_at` in the past, `state: scheduled`, `enabled: true`, but `last_run_at` is days old. No error in any job's `last_status` -- they just stopped firing.

**Root cause:** The Hermes Gateway process exited (code 1, "signal-initiated shutdown without restart request") and systemd didn't restart it because the service was `disabled`.

**Diagnosis:**
```bash
# Check if scheduler is alive
systemctl --user status hermes-gateway.service

# Check scheduler log for start/stop events
grep -i "scheduler.*start\|scheduler.*shut\|ticker" ~/.hermes/logs/agent.log | tail -20

# Check if next_run_at is stale
cronjob list  # compare next_run_at against current time
```

**Fix:**
```bash
systemctl --user start hermes-gateway.service
systemctl --user enable hermes-gateway.service  # prevent recurrence
```

**Permanent fix applied:** `systemctl --user enable hermes-gateway.service` so systemd auto-restarts on crash.

#### 2. Preflight Test Gate

**Symptom:** Workers fire but exit immediately. Job `last_status: ok` but no code changes committed.

**Root cause:** `cargo test --lib` finds test failures. oracle_preflight.py outputs `STATUS: HALT` and tells the worker to fix tests before proceeding.

**Diagnosis:**
```bash
# Run preflight manually and watch stderr
python3 ~/.hermes/scripts/oracle_preflight.py 2>&1 | head -20

# Check for failing tests
cd ~/zion/projects/geometry_os/geometry_os
cargo test --lib 2>&1 | grep FAILED
```

**Fix:** Fix the failing tests. The worker will unblock on next tick.

#### 3. Desktop Dead (socket unresponsive)

**Symptom:** Workers fire, preflight says `STATUS: CONTINUE`, but desktop verification steps fail silently.

**Root cause:** The GeOS desktop binary crashed or the socket `/tmp/geo_cmd.sock` is stale.

**Diagnosis:**
```bash
python3 ~/.hermes/scripts/geo_desktop_alive.py 2>&1
# If "DESKTOP_ALIVE: false", check for stale socket
ls -la /tmp/geo_cmd.sock
```

**Fix:** geo_desktop_alive.py auto-restarts the binary (with 60s cooldown). If manual restart needed:
```bash
cd ~/zion/projects/geometry_os/geometry_os
cargo build --release && ./target/release/geometry_os &
```

#### 4. carry_forward Block

**Symptom:** Workers fire, preflight says continue, but no building happens. Check `~/.hermes/cron/output/<job_id>/` for recent output containing "CARRY_FORWARD: BLOCKED".

**Root cause:** Thrash detection (same phase attempted 3+ times with no progress), stall detection, or manual block via GUI.

**Diagnosis:**
```bash
# Check carry_forward state
cd ~/zion/projects/carry_forward/carry_forward
python3 -c "from carry_forward import check_can_continue; print(check_can_continue())"
```

**Fix:** Reset blockers or address the underlying cause (bad phase, broken tests, API outage).

#### 5. Oracle Unavailable

**Symptom:** Preflight works but always falls back to FIFO (first planned phase in YAML order). Log shows "model_choice not available, falling back to FIFO" or "Oracle call failed".

**Root cause:** model_choice can't reach any LLM provider (ZAI down, Ollama not running).

**Diagnosis:**
```bash
python3 ~/.hermes/scripts/oracle_preflight.py 2>&1 | grep -i oracle
```

**Fix:** Ensure ZAI API or Ollama is reachable. Oracle failure is non-fatal -- FIFO fallback keeps the chain moving.

### Self-Healing Gaps

The chain has several single points of failure with no watchdog:

| Gap | What happens | Risk |
|-----|-------------|------|
| No scheduler health check | Scheduler dies silently, no alarm | Days of lost dev time (happened) |
| No stale-lock cleanup | `.tick.lock` lingers from crashed scheduler | Cosmetic, but confusing for diagnostics |
| No OOM preemption | 2+ workers running `cargo test` simultaneously | 62GB RAM exhausted, system freeze |
| No API credit monitoring | ZAI 429s cascade through all workers | All workers error simultaneously |
| No git lock detection | Two workers try to `git commit` at same time | One commit lost, roadmap corruption |

**Recommended watchdog** (not yet built): A lightweight cron job that runs every 15m and checks:
1. `systemctl --user is-active hermes-gateway.service` -- if inactive, restart it
2. `cronjob list` -- if any job's `next_run_at` is >2x its schedule interval in the past, log a warning
3. `free -h` -- if available RAM < 4GB, pause workers
4. `ls -la ~/.hermes/cron/.tick.lock` -- if older than 5m, remove it

### The Autonomous Jobs

| Job ID | Name | Schedule | Script | Skills |
|--------|------|----------|--------|--------|
| b75cce77be37 | autodev-coreutils-roadmap | every 5m | oracle_preflight.py | geometry-os-v2, carry-forward, gui-control, desktop-verification |
| a3c5ef7baabb | autodev-worker-2 | every 10m | oracle_preflight.py | geometry-os-v2, carry-forward, gui-control, desktop-verification |
| efd83141225d | terminal-qa-tester | every 30m | terminal_qa.py | (terminal only) |
| 5777dd86f767 | geo-dogfood-explorer | every 60m | geo_dogfood_qa.py | terminal, browser |
| 817a691f8f4f | roadmap-audit | every 60m | (none) | (none) |
| c51963d808e2 | creative-daemon | every 120m | (none) | (none) |

Paused (intentionally):
| Job ID | Name | Reason |
|--------|------|--------|
| 603f0d08a4eb | geo-issues-worker-1 | Paused via GUI |
| 553f327a1eb8 | geo-issues-worker-2 | Paused via GUI |

### Files

| File | What it does |
|------|-------------|
| `~/.hermes/scripts/oracle_preflight.py` | Pre-flight: test gate, desktop check, Oracle phase selection, auto-replenish (1036 lines) |
| `~/.hermes/scripts/geo_desktop_alive.py` | Desktop health check + auto-restart (100 lines) |
| `~/.hermes/scripts/terminal_qa.py` | Terminal test suite runner for QA worker |
| `~/.hermes/scripts/geo_dogfood_qa.py` | Dogfood explorer pre-flight |
| `~/.hermes/cron/jobs.json` | Cron job definitions (scheduler state) |
| `~/.config/systemd/user/hermes-gateway.service` | systemd unit for gateway |
| `~/.hermes/logs/agent.log` | Scheduler start/stop events |
| `roadmap_v2.yaml` | Phase definitions with status tracking |
