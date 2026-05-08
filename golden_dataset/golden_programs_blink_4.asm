; DESCRIPTION: Draws a green object at the screen with fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r3 = green color (0x00FF00)
;   r9 = black color (0x000000)
;   r13 = keyboard port address (0xFFFF)
;   r10 = center X (128)
;   r6 = center Y (128)
;   r1 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r8  = toggle state (0=off, 1=on)
;   r5  = toggle counter
;   r12  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r3, 0x00FF00
    LDI r9, 0
    LDI r13, 0xFFFF
    LDI r10, 128
    LDI r6, 128
    LDI r1, 0
    LDI r16, 1
    LDI r17, 3
    LDI r8, 1
    LDI r5, 0

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
    PSET r10, r6, r3

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r12, r13
    CMP r12, r1
    JZ r11, poll

    ; Key pressed: clear the port
    LDI r12, 0
    STORE r13, r12

    ; Check current toggle state using CMP
    CMP r8, r1
    JZ r11, turn_on

    ; Currently ON (r8 > 0): turn OFF
    PSET r10, r6, r9
    LDI r8, 0
    JMP increment

turn_on:
    PSET r10, r6, r3
    LDI r8, 1

increment:
    ADD r5, r16
    CMP r5, r17
    JNZ r11, poll

    HALT
