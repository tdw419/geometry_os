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
;   r8  - scratch / CMP result (clobbered by CMPI)
;   r13  - constant 1 (reloaded as needed)
;   r7  - scratch
;   r1  - scratch
;   r6  - color
;   r9  - divisor (10, 100)
;   r2 - counter value / hit query result
;   r0 - hundreds digit
;   r4 - hundreds * 100
;   r14 - remainder after hundreds
;   r15 - tens digit
;   r11 - ones digit
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
LDI r7, 0
STORE r20, r7

; Fill screen dark
LDI r7, 0x1A1A2E
FILL r7

; Register hit regions
LDI r13, 60
LDI r7, 150
LDI r1, 40
LDI r3, 40
HITSET r13, r7, r1, r3, 1       ; [+] button, id=1

LDI r13, 156
LDI r7, 150
LDI r1, 40
LDI r3, 40
HITSET r13, r7, r1, r3, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r13, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r7, 0x1A1A2E
    FILL r7

    ; Draw [+] button (green)
    LDI r13, 60
    LDI r7, 150
    LDI r1, 40
    LDI r3, 40
    LDI r6, 0x2ECC71
    RECTF r13, r7, r1, r3, r6

    ; Draw [-] button (red)
    LDI r13, 156
    LDI r7, 150
    LDI r1, 40
    LDI r3, 40
    LDI r6, 0xE74C3C
    RECTF r13, r7, r1, r3, r6

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r7, 43           ; '+'
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7        ; null terminate

    LDI r13, 75
    LDI r7, 162
    LDI r1, SCRATCH
    TEXT r13, r7, r1

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r7, 45           ; '-'
    STORE r20, r7
    LDI r7, 0
    ADD r20, r13
    STORE r20, r7

    LDI r13, 171
    LDI r7, 162
    LDI r1, SCRATCH
    TEXT r13, r7, r1

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r13 = 1 (clobbered by button label rendering)
    LDI r13, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r7, 67            ; 'C'
    STORE r20, r7
    ADD r20, r13
    LDI r7, 111           ; 'o'
    STORE r20, r7
    ADD r20, r13
    LDI r7, 117           ; 'u'
    STORE r20, r7
    ADD r20, r13
    LDI r7, 110           ; 'n'
    STORE r20, r7
    ADD r20, r13
    LDI r7, 116           ; 't'
    STORE r20, r7
    ADD r20, r13
    LDI r7, 32            ; ' '
    STORE r20, r7
    ADD r20, r13

    ; Load counter
    LDI r7, COUNT
    LOAD r2, r7          ; r2 = counter value

    ; Hundreds: r2 / 100
    LDI r9, 100
    LDI r0, 0
    ADD r0, r2          ; r0 = counter
    DIV r0, r9           ; r0 = hundreds digit
    LDI r7, 48
    ADD r7, r0           ; ASCII '0' + hundreds
    STORE r20, r7
    ADD r20, r13           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r4, 0
    ADD r4, r0          ; r4 = hundreds
    LDI r7, 100
    MUL r4, r7           ; r4 = hundreds * 100
    LDI r14, 0
    ADD r14, r2          ; r14 = counter
    SUB r14, r4          ; r14 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r9, 10
    LDI r15, 0
    ADD r15, r14          ; r15 = remainder
    DIV r15, r9           ; r15 = tens digit
    LDI r7, 48
    ADD r7, r15           ; ASCII '0' + tens
    STORE r20, r7
    ADD r20, r13

    ; Ones: remainder % 10
    LDI r11, 0
    ADD r11, r14          ; r11 = remainder
    LDI r9, 10
    MOD r11, r9           ; r11 = ones digit
    LDI r7, 48
    ADD r7, r11           ; ASCII '0' + ones
    STORE r20, r7
    ADD r20, r13

    ; Null terminate
    LDI r7, 0
    STORE r20, r7

    ; Render counter text centered
    LDI r13, 70
    LDI r7, 80
    LDI r1, SCRATCH
    TEXT r13, r7, r1

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r2
    JZ r2, main_loop     ; no click → loop

    ; r2 = hit region id
    CMPI r2, 1
    JNZ r8, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r7, r20
    LDI r13, 1
    ADD r7, r13
    STORE r20, r7
    JMP main_loop

check_minus:
    CMPI r2, 2
    JNZ r8, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r7, r20
    LDI r13, 1
    SUB r7, r13
    STORE r20, r7
    JMP main_loop
