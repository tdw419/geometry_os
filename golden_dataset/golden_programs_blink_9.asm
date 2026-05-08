; DESCRIPTION: Display a object using color green at the screen.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r3 = green color (0x00FF00)
;   r10 = black color (0x000000)
;   r8 = keyboard port address (0xFFFF)
;   r4 = center X (128)
;   r13 = center Y (128)
;   r12 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r5  = toggle state (0=off, 1=on)
;   r6  = toggle counter
;   r0  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r3, 0x00FF00
    LDI r10, 0
    LDI r8, 0xFFFF
    LDI r4, 128
    LDI r13, 128
    LDI r12, 0
    LDI r16, 1
    LDI r17, 3
    LDI r5, 1
    LDI r6, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r0, 66
    STORE r20, r0
    ADD r20, r16
    LDI r0, 76
    STORE r20, r0
    ADD r20, r16
    LDI r0, 73
    STORE r20, r0
    ADD r20, r16
    LDI r0, 78
    STORE r20, r0
    ADD r20, r16
    LDI r0, 75
    STORE r20, r0

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r4, r13, r3

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r0, r8
    CMP r0, r12
    JZ r1, poll

    ; Key pressed: clear the port
    LDI r0, 0
    STORE r8, r0

    ; Check current toggle state using CMP
    CMP r5, r12
    JZ r1, turn_on

    ; Currently ON (r5 > 0): turn OFF
    PSET r4, r13, r10
    LDI r5, 0
    JMP increment

turn_on:
    PSET r4, r13, r3
    LDI r5, 1

increment:
    ADD r6, r16
    CMP r6, r17
    JNZ r1, poll

    HALT
