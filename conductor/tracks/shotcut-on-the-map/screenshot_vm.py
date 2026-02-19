#!/usr/bin/env python3
"""Capture screenshot from VM with OCR text extraction."""
import asyncio
import websockets
import json
import sys
import base64
import subprocess
from pathlib import Path

def extract_text_ocr(image_path: str) -> str:
    """Extract text from image using tesseract OCR."""
    try:
        result = subprocess.run(
            ['tesseract', image_path, 'stdout', '-l', 'eng'],
            capture_output=True,
            text=True,
            timeout=10
        )
        if result.returncode == 0:
            return result.stdout.strip()
        return f"[OCR failed: {result.stderr.strip()}]"
    except FileNotFoundError:
        return "[OCR unavailable - install tesseract-ocr]"
    except subprocess.TimeoutExpired:
        return "[OCR timeout]"

async def send_command(output_path: str = None, do_ocr: bool = True):
    uri = "ws://localhost:8768"
    try:
        async with websockets.connect(uri) as websocket:
            command = {"command": "screenshot"}
            await websocket.send(json.dumps(command))
            print("Sent screenshot command. Waiting for response...")
            response = await websocket.recv()
            data = json.loads(response)

            if data.get('success'):
                # Decode base64 image
                img_data = base64.b64decode(data['image'])
                fmt = data.get('format', 'jpg')

                # Determine output path
                if not output_path:
                    output_path = f"/tmp/vm_screenshot.{fmt}"

                # Save to file
                Path(output_path).write_bytes(img_data)
                print(f"✓ Screenshot saved: {output_path} ({len(img_data)} bytes)")

                # OCR extraction
                if do_ocr:
                    text = extract_text_ocr(output_path)
                    print(f"✓ OCR Text:\n{text}")

                # Return structured data
                result = {
                    "success": True,
                    "image_path": output_path,
                    "bytes": len(img_data),
                    "format": fmt
                }
                if do_ocr:
                    result["text"] = text
                return result
            else:
                print(f"✗ Screenshot failed: {data.get('error')}", file=sys.stderr)
                return data

    except ConnectionRefusedError:
        print("Connection refused. Is the shotcut_vm_bridge.py server running?", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description='Capture VM screenshot with OCR')
    parser.add_argument('output', nargs='?', help='Output image path')
    parser.add_argument('--no-ocr', action='store_true', help='Skip OCR extraction')
    args = parser.parse_args()

    asyncio.run(send_command(args.output, not args.no_ocr))
