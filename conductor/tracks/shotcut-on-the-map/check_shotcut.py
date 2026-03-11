
import asyncio
import websockets
import json


async def test():
    try:
        async with websockets.connect('ws://127.0.0.1:8768') as ws:
            print("[*] Checking for shotcut process...")
            await ws.send(json.dumps({'command': 'exec', 'params': {'command': 'pgrep shotcut'}}))
            print(await ws.recv())

            print("[*] Checking DISPLAY environment variable...")
            await ws.send(json.dumps({'command': 'exec', 'params': {'command': 'echo $DISPLAY'}}))
            print(await ws.recv())

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    asyncio.run(test())
