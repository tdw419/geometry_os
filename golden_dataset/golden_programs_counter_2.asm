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
;   r13  - constant 1 (reloaded as needed)
;   r12  - scratch
;   r7  - scratch
;   r8  - color
;   r11  - divisor (10, 100)
;   r14 - counter value / hit query result
;   r0 - hundreds digit
;   r3 - hundreds * 100
;   r1 - remainder after hundreds
;   r9 - tens digit
;   r2 - ones digit
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
LDI r12, 0
STORE r20, r12

; Fill screen dark
LDI r12, 0x1A1A2E
FILL r12

; Register hit regions
LDI r13, 60
LDI r12, 150
LDI r7, 40
LDI r4, 40
HITSET r13, r12, r7, r4, 1       ; [+] button, id=1

LDI r13, 156
LDI r12, 150
LDI r7, 40
LDI r4, 40
HITSET r13, r12, r7, r4, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r13, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r12, 0x1A1A2E
    FILL r12

    ; Draw [+] button (green)
    LDI r13, 60
    LDI r12, 150
    LDI r7, 40
    LDI r4, 40
    LDI r8, 0x2ECC71
    RECTF r13, r12, r7, r4, r8

    ; Draw [-] button (red)
    LDI r13, 156
    LDI r12, 150
    LDI r7, 40
    LDI r4, 40
    LDI r8, 0xE74C3C
    RECTF r13, r12, r7, r4, r8

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r12, 43           ; '+'
    STORE r20, r12
    LDI r12, 0
    ADD r20, r13
    STORE r20, r12        ; null terminate

    LDI r13, 75
    LDI r12, 162
    LDI r7, SCRATCH
    TEXT r13, r12, r7

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r12, 45           ; '-'
    STORE r20, r12
    LDI r12, 0
    ADD r20, r13
    STORE r20, r12

    LDI r13, 171
    LDI r12, 162
    LDI r7, SCRATCH
    TEXT r13, r12, r7

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r13 = 1 (clobbered by button label rendering)
    LDI r13, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r12, 67            ; 'C'
    STORE r20, r12
    ADD r20, r13
    LDI r12, 111           ; 'o'
    STORE r20, r12
    ADD r20, r13
    LDI r12, 117           ; 'u'
    STORE r20, r12
    ADD r20, r13
    LDI r12, 110           ; 'n'
    STORE r20, r12
    ADD r20, r13
    LDI r12, 116           ; 't'
    STORE r20, r12
    ADD r20, r13
    LDI r12, 32            ; ' '
    STORE r20, r12
    ADD r20, r13

    ; Load counter
    LDI r12, COUNT
    LOAD r14, r12          ; r14 = counter value

    ; Hundreds: r14 / 100
    LDI r11, 100
    LDI r0, 0
    ADD r0, r14          ; r0 = counter
    DIV r0, r11           ; r0 = hundreds digit
    LDI r12, 48
    ADD r12, r0           ; ASCII '0' + hundreds
    STORE r20, r12
    ADD r20, r13           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r3, 0
    ADD r3, r0          ; r3 = hundreds
    LDI r12, 100
    MUL r3, r12           ; r3 = hundreds * 100
    LDI r1, 0
    ADD r1, r14          ; r1 = counter
    SUB r1, r3          ; r1 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r11, 10
    LDI r9, 0
    ADD r9, r1          ; r9 = remainder
    DIV r9, r11           ; r9 = tens digit
    LDI r12, 48
    ADD r12, r9           ; ASCII '0' + tens
    STORE r20, r12
    ADD r20, r13

    ; Ones: remainder % 10
    LDI r2, 0
    ADD r2, r1          ; r2 = remainder
    LDI r11, 10
    MOD r2, r11           ; r2 = ones digit
    LDI r12, 48
    ADD r12, r2           ; ASCII '0' + ones
    STORE r20, r12
    ADD r20, r13

    ; Null terminate
    LDI r12, 0
    STORE r20, r12

    ; Render counter text centered
    LDI r13, 70
    LDI r12, 80
    LDI r7, SCRATCH
    TEXT r13, r12, r7

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r14
    JZ r14, main_loop     ; no click → loop

    ; r14 = hit region id
    CMPI r14, 1
    JNZ r15, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r12, r20
    LDI r13, 1
    ADD r12, r13
    STORE r20, r12
    JMP main_loop

check_minus:
    CMPI r14, 2
    JNZ r15, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r12, r20
    LDI r13, 1
    SUB r12, r13
    STORE r20, r12
    JMP main_loop
