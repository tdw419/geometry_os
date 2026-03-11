import asyncio
from transformers import AutoTokenizer
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
from systems.pixel_brain.persona_injector import PersonaInjector

async def persona_test():
    print("🧠 Persona Injection Sequence Start...")
    
    # 1. Initialize Pipeline & Injector
    brain_path = "gpt_neo_125m_brain.rts.png"
    brain = PixelBrainPipeline(brain_path)
    injector = PersonaInjector()
    
    # 2. Select Sector and Inject Persona
    sector = "security_sector"
    user_request = "Scan the current memory buffer for potential exploits."
    
    full_prompt = injector.inject_into_prompt(user_request, sector)
    print(f"🎭 Sector: {sector}")
    print(f"🎭 Persona: Security Engineer")
    
    # 3. Tokenize
    tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")
    input_tokens = tokenizer.encode(full_prompt)
    
    # Trim if too long for our current 1024 seq_len
    if len(input_tokens) > 512:
        input_tokens = input_tokens[:512]
        
    print(f"📝 Prompt length: {len(input_tokens)} tokens")
    
    # 4. Generate
    print("🚀 Running WGPU Inference with Persona context...")
    generated_tokens = brain.generate(input_tokens, max_tokens=20)
    
    # 5. Decode
    output_text = tokenizer.decode(generated_tokens)
    print(f"✨ Substrate Response:\n{output_text}")

if __name__ == "__main__":
    asyncio.run(persona_test())
