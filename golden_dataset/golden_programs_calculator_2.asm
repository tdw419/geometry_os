; DESCRIPTION: This GeOS assembly code implements a simple add/subtract calculator with text display. It reads user input from the keyboard for digits and operators (+, -, =), performs arithmetic operations based on the entered values, converts the result to a string, and displays "X+Y=Z" or "X-Y=Z" on the screen before halting.

; CALCULATOR: Add/subtract calculator with text display
;
; Controls:
;   0-9: enter digits
;   +: add operator
;   -: subtract operator
;   =: compute and display result
;   Q: quit (halt)
;
; After pressing =, displays "X+Y=Z" or "X-Y=Z" and halts.
;
; Register allocation:
;   r3  = CMP result (clobbered by CMP)
;   r15  = state (0=first, 1=op entered, 2=second)
;   r13  = first number accumulator
;   r7  = operator (43='+', 45='-')
;   r8  = second number accumulator
;   r10  = result / number to convert
;   r0  = 0xFFFF (keyboard port)
;   r5  = key value
;   r14  = 48 (ASCII '0') -- constant
;   r2  = 10 -- constant
;   r6 = 0 -- constant
;   r4 = 1 -- constant
;   r9-r12 = temps
;   r1 = text buffer pointer
;   r31 = return address (CALL/RET)
;
; RAM layout:
;   0x0300-0x031F = display text buffer
;   0x0350-0x035F = reversed digit temp buffer
;   0x0360        = digit count
;   0x0362        = quotient temp
;   0x0364        = buffer pointer temp
;   0x0370        = key save temp
;   0x0380        = result save

; ── Constants ──────────────────────────────────────────────────
    LDI r14, 48
    LDI r2, 10
    LDI r6, 0
    LDI r4, 1
    LDI r0, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r15, 0
    LDI r13, 0
    LDI r7, 0
    LDI r8, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r5, r0
    CMP r5, r6
    JZ r3, poll
    LDI r9, 0x0370
    STORE r9, r5
    LDI r5, 0
    STORE r0, r5
    LOAD r5, r9

    ; Check Q (quit)
    LDI r9, 81
    CMP r5, r9
    JNZ r3, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r9, 61
    CMP r5, r9
    JNZ r3, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r9, 48
    CMP r5, r9
    ADD r3, r4
    JZ r3, chk_op
    LDI r9, 57
    CMP r5, r9
    LDI r11, 1
    CMP r3, r11
    JZ r3, chk_op
    ; Is a digit: r5 = digit value
    SUB r5, r14
    ; Branch on state
    CMP r15, r6
    JZ r3, dig_first
    ; State 1 or 2: accumulate in r8
    MUL r8, r2
    ADD r8, r5
    LDI r15, 2
    JMP poll

dig_first:
    MUL r13, r2
    ADD r13, r5
    JMP poll

chk_op:
    ; Check + (43)
    LDI r9, 43
    CMP r5, r9
    JNZ r3, chk_min
    CMP r15, r6
    JNZ r3, poll
    LDI r7, 43
    LDI r15, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r9, 45
    CMP r5, r9
    JNZ r3, poll
    CMP r15, r6
    JNZ r3, poll
    LDI r7, 45
    LDI r15, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r10, r10
    ADD r10, r13
    LDI r9, 43
    CMP r7, r9
    JZ r3, do_add
    SUB r10, r8
    JMP build

do_add:
    ADD r10, r8

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r9, 0x0380
    STORE r9, r10
    ; Convert first number to string at 0x0300
    LDI r1, 0x0300
    XOR r10, r10
    ADD r10, r13
    CALL nts
    ; Append operator character
    STORE r1, r7
    ADD r1, r4
    ; Convert second number to string
    XOR r10, r10
    ADD r10, r8
    CALL nts
    ; Append '='
    LDI r9, 61
    STORE r1, r9
    ADD r1, r4
    ; Convert result to string
    LDI r9, 0x0380
    LOAD r10, r9
    CALL nts
    ; Null-terminate
    LDI r9, 0
    STORE r1, r9
    ; Render text at screen (0, 0)
    LDI r9, 0x0300
    TEXT r6, r6, r9
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r10 = number to convert, r1 = buffer address
; Output: digits written to buffer, r1 advanced past string
; Clobbers: r3, r9, r11, r12
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r10, r6
    JNZ r3, nts_l1
    ; Handle zero
    LDI r9, 48
    STORE r1, r9
    ADD r1, r4
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r12, 0x0350
    LDI r9, 0x0364
    STORE r9, r12
    LDI r11, 0
    LDI r9, 0x0360
    STORE r9, r11

nts_l2:
    ; Loop: extract digits from right
    CMP r10, r6
    JZ r3, nts_r1
    ; quotient = number / 10
    XOR r11, r11
    ADD r11, r10
    DIV r11, r2
    ; Save quotient
    LDI r9, 0x0362
    STORE r9, r11
    ; remainder = number - quotient * 10
    XOR r9, r9
    ADD r9, r11
    MUL r9, r2
    SUB r10, r9
    ; Convert to ASCII
    ADD r10, r14
    ; Store in reversed buffer
    LDI r9, 0x0364
    LOAD r12, r9
    STORE r12, r10
    ADD r12, r4
    LDI r9, 0x0364
    STORE r9, r12
    ; Increment digit count
    LDI r9, 0x0360
    LOAD r11, r9
    ADD r11, r4
    STORE r9, r11
    ; number = quotient
    LDI r9, 0x0362
    LOAD r10, r9
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r9, 0x0360
    LOAD r12, r9
    LDI r11, 0x0350

nts_r2:
    CMP r12, r6
    JZ r3, nts_end
    SUB r12, r4
    XOR r9, r9
    ADD r9, r11
    ADD r9, r12
    LOAD r9, r9
    STORE r1, r9
    ADD r1, r4
    JMP nts_r2

nts_end:
    RET
