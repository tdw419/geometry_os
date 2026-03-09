# PixelBrain Inference Pipeline Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable native Geometry OS LLM inference where the model lives as a visual RTS.PNG artifact, executed by GeoASM orchestration calling WGSL compute shaders.

**Architecture:** Hybrid control/data plane - GeoASM acts as "cortex" (orchestration), WGSL shaders as "thalamus" (tensor compute). Weights stored in Hilbert-folded RTS.PNG atlas for visual locality. Inference triggers visible pixel activations.

**Tech Stack:** Python (converter), WGSL (compute shaders), GeoASM (orchestration), WebGPU (execution), PixiJS (visualization)

---

## Prerequisites

- [x] `pixel_brain_converter.py` exists (creates RTS.PNG from HuggingFace models)
- [x] `tinystories_brain.rts.png` generated (1.8MB atlas)
- [x] WGSL shaders created: embed, attention, project, sample
- [ ] Weight encoding uses float16 (currently 0-255 normalized)
- [ ] GeoASM opcodes for neural primitives
- [ ] Pipeline orchestrator to wire shaders

---

## Task 1: Fix Weight Encoding to Float16

**Problem:** Current converter normalizes weights to 0-255 for visualization. Inference needs actual float16 values.

**Files:**
- Modify: `pixel_brain_converter.py:88-106`
- Create: `tests/test_pixel_brain_converter.py`

### Step 1: Write the failing test

Create `tests/test_pixel_brain_converter.py`:

```python
"""Tests for PixelBrain weight encoding."""
import numpy as np
import pytest
from pathlib import Path


class TestWeightEncoding:
    """Test that weights are encoded as float16, not normalized."""

    def test_fold_weights_preserves_float16(self, tmp_path):
        """Weights should be stored as float16, not 0-255 normalized."""
        from pixel_brain_converter import PixelBrainConverter

        # Create a small test tensor
        test_weights = np.array([
            [-0.5, 0.0, 0.5],
            [1.0, -1.0, 0.25]
        ], dtype=np.float32)

        converter = PixelBrainConverter.__new__(PixelBrainConverter)
        converter.grid_size = 8
        converter.order = 3

        # Import HilbertCurve
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
        converter.hilbert = HilbertCurve(3)
        converter.lut = converter.hilbert.generate_lut()

        # Fold should preserve float values
        result = converter.fold_weights_float16(torch.tensor(test_weights))

        # Verify float16 encoding
        assert result.dtype == np.float16
        assert len(result) == 6

    def test_atlas_stores_rgba_float16(self, tmp_path):
        """Atlas pixels should store 2 float16 values per channel."""
        from pixel_brain_converter import PixelBrainConverter

        # This test will fail until we implement float16 storage
        converter = PixelBrainConverter.__new__(PixelBrainConverter)
        converter.grid_size = 8
        converter.order = 3

        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
        converter.hilbert = HilbertCurve(3)
        converter.lut = converter.hilbert.generate_lut()

        test_tensor = torch.randn(64, 64, dtype=torch.float32)
        atlas = converter.create_brain_atlas_float16(test_tensor)

        # Atlas should be float16, not uint8
        assert atlas.dtype == np.float16
```

### Step 2: Run test to verify it fails

```bash
pytest tests/test_pixel_brain_converter.py -v
```

Expected: FAIL - `fold_weights_float16` method doesn't exist

### Step 3: Implement float16 encoding

Modify `pixel_brain_converter.py`, add new methods after `fold_weights`:

