; DESCRIPTION: This GeOS assembly code implements an interactive counter application with increment and decrement buttons. It uses arithmetic operations to update the counter value and displays it on the screen, handling user input through hit detection for button clicks.

; counter.asm -- Interactive Counter App for Geometry OS
;
; Proves: bytecode persistence, HITSET/HITQ hit-routing, FRAME loop,
;         RECTF drawing, TEXT rendering, arithmetic (DIV/MOD/ADD/SUB).
;
; RAM Layout:
;   0x100        counter value (u32, starts at 0)
;   0x200-0x20F  scratch buffer for number text (null-terminated)
;
; Registers:
;   r15  - scratch / CMP result (clobbered by CMPI)
;   r4  - constant 1 (reloaded as needed)
;   r5  - scratch
;   r0  - scratch
;   r7  - color
;   r9  - divisor (10, 100)
;   r3 - counter value / hit query result
;   r11 - hundreds digit
;   r14 - hundreds * 100
;   r8 - remainder after hundreds
;   r13 - tens digit
;   r12 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r4, 1

; counter = 0
LDI r20, COUNT
LDI r5, 0
STORE r20, r5

; Fill screen dark
LDI r5, 0x1A1A2E
FILL r5

; Register hit regions
LDI r4, 60
LDI r5, 150
LDI r0, 40
LDI r2, 40
HITSET r4, r5, r0, r2, 1       ; [+] button, id=1

LDI r4, 156
LDI r5, 150
LDI r0, 40
LDI r2, 40
HITSET r4, r5, r0, r2, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r4, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r5, 0x1A1A2E
    FILL r5

    ; Draw [+] button (green)
    LDI r4, 60
    LDI r5, 150
    LDI r0, 40
    LDI r2, 40
    LDI r7, 0x2ECC71
    RECTF r4, r5, r0, r2, r7

    ; Draw [-] button (red)
    LDI r4, 156
    LDI r5, 150
    LDI r0, 40
    LDI r2, 40
    LDI r7, 0xE74C3C
    RECTF r4, r5, r0, r2, r7

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r5, 43           ; '+'
    STORE r20, r5
    LDI r5, 0
    ADD r20, r4
    STORE r20, r5        ; null terminate

    LDI r4, 75
    LDI r5, 162
    LDI r0, SCRATCH
    TEXT r4, r5, r0

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r5, 45           ; '-'
    STORE r20, r5
    LDI r5, 0
    ADD r20, r4
    STORE r20, r5

    LDI r4, 171
    LDI r5, 162
    LDI r0, SCRATCH
    TEXT r4, r5, r0

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r4 = 1 (clobbered by button label rendering)
    LDI r4, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r5, 67            ; 'C'
    STORE r20, r5
    ADD r20, r4
    LDI r5, 111           ; 'o'
    STORE r20, r5
    ADD r20, r4
    LDI r5, 117           ; 'u'
    STORE r20, r5
    ADD r20, r4
    LDI r5, 110           ; 'n'
    STORE r20, r5
    ADD r20, r4
    LDI r5, 116           ; 't'
    STORE r20, r5
    ADD r20, r4
    LDI r5, 32            ; ' '
    STORE r20, r5
    ADD r20, r4

    ; Load counter
    LDI r5, COUNT
    LOAD r3, r5          ; r3 = counter value

    ; Hundreds: r3 / 100
    LDI r9, 100
    LDI r11, 0
    ADD r11, r3          ; r11 = counter
    DIV r11, r9           ; r11 = hundreds digit
    LDI r5, 48
    ADD r5, r11           ; ASCII '0' + hundreds
    STORE r20, r5
    ADD r20, r4           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r14, 0
    ADD r14, r11          ; r14 = hundreds
    LDI r5, 100
    MUL r14, r5           ; r14 = hundreds * 100
    LDI r8, 0
    ADD r8, r3          ; r8 = counter
    SUB r8, r14          ; r8 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r9, 10
    LDI r13, 0
    ADD r13, r8          ; r13 = remainder
    DIV r13, r9           ; r13 = tens digit
    LDI r5, 48
    ADD r5, r13           ; ASCII '0' + tens
    STORE r20, r5
    ADD r20, r4

    ; Ones: remainder % 10
    LDI r12, 0
    ADD r12, r8          ; r12 = remainder
    LDI r9, 10
    MOD r12, r9           ; r12 = ones digit
    LDI r5, 48
    ADD r5, r12           ; ASCII '0' + ones
    STORE r20, r5
    ADD r20, r4

    ; Null terminate
    LDI r5, 0
    STORE r20, r5

    ; Render counter text centered
    LDI r4, 70
    LDI r5, 80
    LDI r0, SCRATCH
    TEXT r4, r5, r0

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r3
    JZ r3, main_loop     ; no click → loop

    ; r3 = hit region id
    CMPI r3, 1
    JNZ r15, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r5, r20
    LDI r4, 1
    ADD r5, r4
    STORE r20, r5
    JMP main_loop

check_minus:
    CMPI r3, 2
    JNZ r15, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r5, r20
    LDI r4, 1
    SUB r5, r4
    STORE r20, r5
    JMP main_loop
