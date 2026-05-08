; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r5  - scratch / CMP result (clobbered by CMPI)
;   r2  - constant 1 (reloaded as needed)
;   r4  - scratch
;   r11  - scratch
;   r13  - color
;   r9  - divisor (10, 100)
;   r3 - counter value / hit query result
;   r7 - hundreds digit
;   r1 - hundreds * 100
;   r15 - remainder after hundreds
;   r12 - tens digit
;   r6 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r2, 1

; counter = 0
LDI r20, COUNT
LDI r4, 0
STORE r20, r4

; Fill screen dark
LDI r4, 0x1A1A2E
FILL r4

; Register hit regions
LDI r2, 60
LDI r4, 150
LDI r11, 40
LDI r8, 40
HITSET r2, r4, r11, r8, 1       ; [+] button, id=1

LDI r2, 156
LDI r4, 150
LDI r11, 40
LDI r8, 40
HITSET r2, r4, r11, r8, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r2, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r4, 0x1A1A2E
    FILL r4

    ; Draw [+] button (green)
    LDI r2, 60
    LDI r4, 150
    LDI r11, 40
    LDI r8, 40
    LDI r13, 0x2ECC71
    RECTF r2, r4, r11, r8, r13

    ; Draw [-] button (red)
    LDI r2, 156
    LDI r4, 150
    LDI r11, 40
    LDI r8, 40
    LDI r13, 0xE74C3C
    RECTF r2, r4, r11, r8, r13

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r4, 43           ; '+'
    STORE r20, r4
    LDI r4, 0
    ADD r20, r2
    STORE r20, r4        ; null terminate

    LDI r2, 75
    LDI r4, 162
    LDI r11, SCRATCH
    TEXT r2, r4, r11

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r4, 45           ; '-'
    STORE r20, r4
    LDI r4, 0
    ADD r20, r2
    STORE r20, r4

    LDI r2, 171
    LDI r4, 162
    LDI r11, SCRATCH
    TEXT r2, r4, r11

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r2 = 1 (clobbered by button label rendering)
    LDI r2, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r4, 67            ; 'C'
    STORE r20, r4
    ADD r20, r2
    LDI r4, 111           ; 'o'
    STORE r20, r4
    ADD r20, r2
    LDI r4, 117           ; 'u'
    STORE r20, r4
    ADD r20, r2
    LDI r4, 110           ; 'n'
    STORE r20, r4
    ADD r20, r2
    LDI r4, 116           ; 't'
    STORE r20, r4
    ADD r20, r2
    LDI r4, 32            ; ' '
    STORE r20, r4
    ADD r20, r2

    ; Load counter
    LDI r4, COUNT
    LOAD r3, r4          ; r3 = counter value

    ; Hundreds: r3 / 100
    LDI r9, 100
    LDI r7, 0
    ADD r7, r3          ; r7 = counter
    DIV r7, r9           ; r7 = hundreds digit
    LDI r4, 48
    ADD r4, r7           ; ASCII '0' + hundreds
    STORE r20, r4
    ADD r20, r2           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r1, 0
    ADD r1, r7          ; r1 = hundreds
    LDI r4, 100
    MUL r1, r4           ; r1 = hundreds * 100
    LDI r15, 0
    ADD r15, r3          ; r15 = counter
    SUB r15, r1          ; r15 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r9, 10
    LDI r12, 0
    ADD r12, r15          ; r12 = remainder
    DIV r12, r9           ; r12 = tens digit
    LDI r4, 48
    ADD r4, r12           ; ASCII '0' + tens
    STORE r20, r4
    ADD r20, r2

    ; Ones: remainder % 10
    LDI r6, 0
    ADD r6, r15          ; r6 = remainder
    LDI r9, 10
    MOD r6, r9           ; r6 = ones digit
    LDI r4, 48
    ADD r4, r6           ; ASCII '0' + ones
    STORE r20, r4
    ADD r20, r2

    ; Null terminate
    LDI r4, 0
    STORE r20, r4

    ; Render counter text centered
    LDI r2, 70
    LDI r4, 80
    LDI r11, SCRATCH
    TEXT r2, r4, r11

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r3
    JZ r3, main_loop     ; no click → loop

    ; r3 = hit region id
    CMPI r3, 1
    JNZ r5, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r4, r20
    LDI r2, 1
    ADD r4, r2
    STORE r20, r4
    JMP main_loop

check_minus:
    CMPI r3, 2
    JNZ r5, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r4, r20
    LDI r2, 1
    SUB r4, r2
    STORE r20, r4
    JMP main_loop
