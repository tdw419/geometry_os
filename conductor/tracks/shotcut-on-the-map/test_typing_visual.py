import asyncio
import websockets
import json
import time
import base64


async def test():
    try:
        async with websockets.connect('ws://127.0.0.1:8768') as ws:
            # Assume we are already at the xterm prompt (from previous run)
            print("[*] Typing 'hello'...")
            await ws.send(json.dumps({'command': 'type', 'params': {'text': 'hello world\n'}}))
            print(await ws.recv())

            time.sleep(2)

            print("[*] Taking screenshot...")
            await ws.send(json.dumps({'command': 'screenshot', 'params': {}}))
            res = json.loads(await ws.recv())
            with open('conductor/tracks/shotcut-on-the-map/screenshots/type_test.png', 'wb') as f:
                f.write(base64.b64decode(res['image']))
            print("[+] Saved screenshot: type_test.png")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    asyncio.run(test())
