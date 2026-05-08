; DESCRIPTION: Draws a green object at the screen with fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r6 = green color (0x00FF00)
;   r3 = black color (0x000000)
;   r7 = keyboard port address (0xFFFF)
;   r13 = center X (128)
;   r9 = center Y (128)
;   r1 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r10  = toggle state (0=off, 1=on)
;   r11  = toggle counter
;   r12  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r6, 0x00FF00
    LDI r3, 0
    LDI r7, 0xFFFF
    LDI r13, 128
    LDI r9, 128
    LDI r1, 0
    LDI r16, 1
    LDI r17, 3
    LDI r10, 1
    LDI r11, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r12, 66
    STORE r20, r12
    ADD r20, r16
    LDI r12, 76
    STORE r20, r12
    ADD r20, r16
    LDI r12, 73
    STORE r20, r12
    ADD r20, r16
    LDI r12, 78
    STORE r20, r12
    ADD r20, r16
    LDI r12, 75
    STORE r20, r12

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r13, r9, r6

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r12, r7
    CMP r12, r1
    JZ r4, poll

    ; Key pressed: clear the port
    LDI r12, 0
    STORE r7, r12

    ; Check current toggle state using CMP
    CMP r10, r1
    JZ r4, turn_on

    ; Currently ON (r10 > 0): turn OFF
    PSET r13, r9, r3
    LDI r10, 0
    JMP increment

turn_on:
    PSET r13, r9, r6
    LDI r10, 1

increment:
    ADD r11, r16
    CMP r11, r17
    JNZ r4, poll

    HALT
