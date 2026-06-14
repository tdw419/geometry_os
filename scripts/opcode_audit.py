#!/usr/bin/env python3
"""
Opcode Audit Script for Geometry OS v2
Compares assembler mnemonic->opcode mappings against VM opcode dispatch.

Usage: python3 scripts/opcode_audit.py [--verbose]
"""
import re, os, sys
from collections import defaultdict

PROJECT_DIR = os.path.expanduser("~/zion/projects/geometry_os/geometry_os")
ASM_DIR = os.path.join(PROJECT_DIR, "src/assembler")
VM_DIR = os.path.join(PROJECT_DIR, "src/vm")

verbose = "--verbose" in sys.argv

# ============================================================
# STEP 1: Extract assembler mnemonic -> opcode number
# ============================================================
asm_opcodes = {}  # mnemonic -> (opcode_num, file, line_number)

def extract_asm_opcodes():
    files = ['core_ops.rs', 'graphics_ops.rs', 'immediate_ops.rs', 'system_ops.rs', 'formula_ops.rs']
    
    for fname in files:
        filepath = os.path.join(ASM_DIR, fname)
        if not os.path.exists(filepath):
            continue
        with open(filepath) as f:
            lines = f.readlines()
        
        i = 0
        while i < len(lines):
            line = lines[i]
            
            # Pattern B: Multi-mnemonic arm with sub-match
            multi_m = re.match(r'\s*("(?:[A-Z][A-Z0-9_]*)"(?:\s*\|\s*"[A-Z][A-Z0-9_]*")*)\s*=>\s*\{', line)
            if multi_m:
                mnemonics = re.findall(r'"([A-Z][A-Z0-9_]*)"', multi_m.group(0))
                j = i + 1
                depth = 1
                while j < len(lines) and depth > 0:
                    sub_line = lines[j]
                    depth += sub_line.count('{') - sub_line.count('}')
                    # Sub-match: "MNEM" => 0xNN,
                    for m in re.finditer(r'"([A-Z][A-Z0-9_]*)"\s*=>\s*(0x[0-9A-Fa-f]+)\s*,', sub_line):
                        mnem = m.group(1)
                        num = int(m.group(2), 16)
                        if mnem not in asm_opcodes:
                            asm_opcodes[mnem] = (num, fname, i+1)
                    # Also bytecode.push for single-mnemonic blocks
                    if len(mnemonics) == 1:
                        push_m = re.search(r'bytecode\.push\((0x[0-9A-Fa-f]+)\)', sub_line)
                        if push_m and mnemonics[0] not in asm_opcodes:
                            asm_opcodes[mnemonics[0]] = (int(push_m.group(1), 16), fname, i+1)
                    j += 1
                i = j
                continue
            
            # Pattern A: Single mnemonic
            single_m = re.match(r'\s*"([A-Z][A-Z0-9_]*)"\s*=>\s*\{', line)
            if single_m:
                mnem = single_m.group(1)
                j = i + 1
                depth = 1
                found = False
                while j < len(lines) and depth > 0:
                    sub_line = lines[j]
                    depth += sub_line.count('{') - sub_line.count('}')
                    if not found:
                        push_m = re.search(r'bytecode\.push\((0x[0-9A-Fa-f]+)\)', sub_line)
                        if push_m:
                            num = int(push_m.group(1), 16)
                            if mnem not in asm_opcodes:
                                asm_opcodes[mnem] = (num, fname, i+1)
                            found = True
                        # Sub-match inside single
                        for m in re.finditer(r'"([A-Z][A-Z0-9_]*)"\s*=>\s*(0x[0-9A-Fa-f]+)\s*,', sub_line):
                            sub_mnem = m.group(1)
                            sub_num = int(m.group(2), 16)
                            if sub_mnem not in asm_opcodes:
                                asm_opcodes[sub_mnem] = (sub_num, fname, i+1)
                    j += 1
                i = j
                continue
            
            i += 1

extract_asm_opcodes()

# ============================================================
# STEP 2: Extract VM opcode numbers (careful filtering)
# ============================================================
vm_opcodes = set()

