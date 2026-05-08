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
;   r13  = CMP result (clobbered by CMP)
;   r12  = state (0=first, 1=op entered, 2=second)
;   r1  = first number accumulator
;   r7  = operator (43='+', 45='-')
;   r14  = second number accumulator
;   r10  = result / number to convert
;   r4  = 0xFFFF (keyboard port)
;   r0  = key value
;   r5  = 48 (ASCII '0') -- constant
;   r2  = 10 -- constant
;   r3 = 0 -- constant
;   r15 = 1 -- constant
;   r11-r9 = temps
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
    LDI r5, 48
    LDI r2, 10
    LDI r3, 0
    LDI r15, 1
    LDI r4, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r12, 0
    LDI r1, 0
    LDI r7, 0
    LDI r14, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r0, r4
    CMP r0, r3
    JZ r13, poll
    LDI r11, 0x0370
    STORE r11, r0
    LDI r0, 0
    STORE r4, r0
    LOAD r0, r11

    ; Check Q (quit)
    LDI r11, 81
    CMP r0, r11
    JNZ r13, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r11, 61
    CMP r0, r11
    JNZ r13, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r11, 48
    CMP r0, r11
    ADD r13, r15
    JZ r13, chk_op
    LDI r11, 57
    CMP r0, r11
    LDI r6, 1
    CMP r13, r6
    JZ r13, chk_op
    ; Is a digit: r0 = digit value
    SUB r0, r5
    ; Branch on state
    CMP r12, r3
    JZ r13, dig_first
    ; State 1 or 2: accumulate in r14
    MUL r14, r2
    ADD r14, r0
    LDI r12, 2
    JMP poll

dig_first:
    MUL r1, r2
    ADD r1, r0
    JMP poll

chk_op:
    ; Check + (43)
    LDI r11, 43
    CMP r0, r11
    JNZ r13, chk_min
    CMP r12, r3
    JNZ r13, poll
    LDI r7, 43
    LDI r12, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r11, 45
    CMP r0, r11
    JNZ r13, poll
    CMP r12, r3
    JNZ r13, poll
    LDI r7, 45
    LDI r12, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r10, r10
    ADD r10, r1
    LDI r11, 43
    CMP r7, r11
    JZ r13, do_add
    SUB r10, r14
    JMP build

do_add:
    ADD r10, r14

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r11, 0x0380
    STORE r11, r10
    ; Convert first number to string at 0x0300
    LDI r8, 0x0300
    XOR r10, r10
    ADD r10, r1
    CALL nts
    ; Append operator character
    STORE r8, r7
    ADD r8, r15
    ; Convert second number to string
    XOR r10, r10
    ADD r10, r14
    CALL nts
    ; Append '='
    LDI r11, 61
    STORE r8, r11
    ADD r8, r15
    ; Convert result to string
    LDI r11, 0x0380
    LOAD r10, r11
    CALL nts
    ; Null-terminate
    LDI r11, 0
    STORE r8, r11
    ; Render text at screen (0, 0)
    LDI r11, 0x0300
    TEXT r3, r3, r11
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r10 = number to convert, r8 = buffer address
; Output: digits written to buffer, r8 advanced past string
; Clobbers: r13, r11, r6, r9
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r10, r3
    JNZ r13, nts_l1
    ; Handle zero
    LDI r11, 48
    STORE r8, r11
    ADD r8, r15
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r9, 0x0350
    LDI r11, 0x0364
    STORE r11, r9
    LDI r6, 0
    LDI r11, 0x0360
    STORE r11, r6

nts_l2:
    ; Loop: extract digits from right
    CMP r10, r3
    JZ r13, nts_r1
    ; quotient = number / 10
    XOR r6, r6
    ADD r6, r10
    DIV r6, r2
    ; Save quotient
    LDI r11, 0x0362
    STORE r11, r6
    ; remainder = number - quotient * 10
    XOR r11, r11
    ADD r11, r6
    MUL r11, r2
    SUB r10, r11
    ; Convert to ASCII
    ADD r10, r5
    ; Store in reversed buffer
    LDI r11, 0x0364
    LOAD r9, r11
    STORE r9, r10
    ADD r9, r15
    LDI r11, 0x0364
    STORE r11, r9
    ; Increment digit count
    LDI r11, 0x0360
    LOAD r6, r11
    ADD r6, r15
    STORE r11, r6
    ; number = quotient
    LDI r11, 0x0362
    LOAD r10, r11
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r11, 0x0360
    LOAD r9, r11
    LDI r6, 0x0350

nts_r2:
    CMP r9, r3
    JZ r13, nts_end
    SUB r9, r15
    XOR r11, r11
    ADD r11, r6
    ADD r11, r9
    LOAD r11, r11
    STORE r8, r11
    ADD r8, r15
    JMP nts_r2

nts_end:
    RET
