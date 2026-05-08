; DESCRIPTION: A green object centered at the screen with fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r8 = green color (0x00FF00)
;   r3 = black color (0x000000)
;   r5 = keyboard port address (0xFFFF)
;   r11 = center X (128)
;   r6 = center Y (128)
;   r1 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r4  = toggle state (0=off, 1=on)
;   r0  = toggle counter
;   r10  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r8, 0x00FF00
    LDI r3, 0
    LDI r5, 0xFFFF
    LDI r11, 128
    LDI r6, 128
    LDI r1, 0
    LDI r16, 1
    LDI r17, 3
    LDI r4, 1
    LDI r0, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r10, 66
    STORE r20, r10
    ADD r20, r16
    LDI r10, 76
    STORE r20, r10
    ADD r20, r16
    LDI r10, 73
    STORE r20, r10
    ADD r20, r16
    LDI r10, 78
    STORE r20, r10
    ADD r20, r16
    LDI r10, 75
    STORE r20, r10

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r11, r6, r8

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r10, r5
    CMP r10, r1
    JZ r2, poll

    ; Key pressed: clear the port
    LDI r10, 0
    STORE r5, r10

    ; Check current toggle state using CMP
    CMP r4, r1
    JZ r2, turn_on

    ; Currently ON (r4 > 0): turn OFF
    PSET r11, r6, r3
    LDI r4, 0
    JMP increment

turn_on:
    PSET r11, r6, r8
    LDI r4, 1

increment:
    ADD r0, r16
    CMP r0, r17
    JNZ r2, poll

    HALT
