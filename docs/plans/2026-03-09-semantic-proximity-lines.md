# Semantic Proximity Lines Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Connect consecutive tokens with faint glowing lines to visualize the "Chain of Thought" in the Mind's Eye, transforming isolated points into a Geometric Graph of Thought.

**Architecture:** TokenRasterizer tracks previous token position → emits TOKEN_LINK commands → WGSL shader draws fading arc lines between consecutive tokens in the reasoning chain.

**Tech Stack:** Python, WGSL compute shaders, Hilbert curve mapping

---

## Phase 1: WGSL Shader Token Link Rendering

### Task 1: Add TOKEN_LINK opcode to glyph_renderer.wgsl

**Files:**
- Modify: `systems/hypervisor/src/glyph_renderer.wgsl`

**Step 1: Add opcode constant and render function**

Add to the opcode constants section (around line 274):

```wgsl
const GLYPH_TOKEN_LINK: u32 = 0x0Au;    // Semantic proximity line between tokens
```

Add the render function after `render_token()` (around line 505):

```wgsl
// Render a semantic proximity line between consecutive tokens (Mind's Eye)
// Opcode 0x0A (GLYPH_TOKEN_LINK)
// Draws a faint, fading arc connecting tokens in the reasoning chain
fn render_token_link(glyph: Glyph) {
    let dim = uniforms.resolution;

    // Extract line parameters
    // glyph.x, glyph.y = start position (previous token)
    // glyph.w, glyph.h = end position offset (current token relative to start)
    let x1 = i32(clamp(glyph.x, 0.0, f32(dim - 1u)));
    let y1 = i32(clamp(glyph.y, 0.0, f32(dim - 1u)));
    let x2 = i32(clamp(glyph.x + glyph.w, 0.0, f32(dim - 1u)));
    let y2 = i32(clamp(glyph.y + glyph.h, 0.0, f32(dim - 1u)));

    // Calculate line color with fade based on age
    // Use params.y for age (like thoughts)
    let age = glyph.params.y;
    let age_fade = get_age_fade(age);

    // Line color: faint version of the token color
    // Lower alpha for subtle "connection" effect
    let line_alpha = 0.3 * age_fade * glyph.color.a;
    let line_color = vec4<f32>(glyph.color.rgb * 0.8, line_alpha);

    // Draw the connecting line using existing Bresenham implementation
    draw_line(x1, y1, x2, y2, line_color);
}
```

**Step 2: Add case to main switch statement**

Add to the main switch in `main()` function (around line 629):

```wgsl
case 0x0Au: { // TOKEN_LINK (opcode 0x0A)
    render_token_link(glyph);
}
```

**Step 3: Verify WGSL compiles**

Run: `python3 -c "print('WGSL syntax check - verify manually in wgpu compilation')"`
Expected: No syntax errors when shader is loaded

**Step 4: Commit**

```bash
git add systems/hypervisor/src/glyph_renderer.wgsl
git commit -m "feat(minds-eye): add TOKEN_LINK opcode for semantic proximity lines"
```

---

## Phase 2: TokenRasterizer Chain Tracking

### Task 2: Update TokenRasterizer to track and emit token links

**Files:**
- Modify: `systems/sisyphus/token_rasterizer.py`
- Test: `tests/test_token_rasterizer_links.py`

**Step 1: Write the failing test**

