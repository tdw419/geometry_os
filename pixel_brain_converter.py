#!/usr/bin/env python3
"""
PixelBrain Converter
Converts LLM weights to Hilbert-folded RTS.PNG visual containers for Geometry OS.

The "Screen is the Hard Drive" - The model IS the visual desktop.
"""

import sys
import json
import numpy as np
from PIL import Image
from pathlib import Path
from transformers import AutoModelForCausalLM, AutoConfig

# Add local path for PixelRTS core
sys.path.insert(0, str(Path(__file__).parent / "systems" / "pixel_compiler"))

try:
    from pixelrts_v2_core import HilbertCurve
except ImportError:
    # Fallback for direct execution
    from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve

try:
    from systems.visual_shell.wgsl.model_extractor import extract_model_weights
    from systems.visual_shell.wgsl.quantization.quant_converter import quantize_model_q4
except ImportError:
    # Handle direct execution paths
    sys.path.insert(0, str(Path(__file__).parent / "systems" / "visual_shell" / "wgsl"))
    from model_extractor import extract_model_weights
    from quantization.quant_converter import quantize_model_q4

class PixelBrainConverter:
    def __init__(self, model_id, grid_size=4096):
        print(f"🧠 Initializing PixelBrain for {model_id}...")
        self.model_id = model_id
        self.grid_size = grid_size
        self.order = int(np.log2(grid_size))
        self.hilbert = HilbertCurve(self.order)
        self.lut = self.hilbert.generate_lut()
        
        # Load model metadata (not weights yet for memory efficiency)
        self.config = AutoConfig.from_pretrained(model_id)

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

    def convert(self, output_path, mode="q4_0"):
        """Convert model to PixelBrain RTS.PNG.

        Args:
            output_path: Output .rts.png path
            mode: "q4_0", "float16", or "uint8"
        """
        # 1. Load Model
        print(f"📥 Loading model {self.model_id}...")
        model = AutoModelForCausalLM.from_pretrained(self.model_id)
        state_dict = model.state_dict()

        # 2. Extract Weights
        print(f"🔪 Extracting weights (mode: {mode})...")
        model_type = "gpt-neo" if "gpt-neo" in self.model_id.lower() else "llama"
        flat_weights, layout = extract_model_weights(state_dict, model_type=model_type)

        # 3. Quantize if needed
        if mode == "q4_0":
            print(f"📉 Quantizing to Q4_0 (125M params)...")
            quantized_data, quant_meta = quantize_model_q4(flat_weights)
            encoding = "q4_0"
            atlas_data = quantized_data
            metadata_quant = quant_meta
        elif mode == "float16":
            print(f"🧬 Converting to float16...")
            atlas_data = flat_weights.astype(np.float16).tobytes()
            encoding = "float16"
            metadata_quant = {}
        else:
            print(f"🌈 Normalizing for uint8 visualization...")
            # Normalize to 0-255
            norm = ((flat_weights - flat_weights.min()) / (flat_weights.max() - flat_weights.min() + 1e-8) * 255).astype(np.uint8)
            atlas_data = norm.tobytes()
            encoding = "uint8-normalized"
            metadata_quant = {}

        # 4. Prepare Metadata
        geoasm_src = self.generate_geoasm()
        metadata = {
            "type": "pixel-brain",
            "model_id": self.model_id,
            "encoding": encoding,
            "geoasm": geoasm_src,
            "layout": layout,
            "quantization": metadata_quant,
            "config": {
                "vocab": self.config.vocab_size,
                "dim": self.config.hidden_size,
                "layers": getattr(self.config, 'num_hidden_layers', 0),
                "grid_size": self.grid_size
            }
        }

        # 5. Save RTS.PNG using Hilbert Mapping
        print(f"🗺️  Mapping to Hilbert Atlas (8192x8192)...")
        
        # Target size in bytes (grid_size * grid_size * 4)
        target_size = self.grid_size * self.grid_size * 4
        if len(atlas_data) < target_size:
            atlas_data = atlas_data + b'\x00' * (target_size - len(atlas_data))
        
        # Create empty pixel array
        pixel_array = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.uint8)
        
        # Pack data into pixel array using Hilbert LUT
        # This preserves spatial locality for the Evolution Daemon
        print(f"   Folding {len(atlas_data) // 4} pixels into Hilbert curve...")

        # Process in chunks to avoid memory issues
        num_pixels = len(atlas_data) // 4
        flat_data = np.frombuffer(atlas_data[:num_pixels*4], dtype=np.uint8).reshape(num_pixels, 4)

        # Use chunked processing to avoid creating huge coordinate arrays
        chunk_size = 1000000  # 1M pixels per chunk
        for chunk_start in range(0, num_pixels, chunk_size):
            chunk_end = min(chunk_start + chunk_size, num_pixels)
            chunk_len = chunk_end - chunk_start

            # Compute coordinates on-the-fly for this chunk
            x_coords = np.zeros(chunk_len, dtype=np.int32)
            y_coords = np.zeros(chunk_len, dtype=np.int32)
            for i, idx in enumerate(range(chunk_start, chunk_end)):
                x, y = self.hilbert.index_to_coord(idx)
                x_coords[i] = x
                y_coords[i] = y

            pixel_array[y_coords, x_coords] = flat_data[chunk_start:chunk_end]

            if chunk_start % 5000000 == 0:
                print(f"   Processed {chunk_end}/{num_pixels} pixels...")

        del flat_data  # Free memory

        img = Image.fromarray(pixel_array, 'RGBA')

        # Add metadata chunks
        from PIL import PngImagePlugin
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", json.dumps(metadata))
        
        print(f"💾 Saving to {output_path}...")
        img.save(output_path, "PNG", pnginfo=pnginfo)

        # Also save a sidecar for the compositor
        with open(output_path + ".meta.json", "w") as f:
            json.dump(metadata, f, indent=2)

        print(f"✅ PixelBrain conversion complete: {output_path}")

if __name__ == "__main__":
    target_model = "roneneldan/TinyStories-1M"
    output = "tinystories_brain.rts.png"
    grid_size = 4096
    
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("model", nargs="?", default=target_model)
    parser.add_argument("output", nargs="?", default=output)
    parser.add_argument("--grid_size", type=int, default=grid_size)
    parser.add_argument("--mode", default="q4_0")
    args = parser.parse_args()
        
    converter = PixelBrainConverter(args.model, grid_size=args.grid_size)
    converter.convert(args.output, mode=args.mode)
    print(f"✅ PixelBrain conversion complete: {args.output}")