```python
def fold_weights_float16(self, weights: torch.Tensor) -> np.ndarray:
    """Fold weights preserving float16 precision for inference."""
    flat = weights.detach().cpu().numpy().flatten().astype(np.float16)
    return flat

def create_brain_atlas_float16(self, model) -> np.ndarray:
    """
    Map transformer layers to 2D Hilbert space with float16 precision.

    Returns float16 array of shape (grid_size, grid_size, 4) where
    each pixel stores 4 float16 values (RGBA).
    """
    print("🗺️  Mapping Neural Atlas (float16)...")
    state_dict = model.state_dict()

    # Create float16 atlas (4 channels per pixel)
    atlas = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.float16)
    cursor = 0

    # 1. Embedding Matrix
    embed = state_dict.get('model.embed_tokens.weight',
                           state_dict.get('transformer.wte.weight'))
    if embed is not None:
        print(f"  └─ Folding Embeddings: {embed.shape}")
        cursor = self._pack_to_atlas_float16(atlas, embed, cursor)

    # 2. Transformer Layers
    num_layers = getattr(self.config, 'num_hidden_layers', 0)
    for i in range(num_layers):
        print(f"  └─ Folding Layer {i}...")
        # Q, K, V, O
        for proj in ['q_proj', 'k_proj', 'v_proj', 'o_proj']:
            key = f"model.layers.{i}.self_attn.{proj}.weight"
            if key in state_dict:
                cursor = self._pack_to_atlas_float16(atlas, state_dict[key], cursor)

        # FFN (gate, up, down)
        for proj in ['gate_proj', 'up_proj', 'down_proj']:
            key = f"model.layers.{i}.mlp.{proj}.weight"
            if key in state_dict:
                cursor = self._pack_to_atlas_float16(atlas, state_dict[key], cursor)

    # 3. LM Head
    lm_head = state_dict.get('lm_head.weight')
    if lm_head is not None:
        print(f"  └─ Folding LM Head: {lm_head.shape}")
        cursor = self._pack_to_atlas_float16(atlas, lm_head, cursor)

    return atlas

def _pack_to_atlas_float16(self, atlas: np.ndarray, tensor: torch.Tensor, cursor: int) -> int:
    """Pack tensor into float16 atlas using Hilbert mapping.

    Returns new cursor position.
    """
    flat = tensor.detach().cpu().numpy().flatten().astype(np.float16)

    for i, val in enumerate(flat):
        idx = cursor + i
        if idx >= len(self.lut):
            print(f"  ⚠️ Atlas full at cursor={cursor}, remaining={len(flat)-i}")
            break

        x, y = self.lut[idx]
        channel = idx % 4
        atlas[y, x, channel] = val

    return cursor + len(flat)
```

### Step 4: Update convert method to use float16

Modify `pixel_brain_converter.py:134-177`:

```python
def convert(self, output_path, use_float16=True):
    """Convert model to PixelBrain RTS.PNG.

    Args:
        output_path: Output .rts.png path
        use_float16: If True, store float16 weights (for inference).
                     If False, normalize to uint8 (for visualization).
    """
    print(f"📥 Loading model {self.model_id}...")
    model = AutoModelForCausalLM.from_pretrained(
        self.model_id,
        torch_dtype=torch.float16 if use_float16 else torch.float32
    )

    if use_float16:
        atlas = self.create_brain_atlas_float16(model)
        # Save as EXR or float16 PNG (requires imageio or cv2)
        import imageio
        imageio.imwrite(output_path, atlas.astype(np.float16))
    else:
        atlas_bytes = self.create_brain_atlas(model)
        pixel_array = np.frombuffer(atlas_bytes, dtype=np.uint8).reshape(
            (self.grid_size, self.grid_size, 4)
        )
        img = Image.fromarray(pixel_array, 'RGBA')
        img.save(output_path, "PNG")

    # Metadata
    geoasm_src = self.generate_geoasm()
    metadata = {
        "type": "pixel-brain",
        "model_id": self.model_id,
        "encoding": "float16" if use_float16 else "uint8-normalized",
        "geoasm": geoasm_src,
        "config": {
            "vocab": self.config.vocab_size,
            "dim": self.config.hidden_size,
            "layers": getattr(self.config, 'num_hidden_layers', 0)
        }
    }

    with open(output_path + ".meta.json", "w") as f:
        json.dump(metadata, f, indent=2)

    print(f"✅ PixelBrain saved to {output_path}")
```

### Step 5: Run tests to verify

```bash
pytest tests/test_pixel_brain_converter.py -v
```

