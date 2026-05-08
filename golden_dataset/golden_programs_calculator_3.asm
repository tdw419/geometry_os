; DESCRIPTION: Geometry OS program to draw a red object.

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
;   r10  = CMP result (clobbered by CMP)
;   r2  = state (0=first, 1=op entered, 2=second)
;   r7  = first number accumulator
;   r15  = operator (43='+', 45='-')
;   r9  = second number accumulator
;   r1  = result / number to convert
;   r0  = 0xFFFF (keyboard port)
;   r11  = key value
;   r4  = 48 (ASCII '0') -- constant
;   r14  = 10 -- constant
;   r3 = 0 -- constant
;   r6 = 1 -- constant
;   r8-r13 = temps
;   r12 = text buffer pointer
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
    LDI r4, 48
    LDI r14, 10
    LDI r3, 0
    LDI r6, 1
    LDI r0, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r2, 0
    LDI r7, 0
    LDI r15, 0
    LDI r9, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r11, r0
    CMP r11, r3
    JZ r10, poll
    LDI r8, 0x0370
    STORE r8, r11
    LDI r11, 0
    STORE r0, r11
    LOAD r11, r8

    ; Check Q (quit)
    LDI r8, 81
    CMP r11, r8
    JNZ r10, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r8, 61
    CMP r11, r8
    JNZ r10, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r8, 48
    CMP r11, r8
    ADD r10, r6
    JZ r10, chk_op
    LDI r8, 57
    CMP r11, r8
    LDI r5, 1
    CMP r10, r5
    JZ r10, chk_op
    ; Is a digit: r11 = digit value
    SUB r11, r4
    ; Branch on state
    CMP r2, r3
    JZ r10, dig_first
    ; State 1 or 2: accumulate in r9
    MUL r9, r14
    ADD r9, r11
    LDI r2, 2
    JMP poll

dig_first:
    MUL r7, r14
    ADD r7, r11
    JMP poll

chk_op:
    ; Check + (43)
    LDI r8, 43
    CMP r11, r8
    JNZ r10, chk_min
    CMP r2, r3
    JNZ r10, poll
    LDI r15, 43
    LDI r2, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r8, 45
    CMP r11, r8
    JNZ r10, poll
    CMP r2, r3
    JNZ r10, poll
    LDI r15, 45
    LDI r2, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r1, r1
    ADD r1, r7
    LDI r8, 43
    CMP r15, r8
    JZ r10, do_add
    SUB r1, r9
    JMP build

do_add:
    ADD r1, r9

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r8, 0x0380
    STORE r8, r1
    ; Convert first number to string at 0x0300
    LDI r12, 0x0300
    XOR r1, r1
    ADD r1, r7
    CALL nts
    ; Append operator character
    STORE r12, r15
    ADD r12, r6
    ; Convert second number to string
    XOR r1, r1
    ADD r1, r9
    CALL nts
    ; Append '='
    LDI r8, 61
    STORE r12, r8
    ADD r12, r6
    ; Convert result to string
    LDI r8, 0x0380
    LOAD r1, r8
    CALL nts
    ; Null-terminate
    LDI r8, 0
    STORE r12, r8
    ; Render text at screen (0, 0)
    LDI r8, 0x0300
    TEXT r3, r3, r8
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r1 = number to convert, r12 = buffer address
; Output: digits written to buffer, r12 advanced past string
; Clobbers: r10, r8, r5, r13
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r1, r3
    JNZ r10, nts_l1
    ; Handle zero
    LDI r8, 48
    STORE r12, r8
    ADD r12, r6
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r13, 0x0350
    LDI r8, 0x0364
    STORE r8, r13
    LDI r5, 0
    LDI r8, 0x0360
    STORE r8, r5

nts_l2:
    ; Loop: extract digits from right
    CMP r1, r3
    JZ r10, nts_r1
    ; quotient = number / 10
    XOR r5, r5
    ADD r5, r1
    DIV r5, r14
    ; Save quotient
    LDI r8, 0x0362
    STORE r8, r5
    ; remainder = number - quotient * 10
    XOR r8, r8
    ADD r8, r5
    MUL r8, r14
    SUB r1, r8
    ; Convert to ASCII
    ADD r1, r4
    ; Store in reversed buffer
    LDI r8, 0x0364
    LOAD r13, r8
    STORE r13, r1
    ADD r13, r6
    LDI r8, 0x0364
    STORE r8, r13
    ; Increment digit count
    LDI r8, 0x0360
    LOAD r5, r8
    ADD r5, r6
    STORE r8, r5
    ; number = quotient
    LDI r8, 0x0362
    LOAD r1, r8
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r8, 0x0360
    LOAD r13, r8
    LDI r5, 0x0350

nts_r2:
    CMP r13, r3
    JZ r10, nts_end
    SUB r13, r6
    XOR r8, r8
    ADD r8, r5
    ADD r8, r13
    LOAD r8, r8
    STORE r12, r8
    ADD r12, r6
    JMP nts_r2

nts_end:
    RET
