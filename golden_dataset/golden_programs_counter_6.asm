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
;   r4  - scratch / CMP result (clobbered by CMPI)
;   r7  - constant 1 (reloaded as needed)
;   r2  - scratch
;   r0  - scratch
;   r15  - color
;   r11  - divisor (10, 100)
;   r6 - counter value / hit query result
;   r12 - hundreds digit
;   r13 - hundreds * 100
;   r1 - remainder after hundreds
;   r5 - tens digit
;   r9 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r7, 1

; counter = 0
LDI r20, COUNT
LDI r2, 0
STORE r20, r2

; Fill screen dark
LDI r2, 0x1A1A2E
FILL r2

; Register hit regions
LDI r7, 60
LDI r2, 150
LDI r0, 40
LDI r3, 40
HITSET r7, r2, r0, r3, 1       ; [+] button, id=1

LDI r7, 156
LDI r2, 150
LDI r0, 40
LDI r3, 40
HITSET r7, r2, r0, r3, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r7, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r2, 0x1A1A2E
    FILL r2

    ; Draw [+] button (green)
    LDI r7, 60
    LDI r2, 150
    LDI r0, 40
    LDI r3, 40
    LDI r15, 0x2ECC71
    RECTF r7, r2, r0, r3, r15

    ; Draw [-] button (red)
    LDI r7, 156
    LDI r2, 150
    LDI r0, 40
    LDI r3, 40
    LDI r15, 0xE74C3C
    RECTF r7, r2, r0, r3, r15

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r2, 43           ; '+'
    STORE r20, r2
    LDI r2, 0
    ADD r20, r7
    STORE r20, r2        ; null terminate

    LDI r7, 75
    LDI r2, 162
    LDI r0, SCRATCH
    TEXT r7, r2, r0

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r2, 45           ; '-'
    STORE r20, r2
    LDI r2, 0
    ADD r20, r7
    STORE r20, r2

    LDI r7, 171
    LDI r2, 162
    LDI r0, SCRATCH
    TEXT r7, r2, r0

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r7 = 1 (clobbered by button label rendering)
    LDI r7, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r2, 67            ; 'C'
    STORE r20, r2
    ADD r20, r7
    LDI r2, 111           ; 'o'
    STORE r20, r2
    ADD r20, r7
    LDI r2, 117           ; 'u'
    STORE r20, r2
    ADD r20, r7
    LDI r2, 110           ; 'n'
    STORE r20, r2
    ADD r20, r7
    LDI r2, 116           ; 't'
    STORE r20, r2
    ADD r20, r7
    LDI r2, 32            ; ' '
    STORE r20, r2
    ADD r20, r7

    ; Load counter
    LDI r2, COUNT
    LOAD r6, r2          ; r6 = counter value

    ; Hundreds: r6 / 100
    LDI r11, 100
    LDI r12, 0
    ADD r12, r6          ; r12 = counter
    DIV r12, r11           ; r12 = hundreds digit
    LDI r2, 48
    ADD r2, r12           ; ASCII '0' + hundreds
    STORE r20, r2
    ADD r20, r7           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r13, 0
    ADD r13, r12          ; r13 = hundreds
    LDI r2, 100
    MUL r13, r2           ; r13 = hundreds * 100
    LDI r1, 0
    ADD r1, r6          ; r1 = counter
    SUB r1, r13          ; r1 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r11, 10
    LDI r5, 0
    ADD r5, r1          ; r5 = remainder
    DIV r5, r11           ; r5 = tens digit
    LDI r2, 48
    ADD r2, r5           ; ASCII '0' + tens
    STORE r20, r2
    ADD r20, r7

    ; Ones: remainder % 10
    LDI r9, 0
    ADD r9, r1          ; r9 = remainder
    LDI r11, 10
    MOD r9, r11           ; r9 = ones digit
    LDI r2, 48
    ADD r2, r9           ; ASCII '0' + ones
    STORE r20, r2
    ADD r20, r7

    ; Null terminate
    LDI r2, 0
    STORE r20, r2

    ; Render counter text centered
    LDI r7, 70
    LDI r2, 80
    LDI r0, SCRATCH
    TEXT r7, r2, r0

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r6
    JZ r6, main_loop     ; no click → loop

    ; r6 = hit region id
    CMPI r6, 1
    JNZ r4, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r2, r20
    LDI r7, 1
    ADD r2, r7
    STORE r20, r2
    JMP main_loop

check_minus:
    CMPI r6, 2
    JNZ r4, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r2, r20
    LDI r7, 1
    SUB r2, r7
    STORE r20, r2
    JMP main_loop
