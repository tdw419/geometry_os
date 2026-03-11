import numpy as np
from PIL import Image
import json

def debug_atlas():
    path = "gpt_neo_125m_brain.rts.png"
    img = Image.open(path)
    data = np.array(img)
    print(f"Atlas shape: {data.shape}")
    print(f"Atlas min: {data.min()}, max: {data.max()}, mean: {data.mean()}")
    
    with open(path + ".meta.json") as f:
        meta = json.load(f)
    
    lm_head_start = meta["layout"]["sectors"]["lm_head"]["start"]
    print(f"LM Head Start: {lm_head_start}")
    
    # Check first 100 values of LM head
    flat = data.flatten()
    # Each float index i maps to byte i? No, Q4 quantization.
    # LM head start is 123,532,032 (float index).
    # Block index = 123,532,032 / 32 = 3,860,376.
    # Block bytes start = 3,860,376 * 20 = 77,207,520.
    
    start_byte = (lm_head_start // 32) * 20
    sample_bytes = flat[start_byte : start_byte + 100]
    print(f"Sample bytes at LM head start: {sample_bytes[:20]}")

if __name__ == "__main__":
    debug_atlas()
