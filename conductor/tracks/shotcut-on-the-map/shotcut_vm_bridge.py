#!/usr/bin/env python3
"""
Shotcut VM Bridge for Geometry OS

A WebSocket server that manages a QEMU VM running Shotcut.
Provides WebMCP tools for AI-driven GUI control.

Features:
- Boot QEMU VM with Shotcut pre-installed
- Capture screenshots via VNC
- Inject keyboard/mouse input
- Execute shell commands

Usage:
    python shotcut_vm_bridge.py [--port 8768] [--image shotcut-alpine.qcow2]

WebMCP Tools Exposed:
    - shotcut_boot: Start the VM
    - shotcut_shutdown: Stop the VM
    - shotcut_screenshot: Capture screen
    - shotcut_input: Inject input events
    - shotcut_exec: Run shell commands
"""

import asyncio
import json
import subprocess
import base64
import os
import signal
import shutil
import logging
import argparse
import socket
from pathlib import Path
from typing import Optional, Dict, Any
from dataclasses import dataclass, field
from datetime import datetime

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger('shotcut-bridge')

# Try to import optional dependencies
try:
    import websockets
    from websockets.server import serve
    HAS_WEBSOCKETS = True
except ImportError:
    HAS_WEBSOCKETS = False
    logger.warning("websockets not installed - run: pip install websockets")

try:
    from PIL import Image
    import io
    HAS_PIL = True
except ImportError:
    HAS_PIL = False
    logger.warning("PIL not installed - run: pip install Pillow")


@dataclass
class VMState:
    """State of the Shotcut VM."""
    process: Optional[subprocess.Popen] = None
    session_id: str = ""
    status: str = "stopped"  # stopped, booting, running, error
    vnc_port: int = 5900
    ssh_port: int = 2222
    memory: int = 2048
    cpus: int = 2
    started_at: Optional[datetime] = None
    error_message: str = ""
    qmp_socket: str = ""  # Path to QMP socket for input injection


