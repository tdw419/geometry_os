#!/usr/bin/env python3
"""
Parse xv6 syscall traces into structured JSON for AI training.
Extracts ECALL_U → SRET pairs with full register state and PC addresses.
"""

import re
import json
from pathlib import Path
from typing import List, Dict, Optional, Tuple

# Syscall number to name mapping (Linux syscall table for rv32imac)
SYSCALL_NAMES = {
    1: "exit",
    2: "fork",
    3: "read",
    4: "write",
    5: "fstat",
    6: "open",
    7: "close",
    8: "pipe",
    9: "times",
    10: "execve",
    11: "getpid",
    12: "wait",
    13: "brk",
    14: "sbrk",
    15: "openat",
    16: "write",
    17: "link",
    18: "unlink",
    19: "mkdir",
    20: "rmdir",
    21: "unlink",  # Also used for unlink
    22: "lseek",
    23: "getuid",
    24: "getgid",
    25: "geteuid",
    26: "getegid",
}

# Syscall semantic analysis (what each syscall does)
SYSCALL_SEMANTICS = {
    "exit": {
        "description": "Terminate current process",
        "args": ["exit_code"],
        "returns": "never",
        "memory_ops": ["process_table_cleanup", "fd_table_cleanup"],
        "spatial_ops": ["free_user_memory"],
    },
    "fork": {
        "description": "Create child process (copy parent)",
        "args": [],
        "returns": "child_pid_to_parent_0_to_child",
        "memory_ops": ["copy_user_memory", "allocate_process_table_entry", "copy_fd_table"],
        "spatial_ops": ["duplicate_hilbert_regions", "allocate_process_pixels"],
    },
    "read": {
        "description": "Read from file descriptor",
        "args": ["fd", "buffer", "count"],
        "returns": "bytes_read_or_error",
        "memory_ops": ["buffer_copy_from_kernel", "block_cache_read"],
        "spatial_ops": ["copy_pixels_from_block_region"],
    },
    "write": {
        "description": "Write to file descriptor",
        "args": ["fd", "buffer", "count"],
        "returns": "bytes_written_or_error",
        "memory_ops": ["buffer_copy_to_kernel", "console_write", "block_cache_write"],
        "spatial_ops": ["copy_pixels_to_console", "copy_pixels_to_block_region"],
    },
    "close": {
        "description": "Close file descriptor",
        "args": ["fd"],
        "returns": "0_or_error",
        "memory_ops": ["fd_table_cleanup", "file_handle_release"],
        "spatial_ops": ["free_fd_table_pixels"],
    },
    "openat": {
        "description": "Open file at directory fd + path",
        "args": ["dirfd", "pathname", "flags", "mode"],
        "returns": "fd_or_error",
        "memory_ops": ["namei_path_resolution", "inode_load", "fd_table_alloc"],
        "spatial_ops": ["traverse_directory_hilbert_tree", "load_inode_pixels"],
    },
    "unlink": {
        "description": "Delete file",
        "args": ["pathname"],
        "returns": "0_or_error",
        "memory_ops": ["namei_path_resolution", "inode_free", "block_free"],
        "spatial_ops": ["free_inode_pixels", "free_block_pixels"],
    },
    "wait": {
        "description": "Wait for child process",
        "args": ["status"],
        "returns": "child_pid_or_error",
        "memory_ops": ["process_table_scan", "reap_zombie"],
        "spatial_ops": ["scan_process_table_pixels", "free_zombie_pixels"],
    },
    "fstat": {
        "description": "Get file status",
        "args": ["fd", "statbuf"],
        "returns": "0_or_error",
        "memory_ops": ["fd_lookup", "inode_read", "statbuf_fill"],
        "spatial_ops": ["read_inode_pixels", "write_stat_pixels"],
    },
    "pipe": {
        "description": "Create pipe",
        "args": ["pipefds"],
        "returns": "0_or_error",
        "memory_ops": ["allocate_pipe_buffer", "fd_table_alloc_2"],
        "spatial_ops": ["allocate_pipe_buffer_pixels"],
    },
}


