# Geometry OS Vision Model Guide

How AI vision works in Geometry OS, and how AI agents should use it.

## Overview

Geometry OS has two ways for AI to "see" what's on screen:

1. **Text modality** -- a 48x24 ASCII art downsample of the 256x256 framebuffer is injected into the LLM system prompt as text. Works with any model. No extra setup.

2. **Vision modality** -- the raw 256x256 framebuffer is encoded as a PNG, base64'd, and sent as an image to a vision-capable LLM (multimodal). Much more accurate for spatial reasoning, color detection, and pattern recognition. ~12x faster in benchmarks (1.9s vs 22s) because the model gets actual pixel data instead of trying to parse ASCII art.

Both modalities are used by the `hermes` subsystem inside Geometry OS (the built-in AI agent loop), by the MCP server tools exposed to external agents, and by the AI_AGENT opcode (0xB0) for VM programs.

## Architecture

```
VM Screen Buffer (256x256, Vec<u32>, ARGB)
       |
       +---> screen_to_ascii()       --> 48x24 text art  --> text LLM prompt
       |       (hermes.rs)             (luminance downsampling)
       |
       +---> encode_png_base64()     --> base64 PNG string --> vision LLM
       |       (vision.rs)             (zero-dep pure Rust PNG encoder)
       |
       +---> canvas_checksum()       --> FNV-1a u32 hash  --> fast change detection
       |       (vision.rs)
       |
       +---> canvas_diff()           --> (changed, total, %) --> regression checks
               (vision.rs)
```

## Provider Configuration

The file `provider.json` (next to Cargo.toml) configures which LLM endpoints to use:

```json
{
  "base_url": "https://api.z.ai/api/coding/paas/v4",
  "model": "glm-4.6",
  "vision_model": "llama3.2-vision:11b",
  "api_key": "...",
  "max_tokens": 4096,
  "temperature": 0.3,
  "fallback": {
    "base_url": "http://localhost:11434/api/chat",
    "model": "qwen3.5-tools",
    "vision_model": "llama3.2-vision:11b",
    "api_key": ""
  }
}
```

Key fields:
- `model` -- text-only model for code generation, debugging, general chat
- `vision_model` -- multimodal model for screenshot analysis (must support image input)
- `fallback` -- used when the primary provider is unreachable

**Vision routing logic** (in `call_vision_llm`):
1. If the primary `base_url` is Ollama (port 11434) AND `vision_model` is set, use primary directly
2. Else if fallback exists, use the fallback's `vision_model` (or fallback's `model` if no vision_model set)
3. Else use the primary's `vision_model` (or primary's `model` as last resort)

**Pitfall:** Non-Ollama endpoints (ZAI, OpenAI-compatible) must use `/chat/completions` format. The code auto-appends this suffix. Ollama endpoints use `/api/chat`. If you change providers, check the URL format.

## Two Modalities: When to Use Which

### Text Modality (build_hermes_context)

Used by: `run_hermes_loop()`, `run_hermes_canvas()`, `run_build_loop()`

What happens:
1. `screen_to_ascii()` downsamples 256x256 to 48x24 using luminance mapping (10-level grayscale ramp: ` .:-=+*#%@`)
2. The ASCII art is prepended to the system prompt along with registers, opcode histogram, source code, and episodic memory
3. Sent as plain text to any LLM

Best for: code editing, debugging logic, understanding program flow, writing new programs
Limitations: loses color information, spatial precision, small details

### Vision Modality (call_vision_llm)

Used by: `AI_AGENT` opcode op=3, `vision_bench.rs`, `run_hermes_canvas()` (op=4 perception)

What happens:
1. `vision::encode_png_base64()` encodes the 256x256 screen buffer as a raw PNG (uncompressed deflate, zero external deps), then base64 encodes it
2. The base64 string is sent in the `"images"` field of the chat request (Ollama format) or as a content block (OpenAI format)
3. The vision LLM receives the actual pixel image and can reason about colors, shapes, spatial relationships

Best for: visual diagnostics ("is the screen rendering correctly?"), counting objects, detecting anomalies, spatial reasoning
Limitations: requires a vision-capable model, larger payload (~200KB base64 per call)

## AI_AGENT Opcode (0xB0) -- VM Program Access to Vision

Programs running inside the VM can call vision operations directly:

```
AI_AGENT op_reg    ; 0xB0, reads op from register
```

### Operations

| op | Registers | Description |
|----|-----------|-------------|
| 0 | r[op_reg+1]=path_addr | Screenshot to VFS as PNG. Returns bytes written in r0. |
| 1 | (none) | Canvas checksum (FNV-1a). Returns hash in r0. |
| 2 | r[op_reg+1]=prev_addr | Diff screen against saved screen in RAM. Returns changed pixel count in r0. |
| 3 | r[op_reg+1]=prompt_addr, r[op_reg+2]=response_addr, r[op_reg+3]=max_len | Call vision API with screenshot + prompt. Returns response length in r0. |
| 4 | r[op_reg+1]=mode | Specialized perception. mode=0=full screen, mode=1=region, mode=2=count objects. Returns integer in r0. |

### Example: ai_perception.asm

