; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r2 = green color (0x00FF00)
;   r14 = black color (0x000000)
;   r15 = keyboard port address (0xFFFF)
;   r9 = center X (128)
;   r4 = center Y (128)
;   r12 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r1  = toggle state (0=off, 1=on)
;   r11  = toggle counter
;   r6  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r2, 0x00FF00
    LDI r14, 0
    LDI r15, 0xFFFF
    LDI r9, 128
    LDI r4, 128
    LDI r12, 0
    LDI r16, 1
    LDI r17, 3
    LDI r1, 1
    LDI r11, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r6, 66
    STORE r20, r6
    ADD r20, r16
    LDI r6, 76
    STORE r20, r6
    ADD r20, r16
    LDI r6, 73
    STORE r20, r6
    ADD r20, r16
    LDI r6, 78
    STORE r20, r6
    ADD r20, r16
    LDI r6, 75
    STORE r20, r6

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r9, r4, r2

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r6, r15
    CMP r6, r12
    JZ r10, poll

    ; Key pressed: clear the port
    LDI r6, 0
    STORE r15, r6

    ; Check current toggle state using CMP
    CMP r1, r12
    JZ r10, turn_on

    ; Currently ON (r1 > 0): turn OFF
    PSET r9, r4, r14
    LDI r1, 0
    JMP increment

turn_on:
    PSET r9, r4, r2
    LDI r1, 1

increment:
    ADD r11, r16
    CMP r11, r17
    JNZ r10, poll

    HALT
