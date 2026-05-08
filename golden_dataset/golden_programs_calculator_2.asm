; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
;   r15  = CMP result (clobbered by CMP)
;   r11  = state (0=first, 1=op entered, 2=second)
;   r6  = first number accumulator
;   r9  = operator (43='+', 45='-')
;   r5  = second number accumulator
;   r7  = result / number to convert
;   r14  = 0xFFFF (keyboard port)
;   r8  = key value
;   r1  = 48 (ASCII '0') -- constant
;   r12  = 10 -- constant
;   r13 = 0 -- constant
;   r2 = 1 -- constant
;   r3-r10 = temps
;   r0 = text buffer pointer
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
    LDI r1, 48
    LDI r12, 10
    LDI r13, 0
    LDI r2, 1
    LDI r14, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r11, 0
    LDI r6, 0
    LDI r9, 0
    LDI r5, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r8, r14
    CMP r8, r13
    JZ r15, poll
    LDI r3, 0x0370
    STORE r3, r8
    LDI r8, 0
    STORE r14, r8
    LOAD r8, r3

    ; Check Q (quit)
    LDI r3, 81
    CMP r8, r3
    JNZ r15, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r3, 61
    CMP r8, r3
    JNZ r15, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r3, 48
    CMP r8, r3
    ADD r15, r2
    JZ r15, chk_op
    LDI r3, 57
    CMP r8, r3
    LDI r4, 1
    CMP r15, r4
    JZ r15, chk_op
    ; Is a digit: r8 = digit value
    SUB r8, r1
    ; Branch on state
    CMP r11, r13
    JZ r15, dig_first
    ; State 1 or 2: accumulate in r5
    MUL r5, r12
    ADD r5, r8
    LDI r11, 2
    JMP poll

dig_first:
    MUL r6, r12
    ADD r6, r8
    JMP poll

chk_op:
    ; Check + (43)
    LDI r3, 43
    CMP r8, r3
    JNZ r15, chk_min
    CMP r11, r13
    JNZ r15, poll
    LDI r9, 43
    LDI r11, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r3, 45
    CMP r8, r3
    JNZ r15, poll
    CMP r11, r13
    JNZ r15, poll
    LDI r9, 45
    LDI r11, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r7, r7
    ADD r7, r6
    LDI r3, 43
    CMP r9, r3
    JZ r15, do_add
    SUB r7, r5
    JMP build

do_add:
    ADD r7, r5

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r3, 0x0380
    STORE r3, r7
    ; Convert first number to string at 0x0300
    LDI r0, 0x0300
    XOR r7, r7
    ADD r7, r6
    CALL nts
    ; Append operator character
    STORE r0, r9
    ADD r0, r2
    ; Convert second number to string
    XOR r7, r7
    ADD r7, r5
    CALL nts
    ; Append '='
    LDI r3, 61
    STORE r0, r3
    ADD r0, r2
    ; Convert result to string
    LDI r3, 0x0380
    LOAD r7, r3
    CALL nts
    ; Null-terminate
    LDI r3, 0
    STORE r0, r3
    ; Render text at screen (0, 0)
    LDI r3, 0x0300
    TEXT r13, r13, r3
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r7 = number to convert, r0 = buffer address
; Output: digits written to buffer, r0 advanced past string
; Clobbers: r15, r3, r4, r10
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r7, r13
    JNZ r15, nts_l1
    ; Handle zero
    LDI r3, 48
    STORE r0, r3
    ADD r0, r2
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r10, 0x0350
    LDI r3, 0x0364
    STORE r3, r10
    LDI r4, 0
    LDI r3, 0x0360
    STORE r3, r4

nts_l2:
    ; Loop: extract digits from right
    CMP r7, r13
    JZ r15, nts_r1
    ; quotient = number / 10
    XOR r4, r4
    ADD r4, r7
    DIV r4, r12
    ; Save quotient
    LDI r3, 0x0362
    STORE r3, r4
    ; remainder = number - quotient * 10
    XOR r3, r3
    ADD r3, r4
    MUL r3, r12
    SUB r7, r3
    ; Convert to ASCII
    ADD r7, r1
    ; Store in reversed buffer
    LDI r3, 0x0364
    LOAD r10, r3
    STORE r10, r7
    ADD r10, r2
    LDI r3, 0x0364
    STORE r3, r10
    ; Increment digit count
    LDI r3, 0x0360
    LOAD r4, r3
    ADD r4, r2
    STORE r3, r4
    ; number = quotient
    LDI r3, 0x0362
    LOAD r7, r3
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r3, 0x0360
    LOAD r10, r3
    LDI r4, 0x0350

nts_r2:
    CMP r10, r13
    JZ r15, nts_end
    SUB r10, r2
    XOR r3, r3
    ADD r3, r4
    ADD r3, r10
    LOAD r3, r3
    STORE r0, r3
    ADD r0, r2
    JMP nts_r2

nts_end:
    RET
