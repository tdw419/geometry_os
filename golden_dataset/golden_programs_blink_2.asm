; DESCRIPTION: Draws a green object at the screen with fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r0 = green color (0x00FF00)
;   r15 = black color (0x000000)
;   r10 = keyboard port address (0xFFFF)
;   r4 = center X (128)
;   r2 = center Y (128)
;   r6 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r13  = toggle state (0=off, 1=on)
;   r3  = toggle counter
;   r8  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r0, 0x00FF00
    LDI r15, 0
    LDI r10, 0xFFFF
    LDI r4, 128
    LDI r2, 128
    LDI r6, 0
    LDI r16, 1
    LDI r17, 3
    LDI r13, 1
    LDI r3, 0

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
    PSET r4, r2, r0

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r8, r10
    CMP r8, r6
    JZ r11, poll

    ; Key pressed: clear the port
    LDI r8, 0
    STORE r10, r8

    ; Check current toggle state using CMP
    CMP r13, r6
    JZ r11, turn_on

    ; Currently ON (r13 > 0): turn OFF
    PSET r4, r2, r15
    LDI r13, 0
    JMP increment

turn_on:
    PSET r4, r2, r0
    LDI r13, 1

increment:
    ADD r3, r16
    CMP r3, r17
    JNZ r11, poll

    HALT
