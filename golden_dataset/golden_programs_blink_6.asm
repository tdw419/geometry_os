; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r8 = green color (0x00FF00)
;   r2 = black color (0x000000)
;   r5 = keyboard port address (0xFFFF)
;   r14 = center X (128)
;   r7 = center Y (128)
;   r3 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r9  = toggle state (0=off, 1=on)
;   r0  = toggle counter
;   r11  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r8, 0x00FF00
    LDI r2, 0
    LDI r5, 0xFFFF
    LDI r14, 128
    LDI r7, 128
    LDI r3, 0
    LDI r16, 1
    LDI r17, 3
    LDI r9, 1
    LDI r0, 0

; ── Store "BLINK" signature at RAM[0x200..0x204] ────────────
    LDI r20, 0x0200
    LDI r11, 66
    STORE r20, r11
    ADD r20, r16
    LDI r11, 76
    STORE r20, r11
    ADD r20, r16
    LDI r11, 73
    STORE r20, r11
    ADD r20, r16
    LDI r11, 78
    STORE r20, r11
    ADD r20, r16
    LDI r11, 75
    STORE r20, r11

; ── Initial state: pixel ON (green) ─────────────────────────
    PSET r14, r7, r8

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r11, r5
    CMP r11, r3
    JZ r15, poll

    ; Key pressed: clear the port
    LDI r11, 0
    STORE r5, r11

    ; Check current toggle state using CMP
    CMP r9, r3
    JZ r15, turn_on

    ; Currently ON (r9 > 0): turn OFF
    PSET r14, r7, r2
    LDI r9, 0
    JMP increment

turn_on:
    PSET r14, r7, r8
    LDI r9, 1

increment:
    ADD r0, r16
    CMP r0, r17
    JNZ r15, poll

    HALT
