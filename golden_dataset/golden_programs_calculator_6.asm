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
;   r4  = CMP result (clobbered by CMP)
;   r5  = state (0=first, 1=op entered, 2=second)
;   r8  = first number accumulator
;   r10  = operator (43='+', 45='-')
;   r12  = second number accumulator
;   r0  = result / number to convert
;   r1  = 0xFFFF (keyboard port)
;   r3  = key value
;   r9  = 48 (ASCII '0') -- constant
;   r11  = 10 -- constant
;   r14 = 0 -- constant
;   r7 = 1 -- constant
;   r15-r2 = temps
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
    LDI r9, 48
    LDI r11, 10
    LDI r14, 0
    LDI r7, 1
    LDI r1, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r5, 0
    LDI r8, 0
    LDI r10, 0
    LDI r12, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r3, r1
    CMP r3, r14
    JZ r4, poll
    LDI r15, 0x0370
    STORE r15, r3
    LDI r3, 0
    STORE r1, r3
    LOAD r3, r15

    ; Check Q (quit)
    LDI r15, 81
    CMP r3, r15
    JNZ r4, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r15, 61
    CMP r3, r15
    JNZ r4, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r15, 48
    CMP r3, r15
    ADD r4, r7
    JZ r4, chk_op
    LDI r15, 57
    CMP r3, r15
    LDI r6, 1
    CMP r4, r6
    JZ r4, chk_op
    ; Is a digit: r3 = digit value
    SUB r3, r9
    ; Branch on state
    CMP r5, r14
    JZ r4, dig_first
    ; State 1 or 2: accumulate in r12
    MUL r12, r11
    ADD r12, r3
    LDI r5, 2
    JMP poll

dig_first:
    MUL r8, r11
    ADD r8, r3
    JMP poll

chk_op:
    ; Check + (43)
    LDI r15, 43
    CMP r3, r15
    JNZ r4, chk_min
    CMP r5, r14
    JNZ r4, poll
    LDI r10, 43
    LDI r5, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r15, 45
    CMP r3, r15
    JNZ r4, poll
    CMP r5, r14
    JNZ r4, poll
    LDI r10, 45
    LDI r5, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r0, r0
    ADD r0, r8
    LDI r15, 43
    CMP r10, r15
    JZ r4, do_add
    SUB r0, r12
    JMP build

do_add:
    ADD r0, r12

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r15, 0x0380
    STORE r15, r0
    ; Convert first number to string at 0x0300
    LDI r13, 0x0300
    XOR r0, r0
    ADD r0, r8
    CALL nts
    ; Append operator character
    STORE r13, r10
    ADD r13, r7
    ; Convert second number to string
    XOR r0, r0
    ADD r0, r12
    CALL nts
    ; Append '='
    LDI r15, 61
    STORE r13, r15
    ADD r13, r7
    ; Convert result to string
    LDI r15, 0x0380
    LOAD r0, r15
    CALL nts
    ; Null-terminate
    LDI r15, 0
    STORE r13, r15
    ; Render text at screen (0, 0)
    LDI r15, 0x0300
    TEXT r14, r14, r15
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r0 = number to convert, r13 = buffer address
; Output: digits written to buffer, r13 advanced past string
; Clobbers: r4, r15, r6, r2
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r0, r14
    JNZ r4, nts_l1
    ; Handle zero
    LDI r15, 48
    STORE r13, r15
    ADD r13, r7
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r2, 0x0350
    LDI r15, 0x0364
    STORE r15, r2
    LDI r6, 0
    LDI r15, 0x0360
    STORE r15, r6

nts_l2:
    ; Loop: extract digits from right
    CMP r0, r14
    JZ r4, nts_r1
    ; quotient = number / 10
    XOR r6, r6
    ADD r6, r0
    DIV r6, r11
    ; Save quotient
    LDI r15, 0x0362
    STORE r15, r6
    ; remainder = number - quotient * 10
    XOR r15, r15
    ADD r15, r6
    MUL r15, r11
    SUB r0, r15
    ; Convert to ASCII
    ADD r0, r9
    ; Store in reversed buffer
    LDI r15, 0x0364
    LOAD r2, r15
    STORE r2, r0
    ADD r2, r7
    LDI r15, 0x0364
    STORE r15, r2
    ; Increment digit count
    LDI r15, 0x0360
    LOAD r6, r15
    ADD r6, r7
    STORE r15, r6
    ; number = quotient
    LDI r15, 0x0362
    LOAD r0, r15
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r15, 0x0360
    LOAD r2, r15
    LDI r6, 0x0350

nts_r2:
    CMP r2, r14
    JZ r4, nts_end
    SUB r2, r7
    XOR r15, r15
    ADD r15, r6
    ADD r15, r2
    LOAD r15, r15
    STORE r13, r15
    ADD r13, r7
    JMP nts_r2

nts_end:
    RET
