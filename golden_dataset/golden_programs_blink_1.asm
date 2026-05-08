; DESCRIPTION: Draw object: pos=the screen, color=green, size=fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r15 = green color (0x00FF00)
;   r2 = black color (0x000000)
;   r5 = keyboard port address (0xFFFF)
;   r7 = center X (128)
;   r1 = center Y (128)
;   r14 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r11  = toggle state (0=off, 1=on)
;   r12  = toggle counter
;   r8  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r15, 0x00FF00
    LDI r2, 0
    LDI r5, 0xFFFF
    LDI r7, 128
    LDI r1, 128
    LDI r14, 0
    LDI r16, 1
    LDI r17, 3
    LDI r11, 1
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
    PSET r7, r1, r15

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r8, r5
    CMP r8, r14
    JZ r9, poll

    ; Key pressed: clear the port
    LDI r8, 0
    STORE r5, r8

    ; Check current toggle state using CMP
    CMP r11, r14
    JZ r9, turn_on

    ; Currently ON (r11 > 0): turn OFF
    PSET r7, r1, r2
    LDI r11, 0
    JMP increment

turn_on:
    PSET r7, r1, r15
    LDI r11, 1

increment:
    ADD r12, r16
    CMP r12, r17
    JNZ r9, poll

    HALT
