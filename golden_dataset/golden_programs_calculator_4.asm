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
;   r1  = state (0=first, 1=op entered, 2=second)
;   r0  = first number accumulator
;   r14  = operator (43='+', 45='-')
;   r5  = second number accumulator
;   r4  = result / number to convert
;   r13  = 0xFFFF (keyboard port)
;   r3  = key value
;   r12  = 48 (ASCII '0') -- constant
;   r8  = 10 -- constant
;   r7 = 0 -- constant
;   r15 = 1 -- constant
;   r10-r11 = temps
;   r9 = text buffer pointer
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
    LDI r12, 48
    LDI r8, 10
    LDI r7, 0
    LDI r15, 1
    LDI r13, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r1, 0
    LDI r0, 0
    LDI r14, 0
    LDI r5, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r3, r13
    CMP r3, r7
    JZ r2, poll
    LDI r10, 0x0370
    STORE r10, r3
    LDI r3, 0
    STORE r13, r3
    LOAD r3, r10

    ; Check Q (quit)
    LDI r10, 81
    CMP r3, r10
    JNZ r2, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r10, 61
    CMP r3, r10
    JNZ r2, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r10, 48
    CMP r3, r10
    ADD r2, r15
    JZ r2, chk_op
    LDI r10, 57
    CMP r3, r10
    LDI r6, 1
    CMP r2, r6
    JZ r2, chk_op
    ; Is a digit: r3 = digit value
    SUB r3, r12
    ; Branch on state
    CMP r1, r7
    JZ r2, dig_first
    ; State 1 or 2: accumulate in r5
    MUL r5, r8
    ADD r5, r3
    LDI r1, 2
    JMP poll

dig_first:
    MUL r0, r8
    ADD r0, r3
    JMP poll

chk_op:
    ; Check + (43)
    LDI r10, 43
    CMP r3, r10
    JNZ r2, chk_min
    CMP r1, r7
    JNZ r2, poll
    LDI r14, 43
    LDI r1, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r10, 45
    CMP r3, r10
    JNZ r2, poll
    CMP r1, r7
    JNZ r2, poll
    LDI r14, 45
    LDI r1, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r4, r4
    ADD r4, r0
    LDI r10, 43
    CMP r14, r10
    JZ r2, do_add
    SUB r4, r5
    JMP build

do_add:
    ADD r4, r5

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r10, 0x0380
    STORE r10, r4
    ; Convert first number to string at 0x0300
    LDI r9, 0x0300
    XOR r4, r4
    ADD r4, r0
    CALL nts
    ; Append operator character
    STORE r9, r14
    ADD r9, r15
    ; Convert second number to string
    XOR r4, r4
    ADD r4, r5
    CALL nts
    ; Append '='
    LDI r10, 61
    STORE r9, r10
    ADD r9, r15
    ; Convert result to string
    LDI r10, 0x0380
    LOAD r4, r10
    CALL nts
    ; Null-terminate
    LDI r10, 0
    STORE r9, r10
    ; Render text at screen (0, 0)
    LDI r10, 0x0300
    TEXT r7, r7, r10
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r4 = number to convert, r9 = buffer address
; Output: digits written to buffer, r9 advanced past string
; Clobbers: r2, r10, r6, r11
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r4, r7
    JNZ r2, nts_l1
    ; Handle zero
    LDI r10, 48
    STORE r9, r10
    ADD r9, r15
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r11, 0x0350
    LDI r10, 0x0364
    STORE r10, r11
    LDI r6, 0
    LDI r10, 0x0360
    STORE r10, r6

nts_l2:
    ; Loop: extract digits from right
    CMP r4, r7
    JZ r2, nts_r1
    ; quotient = number / 10
    XOR r6, r6
    ADD r6, r4
    DIV r6, r8
    ; Save quotient
    LDI r10, 0x0362
    STORE r10, r6
    ; remainder = number - quotient * 10
    XOR r10, r10
    ADD r10, r6
    MUL r10, r8
    SUB r4, r10
    ; Convert to ASCII
    ADD r4, r12
    ; Store in reversed buffer
    LDI r10, 0x0364
    LOAD r11, r10
    STORE r11, r4
    ADD r11, r15
    LDI r10, 0x0364
    STORE r10, r11
    ; Increment digit count
    LDI r10, 0x0360
    LOAD r6, r10
    ADD r6, r15
    STORE r10, r6
    ; number = quotient
    LDI r10, 0x0362
    LOAD r4, r10
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r10, 0x0360
    LOAD r11, r10
    LDI r6, 0x0350

nts_r2:
    CMP r11, r7
    JZ r2, nts_end
    SUB r11, r15
    XOR r10, r10
    ADD r10, r6
    ADD r10, r11
    LOAD r10, r10
    STORE r9, r10
    ADD r9, r15
    JMP nts_r2

nts_end:
    RET
