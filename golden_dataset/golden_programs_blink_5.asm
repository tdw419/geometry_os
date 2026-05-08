; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r8 = green color (0x00FF00)
;   r4 = black color (0x000000)
;   r1 = keyboard port address (0xFFFF)
;   r6 = center X (128)
;   r12 = center Y (128)
;   r2 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r5  = toggle state (0=off, 1=on)
;   r11  = toggle counter
;   r15  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r8, 0x00FF00
    LDI r4, 0
    LDI r1, 0xFFFF
    LDI r6, 128
    LDI r12, 128
    LDI r2, 0
    LDI r16, 1
    LDI r17, 3
    LDI r5, 1
    LDI r11, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r15, 66
    STORE r20, r15
    ADD r20, r16
    LDI r15, 76
    STORE r20, r15
    ADD r20, r16
    LDI r15, 73
    STORE r20, r15
    ADD r20, r16
    LDI r15, 78
    STORE r20, r15
    ADD r20, r16
    LDI r15, 75
    STORE r20, r15

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r6, r12, r8

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r15, r1
    CMP r15, r2
    JZ r10, poll

    ; Key pressed: clear the port
    LDI r15, 0
    STORE r1, r15

    ; Check current toggle state using CMP
    CMP r5, r2
    JZ r10, turn_on

    ; Currently ON (r5 > 0): turn OFF
    PSET r6, r12, r4
    LDI r5, 0
    JMP increment

turn_on:
    PSET r6, r12, r8
    LDI r5, 1

increment:
    ADD r11, r16
    CMP r11, r17
    JNZ r10, poll

    HALT