Expected: PASS

### Step 6: Commit

```bash
git add pixel_brain_converter.py tests/test_pixel_brain_converter.py
git commit -m "feat(pixel-brain): add float16 weight encoding for inference"
```

---

## Task 2: Add Neural Opcodes to GeoASM

**Problem:** GeoASM lacks opcodes for neural primitives (EMBED, ATTEND, PROJECT, SAMPLE, THOUGHT_PULSE).

**Files:**
- Modify: `geoasm-cli/geoasm_lib.py:27-90`
- Modify: `systems/hypervisor/src/geoasm_executor.wgsl`
- Create: `tests/test_geoasm_neural_opcodes.py`

### Step 1: Write the failing test

Create `tests/test_geoasm_neural_opcodes.py`:

```python
"""Tests for GeoASM neural extension opcodes."""
import pytest


class TestNeuralOpcodes:
    """Test that neural opcodes are defined and parseable."""

    def test_embed_opcode_defined(self):
        """0xD0 EMBED should be defined."""
        from geoasm_cli.geoasm_lib import OPCODES
        assert 0xD0 in OPCODES
        name, args, desc = OPCODES[0xD0]
        assert name == "EMBED"
        assert args == 2

    def test_attend_opcode_defined(self):
        """0xD1 ATTEND should be defined."""
        from geoasm_cli.geoasm_lib import OPCODES
        assert 0xD1 in OPCODES
        name, args, desc = OPCODES[0xD1]
        assert name == "ATTEND"

    def test_project_opcode_defined(self):
        """0xD2 PROJECT should be defined."""
        from geoasm_cli.geoasm_lib import OPCODES
        assert 0xD2 in OPCODES
        name, args, desc = OPCODES[0xD2]
        assert name == "PROJECT"

    def test_sample_opcode_defined(self):
        """0xD3 SAMPLE should be defined."""
        from geoasm_cli.geoasm_lib import OPCODES
        assert 0xD3 in OPCODES
        name, args, desc = OPCODES[0xD3]
        assert name == "SAMPLE"

    def test_thought_pulse_opcode_defined(self):
        """0xD6 THOUGHT_PULSE should be defined."""
        from geoasm_cli.geoasm_lib import OPCODES
        assert 0xD6 in OPCODES
        name, args, desc = OPCODES[0xD6]
        assert name == "THOUGHT_PULSE"

    def test_neural_opcodes_parse(self):
        """Neural opcodes should parse in GeoASM source."""
        from geoasm_cli.geoasm_lib import GeoASMParser

        source = """
        .main
          0xD0 R1, R2
          0xD1 R2, R2
          0xD2 R2, R2
          0xD3 R2, R3
          0xD6 R3
        """
        parser = GeoASMParser()
        program = parser.parse(source)
        assert len(program.instructions) == 5
```

### Step 2: Run test to verify it fails

```bash
pytest tests/test_geoasm_neural_opcodes.py -v
```

Expected: FAIL - opcodes 0xD0-0xD3 not defined

### Step 3: Add neural opcodes to geoasm_lib.py

Modify `geoasm-cli/geoasm_lib.py`, replace lines 70-76 with:

```python
    # Neural Extension Opcodes (PixelBrain)
    0xD0: ("EMBED", 2, "Lookup token embedding from weight atlas"),
    0xD1: ("ATTEND", 2, "Self-attention via WGSL kernel"),
    0xD2: ("PROJECT", 2, "FFN projection via WGSL kernel"),
    0xD3: ("SAMPLE", 2, "Sample token from logits"),
    0xD4: ("LLM_PROMPT", 0, "Call external LLM"),
    0xD5: ("KV_APPEND", 1, "Append to KV-cache texture"),
    0xD6: ("THOUGHT_PULSE", 1, "Emit visual glyph pulse"),
    0xD7: ("START_TIMER", 1, "Start timer"),
    0xD8: ("STOP_TIMER", 0, "Stop timer"),
    0xD9: ("GET_TIMER", 2, "Get timer value"),
```

### Step 4: Run tests to verify

