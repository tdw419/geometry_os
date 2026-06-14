# Plan: Native Woz-Style Monitor Implementation

## Objective
Implement a functional Woz-style memory monitor in `programs/woz_monitor.asm` to enable an "Edit-Assemble-Run" development loop within the Geometry OS substrate.

## Implementation Steps

1.  **Hex Nibble Conversion**:
    - Add `nibble_to_ascii` subroutine to `programs/woz_monitor.asm`.
    - Update `draw_hex_line` to utilize the new conversion logic.

2.  **Keyboard Interactivity**:
    - Add `IKEY` loop to read hex digits and commands.
    - Implement basic 'E' (Examine) command to set the target address.

3.  **Commands (E, S, R)**:
    - Implement command parsing logic to switch between Examine, Set, and Run modes.

4.  **Verification**:
    - Assemble the monitor using `literal_asm`.
    - Run the bytecode in the VM to verify memory dump and interactivity.
