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
;   r7  - scratch / CMP result (clobbered by CMPI)
;   r6  - constant 1 (reloaded as needed)
;   r8  - scratch
;   r2  - scratch
;   r15  - color
;   r3  - divisor (10, 100)
;   r13 - counter value / hit query result
;   r1 - hundreds digit
;   r14 - hundreds * 100
;   r5 - remainder after hundreds
;   r12 - tens digit
;   r10 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r6, 1

; counter = 0
LDI r20, COUNT
LDI r8, 0
STORE r20, r8

; Fill screen dark
LDI r8, 0x1A1A2E
FILL r8

; Register hit regions
LDI r6, 60
LDI r8, 150
LDI r2, 40
LDI r4, 40
HITSET r6, r8, r2, r4, 1       ; [+] button, id=1

LDI r6, 156
LDI r8, 150
LDI r2, 40
LDI r4, 40
HITSET r6, r8, r2, r4, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r6, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r8, 0x1A1A2E
    FILL r8

    ; Draw [+] button (green)
    LDI r6, 60
    LDI r8, 150
    LDI r2, 40
    LDI r4, 40
    LDI r15, 0x2ECC71
    RECTF r6, r8, r2, r4, r15

    ; Draw [-] button (red)
    LDI r6, 156
    LDI r8, 150
    LDI r2, 40
    LDI r4, 40
    LDI r15, 0xE74C3C
    RECTF r6, r8, r2, r4, r15

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r8, 43           ; '+'
    STORE r20, r8
    LDI r8, 0
    ADD r20, r6
    STORE r20, r8        ; null terminate

    LDI r6, 75
    LDI r8, 162
    LDI r2, SCRATCH
    TEXT r6, r8, r2

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r8, 45           ; '-'
    STORE r20, r8
    LDI r8, 0
    ADD r20, r6
    STORE r20, r8

    LDI r6, 171
    LDI r8, 162
    LDI r2, SCRATCH
    TEXT r6, r8, r2

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r6 = 1 (clobbered by button label rendering)
    LDI r6, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r8, 67            ; 'C'
    STORE r20, r8
    ADD r20, r6
    LDI r8, 111           ; 'o'
    STORE r20, r8
    ADD r20, r6
    LDI r8, 117           ; 'u'
    STORE r20, r8
    ADD r20, r6
    LDI r8, 110           ; 'n'
    STORE r20, r8
    ADD r20, r6
    LDI r8, 116           ; 't'
    STORE r20, r8
    ADD r20, r6
    LDI r8, 32            ; ' '
    STORE r20, r8
    ADD r20, r6

    ; Load counter
    LDI r8, COUNT
    LOAD r13, r8          ; r13 = counter value

    ; Hundreds: r13 / 100
    LDI r3, 100
    LDI r1, 0
    ADD r1, r13          ; r1 = counter
    DIV r1, r3           ; r1 = hundreds digit
    LDI r8, 48
    ADD r8, r1           ; ASCII '0' + hundreds
    STORE r20, r8
    ADD r20, r6           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r14, 0
    ADD r14, r1          ; r14 = hundreds
    LDI r8, 100
    MUL r14, r8           ; r14 = hundreds * 100
    LDI r5, 0
    ADD r5, r13          ; r5 = counter
    SUB r5, r14          ; r5 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r3, 10
    LDI r12, 0
    ADD r12, r5          ; r12 = remainder
    DIV r12, r3           ; r12 = tens digit
    LDI r8, 48
    ADD r8, r12           ; ASCII '0' + tens
    STORE r20, r8
    ADD r20, r6

    ; Ones: remainder % 10
    LDI r10, 0
    ADD r10, r5          ; r10 = remainder
    LDI r3, 10
    MOD r10, r3           ; r10 = ones digit
    LDI r8, 48
    ADD r8, r10           ; ASCII '0' + ones
    STORE r20, r8
    ADD r20, r6

    ; Null terminate
    LDI r8, 0
    STORE r20, r8

    ; Render counter text centered
    LDI r6, 70
    LDI r8, 80
    LDI r2, SCRATCH
    TEXT r6, r8, r2

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r13
    JZ r13, main_loop     ; no click → loop

    ; r13 = hit region id
    CMPI r13, 1
    JNZ r7, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r8, r20
    LDI r6, 1
    ADD r8, r6
    STORE r20, r8
    JMP main_loop

check_minus:
    CMPI r13, 2
    JNZ r7, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r8, r20
    LDI r6, 1
    SUB r8, r6
    STORE r20, r8
    JMP main_loop