```python
# tests/test_token_rasterizer_links.py
"""
Tests for Semantic Proximity Lines - Token chain visualization.

Verifies that consecutive tokens are connected with faint lines
to visualize the "Chain of Thought" in the Mind's Eye.
"""

import pytest
from unittest.mock import Mock, call
from systems.sisyphus.token_rasterizer import TokenRasterizer
from systems.sisyphus.compositor_bridge import CompositorBridge


class TestTokenChainTracking:
    """Tests for token chain position tracking."""

    def test_rasterizer_tracks_previous_token(self):
        """Test TokenRasterizer tracks previous token position."""
        rasterizer = TokenRasterizer()
        rasterizer.bridge = Mock()

        # Process first token
        rasterizer.process_token("def")
        first_pos = (rasterizer._prev_token_x, rasterizer._prev_token_y)

        # Process second token
        rasterizer.process_token("calculate")
        second_pos = (rasterizer._prev_token_x, rasterizer._prev_token_y)

        # Positions should be different (different tokens hash to different positions)
        assert first_pos != second_pos

    def test_rasterizer_emits_link_on_second_token(self):
        """Test TokenRasterizer emits TOKEN_LINK after first token."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # First token - should NOT emit link (no previous)
        rasterizer.process_token("first")
        first_calls = len(mock_bridge.send_thought.call_args_list)

        # Second token - SHOULD emit link
        rasterizer.process_token("second")
        second_calls = len(mock_bridge.send_thought.call_args_list)

        # Second call should have generated 2 messages: token + link
        assert second_calls >= first_calls + 2

    def test_link_contains_previous_position(self):
        """Test TOKEN_LINK contains previous token position."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        rasterizer.process_token("alpha")
        rasterizer.process_token("beta")

        # Check that a TOKEN_LINK was sent
        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        assert len(link_calls) >= 1

        link_data = link_calls[0][0][0]
        assert "prev_x" in link_data
        assert "prev_y" in link_data
        assert "curr_x" in link_data
        assert "curr_y" in link_data

    def test_first_token_no_link(self):
        """Test first token in stream does not emit a link."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        rasterizer.process_token("first_token")

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        assert len(link_calls) == 0


class TestTokenLinkColors:
    """Tests for token link coloring."""

    def test_link_uses_source_token_color(self):
        """Test link color derives from source token type."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Process a keyword followed by identifier
        rasterizer.process_token("if")    # keyword - cyan
        rasterizer.process_token("value") # identifier - white

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        if len(link_calls) >= 1:
            link_data = link_calls[0][0][0]
            # Link should have color information
            assert "color" in link_data


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_token_rasterizer_links.py -v`
Expected: FAIL with "AttributeError: 'TokenRasterizer' object has no attribute '_prev_token_x'"

**Step 3: Implement chain tracking in TokenRasterizer**

Modify `systems/sisyphus/token_rasterizer.py`:

```python
# Add to __init__ method (after self.type_colors definition)
        # Token chain tracking for semantic proximity lines
        self._prev_token_x: Optional[int] = None
        self._prev_token_y: Optional[int] = None
        self._prev_token_color: Optional[tuple] = None

# Add new method after _infer_token_type
    def _emit_token_link(self, curr_x: int, curr_y: int, curr_color: tuple):
        """Emit a TOKEN_LINK command connecting previous token to current."""
        if self._prev_token_x is None or self._prev_token_y is None:
            return  # No previous token to link from

        link_data = {
            "type": "TOKEN_LINK",
            "prev_x": self._prev_token_x,
            "prev_y": self._prev_token_y,
            "curr_x": curr_x,
            "curr_y": curr_y,
            "delta_x": curr_x - self._prev_token_x,
            "delta_y": curr_y - self._prev_token_y,
            "color": self._prev_token_color or (0.5, 0.5, 0.5, 0.3),
            "timestamp": time.time()
        }

        self.bridge.send_thought(link_data, msg_type="TokenLink")

# Modify process_token method to track chain
    def process_token(self, token: str):
        """Rasterize a single token into the Hilbert space and stream it."""
        h_idx = self._hash_token(token)
        t_type = self._infer_token_type(token)
        color = self.type_colors.get(t_type, self.type_colors["default"])

        # Convert to 2D for the bridge
        x, y = self.hilbert.d2xy(self.grid_size, h_idx)

        # Emit TOKEN_LINK if we have a previous token
        self._emit_token_link(x, y, color)

        # Update previous token tracking
        self._prev_token_x = x
        self._prev_token_y = y
        self._prev_token_color = color

        thought_data = {
            "type": "TOKEN_RENDER",
            "content": token,
            "token_type": t_type,
            "hilbert_index": h_idx,
            "x": x,
            "y": y,
            "color": color,
            "timestamp": time.time()
        }

        # Stream via Glass Box bridge (Opcode 0xCD handled by WGSL)
        self.bridge.send_thought(thought_data, msg_type="Token")

# Add reset method for new streams
    def reset_chain(self):
        """Reset token chain tracking for a new stream."""
        self._prev_token_x = None
        self._prev_token_y = None
        self._prev_token_color = None
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_token_rasterizer_links.py -v`
Expected: 5 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/token_rasterizer.py tests/test_token_rasterizer_links.py
git commit -m "feat(minds-eye): add token chain tracking for semantic proximity lines"
```

---

## Phase 3: ThoughtSerializer TOKEN_LINK Support

### Task 3: Add TOKEN_LINK serialization to ThoughtSerializer

**Files:**
- Modify: `systems/sisyphus/thought_serializer.py`
- Test: `tests/test_thought_serializer_links.py`

**Step 1: Write the failing test**

```python
# tests/test_thought_serializer_links.py
"""
Tests for TOKEN_LINK serialization in ThoughtSerializer.
"""

