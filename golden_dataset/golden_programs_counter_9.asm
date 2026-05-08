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
;   r13  - scratch / CMP result (clobbered by CMPI)
;   r14  - constant 1 (reloaded as needed)
;   r4  - scratch
;   r10  - scratch
;   r15  - color
;   r6  - divisor (10, 100)
;   r5 - counter value / hit query result
;   r7 - hundreds digit
;   r12 - hundreds * 100
;   r1 - remainder after hundreds
;   r2 - tens digit
;   r0 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r14, 1

; counter = 0
LDI r20, COUNT
LDI r4, 0
STORE r20, r4

; Fill screen dark
LDI r4, 0x1A1A2E
FILL r4

; Register hit regions
LDI r14, 60
LDI r4, 150
LDI r10, 40
LDI r11, 40
HITSET r14, r4, r10, r11, 1       ; [+] button, id=1

LDI r14, 156
LDI r4, 150
LDI r10, 40
LDI r11, 40
HITSET r14, r4, r10, r11, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r14, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r4, 0x1A1A2E
    FILL r4

    ; Draw [+] button (green)
    LDI r14, 60
    LDI r4, 150
    LDI r10, 40
    LDI r11, 40
    LDI r15, 0x2ECC71
    RECTF r14, r4, r10, r11, r15

    ; Draw [-] button (red)
    LDI r14, 156
    LDI r4, 150
    LDI r10, 40
    LDI r11, 40
    LDI r15, 0xE74C3C
    RECTF r14, r4, r10, r11, r15

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r4, 43           ; '+'
    STORE r20, r4
    LDI r4, 0
    ADD r20, r14
    STORE r20, r4        ; null terminate

    LDI r14, 75
    LDI r4, 162
    LDI r10, SCRATCH
    TEXT r14, r4, r10

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r4, 45           ; '-'
    STORE r20, r4
    LDI r4, 0
    ADD r20, r14
    STORE r20, r4

    LDI r14, 171
    LDI r4, 162
    LDI r10, SCRATCH
    TEXT r14, r4, r10

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r14 = 1 (clobbered by button label rendering)
    LDI r14, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r4, 67            ; 'C'
    STORE r20, r4
    ADD r20, r14
    LDI r4, 111           ; 'o'
    STORE r20, r4
    ADD r20, r14
    LDI r4, 117           ; 'u'
    STORE r20, r4
    ADD r20, r14
    LDI r4, 110           ; 'n'
    STORE r20, r4
    ADD r20, r14
    LDI r4, 116           ; 't'
    STORE r20, r4
    ADD r20, r14
    LDI r4, 32            ; ' '
    STORE r20, r4
    ADD r20, r14

    ; Load counter
    LDI r4, COUNT
    LOAD r5, r4          ; r5 = counter value

    ; Hundreds: r5 / 100
    LDI r6, 100
    LDI r7, 0
    ADD r7, r5          ; r7 = counter
    DIV r7, r6           ; r7 = hundreds digit
    LDI r4, 48
    ADD r4, r7           ; ASCII '0' + hundreds
    STORE r20, r4
    ADD r20, r14           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r12, 0
    ADD r12, r7          ; r12 = hundreds
    LDI r4, 100
    MUL r12, r4           ; r12 = hundreds * 100
    LDI r1, 0
    ADD r1, r5          ; r1 = counter
    SUB r1, r12          ; r1 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r6, 10
    LDI r2, 0
    ADD r2, r1          ; r2 = remainder
    DIV r2, r6           ; r2 = tens digit
    LDI r4, 48
    ADD r4, r2           ; ASCII '0' + tens
    STORE r20, r4
    ADD r20, r14

    ; Ones: remainder % 10
    LDI r0, 0
    ADD r0, r1          ; r0 = remainder
    LDI r6, 10
    MOD r0, r6           ; r0 = ones digit
    LDI r4, 48
    ADD r4, r0           ; ASCII '0' + ones
    STORE r20, r4
    ADD r20, r14

    ; Null terminate
    LDI r4, 0
    STORE r20, r4

    ; Render counter text centered
    LDI r14, 70
    LDI r4, 80
    LDI r10, SCRATCH
    TEXT r14, r4, r10

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r5
    JZ r5, main_loop     ; no click → loop

    ; r5 = hit region id
    CMPI r5, 1
    JNZ r13, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r4, r20
    LDI r14, 1
    ADD r4, r14
    STORE r20, r4
    JMP main_loop

check_minus:
    CMPI r5, 2
    JNZ r13, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r4, r20
    LDI r14, 1
    SUB r4, r14
    STORE r20, r4
    JMP main_loop
