; DESCRIPTION: Display a object using color red at the screen.

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
;   r8  = state (0=first, 1=op entered, 2=second)
;   r12  = first number accumulator
;   r0  = operator (43='+', 45='-')
;   r10  = second number accumulator
;   r2  = result / number to convert
;   r11  = 0xFFFF (keyboard port)
;   r15  = key value
;   r5  = 48 (ASCII '0') -- constant
;   r7  = 10 -- constant
;   r3 = 0 -- constant
;   r9 = 1 -- constant
;   r14-r6 = temps
;   r13 = text buffer pointer
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
    LDI r5, 48
    LDI r7, 10
    LDI r3, 0
    LDI r9, 1
    LDI r11, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r8, 0
    LDI r12, 0
    LDI r0, 0
    LDI r10, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r15, r11
    CMP r15, r3
    JZ r4, poll
    LDI r14, 0x0370
    STORE r14, r15
    LDI r15, 0
    STORE r11, r15
    LOAD r15, r14

    ; Check Q (quit)
    LDI r14, 81
    CMP r15, r14
    JNZ r4, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r14, 61
    CMP r15, r14
    JNZ r4, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r14, 48
    CMP r15, r14
    ADD r4, r9
    JZ r4, chk_op
    LDI r14, 57
    CMP r15, r14
    LDI r1, 1
    CMP r4, r1
    JZ r4, chk_op
    ; Is a digit: r15 = digit value
    SUB r15, r5
    ; Branch on state
    CMP r8, r3
    JZ r4, dig_first
    ; State 1 or 2: accumulate in r10
    MUL r10, r7
    ADD r10, r15
    LDI r8, 2
    JMP poll

dig_first:
    MUL r12, r7
    ADD r12, r15
    JMP poll

chk_op:
    ; Check + (43)
    LDI r14, 43
    CMP r15, r14
    JNZ r4, chk_min
    CMP r8, r3
    JNZ r4, poll
    LDI r0, 43
    LDI r8, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r14, 45
    CMP r15, r14
    JNZ r4, poll
    CMP r8, r3
    JNZ r4, poll
    LDI r0, 45
    LDI r8, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r2, r2
    ADD r2, r12
    LDI r14, 43
    CMP r0, r14
    JZ r4, do_add
    SUB r2, r10
    JMP build

do_add:
    ADD r2, r10

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r14, 0x0380
    STORE r14, r2
    ; Convert first number to string at 0x0300
    LDI r13, 0x0300
    XOR r2, r2
    ADD r2, r12
    CALL nts
    ; Append operator character
    STORE r13, r0
    ADD r13, r9
    ; Convert second number to string
    XOR r2, r2
    ADD r2, r10
    CALL nts
    ; Append '='
    LDI r14, 61
    STORE r13, r14
    ADD r13, r9
    ; Convert result to string
    LDI r14, 0x0380
    LOAD r2, r14
    CALL nts
    ; Null-terminate
    LDI r14, 0
    STORE r13, r14
    ; Render text at screen (0, 0)
    LDI r14, 0x0300
    TEXT r3, r3, r14
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r2 = number to convert, r13 = buffer address
; Output: digits written to buffer, r13 advanced past string
; Clobbers: r4, r14, r1, r6
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r2, r3
    JNZ r4, nts_l1
    ; Handle zero
    LDI r14, 48
    STORE r13, r14
    ADD r13, r9
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r6, 0x0350
    LDI r14, 0x0364
    STORE r14, r6
    LDI r1, 0
    LDI r14, 0x0360
    STORE r14, r1

nts_l2:
    ; Loop: extract digits from right
    CMP r2, r3
    JZ r4, nts_r1
    ; quotient = number / 10
    XOR r1, r1
    ADD r1, r2
    DIV r1, r7
    ; Save quotient
    LDI r14, 0x0362
    STORE r14, r1
    ; remainder = number - quotient * 10
    XOR r14, r14
    ADD r14, r1
    MUL r14, r7
    SUB r2, r14
    ; Convert to ASCII
    ADD r2, r5
    ; Store in reversed buffer
    LDI r14, 0x0364
    LOAD r6, r14
    STORE r6, r2
    ADD r6, r9
    LDI r14, 0x0364
    STORE r14, r6
    ; Increment digit count
    LDI r14, 0x0360
    LOAD r1, r14
    ADD r1, r9
    STORE r14, r1
    ; number = quotient
    LDI r14, 0x0362
    LOAD r2, r14
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r14, 0x0360
    LOAD r6, r14
    LDI r1, 0x0350

nts_r2:
    CMP r6, r3
    JZ r4, nts_end
    SUB r6, r9
    XOR r14, r14
    ADD r14, r1
    ADD r14, r6
    LOAD r14, r14
    STORE r13, r14
    ADD r13, r9
    JMP nts_r2

nts_end:
    RET
