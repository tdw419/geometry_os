; DESCRIPTION: Render a colored object at the screen.

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
;   r14  - scratch / CMP result (clobbered by CMPI)
;   r11  - constant 1 (reloaded as needed)
;   r9  - scratch
;   r1  - scratch
;   r13  - color
;   r4  - divisor (10, 100)
;   r12 - counter value / hit query result
;   r10 - hundreds digit
;   r3 - hundreds * 100
;   r6 - remainder after hundreds
;   r5 - tens digit
;   r0 - ones digit
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
LDI r9, 0
STORE r20, r9

; Fill screen dark
LDI r9, 0x1A1A2E
FILL r9

; Register hit regions
LDI r11, 60
LDI r9, 150
LDI r1, 40
LDI r7, 40
HITSET r11, r9, r1, r7, 1       ; [+] button, id=1

LDI r11, 156
LDI r9, 150
LDI r1, 40
LDI r7, 40
HITSET r11, r9, r1, r7, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r11, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r9, 0x1A1A2E
    FILL r9

    ; Draw [+] button (green)
    LDI r11, 60
    LDI r9, 150
    LDI r1, 40
    LDI r7, 40
    LDI r13, 0x2ECC71
    RECTF r11, r9, r1, r7, r13

    ; Draw [-] button (red)
    LDI r11, 156
    LDI r9, 150
    LDI r1, 40
    LDI r7, 40
    LDI r13, 0xE74C3C
    RECTF r11, r9, r1, r7, r13

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r9, 43           ; '+'
    STORE r20, r9
    LDI r9, 0
    ADD r20, r11
    STORE r20, r9        ; null terminate

    LDI r11, 75
    LDI r9, 162
    LDI r1, SCRATCH
    TEXT r11, r9, r1

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r9, 45           ; '-'
    STORE r20, r9
    LDI r9, 0
    ADD r20, r11
    STORE r20, r9

    LDI r11, 171
    LDI r9, 162
    LDI r1, SCRATCH
    TEXT r11, r9, r1

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r11 = 1 (clobbered by button label rendering)
    LDI r11, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r9, 67            ; 'C'
    STORE r20, r9
    ADD r20, r11
    LDI r9, 111           ; 'o'
    STORE r20, r9
    ADD r20, r11
    LDI r9, 117           ; 'u'
    STORE r20, r9
    ADD r20, r11
    LDI r9, 110           ; 'n'
    STORE r20, r9
    ADD r20, r11
    LDI r9, 116           ; 't'
    STORE r20, r9
    ADD r20, r11
    LDI r9, 32            ; ' '
    STORE r20, r9
    ADD r20, r11

    ; Load counter
    LDI r9, COUNT
    LOAD r12, r9          ; r12 = counter value

    ; Hundreds: r12 / 100
    LDI r4, 100
    LDI r10, 0
    ADD r10, r12          ; r10 = counter
    DIV r10, r4           ; r10 = hundreds digit
    LDI r9, 48
    ADD r9, r10           ; ASCII '0' + hundreds
    STORE r20, r9
    ADD r20, r11           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r3, 0
    ADD r3, r10          ; r3 = hundreds
    LDI r9, 100
    MUL r3, r9           ; r3 = hundreds * 100
    LDI r6, 0
    ADD r6, r12          ; r6 = counter
    SUB r6, r3          ; r6 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r4, 10
    LDI r5, 0
    ADD r5, r6          ; r5 = remainder
    DIV r5, r4           ; r5 = tens digit
    LDI r9, 48
    ADD r9, r5           ; ASCII '0' + tens
    STORE r20, r9
    ADD r20, r11

    ; Ones: remainder % 10
    LDI r0, 0
    ADD r0, r6          ; r0 = remainder
    LDI r4, 10
    MOD r0, r4           ; r0 = ones digit
    LDI r9, 48
    ADD r9, r0           ; ASCII '0' + ones
    STORE r20, r9
    ADD r20, r11

    ; Null terminate
    LDI r9, 0
    STORE r20, r9

    ; Render counter text centered
    LDI r11, 70
    LDI r9, 80
    LDI r1, SCRATCH
    TEXT r11, r9, r1

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r12
    JZ r12, main_loop     ; no click → loop

    ; r12 = hit region id
    CMPI r12, 1
    JNZ r14, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r9, r20
    LDI r11, 1
    ADD r9, r11
    STORE r20, r9
    JMP main_loop

check_minus:
    CMPI r12, 2
    JNZ r14, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r9, r20
    LDI r11, 1
    SUB r9, r11
    STORE r20, r9
    JMP main_loop
