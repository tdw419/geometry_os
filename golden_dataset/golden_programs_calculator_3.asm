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
;   r1  = CMP result (clobbered by CMP)
;   r7  = state (0=first, 1=op entered, 2=second)
;   r4  = first number accumulator
;   r11  = operator (43='+', 45='-')
;   r6  = second number accumulator
;   r9  = result / number to convert
;   r15  = 0xFFFF (keyboard port)
;   r10  = key value
;   r13  = 48 (ASCII '0') -- constant
;   r5  = 10 -- constant
;   r0 = 0 -- constant
;   r3 = 1 -- constant
;   r14-r2 = temps
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
    LDI r13, 48
    LDI r5, 10
    LDI r0, 0
    LDI r3, 1
    LDI r15, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r7, 0
    LDI r4, 0
    LDI r11, 0
    LDI r6, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r10, r15
    CMP r10, r0
    JZ r1, poll
    LDI r14, 0x0370
    STORE r14, r10
    LDI r10, 0
    STORE r15, r10
    LOAD r10, r14

    ; Check Q (quit)
    LDI r14, 81
    CMP r10, r14
    JNZ r1, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r14, 61
    CMP r10, r14
    JNZ r1, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r14, 48
    CMP r10, r14
    ADD r1, r3
    JZ r1, chk_op
    LDI r14, 57
    CMP r10, r14
    LDI r12, 1
    CMP r1, r12
    JZ r1, chk_op
    ; Is a digit: r10 = digit value
    SUB r10, r13
    ; Branch on state
    CMP r7, r0
    JZ r1, dig_first
    ; State 1 or 2: accumulate in r6
    MUL r6, r5
    ADD r6, r10
    LDI r7, 2
    JMP poll

dig_first:
    MUL r4, r5
    ADD r4, r10
    JMP poll

chk_op:
    ; Check + (43)
    LDI r14, 43
    CMP r10, r14
    JNZ r1, chk_min
    CMP r7, r0
    JNZ r1, poll
    LDI r11, 43
    LDI r7, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r14, 45
    CMP r10, r14
    JNZ r1, poll
    CMP r7, r0
    JNZ r1, poll
    LDI r11, 45
    LDI r7, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r9, r9
    ADD r9, r4
    LDI r14, 43
    CMP r11, r14
    JZ r1, do_add
    SUB r9, r6
    JMP build

do_add:
    ADD r9, r6

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r14, 0x0380
    STORE r14, r9
    ; Convert first number to string at 0x0300
    LDI r8, 0x0300
    XOR r9, r9
    ADD r9, r4
    CALL nts
    ; Append operator character
    STORE r8, r11
    ADD r8, r3
    ; Convert second number to string
    XOR r9, r9
    ADD r9, r6
    CALL nts
    ; Append '='
    LDI r14, 61
    STORE r8, r14
    ADD r8, r3
    ; Convert result to string
    LDI r14, 0x0380
    LOAD r9, r14
    CALL nts
    ; Null-terminate
    LDI r14, 0
    STORE r8, r14
    ; Render text at screen (0, 0)
    LDI r14, 0x0300
    TEXT r0, r0, r14
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r9 = number to convert, r8 = buffer address
; Output: digits written to buffer, r8 advanced past string
; Clobbers: r1, r14, r12, r2
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r9, r0
    JNZ r1, nts_l1
    ; Handle zero
    LDI r14, 48
    STORE r8, r14
    ADD r8, r3
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r2, 0x0350
    LDI r14, 0x0364
    STORE r14, r2
    LDI r12, 0
    LDI r14, 0x0360
    STORE r14, r12

nts_l2:
    ; Loop: extract digits from right
    CMP r9, r0
    JZ r1, nts_r1
    ; quotient = number / 10
    XOR r12, r12
    ADD r12, r9
    DIV r12, r5
    ; Save quotient
    LDI r14, 0x0362
    STORE r14, r12
    ; remainder = number - quotient * 10
    XOR r14, r14
    ADD r14, r12
    MUL r14, r5
    SUB r9, r14
    ; Convert to ASCII
    ADD r9, r13
    ; Store in reversed buffer
    LDI r14, 0x0364
    LOAD r2, r14
    STORE r2, r9
    ADD r2, r3
    LDI r14, 0x0364
    STORE r14, r2
    ; Increment digit count
    LDI r14, 0x0360
    LOAD r12, r14
    ADD r12, r3
    STORE r14, r12
    ; number = quotient
    LDI r14, 0x0362
    LOAD r9, r14
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r14, 0x0360
    LOAD r2, r14
    LDI r12, 0x0350

nts_r2:
    CMP r2, r0
    JZ r1, nts_end
    SUB r2, r3
    XOR r14, r14
    ADD r14, r12
    ADD r14, r2
    LOAD r14, r14
    STORE r8, r14
    ADD r8, r3
    JMP nts_r2

nts_end:
    RET