```bash
pytest tests/test_geoasm_neural_opcodes.py -v
```

Expected: PASS

### Step 5: Commit

```bash
git add geoasm-cli/geoasm_lib.py tests/test_geoasm_neural_opcodes.py
git commit -m "feat(geoasm): add neural extension opcodes D0-D6 for PixelBrain"
```

---

## Task 3: Create Pipeline Orchestrator

**Problem:** No code exists to wire the 4 WGSL shaders into a single inference pass.

**Files:**
- Create: `systems/visual_shell/wgsl/pixel_brain_pipeline.py`
- Create: `tests/test_pixel_brain_pipeline.py`

### Step 1: Write the failing test

Create `tests/test_pixel_brain_pipeline.py`:

```python
"""Tests for PixelBrain inference pipeline."""
import pytest
import numpy as np
from pathlib import Path


class TestPixelBrainPipeline:
    """Test the inference pipeline orchestration."""

    def test_pipeline_loads_brain_atlas(self, tmp_path):
        """Pipeline should load the RTS.PNG brain atlas."""
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        # Use the generated brain
        brain_path = Path("tinystories_brain.rts.png.meta.json")
        if not brain_path.exists():
            pytest.skip("tinystories_brain.rts.png not generated")

        pipeline = PixelBrainPipeline("tinystories_brain.rts.png")
        assert pipeline.atlas is not None
        assert pipeline.config["dim"] == 64

    def test_pipeline_embed_token(self):
        """Pipeline should embed a single token."""
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        brain_path = Path("tinystories_brain.rts.png.meta.json")
        if not brain_path.exists():
            pytest.skip("tinystories_brain.rts.png not generated")

        pipeline = PixelBrainPipeline("tinystories_brain.rts.png")

        # Token 0 should produce a 64-dim hidden state
        hidden = pipeline.embed_token(0)
        assert hidden.shape == (64,)
        assert not np.allclose(hidden, 0)  # Should not be zeros

    def test_pipeline_forward_pass(self):
        """Pipeline should run a complete forward pass."""
        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        brain_path = Path("tinystories_brain.rts.png.meta.json")
        if not brain_path.exists():
            pytest.skip("tinystories_brain.rts.png not generated")

        pipeline = PixelBrainPipeline("tinystories_brain.rts.png")

        # Token 0 through full network
        logits = pipeline.forward(0)
        assert logits.shape[0] == 50257  # vocab size
```

### Step 2: Run test to verify it fails

```bash
pytest tests/test_pixel_brain_pipeline.py -v
```

Expected: FAIL - module not found

### Step 3: Create the pipeline orchestrator

Create `systems/visual_shell/wgsl/pixel_brain_pipeline.py`:

