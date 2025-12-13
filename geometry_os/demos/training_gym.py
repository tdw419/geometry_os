
import asyncio
import websockets
import json
import time
import random

# A Curriculum of tasks to teach the OS
CURRICULUM = [
    {
        "intent": "Implement a binary search function in Python",
        "category": "Algorithms"
    },
    {
        "intent": "Create a secure password hashing function using bcrypt",
        "category": "Security"
    },
    {
        "intent": "Write a regex to validate email addresses",
        "category": "Validation"
    },
    {
        "intent": "Optimize this SQL query for performance: SELECT * FROM users",
        "category": "Database"
    },
    {
        "intent": "Create a rest API endpoint using FastAPI",
        "category": "Web"
    }
]

async def train_system():
    uri = "ws://localhost:8000/ws"
    print(f"🏋️  Connecting to Geometry OS Gym at {uri}...")
    
    try:
        async with websockets.connect(uri) as websocket:
            # Shake hands (Receive initial state)
            init_state = await websocket.recv()
            print(f"✅  Connected. System State: {json.loads(init_state)['nodes']} nodes.")
            
            print("\n--- BEGINNING TRAINING SESSION [Use LM Studio] ---")
            
            total_time = 0
            skills_learned = 0
            
            for task in CURRICULUM:
                print(f"\n🧠  Teaching: '{task['intent']}'")
                
                # 1. Send Intent
                request = {"intent": task["intent"]}
                start_t = time.time()
                await websocket.send(json.dumps(request))
                
                # 2. Wait for Thinking (LM Studio + Kernel Verification)
                print("    -> Thinking...", end="", flush=True)
                while True:
                    response = await websocket.recv()
                    data = json.loads(response)
                    
                    if data.get("type") == "result":
                        elapsed = time.time() - start_t
                        print(f" DONE in {elapsed:.2f}s")
                        print(f"    -> Confidence: {data['confidence']:.2f}")
                        
                        if data['confidence'] > 0.9:
                            print("    ✅  Skill Verified & Assigned to Long-Term Memory")
                            skills_learned += 1
                        else:
                            print("    ⚠️  Skill Rejected (Low Confidence)")
                            
                        total_time += elapsed
                        break
                    elif data.get("type") == "log":
                        # print(f"    (Log: {data['msg']})")
                        pass

            print(f"\n--- SESSION COMPLETE ---")
            print(f"📚  New Skills Acquired: {skills_learned}")
            print(f"⏱️   Total Training Time: {total_time:.2f}s")
            print("💡  The system is now permanently smarter. Try asking these intents again!")
            
    except Exception as e:
        print(f"❌  Connection Error: {e}")
        print("    (Is the daemon running? 'python3 -m geometry_os.daemon')")

if __name__ == "__main__":
    asyncio.run(train_system())
