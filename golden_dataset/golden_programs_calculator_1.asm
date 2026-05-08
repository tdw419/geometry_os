; DESCRIPTION: Draws a red object at the screen with fixed size.

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
;   r7  = CMP result (clobbered by CMP)
;   r13  = state (0=first, 1=op entered, 2=second)
;   r5  = first number accumulator
;   r11  = operator (43='+', 45='-')
;   r9  = second number accumulator
;   r12  = result / number to convert
;   r15  = 0xFFFF (keyboard port)
;   r3  = key value
;   r4  = 48 (ASCII '0') -- constant
;   r14  = 10 -- constant
;   r10 = 0 -- constant
;   r6 = 1 -- constant
;   r0-r8 = temps
;   r2 = text buffer pointer
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
    LDI r10, 0
    LDI r6, 1
    LDI r15, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r13, 0
    LDI r5, 0
    LDI r11, 0
    LDI r9, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r3, r15
    CMP r3, r10
    JZ r7, poll
    LDI r0, 0x0370
    STORE r0, r3
    LDI r3, 0
    STORE r15, r3
    LOAD r3, r0

    ; Check Q (quit)
    LDI r0, 81
    CMP r3, r0
    JNZ r7, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r0, 61
    CMP r3, r0
    JNZ r7, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r0, 48
    CMP r3, r0
    ADD r7, r6
    JZ r7, chk_op
    LDI r0, 57
    CMP r3, r0
    LDI r1, 1
    CMP r7, r1
    JZ r7, chk_op
    ; Is a digit: r3 = digit value
    SUB r3, r4
    ; Branch on state
    CMP r13, r10
    JZ r7, dig_first
    ; State 1 or 2: accumulate in r9
    MUL r9, r14
    ADD r9, r3
    LDI r13, 2
    JMP poll

dig_first:
    MUL r5, r14
    ADD r5, r3
    JMP poll

chk_op:
    ; Check + (43)
    LDI r0, 43
    CMP r3, r0
    JNZ r7, chk_min
    CMP r13, r10
    JNZ r7, poll
    LDI r11, 43
    LDI r13, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r0, 45
    CMP r3, r0
    JNZ r7, poll
    CMP r13, r10
    JNZ r7, poll
    LDI r11, 45
    LDI r13, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r12, r12
    ADD r12, r5
    LDI r0, 43
    CMP r11, r0
    JZ r7, do_add
    SUB r12, r9
    JMP build

do_add:
    ADD r12, r9

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r0, 0x0380
    STORE r0, r12
    ; Convert first number to string at 0x0300
    LDI r2, 0x0300
    XOR r12, r12
    ADD r12, r5
    CALL nts
    ; Append operator character
    STORE r2, r11
    ADD r2, r6
    ; Convert second number to string
    XOR r12, r12
    ADD r12, r9
    CALL nts
    ; Append '='
    LDI r0, 61
    STORE r2, r0
    ADD r2, r6
    ; Convert result to string
    LDI r0, 0x0380
    LOAD r12, r0
    CALL nts
    ; Null-terminate
    LDI r0, 0
    STORE r2, r0
    ; Render text at screen (0, 0)
    LDI r0, 0x0300
    TEXT r10, r10, r0
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r12 = number to convert, r2 = buffer address
; Output: digits written to buffer, r2 advanced past string
; Clobbers: r7, r0, r1, r8
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r12, r10
    JNZ r7, nts_l1
    ; Handle zero
    LDI r0, 48
    STORE r2, r0
    ADD r2, r6
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r8, 0x0350
    LDI r0, 0x0364
    STORE r0, r8
    LDI r1, 0
    LDI r0, 0x0360
    STORE r0, r1

nts_l2:
    ; Loop: extract digits from right
    CMP r12, r10
    JZ r7, nts_r1
    ; quotient = number / 10
    XOR r1, r1
    ADD r1, r12
    DIV r1, r14
    ; Save quotient
    LDI r0, 0x0362
    STORE r0, r1
    ; remainder = number - quotient * 10
    XOR r0, r0
    ADD r0, r1
    MUL r0, r14
    SUB r12, r0
    ; Convert to ASCII
    ADD r12, r4
    ; Store in reversed buffer
    LDI r0, 0x0364
    LOAD r8, r0
    STORE r8, r12
    ADD r8, r6
    LDI r0, 0x0364
    STORE r0, r8
    ; Increment digit count
    LDI r0, 0x0360
    LOAD r1, r0
    ADD r1, r6
    STORE r0, r1
    ; number = quotient
    LDI r0, 0x0362
    LOAD r12, r0
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r0, 0x0360
    LOAD r8, r0
    LDI r1, 0x0350

nts_r2:
    CMP r8, r10
    JZ r7, nts_end
    SUB r8, r6
    XOR r0, r0
    ADD r0, r1
    ADD r0, r8
    LOAD r0, r0
    STORE r2, r0
    ADD r2, r6
    JMP nts_r2

nts_end:
    RET