class SyscallParser:
    """Parse xv6 syscall traces from log files."""

    def __init__(self, log_path: str):
        self.log_path = Path(log_path)
        self.syscalls: List[Dict] = []

    def parse(self) -> List[Dict]:
        """Parse log file and extract ECALL_U → SRET pairs."""
        if not self.log_path.exists():
            raise FileNotFoundError(f"Log file not found: {self.log_path}")

        content = self.log_path.read_text()

        # Find all ECALL_U → SRET pairs
        pairs = self._extract_pairs(content)

        for ecall, sret in pairs:
            syscall = self._parse_pair(ecall, sret)
            self.syscalls.append(syscall)

        return self.syscalls

    def _extract_pairs(self, content: str) -> List[Tuple[str, str]]:
        """Extract paired ECALL_U and SRET lines."""
        lines = content.split('\n')
        pairs = []
        pending_ecall: Optional[Dict] = None

        for line in lines:
            if 'ECALL_U delegated to S-mode' in line:
                if pending_ecall:
                    # Unpaired ECALL (shouldn't happen in normal execution)
                    pass
                pending_ecall = line
            elif 'SRET to U-mode' in line and pending_ecall:
                pairs.append((pending_ecall, line))
                pending_ecall = None

        return pairs

    def _parse_pair(self, ecall: str, sret: str) -> Dict:
        """Parse a single ECALL_U → SRET pair into structured data."""
        # Parse ECALL_U line
        ecall_match = re.search(
            r'syscall_num=(\d+),\s*'
            r'a0=0x([0-9A-Fa-f]+),\s*'
            r'a1=0x([0-9A-Fa-f]+),\s*'
            r'a2=0x([0-9A-Fa-f]+),\s*'
            r'a3=0x([0-9A-Fa-f]+),\s*'
            r'a4=0x([0-9A-Fa-f]+),\s*'
            r'a5=0x([0-9A-Fa-f]+),\s*'
            r'PC=0x([0-9A-Fa-f]+)',
            ecall
        )

        # Parse SRET line
        sret_match = re.search(
            r'SRET to U-mode: a0=0x([0-9A-Fa-f]+)\s+\([^)]+\),\s*PC=0x([0-9A-Fa-f]+)',
            sret
        )

        if not ecall_match or not sret_match:
            raise ValueError(f"Failed to parse syscall pair: {ecall[:50]}")

        syscall_num = int(ecall_match.group(1))
        syscall_name = SYSCALL_NAMES.get(syscall_num, f"unknown_{syscall_num}")

        # Build structured syscall record
        syscall = {
            "syscall": {
                "number": syscall_num,
                "name": syscall_name,
                "description": SYSCALL_SEMANTICS.get(syscall_name, {}).get("description", ""),
            },
            "arguments": {
                "a0": int(ecall_match.group(2), 16),
                "a1": int(ecall_match.group(3), 16),
                "a2": int(ecall_match.group(4), 16),
                "a3": int(ecall_match.group(5), 16),
                "a4": int(ecall_match.group(6), 16),
                "a5": int(ecall_match.group(7), 16),
            },
            "return_value": int(sret_match.group(1), 16),
            "program_counter": {
                "ecall_entry": int(ecall_match.group(8), 16),
                "sret_return": int(sret_match.group(2), 16),
            },
            "semantics": SYSCALL_SEMANTICS.get(syscall_name, {}),
        }

        # Add semantic analysis based on syscall type
        self._add_semantic_analysis(syscall)

        return syscall

    def _add_semantic_analysis(self, syscall: Dict):
        """Add semantic analysis based on syscall type."""
        name = syscall["syscall"]["name"]
        args = syscall["arguments"]
        ret = syscall["return_value"]

        if name == "write":
            # Analyze write syscall
            fd = args["a0"]
            buffer = args["a1"]
            count = args["a2"]

            syscall["write_analysis"] = {
                "fd": fd,
                "is_stdout": fd == 1,
                "is_stderr": fd == 2,
                "buffer_address": buffer,
                "buffer_size": count,
                "bytes_written": ret if ret >= 0 else 0,
                "write_failed": ret < 0,
            }

        elif name == "read":
            # Analyze read syscall
            fd = args["a0"]
            buffer = args["a1"]
            count = args["a2"]

            syscall["read_analysis"] = {
                "fd": fd,
                "buffer_address": buffer,
                "buffer_size": count,
                "bytes_read": ret if ret >= 0 else 0,
                "read_failed": ret < 0,
                "eof_reached": ret == 0,
            }

        elif name == "fork":
            # Analyze fork syscall
            syscall["fork_analysis"] = {
                "child_pid": ret,
                "is_child": ret == 0,
                "is_parent": ret > 0,
                "fork_failed": ret < 0,
            }

        elif name == "openat":
            # Analyze openat syscall
            dirfd = args["a0"]
            pathname_addr = args["a1"]
            flags = args["a2"]
            mode = args["a3"]

            syscall["openat_analysis"] = {
                "dirfd": dirfd,
                "pathname_address": pathname_addr,
                "flags": flags,
                "mode": mode,
                "fd_returned": ret if ret >= 0 else -1,
                "open_failed": ret < 0,
            }

        elif name == "close":
            # Analyze close syscall
            fd = args["a0"]

            syscall["close_analysis"] = {
                "fd_closed": fd,
                "close_failed": ret != 0,
            }

        elif name == "unlink":
            # Analyze unlink syscall
            pathname_addr = args["a0"]

            syscall["unlink_analysis"] = {
                "pathname_address": pathname_addr,
                "unlink_failed": ret != 0,
            }

        elif name == "wait":
            # Analyze wait syscall
            status_addr = args["a0"]

            syscall["wait_analysis"] = {
                "status_address": status_addr,
                "child_pid": ret,
                "child_exited": ret > 0,
                "no_child": ret < 0,
            }


def main():
    """Main entry point."""
    import sys

    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <log_file> <output_json>", file=sys.stderr)
        sys.exit(1)

    log_file = sys.argv[1]
    output_file = sys.argv[2]

    # Parse syscalls
    parser = SyscallParser(log_file)
    syscalls = parser.parse()

    # Generate statistics
    stats = {
        "total_syscalls": len(syscalls),
        "syscall_counts": {},
        "unique_syscalls": len(set(s["syscall"]["name"] for s in syscalls)),
    }

    for syscall in syscalls:
        name = syscall["syscall"]["name"]
        stats["syscall_counts"][name] = stats["syscall_counts"].get(name, 0) + 1

    # Build output structure
    output = {
        "metadata": {
            "source_log": log_file,
            "total_pairs": len(syscalls),
            "unique_syscalls": stats["unique_syscalls"],
        },
        "statistics": stats,
        "syscalls": syscalls,
    }

    # Write JSON output
    Path(output_file).write_text(json.dumps(output, indent=2), encoding='utf-8')

    print(f"✓ Parsed {len(syscalls)} syscall pairs", file=sys.stderr)
    print(f"✓ Found {stats['unique_syscalls']} unique syscall types", file=sys.stderr)
    print(f"✓ Output written to {output_file}", file=sys.stderr)
    print(file=sys.stderr)
    print("Top syscalls:", file=sys.stderr)
    for name, count in sorted(stats["syscall_counts"].items(), key=lambda x: -x[1])[:10]:
        print(f"  {name}: {count}", file=sys.stderr)


if __name__ == "__main__":
    main()