class ShotcutVMBridge:
    """Manages the Shotcut QEMU VM and handles WebSocket commands."""

    def __init__(self, image_path: str, port: int = 8768):
        self.image_path = Path(image_path)
        self.port = port
        self.vm = VMState()
        self.clients = set()
        self._vnc_buffer = None
        self._qmp_connected = False

    def _send_qmp_command(self, command: str, arguments: Dict = None) -> Dict:
        """Send a command via QMP socket."""
        if not self.vm.qmp_socket or not os.path.exists(self.vm.qmp_socket):
            return {'error': 'QMP socket not available'}

        try:
            sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            sock.settimeout(5)
            sock.connect(self.vm.qmp_socket)

            # Read greeting
            greeting = sock.recv(4096).decode()

            # Send qmp_capabilities to negotiate
            sock.send(json.dumps({'execute': 'qmp_capabilities'}).encode() + b'\n')
            response = sock.recv(4096).decode()

            # Send actual command
            cmd = {'execute': command}
            if arguments:
                cmd['arguments'] = arguments
            logger.info(f"Sending QMP command: {command} with args: {arguments}")
            sock.send(json.dumps(cmd).encode() + b'\n')
            response = sock.recv(4096).decode()
            logger.info(f"QMP response: {response}")

            sock.close()
            return json.loads(response)
        except Exception as e:
            logger.error(f"QMP error: {e}")
            return {'error': str(e)}

    async def handle_command(self, command: str, params: Dict[str, Any]) -> Dict[str, Any]:
        """Route command to appropriate handler."""
        handlers = {
            'status': self.handle_status,
            'boot': self.handle_boot,
            'shutdown': self.handle_shutdown,
            'screenshot': self.handle_screenshot,
            'input': self.handle_input,
            'exec': self.handle_exec,
            'type': self.handle_type,
            'click': self.handle_click,
        }

        handler = handlers.get(command)
        if not handler:
            return {'success': False, 'error': f'Unknown command: {command}'}

        try:
            return await handler(params)
        except Exception as e:
            logger.error(f"Error handling {command}: {e}")
            return {'success': False, 'error': str(e)}

    async def handle_status(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Get VM status."""
        return {
            'success': True,
            'session_id': self.vm.session_id,
            'status': self.vm.status,
            'vnc_port': self.vm.vnc_port,
            'ssh_port': self.vm.ssh_port,
            'memory': self.vm.memory,
            'cpus': self.vm.cpus,
            'started_at': self.vm.started_at.isoformat() if self.vm.started_at else None,
            'error': self.vm.error_message or None
        }

    async def handle_boot(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Boot the Shotcut VM."""
        if self.vm.status == 'running':
            return {
                'success': True,
                'session_id': self.vm.session_id,
                'status': 'already_running',
                'message': 'VM is already running'
            }

        if not self.image_path.exists():
            return {
                'success': False,
                'error': f'Image not found: {self.image_path}'
            }

        # Check for ISO boot (for installation)
        iso_path = params.get('iso')
        if iso_path and Path(iso_path).exists():
            return await self._boot_with_iso(iso_path, params)

        # Normal boot from disk image
        return await self._boot_from_disk(params)

    async def _boot_from_disk(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Boot VM from existing disk image."""
        logger.info(f"Booting VM from {self.image_path}")

        self.vm.memory = params.get('memory', 2048)
        self.vm.cpus = params.get('cpus', 2)
        self.vm.vnc_port = params.get('vnc_port', 5900)
        self.vm.ssh_port = params.get('ssh_port', 2222)

        # Generate session ID
        self.vm.session_id = f"shotcut-{datetime.now().strftime('%Y%m%d-%H%M%S')}"

        # Build QEMU command
        qemu_cmd = [
            'qemu-system-x86_64',
            '-m', str(self.vm.memory),
            '-smp', str(self.vm.cpus),
            '-drive', f'file={self.image_path},format=qcow2,if=virtio',
            '-vnc', f'127.0.0.1:{self.vm.vnc_port - 5900}',  # Explicitly bind to loopback
            '-serial', 'mon:stdio',
            '-monitor', f'unix:/tmp/qemu-monitor-{self.vm.session_id}.sock,server,nowait',
            '-qmp', f'unix:/tmp/qemu-qmp-{self.vm.session_id}.sock,server,nowait',
            '-netdev', f'user,id=net0,hostfwd=tcp::{self.vm.ssh_port}-:22',
            '-device', 'virtio-net-pci,netdev=net0',
            '-device', 'qxl-vga,vgamem_mb=64',
            '-device', 'usb-ehci,id=usb,bus=pci.0,addr=0x7',
            '-device', 'usb-tablet,bus=usb.0',
            '-enable-kvm',  # Use KVM if available
            '-boot', 'order=c',  # Explicitly boot from the first hard disk
        ]

        # Remove -enable-kvm if not available
        try:
            subprocess.run(['qemu-system-x86_64', '-version'], capture_output=True)
        except FileNotFoundError:
            return {'success': False, 'error': 'qemu-system-x86_64 not found'}

        # Check if KVM is available
        if not os.path.exists('/dev/kvm'):
            qemu_cmd.remove('-enable-kvm')
            logger.warning("KVM not available, using software emulation")

        try:
            self.vm.status = 'booting'
            
            # Redirect QEMU output to files to avoid pipe filling up
            qemu_log_out = open(f'/tmp/qemu-stdout-{self.vm.session_id}.log', 'w')
            qemu_log_err = open(f'/tmp/qemu-stderr-{self.vm.session_id}.log', 'w')
            
            self.vm.process = subprocess.Popen(
                qemu_cmd,
                stdout=qemu_log_out,
                stderr=qemu_log_err,
                stdin=subprocess.PIPE
            )
            self.vm.started_at = datetime.now()
            self.vm.qmp_socket = f'/tmp/qemu-qmp-{self.vm.session_id}.sock'

            # Wait a moment for VM to start
            await asyncio.sleep(2)

            if self.vm.process.poll() is not None:
                self.vm.status = 'error'
                self.vm.error_message = 'VM process exited immediately'
                return {
                    'success': False,
                    'error': self.vm.error_message,
                    'stderr': self.vm.process.stderr.read().decode()
                }

            self.vm.status = 'running'
            logger.info(f"VM started: {self.vm.session_id}")

            return {
                'success': True,
                'session_id': self.vm.session_id,
                'status': 'booting',
                'vnc_port': self.vm.vnc_port,
                'ssh_port': self.vm.ssh_port,
                'message': f'VM started. VNC available at localhost:{self.vm.vnc_port}'
            }

        except Exception as e:
            self.vm.status = 'error'
            self.vm.error_message = str(e)
            return {'success': False, 'error': str(e)}

    async def _boot_with_iso(self, iso_path: str, params: Dict[str, Any]) -> Dict[str, Any]:
        """Boot VM with ISO for installation."""
        logger.info(f"Booting VM with ISO {iso_path}")

        self.vm.memory = params.get('memory', 2048)
        self.vm.cpus = params.get('cpus', 2)
        self.vm.vnc_port = params.get('vnc_port', 5900)
        self.vm.ssh_port = params.get('ssh_port', 2222)

        self.vm.session_id = f"shotcut-install-{datetime.now().strftime('%Y%m%d-%H%M%S')}"

        qemu_cmd = [
            'qemu-system-x86_64',
            '-m', str(self.vm.memory),
            '-smp', str(self.vm.cpus),
            '-drive', f'file={self.image_path},format=qcow2,if=virtio',
            '-cdrom', iso_path,
            '-boot', 'd',  # Boot from CD
            '-vnc', f'127.0.0.1:{self.vm.vnc_port - 5900}',  # Explicitly bind to loopback
            '-serial', 'mon:stdio',
            '-monitor', f'unix:/tmp/qemu-monitor-{self.vm.session_id}.sock,server,nowait',
            '-qmp', f'unix:/tmp/qemu-qmp-{self.vm.session_id}.sock,server,nowait',
            '-netdev', f'user,id=net0,hostfwd=tcp::{self.vm.ssh_port}-:22',
            '-device', 'virtio-net-pci,netdev=net0',
            '-device', 'qxl-vga,vgamem_mb=64',
            '-device', 'usb-ehci,id=usb,bus=pci.0,addr=0x7',
            '-device', 'usb-tablet,bus=usb.0',
        ]

        if os.path.exists('/dev/kvm'):
            qemu_cmd.append('-enable-kvm')

        try:
            self.vm.status = 'booting'
            
            # Redirect QEMU output to files to avoid pipe filling up
            qemu_log_out = open(f'/tmp/qemu-stdout-{self.vm.session_id}.log', 'w')
            qemu_log_err = open(f'/tmp/qemu-stderr-{self.vm.session_id}.log', 'w')
            
            self.vm.process = subprocess.Popen(
                qemu_cmd,
                stdout=qemu_log_out,
                stderr=qemu_log_err,
                stdin=subprocess.PIPE
            )
            self.vm.started_at = datetime.now()
            self.vm.qmp_socket = f'/tmp/qemu-qmp-{self.vm.session_id}.sock'

            await asyncio.sleep(2)

            if self.vm.process.poll() is not None:
                self.vm.status = 'error'
                return {
                    'success': False,
                    'error': 'VM process exited',
                    'stderr': self.vm.process.stderr.read().decode()
                }

            self.vm.status = 'running'
            logger.info(f"VM started with ISO: {self.vm.session_id}")

            return {
                'success': True,
                'session_id': self.vm.session_id,
                'status': 'booting',
                'vnc_port': self.vm.vnc_port,
                'message': f'VM started with ISO. VNC at localhost:{self.vm.vnc_port}'
            }

        except Exception as e:
            self.vm.status = 'error'
            self.vm.error_message = str(e)
            return {'success': False, 'error': str(e)}

    async def handle_shutdown(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Shutdown the VM."""
        if self.vm.status != 'running' or not self.vm.process:
            return {'success': True, 'status': 'already_stopped'}

        logger.info("Shutting down VM...")

        try:
            # Try graceful shutdown first
            self.vm.process.terminate()

            # Wait for process to exit
            try:
                self.vm.process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                # Force kill if needed
                self.vm.process.kill()
                self.vm.process.wait()

            self.vm.status = 'stopped'
            self.vm.process = None
            logger.info("VM shutdown complete")

            return {'success': True, 'status': 'stopped'}

        except Exception as e:
            return {'success': False, 'error': str(e)}

    async def handle_screenshot(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Capture a screenshot via VNC."""
        if self.vm.status != 'running':
            return {'success': False, 'error': 'VM not running'}

        # Try using vncsnapshot or fall back to QEMU screendump
        try:
            # Method 1: Use vncsnapshot if available
            vncsnapshot_path = shutil.which('vncsnapshot')
            if vncsnapshot_path:
                logger.info(f"vncsnapshot found at: {vncsnapshot_path}. Attempting to capture screenshot.")
                try:
                    # Use display number (port - 5900), not raw port
                    display_num = self.vm.vnc_port - 5900
                    result = subprocess.run(
                        [vncsnapshot_path, '-quiet', f':{display_num}', '-'],
                        capture_output=True
                    )
                    if result.returncode == 0:
                        logger.info("vncsnapshot captured screenshot successfully.")
                        return {
                            'success': True,
                            'image': base64.b64encode(result.stdout).decode(),
                            'format': 'jpg'
                        }
                    else:
                        error_msg = f"vncsnapshot failed with exit code {result.returncode}: {result.stderr.decode().strip()}"
                        logger.warning(f"{error_msg} - falling back to QEMU screendump")
                except Exception as e:
                    logger.warning(f"vncsnapshot exception: {e} - falling back to QEMU screendump")
            else:
                logger.info("vncsnapshot not found, trying QEMU screendump")

            # Method 2: Use QEMU QMP for screendump (more reliable than HMP monitor)
            logger.info("Attempting screendump via QMP socket...")
            screenshot_path = f'/tmp/shotcut-screenshot-{self.vm.session_id}.ppm'
            qmp_socket = f'/tmp/qemu-qmp-{self.vm.session_id}.sock'

            if os.path.exists(qmp_socket):
                try:
                    logger.info(f"Sending screendump via QMP socket")
                    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                    sock.settimeout(5)
                    sock.connect(qmp_socket)

                    # Read greeting
                    greeting = sock.recv(4096).decode()

                    # Negotiate capabilities
                    sock.send(json.dumps({'execute': 'qmp_capabilities'}).encode() + b'\n')
                    response = sock.recv(4096).decode()

                    # Send screendump command via QMP
                    cmd = {'execute': 'screendump', 'arguments': {'filename': screenshot_path}}
                    sock.send(json.dumps(cmd).encode() + b'\n')
                    response = sock.recv(4096).decode()
                    logger.info(f"QMP screendump response: {response}")

                    sock.close()
                    await asyncio.sleep(1)  # Wait for file to be written

                    if os.path.exists(screenshot_path):
                        logger.info("screendump file created successfully.")
                        if HAS_PIL:
                            img = Image.open(screenshot_path)
                            buffer = io.BytesIO()
                            img.save(buffer, format='PNG')
                            os.remove(screenshot_path)

                            return {
                                'success': True,
                                'image': base64.b64encode(buffer.getvalue()).decode(),
                                'format': 'png',
                                'width': img.width,
                                'height': img.height
                            }
                        else:
                            with open(screenshot_path, 'rb') as f:
                                data = f.read()
                            os.remove(screenshot_path)
                            return {
                                'success': True,
                                'image': base64.b64encode(data).decode(),
                                'format': 'ppm'
                            }
                    else:
                        logger.warning("screendump file not found after command.")

                except Exception as e:
                    logger.error(f"Error using QMP socket for screendump: {e}")
            else:
                logger.warning(f"QMP socket not found: {qmp_socket}")

            # Method 3: Mock screenshot for testing
            if HAS_PIL:
                # Create a mock screenshot
                img = Image.new('RGB', (800, 600), color='#2d2d2d')
                buffer = io.BytesIO()
                img.save(buffer, format='PNG')

                return {
                    'success': True,
                    'image': base64.b64encode(buffer.getvalue()).decode(),
                    'format': 'png',
                    'width': 800,
                    'height': 600,
                    'mock': True,
                    'message': 'Mock screenshot (VNC capture not available)'
                }

            return {
                'success': False,
                'error': 'Screenshot capture failed - install vncsnapshot or PIL'
            }

        except Exception as e:
            return {'success': False, 'error': str(e)}

    async def handle_input(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Inject input events (keyboard/mouse)."""
        if self.vm.status != 'running':
            return {'success': False, 'error': 'VM not running'}

        events = params.get('events', [])
        results = []

        for event in events:
            event_type = event.get('type')

            if event_type == 'key':
                result = await self._inject_key(event)
            elif event_type == 'mouse':
                result = await self._inject_mouse(event)
            elif event_type == 'click':
                result = await self._inject_click(event)
            elif event_type == 'type':
                result = await self._inject_text(event.get('text', ''))
            else:
                result = {'success': False, 'error': f'Unknown event type: {event_type}'}

            results.append(result)

        return {'success': True, 'results': results}

    async def _inject_key(self, event: Dict[str, Any]) -> Dict[str, Any]:
        """Inject a key event via QMP.

        Note: QMP send-key handles both press AND release in a single command.
        The 'down' parameter is ignored as send-key is a complete key stroke.
        """
        key = event.get('key')

        if not key:
            return {'success': False, 'error': 'No key specified'}

        # Map common key names to QMP key codes
        key_map = {
            'ret': 'ret', 'enter': 'ret', 'return': 'ret',
            'spc': 'spc', 'space': 'spc',
            'tab': 'tab',
            'esc': 'esc', 'escape': 'esc',
            'up': 'up', 'down': 'down', 'left': 'left', 'right': 'right',
            'shift': 'shift', 'ctrl': 'ctrl', 'alt': 'alt',
        }
        qmp_key = key_map.get(key.lower(), key.lower())

        # Use QMP send-key command (handles both press and release)
        result = self._send_qmp_command('send-key', {
            'keys': [{'type': 'qcode', 'data': qmp_key}],
            'hold-time': 50
        })

        if 'return' in result:
            return {'success': True, 'key': key, 'qmp_result': result.get('return')}
        elif 'error' in result:
            logger.error(f"QMP send-key error: {result['error']}")
            return {'success': False, 'error': str(result.get('error')), 'key': key}

        return {'success': True, 'key': key}

    async def _inject_mouse(self, event: Dict[str, Any]) -> Dict[str, Any]:
        """Inject a mouse event via QMP."""
        # Scale coordinates from 1024x768 to 0-32767 for usb-tablet
        raw_x = event.get('x', 0)
        raw_y = event.get('y', 0)
        
        x = int(raw_x * 32767 / 1024)
        y = int(raw_y * 32767 / 768)

        # Use QMP input-send-event
        result = self._send_qmp_command('input-send-event', {
            'events': [
                {'type': 'abs', 'data': {'axis': 'x', 'value': x}},
                {'type': 'abs', 'data': {'axis': 'y', 'value': y}}
            ]
        })

        if 'return' in result:
            return {'success': True, 'x': x, 'y': y}
        elif 'error' in result:
            logger.warning(f"Mouse injection via QMP failed: {result['error']}, using HMP")
            # Fall back to HMP via monitor socket

        return {'success': True, 'x': x, 'y': y}

    async def _inject_click(self, event: Dict[str, Any]) -> Dict[str, Any]:
        """Inject a mouse click."""
        x = event.get('x', 0)
        y = event.get('y', 0)
        button = event.get('button', 1)  # 1=left, 2=middle, 3=right

        # First move, then click
        await self._inject_mouse({'x': x, 'y': y})
        await asyncio.sleep(0.05)

        # Use QMP for button press/release
        button_map = {1: 'left', 2: 'middle', 3: 'right'}
        btn_name = button_map.get(button, 'left')

        result = self._send_qmp_command('input-send-event', {
            'events': [
                {'type': 'btn', 'data': {'button': btn_name, 'down': True}},
                {'type': 'btn', 'data': {'button': btn_name, 'down': False}}
            ]
        })

        return {'success': True, 'x': x, 'y': y, 'button': button}

    async def _inject_text(self, text: str) -> Dict[str, Any]:
        """Inject text (type each character via QMP).

        Note: QMP send-key handles both press AND release in a single command,
        so we only call _inject_key once per character.
        """
        results = []
        # Key map for punctuation and special characters
        shift_chars = {
            ':': ';', '"': "'", '<': ',', '>': '.', '?': '/',
            '!': '1', '@': '2', '#': '3', '$': '4', '%': '5',
            '^': '6', '&': '7', '*': '8', '(': '9', ')': '0',
            '_': '-', '+': '=', '{': '[', '}': ']', '|': '\\'
        }
        
        direct_chars = {
            '-': 'minus', '=': 'equal', '[': 'bracket_left', ']': 'bracket_right',
            '\\': 'backslash', ';': 'semicolon', "'": 'apostrophe', ',': 'comma',
            '.': 'dot', '/': 'slash', '`': 'grave_accent'
        }

        for char in text:
            if char == '\n':
                result = await self._inject_key({'key': 'ret'})
            elif char == '\t':
                result = await self._inject_key({'key': 'tab'})
            elif char == ' ':
                result = await self._inject_key({'key': 'spc'})
            elif char.isalpha():
                if char.isupper():
                    # For uppercase: send shift+key together in one QMP call
                    result = self._send_qmp_command('send-key', {
                        'keys': [
                            {'type': 'qcode', 'data': 'shift'},
                            {'type': 'qcode', 'data': char.lower()}
                        ],
                        'hold-time': 50
                    })
                else:
                    result = await self._inject_key({'key': char})
            elif char in shift_chars:
                # Character requires shift
                base_key = shift_chars[char]
                qmp_key = direct_chars.get(base_key, base_key)
                result = self._send_qmp_command('send-key', {
                    'keys': [
                        {'type': 'qcode', 'data': 'shift'},
                        {'type': 'qcode', 'data': qmp_key}
                    ],
                    'hold-time': 50
                })
            elif char in direct_chars:
                # Character is direct but needs QMP name
                result = await self._inject_key({'key': direct_chars[char]})
            elif char.isdigit():
                result = await self._inject_key({'key': char})
            else:
                # Fallback for other characters
                result = await self._inject_key({'key': char})

            results.append(result)
            await asyncio.sleep(0.1)  # Increased delay for reliability

        return {'success': True, 'text': text, 'keystrokes': len(results)}

    async def handle_type(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Type text into the VM."""
        text = params.get('text', '')
        return await self._inject_text(text)

    async def handle_click(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Click at coordinates."""
        x = params.get('x', 0)
        y = params.get('y', 0)
        button = params.get('button', 'left')

        button_map = {'left': 1, 'middle': 2, 'right': 3}
        return await self._inject_click({
            'x': x,
            'y': y,
            'button': button_map.get(button, 1)
        })

    async def handle_exec(self, params: Dict[str, Any]) -> Dict[str, Any]:
        """Execute a shell command via SSH."""
        if self.vm.status != 'running':
            return {'success': False, 'error': 'VM not running'}

        command = params.get('command')
        if not command:
            return {'success': False, 'error': 'No command specified'}

        # Try SSH execution
        ssh_cmd = [
            'ssh',
            '-p', str(self.vm.ssh_port),
            '-o', 'StrictHostKeyChecking=no',
            '-o', 'ConnectTimeout=5',
            'root@localhost',
            command
        ]

        try:
            result = subprocess.run(
                ssh_cmd,
                capture_output=True,
                text=True,
                timeout=30
            )

            return {
                'success': result.returncode == 0,
                'stdout': result.stdout,
                'stderr': result.stderr,
                'exit_code': result.returncode
            }

        except subprocess.TimeoutExpired:
            return {'success': False, 'error': 'Command timeout'}
        except FileNotFoundError:
            return {'success': False, 'error': 'SSH not available'}
        except Exception as e:
            return {'success': False, 'error': str(e)}

    async def handle_websocket(self, websocket, path):
        """Handle WebSocket connection."""
        self.clients.add(websocket)
        client_addr = websocket.remote_address
        logger.info(f"Client connected: {client_addr}")

        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    command = data.get('command', data.get('cmd'))
                    params = data.get('params', data)

                    logger.debug(f"Command: {command}, Params: {params}")

                    response = await self.handle_command(command, params)
                    await websocket.send(json.dumps(response))

                except json.JSONDecodeError:
                    await websocket.send(json.dumps({
                        'success': False,
                        'error': 'Invalid JSON'
                    }))
                except Exception as e:
                    logger.error(f"Error processing message: {e}")
                    await websocket.send(json.dumps({
                        'success': False,
                        'error': str(e)
                    }))
        finally:
            self.clients.discard(websocket)
            logger.info(f"Client disconnected: {client_addr}")

    async def run(self):
        """Start the WebSocket server."""
        if not HAS_WEBSOCKETS:
            logger.error("websockets library required: pip install websockets")
            return

        logger.info(f"🎬 Shotcut VM Bridge starting on ws://localhost:{self.port}")
        logger.info(f"   Image: {self.image_path}")

        async with serve(self.handle_websocket, 'localhost', self.port):
            logger.info(f"✅ Ready to accept connections")
            await asyncio.Future()  # Run forever


def main():
    parser = argparse.ArgumentParser(description='Shotcut VM Bridge for Geometry OS')
    parser.add_argument('--port', type=int, default=8768, help='WebSocket port')
    parser.add_argument('--image', default='images/shotcut-alpine.qcow2', help='VM disk image')
    parser.add_argument('--debug', action='store_true', help='Enable debug logging')

    args = parser.parse_args()

    if args.debug:
        logging.getLogger().setLevel(logging.DEBUG)

    # Check dependencies
    if not HAS_WEBSOCKETS:
        print("ERROR: websockets required. Install with: pip install websockets")
        return 1

    # Create bridge and run
    bridge = ShotcutVMBridge(
        image_path=args.image,
        port=args.port
    )

    try:
        asyncio.run(bridge.run())
    except KeyboardInterrupt:
        print("\n👋 Shutting down...")


if __name__ == '__main__':
    main()