```asm
; Draw three colored squares
LDI r3, 0xFFFFFF   ; white
; ... (draw white square at 20,20 to 60,60) ...
LDI r3, 0xFF0000   ; red
; ... (draw red square at 100,100 to 140,140) ...
LDI r3, 0x00FF00   ; green
; ... (draw green square at 180,180 to 220,220) ...

; Ask the vision model to count objects
LDI r10, 4         ; op=4: specialized perception
LDI r11, 0         ; mode=0: full screen
AI_AGENT r10       ; R0 = count of distinct objects
HALT
```

## MCP Server Vision Tools (External Agent Access)

External AI agents (Hermes, Claude, etc.) access vision through the MCP server:

### Canvas/VM Level
- `mcp_geo_vision_screenshot` -- Get base64-encoded PNG of the 256x256 canvas
- `mcp_geo_vision_checksum` -- FNV-1a hash (fast change detection)
- `mcp_geo_vision_diff` -- Compare current canvas against a previous checksum
- `mcp_geo_vm_screen_ascii` -- 64x32 ASCII art dump of the framebuffer (text modality)
- `mcp_geo_vm_screenshot` -- Save framebuffer as PNG file

### Desktop Level (WINSYS)
- `mcp_geo_vision_screenshot` -- Annotated screenshot with window bounding boxes and title labels overlaid
- `mcp_geo_desktop_vision` -- Structured JSON: open windows, focused window, ASCII art with window boundaries

## Vision Benchmarks

Run with: `cargo run --release --bin vision_bench`

Five scenarios test diagnostic accuracy:
- `healthy-oscillator` -- small 4x4 white block (healthy)
- `memory-leak` -- large red rectangle at bottom, still running (unhealthy)
- `runaway-process` -- chaotic scattered yellow pixels, still running (unhealthy)
- `stuck-pixel` -- single bright pixel on blank screen (unhealthy)
- `idle-blank` -- truly blank, halted (healthy/debatable)

Each scenario is sent to both text and vision LLMs with the prompt "Is this system healthy? Reply YES or NO and one short reason."

Results (April 2026, ZAI glm-4.6 text + Ollama llama3.2-vision:11b):
- Vision: ~1.9s latency, correctly identified "memory leak" from visual pattern
- Text: ~22s latency, struggled with spatial reasoning from ASCII art

## Usage Patterns for AI Agents

### Pattern 1: Quick Change Detection
```
checksum_before = mcp_geo_vision_checksum()
# ... run program ...
checksum_after = mcp_geo_vision_checksum()
if checksum_before != checksum_after:
    # screen changed, take a look
    screenshot = mcp_geo_vision_screenshot()
```

### Pattern 2: Visual Debugging
```
# Program drew something but output looks wrong
screenshot = mcp_geo_vision_screenshot()
# Send to vision model: "Describe what you see on this 256x256 framebuffer.
# Are there any rendering artifacts, misaligned pixels, or unexpected colors?"
```

### Pattern 3: Program Verification
```
# Run a program, then check if it rendered correctly
mcp_geo_vm_run_program(source="...")
screenshot = mcp_geo_vision_screenshot()
# Ask: "Does this screenshot show a Hilbert curve? Is it symmetric?"
```

### Pattern 4: Desktop State Awareness
```
# Check what's on the GeOS desktop
state = mcp_geo_desktop_vision()
# Returns: windows array, focused_window, ASCII overlay with boundaries
# No vision model needed -- pure text/ASCII
```

## Common Pitfalls

1. **Screen buffer != RAM.** `peek` reads RAM, `screen` reads the framebuffer. They are separate. A LINE drawn at screen coordinates writes to the framebuffer, not to RAM.

2. **Vision model must be running.** If using Ollama fallback, `ollama pull llama3.2-vision:11b` must be done first. Check with `ollama list`.

3. **Payload size.** A 256x256 PNG base64 is ~200KB. This is fine for local Ollama but may be slow over remote APIs. The vision_bench showed 1.9s for local, expect longer for cloud endpoints.

4. **Color format.** Screen pixels are stored as `0x00RRGGBB` (ARGB with zero alpha). The PNG encoder strips the alpha byte and outputs RGB. If you're reading raw pixels from RAM or VFS, account for the byte order.

5. **op=4 perception is heuristic.** It calls the vision LLM with a structured prompt and parses the integer response. It can fail or return wrong counts. Use op=3 (raw prompt/response) for reliable results.

6. **Checksum is not a screenshot.** FNV-1a gives you a 32-bit hash for fast comparison. It cannot tell you WHAT changed, only THAT something changed. Use `vision_diff` for pixel-level comparison, or take a screenshot for visual inspection.

## File Locations

- `src/vision.rs` -- PNG encoder, checksum, diff, annotation (pure Rust, zero deps)
- `src/hermes.rs` -- `call_vision_llm()`, `call_llm()`, `build_hermes_context()`, `screen_to_ascii()`, `ProviderConfig`
- `src/vm/mod.rs` -- AI_AGENT opcode handler (0xB0, ops 0-4)
- `src/bin/vision_bench.rs` -- Benchmark binary
- `src/mcp_server.rs` -- MCP tool registrations for vision
- `provider.json` -- LLM endpoint configuration
- `programs/ai_perception.asm` -- Demo program using AI_AGENT op=4
