#!/usr/bin/env python3
"""
geo_watch.py -- File watcher for Geometry OS edit-run-visualize cycle.

Usage:
    python3 scripts/geo_watch.py programs/fire.asm
    python3 scripts/geo_watch.py programs/snake.asm --socket /tmp/geo_cmd.sock

Watches an .asm file for changes. On every save:
  1. Sends the source to GeOS via Unix socket (load_source)
  2. Triggers assembly (assemble)
  3. Starts execution (run)

Works with the built-in watch command too:
    echo "watch programs/fire.asm" | socat - UNIX-CONNECT:/tmp/geo_cmd.sock

Requires: GeOS running with /tmp/geo_cmd.sock active
Optional: watchdog Python package (falls back to polling)
"""

import argparse
import os
import socket
import sys
import time


SOCK_PATH = "/tmp/geo_cmd.sock"
POLL_INTERVAL = 0.3  # seconds between mtime checks


def send_command(sock_path: str, command: str) -> str:
    """Send a command to GeOS via Unix socket and return the response."""
    try:
        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        sock.connect(sock_path)
        sock.sendall((command + "\n").encode())
        sock.shutdown(socket.SHUT_WR)
        response = b""
        while True:
            chunk = sock.recv(4096)
            if not chunk:
                break
            response += chunk
        sock.close()
        return response.decode(errors="replace").strip()
    except FileNotFoundError:
        print(f"[error] GeOS socket not found at {sock_path}", file=sys.stderr)
        print("[hint] Start GeOS first: cargo run --release", file=sys.stderr)
        sys.exit(1)
    except ConnectionRefusedError:
        print(f"[error] Connection refused to {sock_path}", file=sys.stderr)
        print("[hint] GeOS may not be running", file=sys.stderr)
        sys.exit(1)


def load_and_run(sock_path: str, filepath: str) -> bool:
    """Load source, assemble, and run. Returns True on success."""
    # Read the file
    try:
        with open(filepath, "r") as f:
            source = f.read()
    except IOError as e:
        print(f"[error] Cannot read {filepath}: {e}", file=sys.stderr)
        return False

    # Escape newlines for socket protocol
    escaped = source.replace("\n", "\\n")

    # Send load_source command (bulk load)
    cmd = f"load_source {escaped}"
    resp = send_command(sock_path, cmd)
    if resp and "error" in resp.lower():
        print(f"[load] {resp}", file=sys.stderr)
        return False

    # Assemble
    resp = send_command(sock_path, "assemble")
    print(f"[assemble] {resp}")
    if resp and "error" in resp.lower():
        return False

    # Run
    resp = send_command(sock_path, "run")
    print(f"[run] {resp}")
    return True


def watch_via_socket(sock_path: str, filepath: str):
    """Use GeOS's built-in watch command (preferred -- zero-latency)."""
    abs_path = os.path.abspath(filepath)
    resp = send_command(sock_path, f"watch {abs_path}")
    print(resp)
    if "watching" not in resp.lower() and "ok" not in resp.lower():
        print(f"[error] Failed to start watch: {resp}", file=sys.stderr)
        sys.exit(1)
    print(f"[watching] {filepath} -- save in your editor to see changes live")
    print("[press Ctrl+C to stop]")
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n[stopping]")
        send_command(sock_path, "unwatch")


def watch_via_polling(sock_path: str, filepath: str):
    """Fallback: poll file mtime and send commands on change."""
    abs_path = os.path.abspath(filepath)
    last_mtime = None

    # Initial load
    print(f"[initial load] {filepath}")
    load_and_run(sock_path, abs_path)

    try:
        last_mtime = os.path.getmtime(abs_path)
    except OSError:
        pass

    print(f"[watching] {filepath} -- save in your editor to see changes live")
    print("[press Ctrl+C to stop]")

    try:
        while True:
            time.sleep(POLL_INTERVAL)
            try:
                current_mtime = os.path.getmtime(abs_path)
            except OSError:
                continue

            if last_mtime is not None and current_mtime > last_mtime:
                print(f"\n[change detected] {filepath}")
                load_and_run(sock_path, abs_path)
                last_mtime = current_mtime
    except KeyboardInterrupt:
        print("\n[stopping]")


def main():
    parser = argparse.ArgumentParser(
        description="Watch an .asm file and auto-execute in Geometry OS"
    )
    parser.add_argument("file", help="Path to .asm file to watch")
    parser.add_argument(
        "--socket",
        default=SOCK_PATH,
        help=f"Unix socket path (default: {SOCK_PATH})",
    )
    parser.add_argument(
        "--poll",
        action="store_true",
        help="Use polling instead of GeOS built-in watch (slower but works without watch command)",
    )
    args = parser.parse_args()

    filepath = os.path.abspath(args.file)
    if not os.path.exists(filepath):
        print(f"[error] File not found: {filepath}", file=sys.stderr)
        sys.exit(1)

    # Check if socket is available
    if not os.path.exists(args.socket):
        print(f"[error] GeOS socket not found at {args.socket}", file=sys.stderr)
        print("[hint] Start GeOS first: cargo run --release", file=sys.stderr)
        sys.exit(1)

    if args.poll:
        watch_via_polling(args.socket, filepath)
    else:
        # Try built-in watch first, fall back to polling
        try:
            watch_via_socket(args.socket, filepath)
        except Exception:
            print(
                "[fallback] Built-in watch not available, using polling",
                file=sys.stderr,
            )
            watch_via_polling(args.socket, filepath)


if __name__ == "__main__":
    main()
