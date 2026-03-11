
import asyncio
import websockets
import json
import base64


async def test():
    try:
        async with websockets.connect('ws://127.0.0.1:8768') as ws:
            # We don't need the session ID if the bridge only manages one VM
            await ws.send(json.dumps({'command': 'screenshot', 'params': {}}))
            res = json.loads(await ws.recv())
            if res.get('success'):
                print(f"Success! Image size: {len(res['image'])}")
                with open('conductor/tracks/shotcut-on-the-map/screenshots/stage3_test.png', 'wb') as f:
                    f.write(base64.b64decode(res['image']))
            else:
                print(f"Error: {res.get('error')}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    asyncio.run(test())
