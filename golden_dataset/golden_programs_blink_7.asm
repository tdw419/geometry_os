; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r10 = green color (0x00FF00)
;   r13 = black color (0x000000)
;   r5 = keyboard port address (0xFFFF)
;   r0 = center X (128)
;   r2 = center Y (128)
;   r3 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r4  = toggle state (0=off, 1=on)
;   r9  = toggle counter
;   r8  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r10, 0x00FF00
    LDI r13, 0
    LDI r5, 0xFFFF
    LDI r0, 128
    LDI r2, 128
    LDI r3, 0
    LDI r16, 1
    LDI r17, 3
    LDI r4, 1
    LDI r9, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r8, 66
    STORE r20, r8
    ADD r20, r16
    LDI r8, 76
    STORE r20, r8
    ADD r20, r16
    LDI r8, 73
    STORE r20, r8
    ADD r20, r16
    LDI r8, 78
    STORE r20, r8
    ADD r20, r16
    LDI r8, 75
    STORE r20, r8

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r0, r2, r10

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r8, r5
    CMP r8, r3
    JZ r15, poll

    ; Key pressed: clear the port
    LDI r8, 0
    STORE r5, r8

    ; Check current toggle state using CMP
    CMP r4, r3
    JZ r15, turn_on

    ; Currently ON (r4 > 0): turn OFF
    PSET r0, r2, r13
    LDI r4, 0
    JMP increment

turn_on:
    PSET r0, r2, r10
    LDI r4, 1

increment:
    ADD r9, r16
    CMP r9, r17
    JNZ r15, poll

    HALT
