; DESCRIPTION: A red object centered at the screen with fixed size.

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
;   r4  = CMP result (clobbered by CMP)
;   r10  = state (0=first, 1=op entered, 2=second)
;   r2  = first number accumulator
;   r0  = operator (43='+', 45='-')
;   r14  = second number accumulator
;   r8  = result / number to convert
;   r3  = 0xFFFF (keyboard port)
;   r9  = key value
;   r7  = 48 (ASCII '0') -- constant
;   r15  = 10 -- constant
;   r1 = 0 -- constant
;   r5 = 1 -- constant
;   r12-r13 = temps
;   r6 = text buffer pointer
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
    LDI r7, 48
    LDI r15, 10
    LDI r1, 0
    LDI r5, 1
    LDI r3, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r10, 0
    LDI r2, 0
    LDI r0, 0
    LDI r14, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r9, r3
    CMP r9, r1
    JZ r4, poll
    LDI r12, 0x0370
    STORE r12, r9
    LDI r9, 0
    STORE r3, r9
    LOAD r9, r12

    ; Check Q (quit)
    LDI r12, 81
    CMP r9, r12
    JNZ r4, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r12, 61
    CMP r9, r12
    JNZ r4, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r12, 48
    CMP r9, r12
    ADD r4, r5
    JZ r4, chk_op
    LDI r12, 57
    CMP r9, r12
    LDI r11, 1
    CMP r4, r11
    JZ r4, chk_op
    ; Is a digit: r9 = digit value
    SUB r9, r7
    ; Branch on state
    CMP r10, r1
    JZ r4, dig_first
    ; State 1 or 2: accumulate in r14
    MUL r14, r15
    ADD r14, r9
    LDI r10, 2
    JMP poll

dig_first:
    MUL r2, r15
    ADD r2, r9
    JMP poll

chk_op:
    ; Check + (43)
    LDI r12, 43
    CMP r9, r12
    JNZ r4, chk_min
    CMP r10, r1
    JNZ r4, poll
    LDI r0, 43
    LDI r10, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r12, 45
    CMP r9, r12
    JNZ r4, poll
    CMP r10, r1
    JNZ r4, poll
    LDI r0, 45
    LDI r10, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r8, r8
    ADD r8, r2
    LDI r12, 43
    CMP r0, r12
    JZ r4, do_add
    SUB r8, r14
    JMP build

do_add:
    ADD r8, r14

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r12, 0x0380
    STORE r12, r8
    ; Convert first number to string at 0x0300
    LDI r6, 0x0300
    XOR r8, r8
    ADD r8, r2
    CALL nts
    ; Append operator character
    STORE r6, r0
    ADD r6, r5
    ; Convert second number to string
    XOR r8, r8
    ADD r8, r14
    CALL nts
    ; Append '='
    LDI r12, 61
    STORE r6, r12
    ADD r6, r5
    ; Convert result to string
    LDI r12, 0x0380
    LOAD r8, r12
    CALL nts
    ; Null-terminate
    LDI r12, 0
    STORE r6, r12
    ; Render text at screen (0, 0)
    LDI r12, 0x0300
    TEXT r1, r1, r12
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r8 = number to convert, r6 = buffer address
; Output: digits written to buffer, r6 advanced past string
; Clobbers: r4, r12, r11, r13
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r8, r1
    JNZ r4, nts_l1
    ; Handle zero
    LDI r12, 48
    STORE r6, r12
    ADD r6, r5
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r13, 0x0350
    LDI r12, 0x0364
    STORE r12, r13
    LDI r11, 0
    LDI r12, 0x0360
    STORE r12, r11

nts_l2:
    ; Loop: extract digits from right
    CMP r8, r1
    JZ r4, nts_r1
    ; quotient = number / 10
    XOR r11, r11
    ADD r11, r8
    DIV r11, r15
    ; Save quotient
    LDI r12, 0x0362
    STORE r12, r11
    ; remainder = number - quotient * 10
    XOR r12, r12
    ADD r12, r11
    MUL r12, r15
    SUB r8, r12
    ; Convert to ASCII
    ADD r8, r7
    ; Store in reversed buffer
    LDI r12, 0x0364
    LOAD r13, r12
    STORE r13, r8
    ADD r13, r5
    LDI r12, 0x0364
    STORE r12, r13
    ; Increment digit count
    LDI r12, 0x0360
    LOAD r11, r12
    ADD r11, r5
    STORE r12, r11
    ; number = quotient
    LDI r12, 0x0362
    LOAD r8, r12
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r12, 0x0360
    LOAD r13, r12
    LDI r11, 0x0350

nts_r2:
    CMP r13, r1
    JZ r4, nts_end
    SUB r13, r5
    XOR r12, r12
    ADD r12, r11
    ADD r12, r13
    LOAD r12, r12
    STORE r6, r12
    ADD r6, r5
    JMP nts_r2

nts_end:
    RET