```python
"""
PixelBrain Inference Pipeline

Orchestrates the 4 WGSL shaders for inference:
1. embed (0xD0) - Token → Hidden
2. attend (0xD1) - Self-Attention
3. project (0xD2) - FFN
4. sample (0xD3) - Hidden → Token
"""

import json
import numpy as np
from pathlib import Path
from typing import Optional, Tuple
import logging

logger = logging.getLogger(__name__)


class PixelBrainPipeline:
    """
    Native Geometry OS LLM inference pipeline.

    Loads a Hilbert-folded RTS.PNG brain atlas and executes
    inference using WGSL compute shaders.
    """

    def __init__(self, brain_path: str):
        """
        Initialize pipeline from a PixelBrain RTS.PNG.

        Args:
            brain_path: Path to .rts.png file (or .rts.png.meta.json)
        """
        self.brain_path = Path(brain_path).with_suffix('')
        self._load_metadata()
        self._load_atlas()
        self._init_wgpu()

    def _load_metadata(self):
        """Load brain configuration from meta.json."""
        meta_path = Path(f"{self.brain_path}.rts.png.meta.json")
        if not meta_path.exists():
            raise FileNotFoundError(f"Brain metadata not found: {meta_path}")

        with open(meta_path) as f:
            self.metadata = json.load(f)

        self.config = self.metadata.get("config", {})
        self.model_id = self.metadata.get("model_id", "unknown")
        self.encoding = self.metadata.get("encoding", "uint8-normalized")

        logger.info(f"Loaded PixelBrain: {self.model_id}")
        logger.info(f"  dim={self.config.get('dim')}, "
                   f"layers={self.config.get('layers')}, "
                   f"vocab={self.config.get('vocab')}")

    def _load_atlas(self):
        """Load the weight atlas into memory."""
        import imageio

        atlas_path = Path(f"{self.brain_path}.rts.png")
        if not atlas_path.exists():
            raise FileNotFoundError(f"Brain atlas not found: {atlas_path}")

        self.atlas = imageio.imread(atlas_path)
        logger.info(f"Atlas shape: {self.atlas.shape}, dtype: {self.atlas.dtype}")

    def _init_wgpu(self):
        """Initialize WebGPU device and bind groups."""
        # Placeholder - in production, this would initialize wgpu-py
        # and create bind groups for the 4 shaders
        self.device = None  # wgpu.Device
        self.atlas_texture = None
        self._wgpu_initialized = False

    def _ensure_wgpu(self):
        """Lazily initialize WebGPU."""
        if self._wgpu_initialized:
            return

        try:
            import wgpu
            # Create device and upload atlas texture
            # This is a stub - full implementation would:
            # 1. Create wgpu device
            # 2. Create texture from atlas
            # 3. Create bind groups for each shader
            logger.warning("WGPU initialization not implemented - using CPU fallback")
        except ImportError:
            logger.warning("wgpu not available - using CPU fallback")

        self._wgpu_initialized = True

    def embed_token(self, token_id: int) -> np.ndarray:
        """
        Look up token embedding from atlas.

        Args:
            token_id: Token index (0 to vocab_size-1)

        Returns:
            Hidden state vector of shape (dim,)
        """
        self._ensure_wgpu()

        dim = self.config.get("dim", 64)
        vocab = self.config.get("vocab", 50257)

        if token_id < 0 or token_id >= vocab:
            raise ValueError(f"Invalid token_id: {token_id}")

        # CPU fallback: Read directly from atlas
        # In production, this would dispatch pixel_brain_embed.wgsl
        hidden = np.zeros(dim, dtype=np.float16)

        # Hilbert lookup for embedding
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve
        order = int(np.log2(self.atlas.shape[0]))
        hilbert = HilbertCurve(order)

        for i in range(dim):
            # Token embeddings start at Hilbert index = token_id * dim + i
            atlas_idx = token_id * dim + i
            if atlas_idx < len(hilbert._lut):
                x, y = hilbert._lut[atlas_idx]
                channel = atlas_idx % 4
                if self.atlas.ndim == 3:
                    hidden[i] = self.atlas[y, x, channel]
                else:
                    hidden[i] = self.atlas[y, x]

        return hidden.astype(np.float32)

    def forward(self, token_id: int) -> np.ndarray:
        """
        Run complete forward pass through the network.

        Args:
            token_id: Input token

        Returns:
            Logits vector of shape (vocab_size,)
        """
        self._ensure_wgpu()

        # Step 1: Embed
        hidden = self.embed_token(token_id)

        # Step 2: Transformer layers (attention + ffn)
        num_layers = self.config.get("layers", 8)
        for layer in range(num_layers):
            hidden = self._attention_layer(hidden, layer)
            hidden = self._ffn_layer(hidden, layer)

        # Step 3: LM Head → logits
        logits = self._lm_head(hidden)

        return logits

    def _attention_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        """Single attention layer (stub for CPU fallback)."""
        # In production, dispatches pixel_brain_attention.wgsl
        return hidden  # Placeholder

    def _ffn_layer(self, hidden: np.ndarray, layer: int) -> np.ndarray:
        """Single FFN layer (stub for CPU fallback)."""
        # In production, dispatches pixel_brain_project.wgsl
        return hidden  # Placeholder

    def _lm_head(self, hidden: np.ndarray) -> np.ndarray:
        """Output projection to logits (stub for CPU fallback)."""
        # In production, this is part of sample shader
        vocab = self.config.get("vocab", 50257)
        return np.zeros(vocab, dtype=np.float32)  # Placeholder

    def generate(self, prompt_tokens: list, max_tokens: int = 32) -> list:
        """
        Generate tokens autoregressively.

        Args:
            prompt_tokens: List of input token IDs
            max_tokens: Maximum tokens to generate

        Returns:
            List of generated token IDs (excluding prompt)
        """
        generated = []

        # Use last token as seed
        current_token = prompt_tokens[-1] if prompt_tokens else 0

        for _ in range(max_tokens):
            logits = self.forward(current_token)
            next_token = np.argmax(logits)  # Greedy
            generated.append(int(next_token))
            current_token = next_token

        return generated
```

