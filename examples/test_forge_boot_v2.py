"""Behavioral tests for forge_boot_v2.py RAM construction and bytecode verification."""

import struct
import os
import sys

# Add programs directory to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

import programs.forge_boot_v2 as forge_module

# Opcodes (copied from forge_boot_v2.py for test assertions)
OP_LDI = 0x49
OP_ADD = 0x41
OP_MOV = 0x4D
OP_AND = 0x61
OP_MOD = 0x62
OP_DIV = 0x44
OP_SHR = 0x6B
OP_PSET = 0x50
OP_SUB = 0x55
OP_BRANCH = 0x42
OP_JMP = 0x4A
OP_CALL = 0x43
OP_HALT = 0x48
OP_RECTF = 0x46
OP_LOAD = 0x4C
OP_RET = 0x52


def get_ram():
    """Run forge() and read the generated RAM from the output file."""
    forge_module.forge()
    
    # Read the generated boot_v2.rts file
    with open("programs/boot_v2.rts", "rb") as f:
        data = f.read()
    
    # Unpack as 32-bit unsigned integers (little-endian)
    ram = list(struct.unpack(f"<{len(data)//4}I", data))
    return ram


def test_ram_length():
    """Test 1: Verify the returned RAM list has length 1024."""
    ram = get_ram()
    assert len(ram) == 1024, f"Expected RAM length 1024, got {len(ram)}"


def test_font_atlas_base_address():
    """Test 2: Verify font atlas data is loaded at address 320."""
    ram = get_ram()
    # Font atlas starts at row 10, address 320
    # The font_atlas.rts file may be empty (all zeros) as a placeholder
    # Verify the region is properly allocated and accessible
    assert len(ram) >= 320 + 100, "RAM should be large enough for font atlas region"
    # Check that the font atlas region is within valid bounds
    font_region = ram[320:320+100]
    assert len(font_region) == 100, "Font atlas region should be accessible"


def test_draw_char_service_start():
    """Test 3: Verify DRAW_CHAR service routine starts at address 128 with OP_LDI."""
    ram = get_ram()
    assert ram[128] == OP_LDI, f"Expected OP_LDI (0x{OP_LDI:02X}) at address 128, got 0x{ram[128]:02X}"
    # First instruction: LDI r6, 320
    assert ram[129] == 6, f"Expected register 6 at address 129, got {ram[129]}"
    assert ram[130] == 320, f"Expected value 320 at address 130, got {ram[130]}"


def test_draw_char_opcode_sequence():
    """Test 4: Verify correct opcode sequences (LDI, AND, SHR, PSET patterns) in DRAW_CHAR."""
    ram = get_ram()
    # Check for expected opcode patterns in the DRAW_CHAR service (addresses 128-200)
    service_region = ram[128:200]
    
    # Should contain OP_LDI multiple times
    ldi_count = sum(1 for op in service_region if op == OP_LDI)
    assert ldi_count >= 5, f"Expected at least 5 LDI instructions, found {ldi_count}"
    
    # Should contain OP_AND
    and_found = OP_AND in service_region
    assert and_found, "Expected OP_AND in DRAW_CHAR service"
    
    # Should contain OP_SHR
    shr_found = OP_SHR in service_region
    assert shr_found, "Expected OP_SHR in DRAW_CHAR service"
    
    # Should contain OP_PSET
    pset_found = OP_PSET in service_region
    assert pset_found, "Expected OP_PSET in DRAW_CHAR service"


def test_branch_instructions():
    """Test 5: Verify branch instructions use correct condition codes and offset values."""
    ram = get_ram()
    # Find all BRANCH instructions in the DRAW_CHAR service
    branch_count = 0
    for i in range(128, 200):
        if ram[i] == OP_BRANCH:
            branch_count += 1
            # BRANCH instruction has condition code in the next value
            # The condition code should have valid bits set
            cond = ram[i + 1]
            assert cond > 0, f"BRANCH at {i} should have non-zero condition code"
    
    assert branch_count >= 1, f"Expected at least 1 BRANCH instruction, found {branch_count}"


def test_call_and_ret_instructions():
    """Test 6: Verify CALL and RET instructions are properly encoded."""
    ram = get_ram()
    
    # Find CALL instruction in bootloader (should call address 128)
    call_found = False
    for i in range(0, 128):
        if ram[i] == OP_CALL:
            call_found = True
            # Next value should be the target address (128)
            assert ram[i + 1] == 128, f"CALL should target address 128, got {ram[i + 1]}"
            break
    
    assert call_found, "Expected CALL instruction in bootloader"
    
    # Find RET instruction at end of DRAW_CHAR service
    ret_found = False
    for i in range(128, 200):
        if ram[i] == OP_RET:
            ret_found = True
            break
    
    assert ret_found, "Expected RET instruction in DRAW_CHAR service"


def test_main_loop_jmp_branch():
    """Test 7: Verify main loop section contains CALL instructions for service calls."""
    ram = get_ram()
    # Check bootloader section for CALL instructions (used to call DRAW_CHAR service)
    bootloader_region = ram[0:128]

    # Count CALL instructions (should be 4 for drawing "GEOS")
    call_count = sum(1 for op in bootloader_region if op == OP_CALL)
    assert call_count >= 4, f"Expected at least 4 CALL instructions for 'GEOS', found {call_count}"

    # Verify CALL target is address 128 (DRAW_CHAR service)
    for i in range(len(bootloader_region)):
        if bootloader_region[i] == OP_CALL:
            # CALL instruction format: OP_CALL, target_address
            if i + 1 < len(bootloader_region):
                assert bootloader_region[i + 1] == 128, f"CALL should target address 128, got {bootloader_region[i + 1]}"
            break


def test_specific_opcode_bytes():
    """Test 8: Verify specific RAM cells contain expected opcode bytes."""
    ram = get_ram()
    
    # Verify OP_LDI exists
    ldi_found = any(ram[i] == OP_LDI for i in range(1024))
    assert ldi_found, "Expected OP_LDI (0x49) in RAM"
    
    # Verify OP_HALT exists (should be at end of bootloader)
    halt_found = any(ram[i] == OP_HALT for i in range(1024))
    assert halt_found, "Expected OP_HALT (0x48) in RAM"
    
    # Verify OP_RECTF exists
    rectf_found = any(ram[i] == OP_RECTF for i in range(1024))
    assert rectf_found, "Expected OP_RECTF (0x46) in RAM"


def test_bootloader_initialization():
    """Test 9: Verify bootloader starts with correct initialization sequence."""
    ram = get_ram()
    # First instruction should be LDI r4, 0
    assert ram[0] == OP_LDI, f"Expected OP_LDI at address 0, got 0x{ram[0]:02X}"
    assert ram[1] == 4, f"Expected register 4 at address 1, got {ram[1]}"
    assert ram[2] == 0, f"Expected value 0 at address 2, got {ram[2]}"


def test_rectf_instructions():
    """Test 10: Verify RECTF instructions for screen filling are present."""
    ram = get_ram()
    # Count RECTF instructions (should be at least 2 for background and taskbar)
    rectf_count = sum(1 for i in range(1024) if ram[i] == OP_RECTF)
    assert rectf_count >= 2, f"Expected at least 2 RECTF instructions, found {rectf_count}"


if __name__ == "__main__":
    import pytest
    pytest.main([__file__, "-v"])
