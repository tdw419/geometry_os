
import asyncio
import websockets
import json


async def test():
    try:
        async with websockets.connect('ws://127.0.0.1:8768') as ws:
            await ws.send(json.dumps({'command': 'boot', 'params': {}}))
            print(await ws.recv())
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    asyncio.run(test())
