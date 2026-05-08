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
;   r8  = CMP result (clobbered by CMP)
;   r14  = state (0=first, 1=op entered, 2=second)
;   r7  = first number accumulator
;   r3  = operator (43='+', 45='-')
;   r4  = second number accumulator
;   r1  = result / number to convert
;   r15  = 0xFFFF (keyboard port)
;   r12  = key value
;   r0  = 48 (ASCII '0') -- constant
;   r6  = 10 -- constant
;   r5 = 0 -- constant
;   r10 = 1 -- constant
;   r11-r2 = temps
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
    LDI r0, 48
    LDI r6, 10
    LDI r5, 0
    LDI r10, 1
    LDI r15, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r14, 0
    LDI r7, 0
    LDI r3, 0
    LDI r4, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r12, r15
    CMP r12, r5
    JZ r8, poll
    LDI r11, 0x0370
    STORE r11, r12
    LDI r12, 0
    STORE r15, r12
    LOAD r12, r11

    ; Check Q (quit)
    LDI r11, 81
    CMP r12, r11
    JNZ r8, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r11, 61
    CMP r12, r11
    JNZ r8, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r11, 48
    CMP r12, r11
    ADD r8, r10
    JZ r8, chk_op
    LDI r11, 57
    CMP r12, r11
    LDI r9, 1
    CMP r8, r9
    JZ r8, chk_op
    ; Is a digit: r12 = digit value
    SUB r12, r0
    ; Branch on state
    CMP r14, r5
    JZ r8, dig_first
    ; State 1 or 2: accumulate in r4
    MUL r4, r6
    ADD r4, r12
    LDI r14, 2
    JMP poll

dig_first:
    MUL r7, r6
    ADD r7, r12
    JMP poll

chk_op:
    ; Check + (43)
    LDI r11, 43
    CMP r12, r11
    JNZ r8, chk_min
    CMP r14, r5
    JNZ r8, poll
    LDI r3, 43
    LDI r14, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r11, 45
    CMP r12, r11
    JNZ r8, poll
    CMP r14, r5
    JNZ r8, poll
    LDI r3, 45
    LDI r14, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r1, r1
    ADD r1, r7
    LDI r11, 43
    CMP r3, r11
    JZ r8, do_add
    SUB r1, r4
    JMP build

do_add:
    ADD r1, r4

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r11, 0x0380
    STORE r11, r1
    ; Convert first number to string at 0x0300
    LDI r13, 0x0300
    XOR r1, r1
    ADD r1, r7
    CALL nts
    ; Append operator character
    STORE r13, r3
    ADD r13, r10
    ; Convert second number to string
    XOR r1, r1
    ADD r1, r4
    CALL nts
    ; Append '='
    LDI r11, 61
    STORE r13, r11
    ADD r13, r10
    ; Convert result to string
    LDI r11, 0x0380
    LOAD r1, r11
    CALL nts
    ; Null-terminate
    LDI r11, 0
    STORE r13, r11
    ; Render text at screen (0, 0)
    LDI r11, 0x0300
    TEXT r5, r5, r11
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r1 = number to convert, r13 = buffer address
; Output: digits written to buffer, r13 advanced past string
; Clobbers: r8, r11, r9, r2
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r1, r5
    JNZ r8, nts_l1
    ; Handle zero
    LDI r11, 48
    STORE r13, r11
    ADD r13, r10
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r2, 0x0350
    LDI r11, 0x0364
    STORE r11, r2
    LDI r9, 0
    LDI r11, 0x0360
    STORE r11, r9

nts_l2:
    ; Loop: extract digits from right
    CMP r1, r5
    JZ r8, nts_r1
    ; quotient = number / 10
    XOR r9, r9
    ADD r9, r1
    DIV r9, r6
    ; Save quotient
    LDI r11, 0x0362
    STORE r11, r9
    ; remainder = number - quotient * 10
    XOR r11, r11
    ADD r11, r9
    MUL r11, r6
    SUB r1, r11
    ; Convert to ASCII
    ADD r1, r0
    ; Store in reversed buffer
    LDI r11, 0x0364
    LOAD r2, r11
    STORE r2, r1
    ADD r2, r10
    LDI r11, 0x0364
    STORE r11, r2
    ; Increment digit count
    LDI r11, 0x0360
    LOAD r9, r11
    ADD r9, r10
    STORE r11, r9
    ; number = quotient
    LDI r11, 0x0362
    LOAD r1, r11
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r11, 0x0360
    LOAD r2, r11
    LDI r9, 0x0350

nts_r2:
    CMP r2, r5
    JZ r8, nts_end
    SUB r2, r10
    XOR r11, r11
    ADD r11, r9
    ADD r11, r2
    LOAD r11, r11
    STORE r13, r11
    ADD r13, r10
    JMP nts_r2

nts_end:
    RET
