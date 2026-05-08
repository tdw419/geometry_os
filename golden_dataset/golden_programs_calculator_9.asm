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
;   r2  = CMP result (clobbered by CMP)
;   r10  = state (0=first, 1=op entered, 2=second)
;   r1  = first number accumulator
;   r3  = operator (43='+', 45='-')
;   r15  = second number accumulator
;   r5  = result / number to convert
;   r0  = 0xFFFF (keyboard port)
;   r6  = key value
;   r14  = 48 (ASCII '0') -- constant
;   r4  = 10 -- constant
;   r9 = 0 -- constant
;   r13 = 1 -- constant
;   r12-r11 = temps
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
    LDI r14, 48
    LDI r4, 10
    LDI r9, 0
    LDI r13, 1
    LDI r0, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r10, 0
    LDI r1, 0
    LDI r3, 0
    LDI r15, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r6, r0
    CMP r6, r9
    JZ r2, poll
    LDI r12, 0x0370
    STORE r12, r6
    LDI r6, 0
    STORE r0, r6
    LOAD r6, r12

    ; Check Q (quit)
    LDI r12, 81
    CMP r6, r12
    JNZ r2, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r12, 61
    CMP r6, r12
    JNZ r2, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r12, 48
    CMP r6, r12
    ADD r2, r13
    JZ r2, chk_op
    LDI r12, 57
    CMP r6, r12
    LDI r8, 1
    CMP r2, r8
    JZ r2, chk_op
    ; Is a digit: r6 = digit value
    SUB r6, r14
    ; Branch on state
    CMP r10, r9
    JZ r2, dig_first
    ; State 1 or 2: accumulate in r15
    MUL r15, r4
    ADD r15, r6
    LDI r10, 2
    JMP poll

dig_first:
    MUL r1, r4
    ADD r1, r6
    JMP poll

chk_op:
    ; Check + (43)
    LDI r12, 43
    CMP r6, r12
    JNZ r2, chk_min
    CMP r10, r9
    JNZ r2, poll
    LDI r3, 43
    LDI r10, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r12, 45
    CMP r6, r12
    JNZ r2, poll
    CMP r10, r9
    JNZ r2, poll
    LDI r3, 45
    LDI r10, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r5, r5
    ADD r5, r1
    LDI r12, 43
    CMP r3, r12
    JZ r2, do_add
    SUB r5, r15
    JMP build

do_add:
    ADD r5, r15

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r12, 0x0380
    STORE r12, r5
    ; Convert first number to string at 0x0300
    LDI r7, 0x0300
    XOR r5, r5
    ADD r5, r1
    CALL nts
    ; Append operator character
    STORE r7, r3
    ADD r7, r13
    ; Convert second number to string
    XOR r5, r5
    ADD r5, r15
    CALL nts
    ; Append '='
    LDI r12, 61
    STORE r7, r12
    ADD r7, r13
    ; Convert result to string
    LDI r12, 0x0380
    LOAD r5, r12
    CALL nts
    ; Null-terminate
    LDI r12, 0
    STORE r7, r12
    ; Render text at screen (0, 0)
    LDI r12, 0x0300
    TEXT r9, r9, r12
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r5 = number to convert, r7 = buffer address
; Output: digits written to buffer, r7 advanced past string
; Clobbers: r2, r12, r8, r11
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r5, r9
    JNZ r2, nts_l1
    ; Handle zero
    LDI r12, 48
    STORE r7, r12
    ADD r7, r13
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r11, 0x0350
    LDI r12, 0x0364
    STORE r12, r11
    LDI r8, 0
    LDI r12, 0x0360
    STORE r12, r8

nts_l2:
    ; Loop: extract digits from right
    CMP r5, r9
    JZ r2, nts_r1
    ; quotient = number / 10
    XOR r8, r8
    ADD r8, r5
    DIV r8, r4
    ; Save quotient
    LDI r12, 0x0362
    STORE r12, r8
    ; remainder = number - quotient * 10
    XOR r12, r12
    ADD r12, r8
    MUL r12, r4
    SUB r5, r12
    ; Convert to ASCII
    ADD r5, r14
    ; Store in reversed buffer
    LDI r12, 0x0364
    LOAD r11, r12
    STORE r11, r5
    ADD r11, r13
    LDI r12, 0x0364
    STORE r12, r11
    ; Increment digit count
    LDI r12, 0x0360
    LOAD r8, r12
    ADD r8, r13
    STORE r12, r8
    ; number = quotient
    LDI r12, 0x0362
    LOAD r5, r12
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r12, 0x0360
    LOAD r11, r12
    LDI r8, 0x0350

nts_r2:
    CMP r11, r9
    JZ r2, nts_end
    SUB r11, r13
    XOR r12, r12
    ADD r12, r8
    ADD r12, r11
    LOAD r12, r12
    STORE r7, r12
    ADD r7, r13
    JMP nts_r2

nts_end:
    RET
