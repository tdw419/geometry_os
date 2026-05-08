; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r13 = green color (0x00FF00)
;   r8 = black color (0x000000)
;   r15 = keyboard port address (0xFFFF)
;   r10 = center X (128)
;   r5 = center Y (128)
;   r14 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r7  = toggle state (0=off, 1=on)
;   r0  = toggle counter
;   r4  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r13, 0x00FF00
    LDI r8, 0
    LDI r15, 0xFFFF
    LDI r10, 128
    LDI r5, 128
    LDI r14, 0
    LDI r16, 1
    LDI r17, 3
    LDI r7, 1
    LDI r0, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r4, 66
    STORE r20, r4
    ADD r20, r16
    LDI r4, 76
    STORE r20, r4
    ADD r20, r16
    LDI r4, 73
    STORE r20, r4
    ADD r20, r16
    LDI r4, 78
    STORE r20, r4
    ADD r20, r16
    LDI r4, 75
    STORE r20, r4

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r10, r5, r13

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r4, r15
    CMP r4, r14
    JZ r3, poll

    ; Key pressed: clear the port
    LDI r4, 0
    STORE r15, r4

    ; Check current toggle state using CMP
    CMP r7, r14
    JZ r3, turn_on

    ; Currently ON (r7 > 0): turn OFF
    PSET r10, r5, r8
    LDI r7, 0
    JMP increment

turn_on:
    PSET r10, r5, r13
    LDI r7, 1

increment:
    ADD r0, r16
    CMP r0, r17
    JNZ r3, poll

    HALT
