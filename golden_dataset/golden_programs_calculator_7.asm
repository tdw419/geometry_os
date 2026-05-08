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
;   r3  = CMP result (clobbered by CMP)
;   r1  = state (0=first, 1=op entered, 2=second)
;   r11  = first number accumulator
;   r12  = operator (43='+', 45='-')
;   r14  = second number accumulator
;   r10  = result / number to convert
;   r5  = 0xFFFF (keyboard port)
;   r9  = key value
;   r15  = 48 (ASCII '0') -- constant
;   r6  = 10 -- constant
;   r7 = 0 -- constant
;   r0 = 1 -- constant
;   r13-r4 = temps
;   r8 = text buffer pointer
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
    LDI r15, 48
    LDI r6, 10
    LDI r7, 0
    LDI r0, 1
    LDI r5, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r1, 0
    LDI r11, 0
    LDI r12, 0
    LDI r14, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r9, r5
    CMP r9, r7
    JZ r3, poll
    LDI r13, 0x0370
    STORE r13, r9
    LDI r9, 0
    STORE r5, r9
    LOAD r9, r13

    ; Check Q (quit)
    LDI r13, 81
    CMP r9, r13
    JNZ r3, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r13, 61
    CMP r9, r13
    JNZ r3, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r13, 48
    CMP r9, r13
    ADD r3, r0
    JZ r3, chk_op
    LDI r13, 57
    CMP r9, r13
    LDI r2, 1
    CMP r3, r2
    JZ r3, chk_op
    ; Is a digit: r9 = digit value
    SUB r9, r15
    ; Branch on state
    CMP r1, r7
    JZ r3, dig_first
    ; State 1 or 2: accumulate in r14
    MUL r14, r6
    ADD r14, r9
    LDI r1, 2
    JMP poll

dig_first:
    MUL r11, r6
    ADD r11, r9
    JMP poll

chk_op:
    ; Check + (43)
    LDI r13, 43
    CMP r9, r13
    JNZ r3, chk_min
    CMP r1, r7
    JNZ r3, poll
    LDI r12, 43
    LDI r1, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r13, 45
    CMP r9, r13
    JNZ r3, poll
    CMP r1, r7
    JNZ r3, poll
    LDI r12, 45
    LDI r1, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r10, r10
    ADD r10, r11
    LDI r13, 43
    CMP r12, r13
    JZ r3, do_add
    SUB r10, r14
    JMP build

do_add:
    ADD r10, r14

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r13, 0x0380
    STORE r13, r10
    ; Convert first number to string at 0x0300
    LDI r8, 0x0300
    XOR r10, r10
    ADD r10, r11
    CALL nts
    ; Append operator character
    STORE r8, r12
    ADD r8, r0
    ; Convert second number to string
    XOR r10, r10
    ADD r10, r14
    CALL nts
    ; Append '='
    LDI r13, 61
    STORE r8, r13
    ADD r8, r0
    ; Convert result to string
    LDI r13, 0x0380
    LOAD r10, r13
    CALL nts
    ; Null-terminate
    LDI r13, 0
    STORE r8, r13
    ; Render text at screen (0, 0)
    LDI r13, 0x0300
    TEXT r7, r7, r13
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r10 = number to convert, r8 = buffer address
; Output: digits written to buffer, r8 advanced past string
; Clobbers: r3, r13, r2, r4
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r10, r7
    JNZ r3, nts_l1
    ; Handle zero
    LDI r13, 48
    STORE r8, r13
    ADD r8, r0
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r4, 0x0350
    LDI r13, 0x0364
    STORE r13, r4
    LDI r2, 0
    LDI r13, 0x0360
    STORE r13, r2

nts_l2:
    ; Loop: extract digits from right
    CMP r10, r7
    JZ r3, nts_r1
    ; quotient = number / 10
    XOR r2, r2
    ADD r2, r10
    DIV r2, r6
    ; Save quotient
    LDI r13, 0x0362
    STORE r13, r2
    ; remainder = number - quotient * 10
    XOR r13, r13
    ADD r13, r2
    MUL r13, r6
    SUB r10, r13
    ; Convert to ASCII
    ADD r10, r15
    ; Store in reversed buffer
    LDI r13, 0x0364
    LOAD r4, r13
    STORE r4, r10
    ADD r4, r0
    LDI r13, 0x0364
    STORE r13, r4
    ; Increment digit count
    LDI r13, 0x0360
    LOAD r2, r13
    ADD r2, r0
    STORE r13, r2
    ; number = quotient
    LDI r13, 0x0362
    LOAD r10, r13
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r13, 0x0360
    LOAD r4, r13
    LDI r2, 0x0350

nts_r2:
    CMP r4, r7
    JZ r3, nts_end
    SUB r4, r0
    XOR r13, r13
    ADD r13, r2
    ADD r13, r4
    LOAD r13, r13
    STORE r8, r13
    ADD r8, r0
    JMP nts_r2

nts_end:
    RET
