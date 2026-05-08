; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r8 = green color (0x00FF00)
;   r15 = black color (0x000000)
;   r0 = keyboard port address (0xFFFF)
;   r6 = center X (128)
;   r10 = center Y (128)
;   r11 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r1  = toggle state (0=off, 1=on)
;   r12  = toggle counter
;   r13  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r8, 0x00FF00
    LDI r15, 0
    LDI r0, 0xFFFF
    LDI r6, 128
    LDI r10, 128
    LDI r11, 0
    LDI r16, 1
    LDI r17, 3
    LDI r1, 1
    LDI r12, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r13, 66
    STORE r20, r13
    ADD r20, r16
    LDI r13, 76
    STORE r20, r13
    ADD r20, r16
    LDI r13, 73
    STORE r20, r13
    ADD r20, r16
    LDI r13, 78
    STORE r20, r13
    ADD r20, r16
    LDI r13, 75
    STORE r20, r13

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r6, r10, r8

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r13, r0
    CMP r13, r11
    JZ r2, poll

    ; Key pressed: clear the port
    LDI r13, 0
    STORE r0, r13

    ; Check current toggle state using CMP
    CMP r1, r11
    JZ r2, turn_on

    ; Currently ON (r1 > 0): turn OFF
    PSET r6, r10, r15
    LDI r1, 0
    JMP increment

turn_on:
    PSET r6, r10, r8
    LDI r1, 1

increment:
    ADD r12, r16
    CMP r12, r17
    JNZ r2, poll

    HALT
