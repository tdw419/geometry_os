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
;   r13  - scratch / CMP result (clobbered by CMPI)
;   r0  - constant 1 (reloaded as needed)
;   r1  - scratch
;   r8  - scratch
;   r10  - color
;   r11  - divisor (10, 100)
;   r12 - counter value / hit query result
;   r5 - hundreds digit
;   r14 - hundreds * 100
;   r3 - remainder after hundreds
;   r4 - tens digit
;   r15 - ones digit
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
LDI r1, 0
STORE r20, r1

; Fill screen dark
LDI r1, 0x1A1A2E
FILL r1

; Register hit regions
LDI r0, 60
LDI r1, 150
LDI r8, 40
LDI r6, 40
HITSET r0, r1, r8, r6, 1       ; [+] button, id=1

LDI r0, 156
LDI r1, 150
LDI r8, 40
LDI r6, 40
HITSET r0, r1, r8, r6, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r0, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r1, 0x1A1A2E
    FILL r1

    ; Draw [+] button (green)
    LDI r0, 60
    LDI r1, 150
    LDI r8, 40
    LDI r6, 40
    LDI r10, 0x2ECC71
    RECTF r0, r1, r8, r6, r10

    ; Draw [-] button (red)
    LDI r0, 156
    LDI r1, 150
    LDI r8, 40
    LDI r6, 40
    LDI r10, 0xE74C3C
    RECTF r0, r1, r8, r6, r10

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r1, 43           ; '+'
    STORE r20, r1
    LDI r1, 0
    ADD r20, r0
    STORE r20, r1        ; null terminate

    LDI r0, 75
    LDI r1, 162
    LDI r8, SCRATCH
    TEXT r0, r1, r8

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r1, 45           ; '-'
    STORE r20, r1
    LDI r1, 0
    ADD r20, r0
    STORE r20, r1

    LDI r0, 171
    LDI r1, 162
    LDI r8, SCRATCH
    TEXT r0, r1, r8

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r0 = 1 (clobbered by button label rendering)
    LDI r0, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r1, 67            ; 'C'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 111           ; 'o'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 117           ; 'u'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 110           ; 'n'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 116           ; 't'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 32            ; ' '
    STORE r20, r1
    ADD r20, r0

    ; Load counter
    LDI r1, COUNT
    LOAD r12, r1          ; r12 = counter value

    ; Hundreds: r12 / 100
    LDI r11, 100
    LDI r5, 0
    ADD r5, r12          ; r5 = counter
    DIV r5, r11           ; r5 = hundreds digit
    LDI r1, 48
    ADD r1, r5           ; ASCII '0' + hundreds
    STORE r20, r1
    ADD r20, r0           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r14, 0
    ADD r14, r5          ; r14 = hundreds
    LDI r1, 100
    MUL r14, r1           ; r14 = hundreds * 100
    LDI r3, 0
    ADD r3, r12          ; r3 = counter
    SUB r3, r14          ; r3 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r11, 10
    LDI r4, 0
    ADD r4, r3          ; r4 = remainder
    DIV r4, r11           ; r4 = tens digit
    LDI r1, 48
    ADD r1, r4           ; ASCII '0' + tens
    STORE r20, r1
    ADD r20, r0

    ; Ones: remainder % 10
    LDI r15, 0
    ADD r15, r3          ; r15 = remainder
    LDI r11, 10
    MOD r15, r11           ; r15 = ones digit
    LDI r1, 48
    ADD r1, r15           ; ASCII '0' + ones
    STORE r20, r1
    ADD r20, r0

    ; Null terminate
    LDI r1, 0
    STORE r20, r1

    ; Render counter text centered
    LDI r0, 70
    LDI r1, 80
    LDI r8, SCRATCH
    TEXT r0, r1, r8

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r12
    JZ r12, main_loop     ; no click → loop

    ; r12 = hit region id
    CMPI r12, 1
    JNZ r13, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r1, r20
    LDI r0, 1
    ADD r1, r0
    STORE r20, r1
    JMP main_loop

check_minus:
    CMPI r12, 2
    JNZ r13, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r1, r20
    LDI r0, 1
    SUB r1, r0
    STORE r20, r1
    JMP main_loop
