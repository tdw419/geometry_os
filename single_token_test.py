import asyncio
from transformers import AutoTokenizer
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
import time

async def single_token():
    print("🧠 Single Token Inference Test...")
    
    brain_path = "gpt_neo_125m_brain.rts.png"
    print(f"📦 Loading brain atlas: {brain_path}")
    start = time.time()
    brain = PixelBrainPipeline(brain_path)
    elapsed = time.time() - start
    print(f"   Loaded in {elapsed:.1f}s")
    
    # Tokenize
    tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")
    prompt = "The"
    input_tokens = tokenizer.encode(prompt)
    print(f"📝 Prompt: '{prompt}' (Tokens: {input_tokens})")
    
    # Generate just 1 token
    print("🚀 Running single token inference...")
    start_gen = time.time()
    generated = brain.generate(input_tokens, max_tokens=1)
    elapsed_gen = time.time() - start_gen
    print(f"\n✨ Result: '{prompt}' + '{tokenizer.decode(generated)}'")
    print(f"   Generation time: {elapsed_gen:.1f}s")

if __name__ == "__main__":
    asyncio.run(single_token())
