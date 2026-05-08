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
;   r10  - scratch / CMP result (clobbered by CMPI)
;   r0  - constant 1 (reloaded as needed)
;   r14  - scratch
;   r3  - scratch
;   r8  - color
;   r1  - divisor (10, 100)
;   r13 - counter value / hit query result
;   r2 - hundreds digit
;   r11 - hundreds * 100
;   r12 - remainder after hundreds
;   r5 - tens digit
;   r4 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r0, 1

; counter = 0
LDI r20, COUNT
LDI r14, 0
STORE r20, r14

; Fill screen dark
LDI r14, 0x1A1A2E
FILL r14

; Register hit regions
LDI r0, 60
LDI r14, 150
LDI r3, 40
LDI r6, 40
HITSET r0, r14, r3, r6, 1       ; [+] button, id=1

LDI r0, 156
LDI r14, 150
LDI r3, 40
LDI r6, 40
HITSET r0, r14, r3, r6, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r0, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r14, 0x1A1A2E
    FILL r14

    ; Draw [+] button (green)
    LDI r0, 60
    LDI r14, 150
    LDI r3, 40
    LDI r6, 40
    LDI r8, 0x2ECC71
    RECTF r0, r14, r3, r6, r8

    ; Draw [-] button (red)
    LDI r0, 156
    LDI r14, 150
    LDI r3, 40
    LDI r6, 40
    LDI r8, 0xE74C3C
    RECTF r0, r14, r3, r6, r8

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r14, 43           ; '+'
    STORE r20, r14
    LDI r14, 0
    ADD r20, r0
    STORE r20, r14        ; null terminate

    LDI r0, 75
    LDI r14, 162
    LDI r3, SCRATCH
    TEXT r0, r14, r3

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r14, 45           ; '-'
    STORE r20, r14
    LDI r14, 0
    ADD r20, r0
    STORE r20, r14

    LDI r0, 171
    LDI r14, 162
    LDI r3, SCRATCH
    TEXT r0, r14, r3

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r0 = 1 (clobbered by button label rendering)
    LDI r0, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r14, 67            ; 'C'
    STORE r20, r14
    ADD r20, r0
    LDI r14, 111           ; 'o'
    STORE r20, r14
    ADD r20, r0
    LDI r14, 117           ; 'u'
    STORE r20, r14
    ADD r20, r0
    LDI r14, 110           ; 'n'
    STORE r20, r14
    ADD r20, r0
    LDI r14, 116           ; 't'
    STORE r20, r14
    ADD r20, r0
    LDI r14, 32            ; ' '
    STORE r20, r14
    ADD r20, r0

    ; Load counter
    LDI r14, COUNT
    LOAD r13, r14          ; r13 = counter value

    ; Hundreds: r13 / 100
    LDI r1, 100
    LDI r2, 0
    ADD r2, r13          ; r2 = counter
    DIV r2, r1           ; r2 = hundreds digit
    LDI r14, 48
    ADD r14, r2           ; ASCII '0' + hundreds
    STORE r20, r14
    ADD r20, r0           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r11, 0
    ADD r11, r2          ; r11 = hundreds
    LDI r14, 100
    MUL r11, r14           ; r11 = hundreds * 100
    LDI r12, 0
    ADD r12, r13          ; r12 = counter
    SUB r12, r11          ; r12 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r1, 10
    LDI r5, 0
    ADD r5, r12          ; r5 = remainder
    DIV r5, r1           ; r5 = tens digit
    LDI r14, 48
    ADD r14, r5           ; ASCII '0' + tens
    STORE r20, r14
    ADD r20, r0

    ; Ones: remainder % 10
    LDI r4, 0
    ADD r4, r12          ; r4 = remainder
    LDI r1, 10
    MOD r4, r1           ; r4 = ones digit
    LDI r14, 48
    ADD r14, r4           ; ASCII '0' + ones
    STORE r20, r14
    ADD r20, r0

    ; Null terminate
    LDI r14, 0
    STORE r20, r14

    ; Render counter text centered
    LDI r0, 70
    LDI r14, 80
    LDI r3, SCRATCH
    TEXT r0, r14, r3

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r13
    JZ r13, main_loop     ; no click → loop

    ; r13 = hit region id
    CMPI r13, 1
    JNZ r10, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r14, r20
    LDI r0, 1
    ADD r14, r0
    STORE r20, r14
    JMP main_loop

check_minus:
    CMPI r13, 2
    JNZ r10, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r14, r20
    LDI r0, 1
    SUB r14, r0
    STORE r20, r14
    JMP main_loop
