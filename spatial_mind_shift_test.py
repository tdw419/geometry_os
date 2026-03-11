import asyncio
import json
import logging
from systems.visual_shell.api.persona_bridge import PersonaBridge, PersonaShiftEvent
from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service, reset_pixel_brain_service
from systems.pixel_brain.persona_injector import PersonaInjector

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def run_experiment():
    print("\n" + "="*60)
    print("🧠 GEOMETRY OS: FIRST SPATIAL MIND-SHIFT EXPERIMENT")
    print("="*60 + "\n")

    # 1. Setup Environment
    reset_pixel_brain_service()
    brain_path = "tinystories_brain.rts.png"
    service = get_pixel_brain_service(brain_path=brain_path, tokenizer_name="gpt2")
    
    # Wait for initialization
    await asyncio.sleep(1)
    
    if not service.is_available():
        print("❌ PixelBrain Service not available. Ensure gpt_neo_125m_brain.rts.png exists.")
        return

    injector = PersonaInjector()
    bridge = PersonaBridge(persona_injector=injector)

    # 2. Simulated WebSocket Listener (to verify visual broadcast)
    received_events = []
    
    async def mock_ws_listener():
        # Get the global streamer
        from systems.visual_shell.api.visual_bridge import get_multi_vm_streamer
        streamer = get_multi_vm_streamer()
        
        # Mock a WebSocket
        class MockWS:
            async def send_text(self, text):
                try:
                    data = json.loads(text)
                    received_events.append(data)
                except Exception as e:
                    print(f"❌ MockWS Error: {e}")
                
        mock_ws = MockWS()
        streamer.active_websockets.add(mock_ws)
        print("📺 Visual Bridge: Mock WebSocket listener attached.")

    await mock_ws_listener()

    # 3. Baseline Thought (No Persona)
    print("📡 SCENARIO 1: Neutral Territory (No Persona)")
    prompt = "Analyze the current memory state."
    result1 = await service.generate(prompt, max_tokens=5)
    print(f"📝 Prompt: {prompt}")
    print(f"✨ Output: {result1['text']}\n")

    # 3. Spatial Shift to Security Zone
    print("🚀 SCENARIO 2: Entering Security Zone (Spatial Mind-Shift)")
    print("📍 Viewport entering Hilbert index 1,500,000...")
    
    event = PersonaShiftEvent(
        persona_id="security-engineer",
        sector_id="security_sector",
        position=(1500000, 0)
    )
    
    persona_info = await bridge.handle_persona_shift(event)
    print(f"🎭 PERSONA ACTIVATED: {persona_info.name}")
    print(f"🛡️ MISSION: {persona_info.mission[:100]}...")
    
    # 4. Persona-Driven Thought (Security)
    print("\n📡 SCENARIO 2: Thinking as a Security Engineer")
    result2 = await service.generate(prompt, max_tokens=5)
    print(f"📝 Prompt: {prompt}")
    print(f"✨ Output: {result2['text']}\n")

    # 5. Spatial Shift to Mutation Lab
    print("🚀 SCENARIO 3: Moving to Mutation Lab (Spatial Mind-Shift)")
    print("📍 Viewport entering Hilbert index 2,500,000...")
    
    event3 = PersonaShiftEvent(
        persona_id="rapid-prototyper",
        sector_id="mutation_lab",
        position=(2500000, 0)
    )
    
    persona_info3 = await bridge.handle_persona_shift(event3)
    print(f"🎭 PERSONA ACTIVATED: {persona_info3.name}")
    
    print("\n📡 SCENARIO 3: Thinking as a Rapid Prototyper")
    result3 = await service.generate(prompt, max_tokens=5)
    print(f"📝 Prompt: {prompt}")
    print(f"✨ Output: {result3['text']}")
    
    print("\n" + "="*60)
    print("✅ EXPERIMENT COMPLETE")
    print(f"📊 Visual Events Received: {len(received_events)}")
    for event in received_events:
        if event.get("type") == "event":
            data = event.get("data", {})
            if data.get("type") == "PERSONA_ACTIVE":
                print(f"🌈 VISUAL PROOF: Received PERSONA_ACTIVE for '{data.get('name')}' (Color: {data.get('color')})")
    print("="*60 + "\n")

if __name__ == "__main__":
    asyncio.run(run_experiment())