import pytest
from systems.sisyphus.thought_serializer import ThoughtSerializer, ThoughtGlyph
from systems.sisyphus.native_hilbert import NativeHilbertLUT


class TestTokenLinkSerialization:
    """Tests for TOKEN_LINK thought serialization."""

    def test_serialize_token_link(self):
        """Test serializing a TOKEN_LINK thought."""
        serializer = ThoughtSerializer(NativeHilbertLUT())

        link_thought = {
            "type": "TOKEN_LINK",
            "prev_x": 100,
            "prev_y": 150,
            "delta_x": 10,
            "delta_y": -5,
            "color": (0.0, 1.0, 1.0, 0.3)
        }

        glyph = serializer.serialize(link_thought)

        assert glyph.thought_type == "TOKEN_LINK"
        assert glyph.hilbert_index >= 0

    def test_token_link_glyph_command(self):
        """Test TOKEN_LINK produces valid glyph command."""
        serializer = ThoughtSerializer(NativeHilbertLUT())

        link_thought = {
            "type": "TOKEN_LINK",
            "prev_x": 50,
            "prev_y": 75,
            "delta_x": 25,
            "delta_y": 10,
            "color": (1.0, 0.5, 0.0, 0.3)
        }

        glyph = serializer.serialize(link_thought)
        cmd = serializer.to_glyph_command(glyph)

        # Glyph command should be 16 bytes
        assert len(cmd) == 16

        # Opcode should be 0x0A (TOKEN_LINK)
        opcode = cmd[0]
        assert opcode == 0x0A


class TestTokenLinkCoordinates:
    """Tests for TOKEN_LINK coordinate encoding."""

    def test_link_coordinates_preserved(self):
        """Test link start/end coordinates are preserved in glyph."""
        serializer = ThoughtSerializer(NativeHilbertLUT())

        link_thought = {
            "type": "TOKEN_LINK",
            "prev_x": 128,
            "prev_y": 64,
            "delta_x": 32,
            "delta_y": 16,
            "color": (0.5, 0.5, 0.5, 0.3)
        }

        glyph = serializer.serialize(link_thought)

        # The glyph should encode the line geometry
        # x, y = start position
        # hilbert_index derived from midpoint or start
        assert glyph.hilbert_index >= 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_thought_serializer_links.py -v`
Expected: FAIL with "KeyError: 'TOKEN_LINK'" or similar

**Step 3: Add TOKEN_LINK to ThoughtSerializer**

First, read the existing thought_serializer.py to understand its structure:

```python
# Read existing file to understand structure
```

Then add TOKEN_LINK support:

```python
# Add to ThoughtSerializer.serialize method
    def serialize(self, thought: dict) -> ThoughtGlyph:
        """Serialize a thought to a glyph with Hilbert coordinates."""
        thought_type = thought.get("type", "unknown")

        if thought_type == "TOKEN_LINK":
            return self._serialize_token_link(thought)
        # ... existing serialization ...

    def _serialize_token_link(self, thought: dict) -> ThoughtGlyph:
        """Serialize a TOKEN_LINK thought for semantic proximity lines."""
        prev_x = thought.get("prev_x", 0)
        prev_y = thought.get("prev_y", 0)
        color = thought.get("color", (0.5, 0.5, 0.5, 0.3))

        # Use start position for Hilbert index
        hilbert_idx = self.hilbert.xy2d(self.grid_size, prev_x, prev_y)

        return ThoughtGlyph(
            thought_type="TOKEN_LINK",
            content=f"link_{prev_x}_{prev_y}",
            hilbert_index=hilbert_idx,
            color=color,
            timestamp=time.time()
        )