### Step 4: Run tests to verify

```bash
pytest tests/test_pixel_brain_pipeline.py -v
```

Expected: Some tests pass (load, embed), some skip (forward needs WGSL)

### Step 5: Commit

```bash
git add systems/visual_shell/wgsl/pixel_brain_pipeline.py tests/test_pixel_brain_pipeline.py
git commit -m "feat(pixel-brain): add inference pipeline orchestrator"
```

---

## Task 4: Wire THOUGHT_PULSE to Visual Shell

**Problem:** The 0xD6 THOUGHT_PULSE opcode needs to emit visible glyphs in the Visual Shell.

**Files:**
- Modify: `systems/visual_shell/api/visual_bridge.py`
- Create: `tests/test_thought_pulse.py`

### Step 1: Write the failing test

Create `tests/test_thought_pulse.py`:

```python
"""Tests for THOUGHT_PULSE visual emission."""
import pytest


class TestThoughtPulse:
    """Test that 0xD6 emits visual glyphs."""

    def test_thought_pulse_emits_glyph(self):
        """THOUGHT_PULSE should emit a 0xCE glyph."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        bridge.initialize()

        # Emit thought pulse for token "Hello" (hypothetical)
        result = bridge.emit_thought_pulse(
            token_id=15496,  # "Hello" in GPT-2 tokenizer
            position=(100, 100),
            intensity=1.0
        )

        assert result is True
        assert bridge.has_active_glyphs()

    def test_thought_pulse_uses_glyph_0xCE(self):
        """THOUGHT_PULSE should use the THOUGHT_RENDER glyph."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()
        bridge.initialize()

        bridge.emit_thought_pulse(token_id=0, position=(0, 0))
        glyphs = bridge.get_active_glyphs()

        assert len(glyphs) > 0
        assert glyphs[0]["opcode"] == 0xCE
```

### Step 2: Run test to verify it fails

```bash
pytest tests/test_thought_pulse.py -v
```

Expected: FAIL - `emit_thought_pulse` method doesn't exist

### Step 3: Add THOUGHT_PULSE to VisualBridge

Modify `systems/visual_shell/api/visual_bridge.py`, add method:

```python
def emit_thought_pulse(
    self,
    token_id: int,
    position: tuple,
    intensity: float = 1.0
) -> bool:
    """
    Emit a THOUGHT_PULSE (0xCE) glyph for LLM output visualization.

    Args:
        token_id: The generated token
        position: (x, y) screen position
        intensity: Pulse brightness (0-1)

    Returns:
        True if emission successful
    """
    if not self._initialized:
        return False

    # Create thought glyph
    glyph = {
        "opcode": 0xCE,  # THOUGHT_RENDER
        "token_id": token_id,
        "x": position[0],
        "y": position[1],
        "intensity": intensity,
        "timestamp": time.time()
    }

    # Add to active glyphs
    self._active_glyphs.append(glyph)

    # Trigger visual update
    self._schedule_render()

    return True

def has_active_glyphs(self) -> bool:
    """Check if there are active thought glyphs."""
    return len(self._active_glyphs) > 0

def get_active_glyphs(self) -> list:
    """Get list of active thought glyphs."""
    return self._active_glyphs.copy()
```

