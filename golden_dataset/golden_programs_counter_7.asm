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
;   r14  - scratch / CMP result (clobbered by CMPI)
;   r8  - constant 1 (reloaded as needed)
;   r0  - scratch
;   r1  - scratch
;   r10  - color
;   r12  - divisor (10, 100)
;   r5 - counter value / hit query result
;   r2 - hundreds digit
;   r13 - hundreds * 100
;   r4 - remainder after hundreds
;   r6 - tens digit
;   r9 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r8, 1

; counter = 0
LDI r20, COUNT
LDI r0, 0
STORE r20, r0

; Fill screen dark
LDI r0, 0x1A1A2E
FILL r0

; Register hit regions
LDI r8, 60
LDI r0, 150
LDI r1, 40
LDI r15, 40
HITSET r8, r0, r1, r15, 1       ; [+] button, id=1

LDI r8, 156
LDI r0, 150
LDI r1, 40
LDI r15, 40
HITSET r8, r0, r1, r15, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r8, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r0, 0x1A1A2E
    FILL r0

    ; Draw [+] button (green)
    LDI r8, 60
    LDI r0, 150
    LDI r1, 40
    LDI r15, 40
    LDI r10, 0x2ECC71
    RECTF r8, r0, r1, r15, r10

    ; Draw [-] button (red)
    LDI r8, 156
    LDI r0, 150
    LDI r1, 40
    LDI r15, 40
    LDI r10, 0xE74C3C
    RECTF r8, r0, r1, r15, r10

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r0, 43           ; '+'
    STORE r20, r0
    LDI r0, 0
    ADD r20, r8
    STORE r20, r0        ; null terminate

    LDI r8, 75
    LDI r0, 162
    LDI r1, SCRATCH
    TEXT r8, r0, r1

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r0, 45           ; '-'
    STORE r20, r0
    LDI r0, 0
    ADD r20, r8
    STORE r20, r0

    LDI r8, 171
    LDI r0, 162
    LDI r1, SCRATCH
    TEXT r8, r0, r1

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r8 = 1 (clobbered by button label rendering)
    LDI r8, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r0, 67            ; 'C'
    STORE r20, r0
    ADD r20, r8
    LDI r0, 111           ; 'o'
    STORE r20, r0
    ADD r20, r8
    LDI r0, 117           ; 'u'
    STORE r20, r0
    ADD r20, r8
    LDI r0, 110           ; 'n'
    STORE r20, r0
    ADD r20, r8
    LDI r0, 116           ; 't'
    STORE r20, r0
    ADD r20, r8
    LDI r0, 32            ; ' '
    STORE r20, r0
    ADD r20, r8

    ; Load counter
    LDI r0, COUNT
    LOAD r5, r0          ; r5 = counter value

    ; Hundreds: r5 / 100
    LDI r12, 100
    LDI r2, 0
    ADD r2, r5          ; r2 = counter
    DIV r2, r12           ; r2 = hundreds digit
    LDI r0, 48
    ADD r0, r2           ; ASCII '0' + hundreds
    STORE r20, r0
    ADD r20, r8           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r13, 0
    ADD r13, r2          ; r13 = hundreds
    LDI r0, 100
    MUL r13, r0           ; r13 = hundreds * 100
    LDI r4, 0
    ADD r4, r5          ; r4 = counter
    SUB r4, r13          ; r4 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r12, 10
    LDI r6, 0
    ADD r6, r4          ; r6 = remainder
    DIV r6, r12           ; r6 = tens digit
    LDI r0, 48
    ADD r0, r6           ; ASCII '0' + tens
    STORE r20, r0
    ADD r20, r8

    ; Ones: remainder % 10
    LDI r9, 0
    ADD r9, r4          ; r9 = remainder
    LDI r12, 10
    MOD r9, r12           ; r9 = ones digit
    LDI r0, 48
    ADD r0, r9           ; ASCII '0' + ones
    STORE r20, r0
    ADD r20, r8

    ; Null terminate
    LDI r0, 0
    STORE r20, r0

    ; Render counter text centered
    LDI r8, 70
    LDI r0, 80
    LDI r1, SCRATCH
    TEXT r8, r0, r1

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r5
    JZ r5, main_loop     ; no click → loop

    ; r5 = hit region id
    CMPI r5, 1
    JNZ r14, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r0, r20
    LDI r8, 1
    ADD r0, r8
    STORE r20, r0
    JMP main_loop

check_minus:
    CMPI r5, 2
    JNZ r14, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r0, r20
    LDI r8, 1
    SUB r0, r8
    STORE r20, r0
    JMP main_loop