def extract_vm_opcodes_careful(filepath):
    """Extract opcode numbers from VM dispatch, ignoring non-dispatch patterns."""
    ops = set()
    with open(filepath) as f:
        for line in f:
            stripped = line.strip()
            
            # Skip lines that are clearly not opcode dispatch:
            # - Character range checks like 0x20..=0x7E (printable ASCII)
            # - Lines inside strings/comments
            if 'out.push' in line or 'b as char' in line:
                continue
            if '..=' in line and '0x20' in line and '0x7E' in line:
                continue
            
            # Individual: 0xNN => (must be at reasonable indent for dispatch)
            # Only match if the line looks like a match arm in a dispatch
            # Match dispatch arms: 0xNN => { ... or 0xNN => self.method()
            if re.match(r'\s+0x[0-9A-Fa-f]{2}\s*=>', line) and '..=' not in line:
                m = re.match(r'\s+(0x[0-9A-Fa-f]{2})\s*=>', line)
                if m:
                    ops.add(int(m.group(1), 16))
            
            # Ranges: 0xNN..=0xMM => (only for opcode ranges, not char ranges)
            for m in re.finditer(r'(0x[0-9A-Fa-f]{2})\.\.=(0x[0-9A-Fa-f]{2})\s*=>', line):
                start, end = int(m.group(1), 16), int(m.group(2), 16)
                # Sanity check: opcode ranges should be < 0x100
                if start < 0x100 and end < 0x100 and end - start < 64:
                    for n in range(start, end + 1):
                        ops.add(n)
    return ops

# Main VM file
vm_main = os.path.join(VM_DIR, "mod.rs")
if os.path.exists(vm_main):
    vm_opcodes |= extract_vm_opcodes_careful(vm_main)

# ops_*.rs files (but NOT ops_pty.rs for range extraction)
if os.path.isdir(VM_DIR):
    for fname in sorted(os.listdir(VM_DIR)):
        if fname.startswith('ops_') and fname.endswith('.rs'):
            fpath = os.path.join(VM_DIR, fname)
            if 'pty' not in fname:  # pty.rs has char ranges, not opcode ranges
                vm_opcodes |= extract_vm_opcodes_careful(fpath)
            else:
                # For pty, only extract individual opcodes (not char ranges)
                with open(fpath) as f:
                    for line in f:
                        if re.match(r'\s+0x[0-9A-Fa-f]{2}\s*=>', line) and '..=' not in line:
                            m = re.match(r'\s+(0x[0-9A-Fa-f]{2})\s*=>', line)
                            if m:
                                vm_opcodes.add(int(m.group(1), 16))

# Also check disasm.rs for complete picture
disasm_path = os.path.join(VM_DIR, "disasm.rs")
disasm_opcodes = set()
if os.path.exists(disasm_path):
    disasm_opcodes = extract_vm_opcodes_careful(disasm_path)

# ============================================================
# STEP 3: Build reverse maps and analyze
# ============================================================
asm_num_to_mnems = defaultdict(list)
for mnem, (num, f, ln) in asm_opcodes.items():
    asm_num_to_mnems[num].append(mnem)
asm_nums = set(asm_num_to_mnems.keys())

# ============================================================
# STEP 4: Report
# ============================================================
print("=" * 78)
print("GEOMETRY OS OPCODE AUDIT REPORT")
print("=" * 78)
print(f"\nAssembler mnemonics:       {len(asm_opcodes)}")
print(f"Assembler opcode numbers:  {len(asm_nums)}")
print(f"VM opcode numbers:         {len(vm_opcodes)}")
print(f"Disasm opcode numbers:     {len(disasm_opcodes)}")

# --- Assembler-only opcodes ---
asm_only = asm_nums - vm_opcodes
if asm_only:
    print(f"\n{'='*60}")
    print(f"[BUG] ASSEMBLER OPCODES WITHOUT VM HANDLERS ({len(asm_only)}):")
    for num in sorted(asm_only):
        for mnem in asm_num_to_mnems[num]:
            info = asm_opcodes[mnem]
            print(f"  0x{num:02X}  {mnem:<20}  ({info[1]}:{info[2]})")
else:
    print("\n[OK] All assembler opcodes have VM handlers")

