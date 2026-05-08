; DESCRIPTION: A colored object centered at the screen with fixed size.

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
;   r2  - scratch / CMP result (clobbered by CMPI)
;   r11  - constant 1 (reloaded as needed)
;   r4  - scratch
;   r10  - scratch
;   r1  - color
;   r9  - divisor (10, 100)
;   r6 - counter value / hit query result
;   r13 - hundreds digit
;   r14 - hundreds * 100
;   r12 - remainder after hundreds
;   r15 - tens digit
;   r3 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r11, 1

; counter = 0
LDI r20, COUNT
LDI r4, 0
STORE r20, r4

; Fill screen dark
LDI r4, 0x1A1A2E
FILL r4

; Register hit regions
LDI r11, 60
LDI r4, 150
LDI r10, 40
LDI r5, 40
HITSET r11, r4, r10, r5, 1       ; [+] button, id=1

LDI r11, 156
LDI r4, 150
LDI r10, 40
LDI r5, 40
HITSET r11, r4, r10, r5, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r11, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r4, 0x1A1A2E
    FILL r4

    ; Draw [+] button (green)
    LDI r11, 60
    LDI r4, 150
    LDI r10, 40
    LDI r5, 40
    LDI r1, 0x2ECC71
    RECTF r11, r4, r10, r5, r1

    ; Draw [-] button (red)
    LDI r11, 156
    LDI r4, 150
    LDI r10, 40
    LDI r5, 40
    LDI r1, 0xE74C3C
    RECTF r11, r4, r10, r5, r1

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r4, 43           ; '+'
    STORE r20, r4
    LDI r4, 0
    ADD r20, r11
    STORE r20, r4        ; null terminate

    LDI r11, 75
    LDI r4, 162
    LDI r10, SCRATCH
    TEXT r11, r4, r10

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r4, 45           ; '-'
    STORE r20, r4
    LDI r4, 0
    ADD r20, r11
    STORE r20, r4

    LDI r11, 171
    LDI r4, 162
    LDI r10, SCRATCH
    TEXT r11, r4, r10

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r11 = 1 (clobbered by button label rendering)
    LDI r11, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r4, 67            ; 'C'
    STORE r20, r4
    ADD r20, r11
    LDI r4, 111           ; 'o'
    STORE r20, r4
    ADD r20, r11
    LDI r4, 117           ; 'u'
    STORE r20, r4
    ADD r20, r11
    LDI r4, 110           ; 'n'
    STORE r20, r4
    ADD r20, r11
    LDI r4, 116           ; 't'
    STORE r20, r4
    ADD r20, r11
    LDI r4, 32            ; ' '
    STORE r20, r4
    ADD r20, r11

    ; Load counter
    LDI r4, COUNT
    LOAD r6, r4          ; r6 = counter value

    ; Hundreds: r6 / 100
    LDI r9, 100
    LDI r13, 0
    ADD r13, r6          ; r13 = counter
    DIV r13, r9           ; r13 = hundreds digit
    LDI r4, 48
    ADD r4, r13           ; ASCII '0' + hundreds
    STORE r20, r4
    ADD r20, r11           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r14, 0
    ADD r14, r13          ; r14 = hundreds
    LDI r4, 100
    MUL r14, r4           ; r14 = hundreds * 100
    LDI r12, 0
    ADD r12, r6          ; r12 = counter
    SUB r12, r14          ; r12 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r9, 10
    LDI r15, 0
    ADD r15, r12          ; r15 = remainder
    DIV r15, r9           ; r15 = tens digit
    LDI r4, 48
    ADD r4, r15           ; ASCII '0' + tens
    STORE r20, r4
    ADD r20, r11

    ; Ones: remainder % 10
    LDI r3, 0
    ADD r3, r12          ; r3 = remainder
    LDI r9, 10
    MOD r3, r9           ; r3 = ones digit
    LDI r4, 48
    ADD r4, r3           ; ASCII '0' + ones
    STORE r20, r4
    ADD r20, r11

    ; Null terminate
    LDI r4, 0
    STORE r20, r4

    ; Render counter text centered
    LDI r11, 70
    LDI r4, 80
    LDI r10, SCRATCH
    TEXT r11, r4, r10

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r6
    JZ r6, main_loop     ; no click → loop

    ; r6 = hit region id
    CMPI r6, 1
    JNZ r2, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r4, r20
    LDI r11, 1
    ADD r4, r11
    STORE r20, r4
    JMP main_loop

check_minus:
    CMPI r6, 2
    JNZ r2, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r4, r20
    LDI r11, 1
    SUB r4, r11
    STORE r20, r4
    JMP main_loop
