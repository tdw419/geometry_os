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
;   r10  - scratch / CMP result (clobbered by CMPI)
;   r13  - constant 1 (reloaded as needed)
;   r1  - scratch
;   r12  - scratch
;   r7  - color
;   r5  - divisor (10, 100)
;   r9 - counter value / hit query result
;   r11 - hundreds digit
;   r3 - hundreds * 100
;   r14 - remainder after hundreds
;   r15 - tens digit
;   r4 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r13, 1

; counter = 0
LDI r20, COUNT
LDI r1, 0
STORE r20, r1

; Fill screen dark
LDI r1, 0x1A1A2E
FILL r1

; Register hit regions
LDI r13, 60
LDI r1, 150
LDI r12, 40
LDI r2, 40
HITSET r13, r1, r12, r2, 1       ; [+] button, id=1

LDI r13, 156
LDI r1, 150
LDI r12, 40
LDI r2, 40
HITSET r13, r1, r12, r2, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r13, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r1, 0x1A1A2E
    FILL r1

    ; Draw [+] button (green)
    LDI r13, 60
    LDI r1, 150
    LDI r12, 40
    LDI r2, 40
    LDI r7, 0x2ECC71
    RECTF r13, r1, r12, r2, r7

    ; Draw [-] button (red)
    LDI r13, 156
    LDI r1, 150
    LDI r12, 40
    LDI r2, 40
    LDI r7, 0xE74C3C
    RECTF r13, r1, r12, r2, r7

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r1, 43           ; '+'
    STORE r20, r1
    LDI r1, 0
    ADD r20, r13
    STORE r20, r1        ; null terminate

    LDI r13, 75
    LDI r1, 162
    LDI r12, SCRATCH
    TEXT r13, r1, r12

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r1, 45           ; '-'
    STORE r20, r1
    LDI r1, 0
    ADD r20, r13
    STORE r20, r1

    LDI r13, 171
    LDI r1, 162
    LDI r12, SCRATCH
    TEXT r13, r1, r12

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r13 = 1 (clobbered by button label rendering)
    LDI r13, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r1, 67            ; 'C'
    STORE r20, r1
    ADD r20, r13
    LDI r1, 111           ; 'o'
    STORE r20, r1
    ADD r20, r13
    LDI r1, 117           ; 'u'
    STORE r20, r1
    ADD r20, r13
    LDI r1, 110           ; 'n'
    STORE r20, r1
    ADD r20, r13
    LDI r1, 116           ; 't'
    STORE r20, r1
    ADD r20, r13
    LDI r1, 32            ; ' '
    STORE r20, r1
    ADD r20, r13

    ; Load counter
    LDI r1, COUNT
    LOAD r9, r1          ; r9 = counter value

    ; Hundreds: r9 / 100
    LDI r5, 100
    LDI r11, 0
    ADD r11, r9          ; r11 = counter
    DIV r11, r5           ; r11 = hundreds digit
    LDI r1, 48
    ADD r1, r11           ; ASCII '0' + hundreds
    STORE r20, r1
    ADD r20, r13           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r3, 0
    ADD r3, r11          ; r3 = hundreds
    LDI r1, 100
    MUL r3, r1           ; r3 = hundreds * 100
    LDI r14, 0
    ADD r14, r9          ; r14 = counter
    SUB r14, r3          ; r14 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r5, 10
    LDI r15, 0
    ADD r15, r14          ; r15 = remainder
    DIV r15, r5           ; r15 = tens digit
    LDI r1, 48
    ADD r1, r15           ; ASCII '0' + tens
    STORE r20, r1
    ADD r20, r13

    ; Ones: remainder % 10
    LDI r4, 0
    ADD r4, r14          ; r4 = remainder
    LDI r5, 10
    MOD r4, r5           ; r4 = ones digit
    LDI r1, 48
    ADD r1, r4           ; ASCII '0' + ones
    STORE r20, r1
    ADD r20, r13

    ; Null terminate
    LDI r1, 0
    STORE r20, r1

    ; Render counter text centered
    LDI r13, 70
    LDI r1, 80
    LDI r12, SCRATCH
    TEXT r13, r1, r12

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r9
    JZ r9, main_loop     ; no click → loop

    ; r9 = hit region id
    CMPI r9, 1
    JNZ r10, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r1, r20
    LDI r13, 1
    ADD r1, r13
    STORE r20, r1
    JMP main_loop

check_minus:
    CMPI r9, 2
    JNZ r10, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r1, r20
    LDI r13, 1
    SUB r1, r13
    STORE r20, r1
    JMP main_loop
