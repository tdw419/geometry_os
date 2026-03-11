
import asyncio
import websockets
import json
import time


async def test():
    try:
        async with websockets.connect('ws://127.0.0.1:8768') as ws:
            print("[*] Logging in as root...")
            await ws.send(json.dumps({'command': 'type', 'params': {'text': 'root\n'}}))
            print(await ws.recv())

            time.sleep(2)

            print("[*] Sending password...")
            await ws.send(json.dumps({'command': 'type', 'params': {'text': 'root\n'}}))
            print(await ws.recv())

            time.sleep(2)

            print("[*] Starting X...")
            await ws.send(json.dumps({'command': 'type', 'params': {'text': 'startx\n'}}))
            print(await ws.recv())

            time.sleep(20)

            print("[*] Launching Shotcut...")
            await ws.send(json.dumps({'command': 'type', 'params': {'text': 'shotcut\n'}}))
            print(await ws.recv())

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    asyncio.run(test())