# Add to to_glyph_command method
    def to_glyph_command(self, glyph: ThoughtGlyph) -> bytes:
        """Convert ThoughtGlyph to 16-byte WGSL glyph command."""
        if glyph.thought_type == "TOKEN_LINK":
            # Opcode 0x0A for TOKEN_LINK
            # Format: [opcode:1][x:2][y:2][w:2][h:2][r:1][g:1][b:1][a:1]
            opcode = 0x0A
            x = int(glyph.hilbert_index % self.grid_size)
            y = int(glyph.hilbert_index // self.grid_size)
            r = int(glyph.color[0] * 255)
            g = int(glyph.color[1] * 255)
            b = int(glyph.color[2] * 255)
            a = int(glyph.color[3] * 255)

            return bytes([
                opcode,
                (x >> 8) & 0xFF, x & 0xFF,
                (y >> 8) & 0xFF, y & 0xFF,
                0, 0,  # width, height (set by delta in process_token)
                r, g, b, a,
                0, 0, 0, 0  # padding
            ])
        # ... existing serialization ...
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_thought_serializer_links.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/sisyphus/thought_serializer.py tests/test_thought_serializer_links.py
git commit -m "feat(minds-eye): add TOKEN_LINK serialization support"
```

---

## Phase 4: Integration

### Task 4: End-to-end token chain visualization

**Files:**
- Test: `tests/test_minds_eye_e2e.py`

**Step 1: Write the integration test**

```python
# tests/test_minds_eye_e2e.py
"""
End-to-end tests for Mind's Eye token chain visualization.

Verifies the complete pipeline: token stream → chain tracking → link emission → visualization
"""

import pytest
from unittest.mock import Mock, patch
from systems.sisyphus.token_rasterizer import TokenRasterizer


class TestMindsEyeE2E:
    """End-to-end tests for token chain visualization."""

    def test_token_stream_produces_chain(self):
        """Test that a token stream produces a chain of linked tokens."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Stream a sequence of tokens
        tokens = ["def", "calculate", "(", "x", ",", "y", ")"]
        for token in tokens:
            rasterizer.process_token(token)

        calls = mock_bridge.send_thought.call_args_list

        # Should have TOKEN_RENDER for each token
        render_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_RENDER"]
        assert len(render_calls) == len(tokens)

        # Should have TOKEN_LINK for all but first token
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]
        assert len(link_calls) == len(tokens) - 1

    def test_reset_chain_starts_new_chain(self):
        """Test that reset_chain allows starting a new independent chain."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Stream first chain
        rasterizer.process_token("a")
        rasterizer.process_token("b")

        # Reset
        rasterizer.reset_chain()

        # Stream second chain
        rasterizer.process_token("c")
        rasterizer.process_token("d")

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        # Should have exactly 2 links (b linked from a, d linked from c)
        assert len(link_calls) == 2

        # The link for 'd' should come from 'c', not 'b'
        last_link = link_calls[-1][0][0]
        assert last_link["prev_x"] != link_calls[0][0][0]["curr_x"] or \
               last_link["prev_y"] != link_calls[0][0][0]["curr_y"]

    def test_reasoning_chain_visualization(self):
        """Test that a reasoning chain is visualized correctly."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Simulate a reasoning chain
        reasoning = """
        if temperature > threshold:
            activate_cooling()
        """
        tokens = reasoning.split()

        for token in tokens:
            if token.strip():
                rasterizer.process_token(token.strip())

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        # All consecutive tokens should be linked
        assert len(link_calls) >= 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it passes**

Run: `python3 -m pytest tests/test_minds_eye_e2e.py -v`
Expected: 3 passed

**Step 3: Run all Mind's Eye tests**

Run: `python3 -m pytest tests/test_token_rasterizer*.py tests/test_thought_serializer*.py tests/test_minds_eye*.py -v`
Expected: All tests passing

**Step 4: Commit**

```bash
git add tests/test_minds_eye_e2e.py
git commit -m "test(minds-eye): add end-to-end tests for token chain visualization"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | TOKEN_LINK opcode in WGSL | `glyph_renderer.wgsl` | Manual verification |
| 2 | TokenRasterizer chain tracking | `token_rasterizer.py` | 5 |
| 3 | ThoughtSerializer TOKEN_LINK | `thought_serializer.py` | 3 |
| 4 | E2E integration tests | (new test file) | 3 |

**Total: 4 tasks, 11+ tests**

---

## Visual Result

After implementation, the Mind's Eye will display:

```
Token A ──── faint line ──── Token B ──── faint line ──── Token C
   ●───────────────────────────●───────────────────────────●
   ↑                           ↑                           ↑
 Hilbert                      Chain                       Chain
 Position                    Connection                  Continues
```

The "Chain of Thought" becomes visible as a geometric graph in Hilbert space.

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-09-semantic-proximity-lines.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**

**If Subagent-Driven chosen:**
- **REQUIRED SUB-SKILL:** Use superpowers:subagent-driven-development
- Stay in this session
- Fresh subagent per task + code review

**If Parallel Session chosen:**
- Guide them to open new session in worktree
- **REQUIRED SUB-SKILL:** New session uses superpowers:executing-plans
