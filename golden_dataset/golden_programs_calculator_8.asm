; DESCRIPTION: Render a red object at the screen.

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
;   r6  = CMP result (clobbered by CMP)
;   r3  = state (0=first, 1=op entered, 2=second)
;   r14  = first number accumulator
;   r9  = operator (43='+', 45='-')
;   r11  = second number accumulator
;   r2  = result / number to convert
;   r10  = 0xFFFF (keyboard port)
;   r8  = key value
;   r0  = 48 (ASCII '0') -- constant
;   r12  = 10 -- constant
;   r1 = 0 -- constant
;   r13 = 1 -- constant
;   r4-r15 = temps
;   r5 = text buffer pointer
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
    LDI r0, 48
    LDI r12, 10
    LDI r1, 0
    LDI r13, 1
    LDI r10, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r3, 0
    LDI r14, 0
    LDI r9, 0
    LDI r11, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r8, r10
    CMP r8, r1
    JZ r6, poll
    LDI r4, 0x0370
    STORE r4, r8
    LDI r8, 0
    STORE r10, r8
    LOAD r8, r4

    ; Check Q (quit)
    LDI r4, 81
    CMP r8, r4
    JNZ r6, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r4, 61
    CMP r8, r4
    JNZ r6, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r4, 48
    CMP r8, r4
    ADD r6, r13
    JZ r6, chk_op
    LDI r4, 57
    CMP r8, r4
    LDI r7, 1
    CMP r6, r7
    JZ r6, chk_op
    ; Is a digit: r8 = digit value
    SUB r8, r0
    ; Branch on state
    CMP r3, r1
    JZ r6, dig_first
    ; State 1 or 2: accumulate in r11
    MUL r11, r12
    ADD r11, r8
    LDI r3, 2
    JMP poll

dig_first:
    MUL r14, r12
    ADD r14, r8
    JMP poll

chk_op:
    ; Check + (43)
    LDI r4, 43
    CMP r8, r4
    JNZ r6, chk_min
    CMP r3, r1
    JNZ r6, poll
    LDI r9, 43
    LDI r3, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r4, 45
    CMP r8, r4
    JNZ r6, poll
    CMP r3, r1
    JNZ r6, poll
    LDI r9, 45
    LDI r3, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r2, r2
    ADD r2, r14
    LDI r4, 43
    CMP r9, r4
    JZ r6, do_add
    SUB r2, r11
    JMP build

do_add:
    ADD r2, r11

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r4, 0x0380
    STORE r4, r2
    ; Convert first number to string at 0x0300
    LDI r5, 0x0300
    XOR r2, r2
    ADD r2, r14
    CALL nts
    ; Append operator character
    STORE r5, r9
    ADD r5, r13
    ; Convert second number to string
    XOR r2, r2
    ADD r2, r11
    CALL nts
    ; Append '='
    LDI r4, 61
    STORE r5, r4
    ADD r5, r13
    ; Convert result to string
    LDI r4, 0x0380
    LOAD r2, r4
    CALL nts
    ; Null-terminate
    LDI r4, 0
    STORE r5, r4
    ; Render text at screen (0, 0)
    LDI r4, 0x0300
    TEXT r1, r1, r4
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r2 = number to convert, r5 = buffer address
; Output: digits written to buffer, r5 advanced past string
; Clobbers: r6, r4, r7, r15
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r2, r1
    JNZ r6, nts_l1
    ; Handle zero
    LDI r4, 48
    STORE r5, r4
    ADD r5, r13
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r15, 0x0350
    LDI r4, 0x0364
    STORE r4, r15
    LDI r7, 0
    LDI r4, 0x0360
    STORE r4, r7

nts_l2:
    ; Loop: extract digits from right
    CMP r2, r1
    JZ r6, nts_r1
    ; quotient = number / 10
    XOR r7, r7
    ADD r7, r2
    DIV r7, r12
    ; Save quotient
    LDI r4, 0x0362
    STORE r4, r7
    ; remainder = number - quotient * 10
    XOR r4, r4
    ADD r4, r7
    MUL r4, r12
    SUB r2, r4
    ; Convert to ASCII
    ADD r2, r0
    ; Store in reversed buffer
    LDI r4, 0x0364
    LOAD r15, r4
    STORE r15, r2
    ADD r15, r13
    LDI r4, 0x0364
    STORE r4, r15
    ; Increment digit count
    LDI r4, 0x0360
    LOAD r7, r4
    ADD r7, r13
    STORE r4, r7
    ; number = quotient
    LDI r4, 0x0362
    LOAD r2, r4
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r4, 0x0360
    LOAD r15, r4
    LDI r7, 0x0350

nts_r2:
    CMP r15, r1
    JZ r6, nts_end
    SUB r15, r13
    XOR r4, r4
    ADD r4, r7
    ADD r4, r15
    LOAD r4, r4
    STORE r5, r4
    ADD r5, r13
    JMP nts_r2

nts_end:
    RET
