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
;   r15  = CMP result (clobbered by CMP)
;   r13  = state (0=first, 1=op entered, 2=second)
;   r12  = first number accumulator
;   r1  = operator (43='+', 45='-')
;   r14  = second number accumulator
;   r3  = result / number to convert
;   r8  = 0xFFFF (keyboard port)
;   r2  = key value
;   r4  = 48 (ASCII '0') -- constant
;   r0  = 10 -- constant
;   r6 = 0 -- constant
;   r10 = 1 -- constant
;   r11-r5 = temps
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
    LDI r4, 48
    LDI r0, 10
    LDI r6, 0
    LDI r10, 1
    LDI r8, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r13, 0
    LDI r12, 0
    LDI r1, 0
    LDI r14, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r2, r8
    CMP r2, r6
    JZ r15, poll
    LDI r11, 0x0370
    STORE r11, r2
    LDI r2, 0
    STORE r8, r2
    LOAD r2, r11

    ; Check Q (quit)
    LDI r11, 81
    CMP r2, r11
    JNZ r15, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r11, 61
    CMP r2, r11
    JNZ r15, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r11, 48
    CMP r2, r11
    ADD r15, r10
    JZ r15, chk_op
    LDI r11, 57
    CMP r2, r11
    LDI r9, 1
    CMP r15, r9
    JZ r15, chk_op
    ; Is a digit: r2 = digit value
    SUB r2, r4
    ; Branch on state
    CMP r13, r6
    JZ r15, dig_first
    ; State 1 or 2: accumulate in r14
    MUL r14, r0
    ADD r14, r2
    LDI r13, 2
    JMP poll

dig_first:
    MUL r12, r0
    ADD r12, r2
    JMP poll

chk_op:
    ; Check + (43)
    LDI r11, 43
    CMP r2, r11
    JNZ r15, chk_min
    CMP r13, r6
    JNZ r15, poll
    LDI r1, 43
    LDI r13, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r11, 45
    CMP r2, r11
    JNZ r15, poll
    CMP r13, r6
    JNZ r15, poll
    LDI r1, 45
    LDI r13, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r3, r3
    ADD r3, r12
    LDI r11, 43
    CMP r1, r11
    JZ r15, do_add
    SUB r3, r14
    JMP build

do_add:
    ADD r3, r14

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r11, 0x0380
    STORE r11, r3
    ; Convert first number to string at 0x0300
    LDI r7, 0x0300
    XOR r3, r3
    ADD r3, r12
    CALL nts
    ; Append operator character
    STORE r7, r1
    ADD r7, r10
    ; Convert second number to string
    XOR r3, r3
    ADD r3, r14
    CALL nts
    ; Append '='
    LDI r11, 61
    STORE r7, r11
    ADD r7, r10
    ; Convert result to string
    LDI r11, 0x0380
    LOAD r3, r11
    CALL nts
    ; Null-terminate
    LDI r11, 0
    STORE r7, r11
    ; Render text at screen (0, 0)
    LDI r11, 0x0300
    TEXT r6, r6, r11
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r3 = number to convert, r7 = buffer address
; Output: digits written to buffer, r7 advanced past string
; Clobbers: r15, r11, r9, r5
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r3, r6
    JNZ r15, nts_l1
    ; Handle zero
    LDI r11, 48
    STORE r7, r11
    ADD r7, r10
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r5, 0x0350
    LDI r11, 0x0364
    STORE r11, r5
    LDI r9, 0
    LDI r11, 0x0360
    STORE r11, r9

nts_l2:
    ; Loop: extract digits from right
    CMP r3, r6
    JZ r15, nts_r1
    ; quotient = number / 10
    XOR r9, r9
    ADD r9, r3
    DIV r9, r0
    ; Save quotient
    LDI r11, 0x0362
    STORE r11, r9
    ; remainder = number - quotient * 10
    XOR r11, r11
    ADD r11, r9
    MUL r11, r0
    SUB r3, r11
    ; Convert to ASCII
    ADD r3, r4
    ; Store in reversed buffer
    LDI r11, 0x0364
    LOAD r5, r11
    STORE r5, r3
    ADD r5, r10
    LDI r11, 0x0364
    STORE r11, r5
    ; Increment digit count
    LDI r11, 0x0360
    LOAD r9, r11
    ADD r9, r10
    STORE r11, r9
    ; number = quotient
    LDI r11, 0x0362
    LOAD r3, r11
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r11, 0x0360
    LOAD r5, r11
    LDI r9, 0x0350

nts_r2:
    CMP r5, r6
    JZ r15, nts_end
    SUB r5, r10
    XOR r11, r11
    ADD r11, r9
    ADD r11, r5
    LOAD r11, r11
    STORE r7, r11
    ADD r7, r10
    JMP nts_r2

nts_end:
    RET
