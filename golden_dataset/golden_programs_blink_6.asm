; DESCRIPTION: Draw object: pos=the screen, color=green, size=fixed size.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r13 = green color (0x00FF00)
;   r9 = black color (0x000000)
;   r4 = keyboard port address (0xFFFF)
;   r12 = center X (128)
;   r2 = center Y (128)
;   r10 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r14  = toggle state (0=off, 1=on)
;   r1  = toggle counter
;   r7  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r13, 0x00FF00
    LDI r9, 0
    LDI r4, 0xFFFF
    LDI r12, 128
    LDI r2, 128
    LDI r10, 0
    LDI r16, 1
    LDI r17, 3
    LDI r14, 1
    LDI r1, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r7, 66
    STORE r20, r7
    ADD r20, r16
    LDI r7, 76
    STORE r20, r7
    ADD r20, r16
    LDI r7, 73
    STORE r20, r7
    ADD r20, r16
    LDI r7, 78
    STORE r20, r7
    ADD r20, r16
    LDI r7, 75
    STORE r20, r7

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r12, r2, r13

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r7, r4
    CMP r7, r10
    JZ r0, poll

    ; Key pressed: clear the port
    LDI r7, 0
    STORE r4, r7

    ; Check current toggle state using CMP
    CMP r14, r10
    JZ r0, turn_on

    ; Currently ON (r14 > 0): turn OFF
    PSET r12, r2, r9
    LDI r14, 0
    JMP increment

turn_on:
    PSET r12, r2, r13
    LDI r14, 1

increment:
    ADD r1, r16
    CMP r1, r17
    JNZ r0, poll

    HALT
