; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r13  - constant 1 (reloaded as needed)
;   r15  - scratch
;   r5  - scratch
;   r12  - color
;   r6  - divisor (10, 100)
;   r3 - counter value / hit query result
;   r7 - hundreds digit
;   r4 - hundreds * 100
;   r10 - remainder after hundreds
;   r0 - tens digit
;   r14 - ones digit
;   r20 - RAM pointer
;
; NOTE: The assembler's label detector uses line.find(':'), so we
;       avoid colons inside quoted strings to prevent misparse.

#define COUNT   0x100
#define SCRATCH 0x200

; ── INIT ──────────────────────────────────────
LDI r13, 1

; counter = 0
LDI r20, COUNT
LDI r15, 0
STORE r20, r15

; Fill screen dark
LDI r15, 0x1A1A2E
FILL r15

; Register hit regions
LDI r13, 60
LDI r15, 150
LDI r5, 40
LDI r8, 40
HITSET r13, r15, r5, r8, 1       ; [+] button, id=1

LDI r13, 156
LDI r15, 150
LDI r5, 40
LDI r8, 40
HITSET r13, r15, r5, r8, 2       ; [-] button, id=2

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r13, 1

    ; ── DRAW ──

    ; Clear screen
    LDI r15, 0x1A1A2E
    FILL r15

    ; Draw [+] button (green)
    LDI r13, 60
    LDI r15, 150
    LDI r5, 40
    LDI r8, 40
    LDI r12, 0x2ECC71
    RECTF r13, r15, r5, r8, r12

    ; Draw [-] button (red)
    LDI r13, 156
    LDI r15, 150
    LDI r5, 40
    LDI r8, 40
    LDI r12, 0xE74C3C
    RECTF r13, r15, r5, r8, r12

    ; "+" label at center of green button
    LDI r20, SCRATCH
    LDI r15, 43           ; '+'
    STORE r20, r15
    LDI r15, 0
    ADD r20, r13
    STORE r20, r15        ; null terminate

    LDI r13, 75
    LDI r15, 162
    LDI r5, SCRATCH
    TEXT r13, r15, r5

    ; "-" label at center of red button
    LDI r20, SCRATCH
    LDI r15, 45           ; '-'
    STORE r20, r15
    LDI r15, 0
    ADD r20, r13
    STORE r20, r15

    LDI r13, 171
    LDI r15, 162
    LDI r5, SCRATCH
    TEXT r13, r15, r5

    ; ── Render counter value ──
    ; Build "Count XXX" in scratch buffer (no colon to avoid label misparse)
    ; Restore r13 = 1 (clobbered by button label rendering)
    LDI r13, 1
    ; "Count " = 67 111 117 110 116 32
    LDI r20, SCRATCH
    LDI r15, 67            ; 'C'
    STORE r20, r15
    ADD r20, r13
    LDI r15, 111           ; 'o'
    STORE r20, r15
    ADD r20, r13
    LDI r15, 117           ; 'u'
    STORE r20, r15
    ADD r20, r13
    LDI r15, 110           ; 'n'
    STORE r20, r15
    ADD r20, r13
    LDI r15, 116           ; 't'
    STORE r20, r15
    ADD r20, r13
    LDI r15, 32            ; ' '
    STORE r20, r15
    ADD r20, r13

    ; Load counter
    LDI r15, COUNT
    LOAD r3, r15          ; r3 = counter value

    ; Hundreds: r3 / 100
    LDI r6, 100
    LDI r7, 0
    ADD r7, r3          ; r7 = counter
    DIV r7, r6           ; r7 = hundreds digit
    LDI r15, 48
    ADD r15, r7           ; ASCII '0' + hundreds
    STORE r20, r15
    ADD r20, r13           ; advance pointer

    ; Remainder = counter - hundreds*100
    LDI r4, 0
    ADD r4, r7          ; r4 = hundreds
    LDI r15, 100
    MUL r4, r15           ; r4 = hundreds * 100
    LDI r10, 0
    ADD r10, r3          ; r10 = counter
    SUB r10, r4          ; r10 = remainder (0..99)

    ; Tens: remainder / 10
    LDI r6, 10
    LDI r0, 0
    ADD r0, r10          ; r0 = remainder
    DIV r0, r6           ; r0 = tens digit
    LDI r15, 48
    ADD r15, r0           ; ASCII '0' + tens
    STORE r20, r15
    ADD r20, r13

    ; Ones: remainder % 10
    LDI r14, 0
    ADD r14, r10          ; r14 = remainder
    LDI r6, 10
    MOD r14, r6           ; r14 = ones digit
    LDI r15, 48
    ADD r15, r14           ; ASCII '0' + ones
    STORE r20, r15
    ADD r20, r13

    ; Null terminate
    LDI r15, 0
    STORE r20, r15

    ; Render counter text centered
    LDI r13, 70
    LDI r15, 80
    LDI r5, SCRATCH
    TEXT r13, r15, r5

    ; ── FRAME ──
    FRAME

    ; ── HIT CHECK ──
    HITQ r3
    JZ r3, main_loop     ; no click → loop

    ; r3 = hit region id
    CMPI r3, 1
    JNZ r1, check_minus

    ; id=1 → increment
    LDI r20, COUNT
    LOAD r15, r20
    LDI r13, 1
    ADD r15, r13
    STORE r20, r15
    JMP main_loop

check_minus:
    CMPI r3, 2
    JNZ r1, main_loop    ; unknown id → ignore
    ; id=2 → decrement
    LDI r20, COUNT
    LOAD r15, r20
    LDI r13, 1
    SUB r15, r13
    STORE r20, r15
    JMP main_loop
