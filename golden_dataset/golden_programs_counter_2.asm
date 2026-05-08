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
;   r14  - scratch / CMP result (clobbered by CMPI)
;   r4  - constant 1 (reloaded as needed)
;   r2  - scratch
;   r5  - scratch
;   r15  - color
;   r3  - divisor (10, 100)
;   r1 - counter value / hit query result
;   r12 - hundreds digit
;   r11 - hundreds * 100
;   r8 - remainder after hundreds
;   r10 - tens digit
;   r0 - ones digit
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
LDI r2, 0
STORE r20, r2

; Fill screen dark
LDI r2, 0x1A1A2E
FILL r2

; Register hit regions
LDI r4, 60
LDI r2, 150
LDI r5, 40
LDI r9, 40
HITSET r4, r2, r5, r9, 1       ; [+] button, id=1

LDI r4, 156
LDI r2, 150
LDI r5, 40
LDI r9, 40
HITSET r4, r2, r5, r9, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r4, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r2, 0x1A1A2E
    FILL r2

    ; Draw [+] button (green)
    LDI r4, 60
    LDI r2, 150
    LDI r5, 40
    LDI r9, 40
    LDI r15, 0x2ECC71
    RECTF r4, r2, r5, r9, r15

    ; Draw [-] button (red)
    LDI r4, 156
    LDI r2, 150
    LDI r5, 40
    LDI r9, 40
    LDI r15, 0xE74C3C
    RECTF r4, r2, r5, r9, r15

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r2, 43           ; '+'
    STORE r20, r2
    LDI r2, 0
    ADD r20, r4
    STORE r20, r2        ; null terminate

    LDI r4, 75
    LDI r2, 162
    LDI r5, SCRATCH
    TEXT r4, r2, r5

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r2, 45           ; '-'
    STORE r20, r2
    LDI r2, 0
    ADD r20, r4
    STORE r20, r2

    LDI r4, 171
    LDI r2, 162
    LDI r5, SCRATCH
    TEXT r4, r2, r5

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r4 = 1 (clobbered by button label rendering)
    LDI r4, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r2, 67            ; 'C'
    STORE r20, r2
    ADD r20, r4
    LDI r2, 111           ; 'o'
    STORE r20, r2
    ADD r20, r4
    LDI r2, 117           ; 'u'
    STORE r20, r2
    ADD r20, r4
    LDI r2, 110           ; 'n'
    STORE r20, r2
    ADD r20, r4
    LDI r2, 116           ; 't'
    STORE r20, r2
    ADD r20, r4
    LDI r2, 32            ; ' '
    STORE r20, r2
    ADD r20, r4

    ; Load counter
    LDI r2, COUNT
    LOAD r1, r2          ; r1 = counter value

    ; Hundreds: r1 / 100
    LDI r3, 100
    LDI r12, 0
    ADD r12, r1          ; r12 = counter
    DIV r12, r3           ; r12 = hundreds digit
    LDI r2, 48
    ADD r2, r12           ; ASCII '0' + hundreds
    STORE r20, r2
    ADD r20, r4           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r11, 0
    ADD r11, r12          ; r11 = hundreds
    LDI r2, 100
    MUL r11, r2           ; r11 = hundreds * 100
    LDI r8, 0
    ADD r8, r1          ; r8 = counter
    SUB r8, r11          ; r8 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r3, 10
    LDI r10, 0
    ADD r10, r8          ; r10 = remainder
    DIV r10, r3           ; r10 = tens digit
    LDI r2, 48
    ADD r2, r10           ; ASCII '0' + tens
    STORE r20, r2
    ADD r20, r4

    ; Ones: remainder % 10
    LDI r0, 0
    ADD r0, r8          ; r0 = remainder
    LDI r3, 10
    MOD r0, r3           ; r0 = ones digit
    LDI r2, 48
    ADD r2, r0           ; ASCII '0' + ones
    STORE r20, r2
    ADD r20, r4

    ; Null terminate
    LDI r2, 0
    STORE r20, r2

    ; Render counter text centered
    LDI r4, 70
    LDI r2, 80
    LDI r5, SCRATCH
    TEXT r4, r2, r5

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r1
    JZ r1, main_loop     ; no click → loop

    ; r1 = hit region id
    CMPI r1, 1
    JNZ r14, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r2, r20
    LDI r4, 1
    ADD r2, r4
    STORE r20, r2
    JMP main_loop

check_minus:
    CMPI r1, 2
    JNZ r14, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r2, r20
    LDI r4, 1
    SUB r2, r4
    STORE r20, r2
    JMP main_loop
