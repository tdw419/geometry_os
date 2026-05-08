; DESCRIPTION: This GeOS assembly code toggles a pixel at the center of the screen between green and black colors using keyboard input. It reads from the keyboard port (RAM[0xFFFF]) to detect keypresses, utilizing the CMP opcode to compare values for conditional execution. The toggle state is managed through registers, and after three toggles, the program halts.

; BLINK: Toggle a pixel on/off using keyboard input and CMP
;
; Demonstrates the CMP opcode (0x50) by toggling a center pixel
; between green (0x00FF00) and black. Reads keyboard port at
; RAM[0xFFFF] and uses CMP against zero to detect keypresses.
;
; Register allocation:
;   r11 = green color (0x00FF00)
;   r15 = black color (0x000000)
;   r14 = keyboard port address (0xFFFF)
;   r6 = center X (128)
;   r9 = center Y (128)
;   r13 = zero constant (0)
;   r16 = one constant (1)
;   r17 = max toggles (3)
;   r0  = toggle state (0=off, 1=on)
;   r7  = toggle counter
;   r12  = temp (loaded values)

; ── Setup ────────────────────────────────────────────────────
    LDI r11, 0x00FF00
    LDI r15, 0
    LDI r14, 0xFFFF
    LDI r6, 128
    LDI r9, 128
    LDI r13, 0
    LDI r16, 1
    LDI r17, 3
    LDI r0, 1
    LDI r7, 0

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
    PSET r6, r9, r11

; ── Main loop: poll keyboard, toggle on keypress ─────────────
poll:
    LOAD r12, r14
    CMP r12, r13
    JZ r8, poll

    ; Key pressed: clear the port
    LDI r12, 0
    STORE r14, r12

    ; Check current toggle state using CMP
    CMP r0, r13
    JZ r8, turn_on

    ; Currently ON (r0 > 0): turn OFF
    PSET r6, r9, r15
    LDI r0, 0
    JMP increment

turn_on:
    PSET r6, r9, r11
    LDI r0, 1

increment:
    ADD r7, r16
    CMP r7, r17
    JNZ r8, poll

    HALT