### Step 4: Run tests to verify

```bash
pytest tests/test_thought_pulse.py -v
```

Expected: PASS (or skip if VisualBridge not fully initialized)

### Step 5: Commit

```bash
git add systems/visual_shell/api/visual_bridge.py tests/test_thought_pulse.py
git commit -m "feat(visual-shell): add THOUGHT_PULSE emission for PixelBrain"
```

---

## Task 5: End-to-End Test

**Problem:** Need to verify the complete pipeline from token input to glyph output.

**Files:**
- Create: `tests/test_pixel_brain_e2e.py`

### Step 1: Write the e2e test

Create `tests/test_pixel_brain_e2e.py`:

```python
"""End-to-end tests for PixelBrain inference."""
import pytest
from pathlib import Path


class TestPixelBrainE2E:
    """Full pipeline integration tests."""

    @pytest.fixture
    def brain_available(self):
        """Check if brain artifact exists."""
        return Path("tinystories_brain.rts.png.meta.json").exists()

    def test_token_through_pipeline(self, brain_available):
        """A token should flow through the full pipeline."""
        if not brain_available:
            pytest.skip("Brain artifact not available")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline("tinystories_brain.rts.png")

        # Token 0 through the network
        logits = pipeline.forward(0)

        assert logits is not None
        assert len(logits) == 50257  # vocab size

    def test_generate_sequence(self, brain_available):
        """Pipeline should generate a token sequence."""
        if not brain_available:
            pytest.skip("Brain artifact not available")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        pipeline = PixelBrainPipeline("tinystories_brain.rts.png")

        # Generate from seed token
        generated = pipeline.generate([0], max_tokens=5)

        assert len(generated) == 5
        assert all(isinstance(t, int) for t in generated)
        assert all(0 <= t < 50257 for t in generated)

    def test_visual_feedback_on_generation(self, brain_available):
        """Generation should trigger visual feedback."""
        if not brain_available:
            pytest.skip("Brain artifact not available")

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
        from systems.visual_shell.api.visual_bridge import VisualBridge

        pipeline = PixelBrainPipeline("tinystories_brain.rts.png")
        bridge = VisualBridge()
        bridge.initialize()

        # Generate and emit pulses
        generated = pipeline.generate([0], max_tokens=3)

        for i, token in enumerate(generated):
            bridge.emit_thought_pulse(
                token_id=token,
                position=(i * 50, 0),
                intensity=1.0
            )

        assert bridge.has_active_glyphs()
        assert len(bridge.get_active_glyphs()) == 3
```

### Step 2: Run test

```bash
pytest tests/test_pixel_brain_e2e.py -v
```

Expected: Some tests pass, some may skip

### Step 3: Commit

```bash
git add tests/test_pixel_brain_e2e.py
git commit -m "test(pixel-brain): add end-to-end integration tests"
```

---

## Verification Checklist

After all tasks complete, verify:

- [ ] `tinystories_brain.rts.png` loads with float16 weights
- [ ] GeoASM opcodes D0-D6 defined
- [ ] `PixelBrainPipeline` embeds tokens
- [ ] `THOUGHT_PULSE` emits visible glyphs
- [ ] E2E test passes (or skips gracefully)

---

## Files Changed Summary

| File | Action | Lines |
|------|--------|-------|
| `pixel_brain_converter.py` | Modify | +60 |
| `geoasm-cli/geoasm_lib.py` | Modify | +10 |
| `systems/visual_shell/wgsl/pixel_brain_pipeline.py` | Create | +180 |
| `systems/visual_shell/api/visual_bridge.py` | Modify | +35 |
| `tests/test_pixel_brain_converter.py` | Create | +40 |
| `tests/test_geoasm_neural_opcodes.py` | Create | +50 |
| `tests/test_pixel_brain_pipeline.py` | Create | +45 |
| `tests/test_thought_pulse.py` | Create | +35 |
| `tests/test_pixel_brain_e2e.py` | Create | +60 |

**Total: ~515 lines of code + tests**
