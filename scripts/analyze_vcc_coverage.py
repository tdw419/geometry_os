#!/usr/bin/env python3
"""
Analyze VCC trace data to estimate pipe2 coverage impact.
"""

import json
import sys
from pathlib import Path
from collections import Counter

def main():
    trace_dir = Path(__file__).parent.parent / "traces/parsed"

    if not trace_dir.exists():
        print(f"❌ Trace directory not found: {trace_dir}")
        return False

    syscall_counter = Counter()
    total_syscalls = 0

    for trace_file in trace_dir.glob("*.json"):
        try:
            with open(trace_file) as f:
                data = json.load(f)

            if "syscalls" in data:
                for syscall_entry in data["syscalls"]:
                    # Syscall info is nested under 'syscall' key
                    syscall_info = syscall_entry.get("syscall", {})
                    syscall_name = syscall_info.get("name", "unknown")
                    syscall_counter[syscall_name] += 1
                    total_syscalls += 1
        except Exception as e:
            print(f"Error reading {trace_file}: {e}")
            continue

    print(f"Total syscalls in traces: {total_syscalls}")
    print(f"\nTop 20 syscalls by frequency:")
    print("-" * 50)

    for syscall, count in syscall_counter.most_common(20):
        percentage = (count / total_syscalls) * 100
        status = "✓" if syscall in ["pipe", "pipe2", "read", "write", "fork", "close", "openat", "exit", "execve", "getdents", "fstatat", "fstat", "unlink", "brk", "mmap", "munmap", "getpid", "rmdir", "wait"] else "✗"
        print(f"{status} {syscall:20s}: {count:4d} ({percentage:5.2f}%)")

    # Count pixel-native syscalls
    pixel_native_syscalls = ["pipe", "pipe2", "read", "write", "fork", "close", "openat", "exit", "execve", "getdents", "fstatat", "fstat", "unlink", "brk", "mmap", "munmap", "getpid", "rmdir", "wait"]
    pixel_native_count = sum(count for syscall, count in syscall_counter.items() if syscall in pixel_native_syscalls)

    print("-" * 50)
    print(f"Pixel-native coverage: {pixel_native_count}/{total_syscalls} ({pixel_native_count/total_syscalls*100:.1f}%)")

    # Specific pipe stats
    pipe_calls = syscall_counter.get("pipe", 0) + syscall_counter.get("pipe2", 0)
    print(f"\nPipe/pipe2 calls: {pipe_calls} (now covered)")

    return True

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)