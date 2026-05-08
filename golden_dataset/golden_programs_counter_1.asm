; DESCRIPTION: Display a object using color colored at the screen.

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
;   r12  - scratch / CMP result (clobbered by CMPI)
;   r5  - constant 1 (reloaded as needed)
;   r0  - scratch
;   r2  - scratch
;   r13  - color
;   r10  - divisor (10, 100)
;   r4 - counter value / hit query result
;   r7 - hundreds digit
;   r3 - hundreds * 100
;   r15 - remainder after hundreds
;   r14 - tens digit
;   r6 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r5, 1

; counter = 0
LDI r20, COUNT
LDI r0, 0
STORE r20, r0

; Fill screen dark
LDI r0, 0x1A1A2E
FILL r0

; Register hit regions
LDI r5, 60
LDI r0, 150
LDI r2, 40
LDI r1, 40
HITSET r5, r0, r2, r1, 1       ; [+] button, id=1

LDI r5, 156
LDI r0, 150
LDI r2, 40
LDI r1, 40
HITSET r5, r0, r2, r1, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r5, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r0, 0x1A1A2E
    FILL r0

    ; Draw [+] button (green)
    LDI r5, 60
    LDI r0, 150
    LDI r2, 40
    LDI r1, 40
    LDI r13, 0x2ECC71
    RECTF r5, r0, r2, r1, r13

    ; Draw [-] button (red)
    LDI r5, 156
    LDI r0, 150
    LDI r2, 40
    LDI r1, 40
    LDI r13, 0xE74C3C
    RECTF r5, r0, r2, r1, r13

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r0, 43           ; '+'
    STORE r20, r0
    LDI r0, 0
    ADD r20, r5
    STORE r20, r0        ; null terminate

    LDI r5, 75
    LDI r0, 162
    LDI r2, SCRATCH
    TEXT r5, r0, r2

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r0, 45           ; '-'
    STORE r20, r0
    LDI r0, 0
    ADD r20, r5
    STORE r20, r0

    LDI r5, 171
    LDI r0, 162
    LDI r2, SCRATCH
    TEXT r5, r0, r2

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r5 = 1 (clobbered by button label rendering)
    LDI r5, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r0, 67            ; 'C'
    STORE r20, r0
    ADD r20, r5
    LDI r0, 111           ; 'o'
    STORE r20, r0
    ADD r20, r5
    LDI r0, 117           ; 'u'
    STORE r20, r0
    ADD r20, r5
    LDI r0, 110           ; 'n'
    STORE r20, r0
    ADD r20, r5
    LDI r0, 116           ; 't'
    STORE r20, r0
    ADD r20, r5
    LDI r0, 32            ; ' '
    STORE r20, r0
    ADD r20, r5

    ; Load counter
    LDI r0, COUNT
    LOAD r4, r0          ; r4 = counter value

    ; Hundreds: r4 / 100
    LDI r10, 100
    LDI r7, 0
    ADD r7, r4          ; r7 = counter
    DIV r7, r10           ; r7 = hundreds digit
    LDI r0, 48
    ADD r0, r7           ; ASCII '0' + hundreds
    STORE r20, r0
    ADD r20, r5           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r3, 0
    ADD r3, r7          ; r3 = hundreds
    LDI r0, 100
    MUL r3, r0           ; r3 = hundreds * 100
    LDI r15, 0
    ADD r15, r4          ; r15 = counter
    SUB r15, r3          ; r15 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r10, 10
    LDI r14, 0
    ADD r14, r15          ; r14 = remainder
    DIV r14, r10           ; r14 = tens digit
    LDI r0, 48
    ADD r0, r14           ; ASCII '0' + tens
    STORE r20, r0
    ADD r20, r5

    ; Ones: remainder % 10
    LDI r6, 0
    ADD r6, r15          ; r6 = remainder
    LDI r10, 10
    MOD r6, r10           ; r6 = ones digit
    LDI r0, 48
    ADD r0, r6           ; ASCII '0' + ones
    STORE r20, r0
    ADD r20, r5

    ; Null terminate
    LDI r0, 0
    STORE r20, r0

    ; Render counter text centered
    LDI r5, 70
    LDI r0, 80
    LDI r2, SCRATCH
    TEXT r5, r0, r2

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r4
    JZ r4, main_loop     ; no click → loop

    ; r4 = hit region id
    CMPI r4, 1
    JNZ r12, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r0, r20
    LDI r5, 1
    ADD r0, r5
    STORE r20, r0
    JMP main_loop

check_minus:
    CMPI r4, 2
    JNZ r12, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r0, r20
    LDI r5, 1
    SUB r0, r5
    STORE r20, r0
    JMP main_loop
