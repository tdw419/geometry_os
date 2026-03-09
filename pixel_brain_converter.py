#!/usr/bin/env python3
"""
PixelBrain Converter
Converts LLM weights to Hilbert-folded RTS.PNG visual containers for Geometry OS.

The "Screen is the Hard Drive" - The model IS the visual desktop.
"""

import os
import sys
import json
import torch
import numpy as np
from PIL import Image
from pathlib import Path
from transformers import AutoModelForCausalLM, AutoConfig

# Add local path for PixelRTS core
sys.path.insert(0, str(Path(__file__).parent / "systems" / "pixel_compiler"))

try:
    from pixelrts_v2_core import HilbertCurve, PixelRTSMetadata, PixelRTSEncoder
except ImportError:
    # Fallback for direct execution
    from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve, PixelRTSMetadata, PixelRTSEncoder

class PixelBrainConverter:
    def __init__(self, model_id, grid_size=2048):
        print(f"🧠 Initializing PixelBrain for {model_id}...")
        self.model_id = model_id
        self.grid_size = grid_size
        self.order = int(np.log2(grid_size))
        self.hilbert = HilbertCurve(self.order)
        self.lut = self.hilbert.generate_lut()
        
        # Load model metadata (not weights yet for memory efficiency)
        self.config = AutoConfig.from_pretrained(model_id)
        
    def fold_weights(self, weights: torch.Tensor):
        """Fold a 2D weight matrix into a 1D Hilbert stream."""
        # Flatten and convert to float16 (Geometry OS standard for weights)
        flat = weights.detach().cpu().numpy().flatten().astype(np.float16)
        return flat

    def fold_weights_float16(self, weights: torch.Tensor) -> np.ndarray:
        """Fold weights preserving float16 precision for inference.

        Unlike fold_weights which normalizes for visualization,
        this preserves actual weight values for inference.
        """
        flat = weights.detach().cpu().numpy().flatten().astype(np.float16)
        return flat

    def create_brain_atlas(self, model):
        """
        Map transformer layers to 2D Hilbert space.
        Related weights (like Q,K,V) stay spatially coherent.
        """
        print("🗺️  Mapping Neural Atlas...")
        state_dict = model.state_dict()
        
        # We pack weights as float16 (2 weights per pixel if using RGBA8, 
        # or 1 weight per channel if using Rgba32Float).
        # For simplicity and visualization, we'll map 1 weight -> 1 pixel (grayscale/heatmap)
        # or 4 weights -> 1 pixel (RGBA).
        
        atlas_data = bytearray(self.grid_size * self.grid_size * 4)
        cursor = 0
        
        # 1. Embedding Matrix
        embed = state_dict.get('model.embed_tokens.weight', state_dict.get('transformer.wte.weight'))
        if embed is not None:
            print(f"  └─ Folding Embeddings: {embed.shape}")
            self._pack_to_atlas(atlas_data, embed, cursor)
            cursor += embed.numel()
            
        # 2. Transformer Layers
        num_layers = self.config.num_hidden_layers if hasattr(self.config, 'num_hidden_layers') else 0
        for i in range(num_layers):
            print(f"  └─ Folding Layer {i}...")
            # Q, K, V, O
            for proj in ['q_proj', 'k_proj', 'v_proj', 'o_proj']:
                key = f"model.layers.{i}.self_attn.{proj}.weight"
                if key in state_dict:
                    self._pack_to_atlas(atlas_data, state_dict[key], cursor)
                    cursor += state_dict[key].numel()
            
            # FFN
            for proj in ['gate_proj', 'up_proj', 'down_proj']:
                key = f"model.layers.{i}.mlp.{proj}.weight"
                if key in state_dict:
                    self._pack_to_atlas(atlas_data, state_dict[key], cursor)
                    cursor += state_dict[key].numel()

        # 3. LM Head
        lm_head = state_dict.get('lm_head.weight', state_dict.get('model.embed_tokens.weight'))
        if lm_head is not None:
            print(f"  └─ Folding LM Head: {lm_head.shape}")
            self._pack_to_atlas(atlas_data, lm_head, cursor)
            cursor += lm_head.numel()

        return bytes(atlas_data)

    def _pack_to_atlas(self, atlas_data, tensor, cursor_offset):
        """Pack tensor weights into the atlas_data bytearray using Hilbert mapping."""
        flat = tensor.detach().cpu().numpy().flatten()
        # Normalize to 0-255 for visualization
        # In a real impl, we'd store raw float16/float32
        norm = ((flat - flat.min()) / (flat.max() - flat.min() + 1e-8) * 255).astype(np.uint8)

        for i, val in enumerate(norm):
            abs_float_idx = (cursor_offset + i)
            pixel_idx = abs_float_idx // 4
            channel = abs_float_idx % 4

            if pixel_idx >= len(self.lut):
                if i % 100000 == 0:
                    print(f"  ⚠️ Atlas full at cursor={cursor_offset}, remaining={len(flat)-i}")
                break

            x, y = self.lut[pixel_idx]
            pixel_base = (y * self.grid_size + x) * 4
            atlas_data[pixel_base + channel] = val
    def create_brain_atlas_float16(self, model) -> np.ndarray:
        """
        Map transformer layers to 2D Hilbert space with float16 precision.

        Returns float16 array of shape (grid_size, grid_size, 4) where
        each pixel stores 4 float16 values (RGBA).
        """
        print("🗺️  Mapping Neural Atlas (float16)...")
        state_dict = model.state_dict() if hasattr(model, 'state_dict') else {}

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

    def _pack_to_atlas_float16(self, atlas: np.ndarray, tensor, cursor: int) -> int:
        """Pack tensor into float16 atlas using Hilbert mapping.

        Returns new cursor position.
        """
        if hasattr(tensor, 'detach'):
            flat = tensor.detach().cpu().numpy().flatten().astype(np.float16)
        else:
            flat = np.array(tensor).flatten().astype(np.float16)

        for i, val in enumerate(flat):
            abs_float_idx = cursor + i
            pixel_idx = abs_float_idx // 4
            channel = abs_float_idx % 4
            
            if pixel_idx >= len(self.lut):
                if i % 100000 == 0:
                    print(f"  ⚠️ Atlas full at cursor={cursor}, remaining={len(flat)-i}")
                break

            x, y = self.lut[pixel_idx]
            atlas[y, x, channel] = val

        return cursor + len(flat)

    def generate_geoasm(self):
        """Generate the GeoASM orchestration program."""
        return f"""
; PixelBrain {self.model_id} Orchestration
; Native Geometry OS Inference

.config
  model_id "{self.model_id}"
  vocab_size {self.config.vocab_size}
  hidden_dim {self.config.hidden_size}
  layers {getattr(self.config, 'num_hidden_layers', 0)}

.main
  ; Cognitive Loop
  0xD4                  ; LLM_PROMPT (Await user intent)
  0xD0 R1, R2           ; EMBED (Lookup token R1 into hidden R2)
  
  LOOP {getattr(self.config, 'num_hidden_layers', 0)}
    0xD1 R2, R2         ; ATTEND (Self-Attention)
    0xD2 R2, R2         ; PROJECT (FFN)
  ENDLOOP
  
  0xD3 R2, R3           ; SAMPLE (Logits R2 to Token R3)
  0xD6 R3               ; THOUGHT_PULSE (Visual feedback)
  JMP .main
        """

    def convert(self, output_path, use_float16=True):
        """Convert model to PixelBrain RTS.PNG.

        Args:
            output_path: Output .rts.png path
            use_float16: If True, store float16 weights (for inference).
                         If False, normalize to uint8 (for visualization).
        """
        # 1. Load Model
        print(f"📥 Loading model {self.model_id} (this might take a while)...")
        model = AutoModelForCausalLM.from_pretrained(
            self.model_id,
            torch_dtype=torch.float16 if use_float16 else torch.float32
        )

        # 2. Prepare Metadata
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

        # 3. Save RTS.PNG
        print(f"💾 Saving to {output_path}...")

        if use_float16:
            atlas = self.create_brain_atlas_float16(model)
            # Save as EXR or float16-compatible format
            try:
                import imageio
                imageio.imwrite(output_path, atlas.astype(np.float16))
            except ImportError:
                # Fallback: save as raw binary with .f16 extension
                print("  ⚠️ imageio not available, saving as raw .f16")
                atlas.tofile(output_path + ".f16")
        else:
            # Visualization mode: normalize to uint8
            atlas_bytes = self.create_brain_atlas(model)
            pixel_array = np.frombuffer(atlas_bytes, dtype=np.uint8).reshape(
                (self.grid_size, self.grid_size, 4)
            )
            img = Image.fromarray(pixel_array, 'RGBA')

            # Add metadata chunks
            from PIL import PngImagePlugin
            pnginfo = PngImagePlugin.PngInfo()
            pnginfo.add_text("PixelRTS", PixelRTSMetadata.MAGIC.decode() + json.dumps(metadata))

            img.save(output_path, "PNG", pnginfo=pnginfo)

        # Also save a sidecar for the compositor
        with open(output_path + ".meta.json", "w") as f:
            json.dump(metadata, f, indent=2)

        print(f"✅ PixelBrain conversion complete: {output_path}")

if __name__ == "__main__":
    # Use a tiny model for the demo
    # "TinyStories-1M" is ideal but we'll use a placeholder or check for local models
    target_model = "roneneldan/TinyStories-1M"
    output = "tinystories_brain.rts.png"
    
    if len(sys.argv) > 1:
        target_model = sys.argv[1]
    if len(sys.argv) > 2:
        output = sys.argv[2]
        
    converter = PixelBrainConverter(target_model)
    # Perform the actual conversion
    converter.convert(output)
    print(f"✅ PixelBrain conversion complete: {output}")