# --- VM-only opcodes ---
vm_only = vm_opcodes - asm_nums
if vm_only:
    print(f"\n{'='*60}")
    print(f"[INFO] VM OPCODES WITHOUT ASSEMBLER MNEMONICS ({len(vm_only)}):")
    for num in sorted(vm_only):
        # Find the handler location
        loc = ""
        for vfile in [vm_main] + sorted(
            os.path.join(VM_DIR, f) for f in os.listdir(VM_DIR) 
            if f.startswith('ops_') and f.endswith('.rs')
        ) if os.path.isdir(VM_DIR) else []:
            if not os.path.exists(vfile):
                continue
            with open(vfile) as f:
                for lnum, line in enumerate(f, 1):
                    if re.match(rf'\s+0x{num:02X}\s*=>', line):
                        loc = f"{os.path.basename(vfile)}:{lnum}"
                        break
            if loc:
                break
        print(f"  0x{num:02X}  {loc:<30} (reserved/internal)")
else:
    print("\n[OK] All VM opcodes have assembler mnemonics")

# --- Duplicate opcode numbers (multiple mnemonics -> same number) ---
dupes = {n: ms for n, ms in asm_num_to_mnems.items() if len(ms) > 1}
if dupes:
    print(f"\n{'='*60}")
    print(f"[INFO] MULTIPLE MNEMONICS SHARING OPCODE NUMBERS ({len(dupes)}):")
    print(f"{'='*60}")
    for num in sorted(dupes):
        mnems = sorted(dupes[num])
        print(f"  0x{num:02X}: {', '.join(mnems)}")
        if num == 0xFF:
            print(f"        ^ Intentional: mode-based dispatch (7 MAP_* sub-ops)")
        elif num == 0xB0:
            print(f"        ^ Intentional: AI_AGENT + SCREENA (sentinel encoding)")
else:
    print("\n[OK] No duplicate opcode numbers")

# --- Disasm coverage ---
disasm_only = disasm_opcodes - vm_opcodes
disasm_missing = vm_opcodes - disasm_opcodes
if disasm_missing:
    print(f"\n{'='*60}")
    print(f"[INFO] VM OPCODES WITHOUT DISASM ENTRIES ({len(disasm_missing)}):")
    for num in sorted(disasm_missing):
        mnems = asm_num_to_mnems.get(num, [])
        mnem_str = ', '.join(mnems) if mnems else '(no mnemonic)'
        print(f"  0x{num:02X}  {mnem_str}")

# ============================================================
# COMPLETE TABLE (verbose)
# ============================================================
if verbose:
    print(f"\n{'='*78}")
    print("COMPLETE OPCODE TABLE")
    print(f"{'='*78}")
    print(f"{'Hex':<6} {'Mnemonic(s)':<30} {'Status':<12}")
    print("-" * 50)
    for num in sorted(asm_nums | vm_opcodes):
        mnems = asm_num_to_mnems.get(num, [])
        mnem_str = ', '.join(sorted(mnems)) if mnems else '(no mnemonic)'
        if num in asm_only:
            status = "ASM-ONLY"
        elif num in vm_only:
            status = "VM-ONLY"
        elif num in dupes:
            status = "SHARED"
        else:
            status = "OK"
        print(f"0x{num:02X}   {mnem_str:<30} {status:<12}")

# ============================================================
# SUMMARY
# ============================================================
real_issues = len(asm_only)  # Only assembler-without-VM is a real bug
intentional = len(dupes)     # Multi-mnemonic is by design
informational = len(vm_only) # VM-only is reserved/internal

print(f"\n{'='*78}")
print("SUMMARY")
print(f"{'='*78}")
print(f"  Assembler mnemonics:       {len(asm_opcodes)}")
print(f"  Assembler opcode numbers:  {len(asm_nums)}")
print(f"  VM opcode numbers:         {len(vm_opcodes)}")
print(f"  Disasm opcode numbers:     {len(disasm_opcodes)}")
print(f"  Shared (both sides):       {len(asm_nums & vm_opcodes)}")
print(f"")
print(f"  [BUG] Assembler w/o VM:    {len(asm_only)}")
print(f"  [OK]  Multi-mnemonic:      {intentional} (intentional mode dispatch)")
print(f"  [OK]  VM-only (reserved):  {informational}")
print(f"  [OK]  Disasm coverage:     {len(disasm_opcodes)}/{len(vm_opcodes)} ({100*len(disasm_opcodes)//max(len(vm_opcodes),1)}%)")
print(f"")
if real_issues == 0:
    print("  RESULT: PASS - No assembler/VM mismatches detected")
else:
    print(f"  RESULT: FAIL - {real_issues} assembler opcodes missing VM handlers")
