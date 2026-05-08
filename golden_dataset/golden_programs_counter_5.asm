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
;   r1  - scratch / CMP result (clobbered by CMPI)
;   r11  - constant 1 (reloaded as needed)
;   r2  - scratch
;   r14  - scratch
;   r7  - color
;   r12  - divisor (10, 100)
;   r13 - counter value / hit query result
;   r10 - hundreds digit
;   r4 - hundreds * 100
;   r5 - remainder after hundreds
;   r8 - tens digit
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
LDI r2, 0
STORE r20, r2

; Fill screen dark
LDI r2, 0x1A1A2E
FILL r2

; Register hit regions
LDI r11, 60
LDI r2, 150
LDI r14, 40
LDI r15, 40
HITSET r11, r2, r14, r15, 1       ; [+] button, id=1

LDI r11, 156
LDI r2, 150
LDI r14, 40
LDI r15, 40
HITSET r11, r2, r14, r15, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r11, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r2, 0x1A1A2E
    FILL r2

    ; Draw [+] button (green)
    LDI r11, 60
    LDI r2, 150
    LDI r14, 40
    LDI r15, 40
    LDI r7, 0x2ECC71
    RECTF r11, r2, r14, r15, r7

    ; Draw [-] button (red)
    LDI r11, 156
    LDI r2, 150
    LDI r14, 40
    LDI r15, 40
    LDI r7, 0xE74C3C
    RECTF r11, r2, r14, r15, r7

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r2, 43           ; '+'
    STORE r20, r2
    LDI r2, 0
    ADD r20, r11
    STORE r20, r2        ; null terminate

    LDI r11, 75
    LDI r2, 162
    LDI r14, SCRATCH
    TEXT r11, r2, r14

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r2, 45           ; '-'
    STORE r20, r2
    LDI r2, 0
    ADD r20, r11
    STORE r20, r2

    LDI r11, 171
    LDI r2, 162
    LDI r14, SCRATCH
    TEXT r11, r2, r14

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r11 = 1 (clobbered by button label rendering)
    LDI r11, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r2, 67            ; 'C'
    STORE r20, r2
    ADD r20, r11
    LDI r2, 111           ; 'o'
    STORE r20, r2
    ADD r20, r11
    LDI r2, 117           ; 'u'
    STORE r20, r2
    ADD r20, r11
    LDI r2, 110           ; 'n'
    STORE r20, r2
    ADD r20, r11
    LDI r2, 116           ; 't'
    STORE r20, r2
    ADD r20, r11
    LDI r2, 32            ; ' '
    STORE r20, r2
    ADD r20, r11

    ; Load counter
    LDI r2, COUNT
    LOAD r13, r2          ; r13 = counter value

    ; Hundreds: r13 / 100
    LDI r12, 100
    LDI r10, 0
    ADD r10, r13          ; r10 = counter
    DIV r10, r12           ; r10 = hundreds digit
    LDI r2, 48
    ADD r2, r10           ; ASCII '0' + hundreds
    STORE r20, r2
    ADD r20, r11           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r4, 0
    ADD r4, r10          ; r4 = hundreds
    LDI r2, 100
    MUL r4, r2           ; r4 = hundreds * 100
    LDI r5, 0
    ADD r5, r13          ; r5 = counter
    SUB r5, r4          ; r5 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r12, 10
    LDI r8, 0
    ADD r8, r5          ; r8 = remainder
    DIV r8, r12           ; r8 = tens digit
    LDI r2, 48
    ADD r2, r8           ; ASCII '0' + tens
    STORE r20, r2
    ADD r20, r11

    ; Ones: remainder % 10
    LDI r0, 0
    ADD r0, r5          ; r0 = remainder
    LDI r12, 10
    MOD r0, r12           ; r0 = ones digit
    LDI r2, 48
    ADD r2, r0           ; ASCII '0' + ones
    STORE r20, r2
    ADD r20, r11

    ; Null terminate
    LDI r2, 0
    STORE r20, r2

    ; Render counter text centered
    LDI r11, 70
    LDI r2, 80
    LDI r14, SCRATCH
    TEXT r11, r2, r14

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r13
    JZ r13, main_loop     ; no click → loop

    ; r13 = hit region id
    CMPI r13, 1
    JNZ r1, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r2, r20
    LDI r11, 1
    ADD r2, r11
    STORE r20, r2
    JMP main_loop

check_minus:
    CMPI r13, 2
    JNZ r1, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r2, r20
    LDI r11, 1
    SUB r2, r11
    STORE r20, r2
    JMP main_loop
