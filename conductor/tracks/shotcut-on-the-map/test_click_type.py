import asyncio
import websockets
import json
import time
import base64


async def send_command(ws, cmd, params):
    await ws.send(json.dumps({'command': cmd, 'params': params}))
    return json.loads(await ws.recv())


async def test():
    try:
        async with websockets.connect('ws://127.0.0.1:8768') as ws:
            # Assume we are already in X with the white xterm visible
            print("[*] Clicking at (100, 100) to focus...")
            await send_command(ws, 'click', {'x': 100, 'y': 100, 'button': 'left'})
            time.sleep(1)

            print("[*] Typing 'ls -la'...")
            await send_command(ws, 'type', {'text': 'ls -la\n'})
            time.sleep(2)

            print("[*] Taking screenshot...")
            res = await send_command(ws, 'screenshot', {})
            with open('conductor/tracks/shotcut-on-the-map/screenshots/click_type_test.png', 'wb') as f:
                f.write(base64.b64decode(res['image']))
            print("[+] Saved screenshot: click_type_test.png")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    asyncio.run(test())
