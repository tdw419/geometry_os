; DESCRIPTION: Draws a green object at the screen with fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r2 = green color (0x00FF00)
;   r12 = black color (0x000000)
;   r13 = keyboard port address (0xFFFF)
;   r3 = center X (128)
;   r11 = center Y (128)
;   r4 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r14  = toggle state (0=off, 1=on)
;   r5  = toggle counter
;   r9  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r2, 0x00FF00
    LDI r12, 0
    LDI r13, 0xFFFF
    LDI r3, 128
    LDI r11, 128
    LDI r4, 0
    LDI r16, 1
    LDI r17, 3
    LDI r14, 1
    LDI r5, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r9, 66
    STORE r20, r9
    ADD r20, r16
    LDI r9, 76
    STORE r20, r9
    ADD r20, r16
    LDI r9, 73
    STORE r20, r9
    ADD r20, r16
    LDI r9, 78
    STORE r20, r9
    ADD r20, r16
    LDI r9, 75
    STORE r20, r9

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r3, r11, r2

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r9, r13
    CMP r9, r4
    JZ r6, poll

    ; Key pressed: clear the port
    LDI r9, 0
    STORE r13, r9

    ; Check current toggle state using CMP
    CMP r14, r4
    JZ r6, turn_on

    ; Currently ON (r14 > 0): turn OFF
    PSET r3, r11, r12
    LDI r14, 0
    JMP increment

turn_on:
    PSET r3, r11, r2
    LDI r14, 1

increment:
    ADD r5, r16
    CMP r5, r17
    JNZ r6, poll

    HALT
