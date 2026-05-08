; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
;   r12  - constant 1 (reloaded as needed)
;   r3  - scratch
;   r10  - scratch
;   r7  - color
;   r15  - divisor (10, 100)
;   r0 - counter value / hit query result
;   r14 - hundreds digit
;   r13 - hundreds * 100
;   r11 - remainder after hundreds
;   r1 - tens digit
;   r5 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r12, 1

; counter = 0
LDI r20, COUNT
LDI r3, 0
STORE r20, r3

; Fill screen dark
LDI r3, 0x1A1A2E
FILL r3

; Register hit regions
LDI r12, 60
LDI r3, 150
LDI r10, 40
LDI r6, 40
HITSET r12, r3, r10, r6, 1       ; [+] button, id=1

LDI r12, 156
LDI r3, 150
LDI r10, 40
LDI r6, 40
HITSET r12, r3, r10, r6, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r12, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r3, 0x1A1A2E
    FILL r3

    ; Draw [+] button (green)
    LDI r12, 60
    LDI r3, 150
    LDI r10, 40
    LDI r6, 40
    LDI r7, 0x2ECC71
    RECTF r12, r3, r10, r6, r7

    ; Draw [-] button (red)
    LDI r12, 156
    LDI r3, 150
    LDI r10, 40
    LDI r6, 40
    LDI r7, 0xE74C3C
    RECTF r12, r3, r10, r6, r7

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r3, 43           ; '+'
    STORE r20, r3
    LDI r3, 0
    ADD r20, r12
    STORE r20, r3        ; null terminate

    LDI r12, 75
    LDI r3, 162
    LDI r10, SCRATCH
    TEXT r12, r3, r10

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r3, 45           ; '-'
    STORE r20, r3
    LDI r3, 0
    ADD r20, r12
    STORE r20, r3

    LDI r12, 171
    LDI r3, 162
    LDI r10, SCRATCH
    TEXT r12, r3, r10

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r12 = 1 (clobbered by button label rendering)
    LDI r12, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r3, 67            ; 'C'
    STORE r20, r3
    ADD r20, r12
    LDI r3, 111           ; 'o'
    STORE r20, r3
    ADD r20, r12
    LDI r3, 117           ; 'u'
    STORE r20, r3
    ADD r20, r12
    LDI r3, 110           ; 'n'
    STORE r20, r3
    ADD r20, r12
    LDI r3, 116           ; 't'
    STORE r20, r3
    ADD r20, r12
    LDI r3, 32            ; ' '
    STORE r20, r3
    ADD r20, r12

    ; Load counter
    LDI r3, COUNT
    LOAD r0, r3          ; r0 = counter value

    ; Hundreds: r0 / 100
    LDI r15, 100
    LDI r14, 0
    ADD r14, r0          ; r14 = counter
    DIV r14, r15           ; r14 = hundreds digit
    LDI r3, 48
    ADD r3, r14           ; ASCII '0' + hundreds
    STORE r20, r3
    ADD r20, r12           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r13, 0
    ADD r13, r14          ; r13 = hundreds
    LDI r3, 100
    MUL r13, r3           ; r13 = hundreds * 100
    LDI r11, 0
    ADD r11, r0          ; r11 = counter
    SUB r11, r13          ; r11 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r15, 10
    LDI r1, 0
    ADD r1, r11          ; r1 = remainder
    DIV r1, r15           ; r1 = tens digit
    LDI r3, 48
    ADD r3, r1           ; ASCII '0' + tens
    STORE r20, r3
    ADD r20, r12

    ; Ones: remainder % 10
    LDI r5, 0
    ADD r5, r11          ; r5 = remainder
    LDI r15, 10
    MOD r5, r15           ; r5 = ones digit
    LDI r3, 48
    ADD r3, r5           ; ASCII '0' + ones
    STORE r20, r3
    ADD r20, r12

    ; Null terminate
    LDI r3, 0
    STORE r20, r3

    ; Render counter text centered
    LDI r12, 70
    LDI r3, 80
    LDI r10, SCRATCH
    TEXT r12, r3, r10

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r0
    JZ r0, main_loop     ; no click → loop

    ; r0 = hit region id
    CMPI r0, 1
    JNZ r4, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r3, r20
    LDI r12, 1
    ADD r3, r12
    STORE r20, r3
    JMP main_loop

check_minus:
    CMPI r0, 2
    JNZ r4, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r3, r20
    LDI r12, 1
    SUB r3, r12
    STORE r20, r3
    JMP main_loop
