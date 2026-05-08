; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r10 = green color (0x00FF00)
;   r14 = black color (0x000000)
;   r6 = keyboard port address (0xFFFF)
;   r12 = center X (128)
;   r5 = center Y (128)
;   r0 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r13  = toggle state (0=off, 1=on)
;   r4  = toggle counter
;   r1  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r10, 0x00FF00
    LDI r14, 0
    LDI r6, 0xFFFF
    LDI r12, 128
    LDI r5, 128
    LDI r0, 0
    LDI r16, 1
    LDI r17, 3
    LDI r13, 1
    LDI r4, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r1, 66
    STORE r20, r1
    ADD r20, r16
    LDI r1, 76
    STORE r20, r1
    ADD r20, r16
    LDI r1, 73
    STORE r20, r1
    ADD r20, r16
    LDI r1, 78
    STORE r20, r1
    ADD r20, r16
    LDI r1, 75
    STORE r20, r1

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r12, r5, r10

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r1, r6
    CMP r1, r0
    JZ r7, poll

    ; Key pressed: clear the port
    LDI r1, 0
    STORE r6, r1

    ; Check current toggle state using CMP
    CMP r13, r0
    JZ r7, turn_on

    ; Currently ON (r13 > 0): turn OFF
    PSET r12, r5, r14
    LDI r13, 0
    JMP increment

turn_on:
    PSET r12, r5, r10
    LDI r13, 1

increment:
    ADD r4, r16
    CMP r4, r17
    JNZ r7, poll

    HALT
