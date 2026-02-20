
import asyncio
import websockets
import json
import time
import base64


async def send_command(ws, cmd, params):
    await ws.send(json.dumps({'command': cmd, 'params': params}))
    return json.loads(await ws.recv())


async def save_screenshot(ws, name):
    res = await send_command(ws, 'screenshot', {})
    if res.get('success'):
        with open(f'conductor/tracks/shotcut-on-the-map/screenshots/{name}.png', 'wb') as f:
            f.write(base64.b64decode(res['image']))
        print(f"[+] Saved screenshot: {name}.png")


async def test():
    try:
        async with websockets.connect('ws://127.0.0.1:8768') as ws:
            print("[*] Logging in...")
            await send_command(ws, 'type', {'text': 'root\n'})
            time.sleep(2)
            await send_command(ws, 'type', {'text': 'root\n'})
            time.sleep(5)

            print("[*] Starting X...")
            await send_command(ws, 'type', {'text': 'startx\n'})
            time.sleep(15)

            print("[*] Checking shotcut path...")
            await send_command(ws, 'type', {'text': 'which shotcut\n'})
            time.sleep(2)
            await save_screenshot(ws, 'check_path')

            print("[*] Launching Shotcut...")
            await send_command(ws, 'type', {'text': 'QT_X11_NO_MITSHM=1 shotcut --software\n'})
            time.sleep(30)
            await save_screenshot(ws, 'after_shotcut_complex')

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    asyncio.run(test())
