# Vision Property Gate Test -- Results

## Test Date: 2026-05-03

## The Five Metrics

| Metric | What | Threshold |
|--------|------|-----------|
| MeC | Distinct semantic colors per dashboard group | <= 8 |
| TiR | Text pixels as % of non-background pixels | <= 30% |
| Rule of 6 | Distinct visual element groups | <= 6 |
| Hierarchy | Top-left shows system health at a glance | must exist |
| Resolution | Fits in 256x256 without overlap | must fit |

## Method: Hybrid (Deterministic + Vision)

**Key finding:** Pixel-level analysis beats vision for quantitative metrics.
Vision models hallucinate at 256x256 resolution. Deterministic pixel counting
is exact, fast, and doesn't need GPU.

The gate should use TWO layers:

```
Layer 1: Pixel analysis (deterministic, ~0.2s)
  - MeC: count unique non-black/non-white colors with >50px presence
  - TiR: white_px / (total_px - black_px) * 100
  - Rule of 6: count connected-component visual groups
  - Resolution: trivially true (always 256x256)

Layer 2: Vision model (semantic, ~10-15s, best-effort)
  - Hierarchy: "is top-left showing health status?"
  - Readability: "can you read the text labels?"
  - Fallback: if vision model returns empty/hallucinated, use ASCII screen dump
    parsed by text model as a lower-confidence substitute
```

## PASS Case Results

Program: Green health bar (top-left), "OK" label, 4 scheduler activity bars
(red/orange/yellow/cyan), process status text.

Analyzed via pixel dump (65536 pixels):

| Metric | Measured | Threshold | Result |
|--------|----------|-----------|--------|
| MeC | 5 colors | <= 8 | PASS |
| TiR | 15.0% | <= 30% | PASS |
| Rule of 6 | 3 groups | <= 6 | PASS |
| Hierarchy | Green bar at (0,0) | must exist | PASS |
| Resolution | ~2976px used | fits 256x256 | PASS |

Pixel breakdown:
- GREEN (0x00FF00): 994px -- health bar
- RED (0xFF0000): 384px -- scheduler bar 0
- ORANGE (0xFF8800): 384px -- scheduler bar 1
- YELLOW (0xFFFF00): 384px -- scheduler bar 2
- CYAN (0x00FFFF): 384px -- scheduler bar 3
- WHITE (0xFFFFFF): 446px -- text labels

## FAIL Case Results

Program: 10 different-colored bars, 10 text lines, deliberately overloaded.

| Metric | Measured | Threshold | Result |
|--------|----------|-----------|--------|
| MeC | 10 colors | <= 8 | FAIL |
| TiR | 58.7% | <= 30% | FAIL |
| Rule of 6 | 20 groups | <= 6 | FAIL |
| Hierarchy | Red bar at (0,0) | must exist | PASS* |
| Resolution | fits 256x256 | fits | PASS |

*Hierarchy technically passes (something is in top-left) but it's RED, not
a health color. Vision model would need to catch the semantic mismatch.

## Vision Model Assessment

Model tested: llama3.2-vision:11b (local Ollama, RTX 5090)

Issues:
- Hallucinated "Hello, World!" when screen showed a dashboard
- Returned empty descriptions on structured prompts (GPU at 97% util)
- Could not reliably count colors, read text, or evaluate layout

Verdict: Local vision is NOT ready for gate enforcement. Use it as a
supplementary signal only. The deterministic pixel analysis catches the
quantitative violations reliably.

## Assembly Syntax Reference (for future tests)

GeOS uses uppercase opcodes, LDI for immediates:

```
LDI r1, value        -- load immediate
RECTF rx, ry, rw, rh, color  -- filled rectangle (x, y, w, h, 0xRRGGBB)
STRO buf_reg, "text"  -- store string to buffer
DRAWTEXT rx, ry, buf_reg, fg_color, bg_color  -- draw text
PSET rx, ry, color    -- set pixel
FILL color            -- fill entire screen
HALT                  -- stop execution
#define BUF 0x6000     -- text buffer address
```

## Screenshots

- PASS: /tmp/vision_gate_pass.png
- FAIL: /tmp/vision_gate_fail.png

## Next Steps

1. DONE: Deterministic pixel analysis CI check at programs/vision_gate.py
2. DONE: Skill saved as vision-gate for future session discovery
3. TODO: Wire into autodev reviewer loop (add as a post-build check)
4. TODO: Re-test with a more capable vision model (LLaVA-NeXT, GPT-4V API)
5. TODO: Improve Rule of 6 to use connected-component analysis instead of
   color-count heuristic (currently each unique color = 1 group, which
   overcounts when one component uses multiple colors via gradients)

## Files

- Gate script: programs/vision_gate.py
- Test results: programs/vision_gate_test_plan.md (this file)
- Test hex dumps: /tmp/vision_gate_pass.hex, /tmp/vision_gate_fail.hex
- Design doc: ~/.hermes/docs/geo-visual-kernel.md
