; DESCRIPTION: Draws a green object at the screen with fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r11 = green color (0x00FF00)
;   r6 = black color (0x000000)
;   r2 = keyboard port address (0xFFFF)
;   r10 = center X (128)
;   r4 = center Y (128)
;   r1 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r7  = toggle state (0=off, 1=on)
;   r12  = toggle counter
;   r8  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r11, 0x00FF00
    LDI r6, 0
    LDI r2, 0xFFFF
    LDI r10, 128
    LDI r4, 128
    LDI r1, 0
    LDI r16, 1
    LDI r17, 3
    LDI r7, 1
    LDI r12, 0

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
    PSET r10, r4, r11

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r8, r2
    CMP r8, r1
    JZ r9, poll

    ; Key pressed: clear the port
    LDI r8, 0
    STORE r2, r8

    ; Check current toggle state using CMP
    CMP r7, r1
    JZ r9, turn_on

    ; Currently ON (r7 > 0): turn OFF
    PSET r10, r4, r6
    LDI r7, 0
    JMP increment

turn_on:
    PSET r10, r4, r11
    LDI r7, 1

increment:
    ADD r12, r16
    CMP r12, r17
    JNZ r9, poll

    HALT
