import asyncio
from transformers import AutoTokenizer
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
import numpy as np
import time

async def first_thought():
    print("🧠 Starting Geometry OS - First Thought Sequence...")
    print(f"   Time: {time.strftime('%H:%M:%S')}")
    
    # 1. Initialize Pipeline
    brain_path = "gpt_neo_125m_brain.rts.png"
    print(f"📦 Loading brain atlas: {brain_path}")
    start = time.time()
    brain = PixelBrainPipeline(brain_path)
    print(f"   Loaded in {time.time() - start:.1f}s")
    
    # 2. Tokenize Prompt
    tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")
    prompt = "A"
    input_tokens = tokenizer.encode(prompt)
    print(f"📝 Prompt: '{prompt}' (Tokens: {input_tokens})")
    
    # 3. Generate
    print("\n🚀 Running Inference...")
    start = time.time()
    
    # We'll use forward() directly for the first token to inspect logits
    logits = brain.forward(input_tokens[0], position=0)
    print(f"📊 Logits Sample (first 10): {logits[:10]}")
    print(f"📊 Logits Range: min={logits.min():.4f}, max={logits.max():.4f}, mean={logits.mean():.4f}")
    
    top_5 = np.argsort(logits)[-5:][::-1]
    print(f"🔝 Top 5 Tokens: {top_5}")
    for t in top_5:
        print(f"   - {t}: '{tokenizer.decode([int(t)])}' (logit: {logits[t]:.4f})")

    # Resume full generation
    generated_tokens = brain.generate(input_tokens, max_tokens=5)
    elapsed = time.time() - start
    
    # 4. Decode
    output_text = tokenizer.decode(generated_tokens)
    print(f"\n✨ Result: '{prompt}' -> '{output_text}'")
    print(f"📊 Performance: {len(generated_tokens)/elapsed:.2f} tokens/sec")

if __name__ == "__main__":
    asyncio.run(first_thought())
