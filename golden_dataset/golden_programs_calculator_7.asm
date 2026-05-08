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
;   r9  = CMP result (clobbered by CMP)
;   r5  = state (0=first, 1=op entered, 2=second)
;   r2  = first number accumulator
;   r12  = operator (43='+', 45='-')
;   r13  = second number accumulator
;   r15  = result / number to convert
;   r3  = 0xFFFF (keyboard port)
;   r6  = key value
;   r1  = 48 (ASCII '0') -- constant
;   r10  = 10 -- constant
;   r4 = 0 -- constant
;   r0 = 1 -- constant
;   r11-r14 = temps
;   r7 = text buffer pointer
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
    LDI r10, 10
    LDI r4, 0
    LDI r0, 1
    LDI r3, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r5, 0
    LDI r2, 0
    LDI r12, 0
    LDI r13, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r6, r3
    CMP r6, r4
    JZ r9, poll
    LDI r11, 0x0370
    STORE r11, r6
    LDI r6, 0
    STORE r3, r6
    LOAD r6, r11

    ; Check Q (quit)
    LDI r11, 81
    CMP r6, r11
    JNZ r9, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r11, 61
    CMP r6, r11
    JNZ r9, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r11, 48
    CMP r6, r11
    ADD r9, r0
    JZ r9, chk_op
    LDI r11, 57
    CMP r6, r11
    LDI r8, 1
    CMP r9, r8
    JZ r9, chk_op
    ; Is a digit: r6 = digit value
    SUB r6, r1
    ; Branch on state
    CMP r5, r4
    JZ r9, dig_first
    ; State 1 or 2: accumulate in r13
    MUL r13, r10
    ADD r13, r6
    LDI r5, 2
    JMP poll

dig_first:
    MUL r2, r10
    ADD r2, r6
    JMP poll

chk_op:
    ; Check + (43)
    LDI r11, 43
    CMP r6, r11
    JNZ r9, chk_min
    CMP r5, r4
    JNZ r9, poll
    LDI r12, 43
    LDI r5, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r11, 45
    CMP r6, r11
    JNZ r9, poll
    CMP r5, r4
    JNZ r9, poll
    LDI r12, 45
    LDI r5, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r15, r15
    ADD r15, r2
    LDI r11, 43
    CMP r12, r11
    JZ r9, do_add
    SUB r15, r13
    JMP build

do_add:
    ADD r15, r13

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r11, 0x0380
    STORE r11, r15
    ; Convert first number to string at 0x0300
    LDI r7, 0x0300
    XOR r15, r15
    ADD r15, r2
    CALL nts
    ; Append operator character
    STORE r7, r12
    ADD r7, r0
    ; Convert second number to string
    XOR r15, r15
    ADD r15, r13
    CALL nts
    ; Append '='
    LDI r11, 61
    STORE r7, r11
    ADD r7, r0
    ; Convert result to string
    LDI r11, 0x0380
    LOAD r15, r11
    CALL nts
    ; Null-terminate
    LDI r11, 0
    STORE r7, r11
    ; Render text at screen (0, 0)
    LDI r11, 0x0300
    TEXT r4, r4, r11
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r15 = number to convert, r7 = buffer address
; Output: digits written to buffer, r7 advanced past string
; Clobbers: r9, r11, r8, r14
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r15, r4
    JNZ r9, nts_l1
    ; Handle zero
    LDI r11, 48
    STORE r7, r11
    ADD r7, r0
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r14, 0x0350
    LDI r11, 0x0364
    STORE r11, r14
    LDI r8, 0
    LDI r11, 0x0360
    STORE r11, r8

nts_l2:
    ; Loop: extract digits from right
    CMP r15, r4
    JZ r9, nts_r1
    ; quotient = number / 10
    XOR r8, r8
    ADD r8, r15
    DIV r8, r10
    ; Save quotient
    LDI r11, 0x0362
    STORE r11, r8
    ; remainder = number - quotient * 10
    XOR r11, r11
    ADD r11, r8
    MUL r11, r10
    SUB r15, r11
    ; Convert to ASCII
    ADD r15, r1
    ; Store in reversed buffer
    LDI r11, 0x0364
    LOAD r14, r11
    STORE r14, r15
    ADD r14, r0
    LDI r11, 0x0364
    STORE r11, r14
    ; Increment digit count
    LDI r11, 0x0360
    LOAD r8, r11
    ADD r8, r0
    STORE r11, r8
    ; number = quotient
    LDI r11, 0x0362
    LOAD r15, r11
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r11, 0x0360
    LOAD r14, r11
    LDI r8, 0x0350

nts_r2:
    CMP r14, r4
    JZ r9, nts_end
    SUB r14, r0
    XOR r11, r11
    ADD r11, r8
    ADD r11, r14
    LOAD r11, r11
    STORE r7, r11
    ADD r7, r0
    JMP nts_r2

nts_end:
    RET
