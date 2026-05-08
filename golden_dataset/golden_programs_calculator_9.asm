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
;   r2  = CMP result (clobbered by CMP)
;   r13  = state (0=first, 1=op entered, 2=second)
;   r5  = first number accumulator
;   r3  = operator (43='+', 45='-')
;   r0  = second number accumulator
;   r15  = result / number to convert
;   r12  = 0xFFFF (keyboard port)
;   r8  = key value
;   r11  = 48 (ASCII '0') -- constant
;   r9  = 10 -- constant
;   r4 = 0 -- constant
;   r6 = 1 -- constant
;   r7-r14 = temps
;   r10 = text buffer pointer
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
    LDI r11, 48
    LDI r9, 10
    LDI r4, 0
    LDI r6, 1
    LDI r12, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r13, 0
    LDI r5, 0
    LDI r3, 0
    LDI r0, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r8, r12
    CMP r8, r4
    JZ r2, poll
    LDI r7, 0x0370
    STORE r7, r8
    LDI r8, 0
    STORE r12, r8
    LOAD r8, r7

    ; Check Q (quit)
    LDI r7, 81
    CMP r8, r7
    JNZ r2, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r7, 61
    CMP r8, r7
    JNZ r2, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r7, 48
    CMP r8, r7
    ADD r2, r6
    JZ r2, chk_op
    LDI r7, 57
    CMP r8, r7
    LDI r1, 1
    CMP r2, r1
    JZ r2, chk_op
    ; Is a digit: r8 = digit value
    SUB r8, r11
    ; Branch on state
    CMP r13, r4
    JZ r2, dig_first
    ; State 1 or 2: accumulate in r0
    MUL r0, r9
    ADD r0, r8
    LDI r13, 2
    JMP poll

dig_first:
    MUL r5, r9
    ADD r5, r8
    JMP poll

chk_op:
    ; Check + (43)
    LDI r7, 43
    CMP r8, r7
    JNZ r2, chk_min
    CMP r13, r4
    JNZ r2, poll
    LDI r3, 43
    LDI r13, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r7, 45
    CMP r8, r7
    JNZ r2, poll
    CMP r13, r4
    JNZ r2, poll
    LDI r3, 45
    LDI r13, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r15, r15
    ADD r15, r5
    LDI r7, 43
    CMP r3, r7
    JZ r2, do_add
    SUB r15, r0
    JMP build

do_add:
    ADD r15, r0

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r7, 0x0380
    STORE r7, r15
    ; Convert first number to string at 0x0300
    LDI r10, 0x0300
    XOR r15, r15
    ADD r15, r5
    CALL nts
    ; Append operator character
    STORE r10, r3
    ADD r10, r6
    ; Convert second number to string
    XOR r15, r15
    ADD r15, r0
    CALL nts
    ; Append '='
    LDI r7, 61
    STORE r10, r7
    ADD r10, r6
    ; Convert result to string
    LDI r7, 0x0380
    LOAD r15, r7
    CALL nts
    ; Null-terminate
    LDI r7, 0
    STORE r10, r7
    ; Render text at screen (0, 0)
    LDI r7, 0x0300
    TEXT r4, r4, r7
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r15 = number to convert, r10 = buffer address
; Output: digits written to buffer, r10 advanced past string
; Clobbers: r2, r7, r1, r14
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r15, r4
    JNZ r2, nts_l1
    ; Handle zero
    LDI r7, 48
    STORE r10, r7
    ADD r10, r6
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r14, 0x0350
    LDI r7, 0x0364
    STORE r7, r14
    LDI r1, 0
    LDI r7, 0x0360
    STORE r7, r1

nts_l2:
    ; Loop: extract digits from right
    CMP r15, r4
    JZ r2, nts_r1
    ; quotient = number / 10
    XOR r1, r1
    ADD r1, r15
    DIV r1, r9
    ; Save quotient
    LDI r7, 0x0362
    STORE r7, r1
    ; remainder = number - quotient * 10
    XOR r7, r7
    ADD r7, r1
    MUL r7, r9
    SUB r15, r7
    ; Convert to ASCII
    ADD r15, r11
    ; Store in reversed buffer
    LDI r7, 0x0364
    LOAD r14, r7
    STORE r14, r15
    ADD r14, r6
    LDI r7, 0x0364
    STORE r7, r14
    ; Increment digit count
    LDI r7, 0x0360
    LOAD r1, r7
    ADD r1, r6
    STORE r7, r1
    ; number = quotient
    LDI r7, 0x0362
    LOAD r15, r7
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r7, 0x0360
    LOAD r14, r7
    LDI r1, 0x0350

nts_r2:
    CMP r14, r4
    JZ r2, nts_end
    SUB r14, r6
    XOR r7, r7
    ADD r7, r1
    ADD r7, r14
    LOAD r7, r7
    STORE r10, r7
    ADD r10, r6
    JMP nts_r2

nts_end:
    RET
