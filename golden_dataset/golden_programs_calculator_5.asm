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
;   r14  = CMP result (clobbered by CMP)
;   r3  = state (0=first, 1=op entered, 2=second)
;   r5  = first number accumulator
;   r15  = operator (43='+', 45='-')
;   r7  = second number accumulator
;   r12  = result / number to convert
;   r13  = 0xFFFF (keyboard port)
;   r11  = key value
;   r10  = 48 (ASCII '0') -- constant
;   r1  = 10 -- constant
;   r4 = 0 -- constant
;   r9 = 1 -- constant
;   r6-r2 = temps
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
    LDI r10, 48
    LDI r1, 10
    LDI r4, 0
    LDI r9, 1
    LDI r13, 0xFFFF

; ── Initialize state ──────────────────────────────────────────
    LDI r3, 0
    LDI r5, 0
    LDI r15, 0
    LDI r7, 0

; ── Main keyboard poll loop ──────────────────────────────────
poll:
    LOAD r11, r13
    CMP r11, r4
    JZ r14, poll
    LDI r6, 0x0370
    STORE r6, r11
    LDI r11, 0
    STORE r13, r11
    LOAD r11, r6

    ; Check Q (quit)
    LDI r6, 81
    CMP r11, r6
    JNZ r14, chk_eq
    HALT

chk_eq:
    ; Check = (compute)
    LDI r6, 61
    CMP r11, r6
    JNZ r14, chk_dig
    JMP compute

chk_dig:
    ; Check if key is digit (48-57)
    LDI r6, 48
    CMP r11, r6
    ADD r14, r9
    JZ r14, chk_op
    LDI r6, 57
    CMP r11, r6
    LDI r0, 1
    CMP r14, r0
    JZ r14, chk_op
    ; Is a digit: r11 = digit value
    SUB r11, r10
    ; Branch on state
    CMP r3, r4
    JZ r14, dig_first
    ; State 1 or 2: accumulate in r7
    MUL r7, r1
    ADD r7, r11
    LDI r3, 2
    JMP poll

dig_first:
    MUL r5, r1
    ADD r5, r11
    JMP poll

chk_op:
    ; Check + (43)
    LDI r6, 43
    CMP r11, r6
    JNZ r14, chk_min
    CMP r3, r4
    JNZ r14, poll
    LDI r15, 43
    LDI r3, 1
    JMP poll

chk_min:
    ; Check - (45)
    LDI r6, 45
    CMP r11, r6
    JNZ r14, poll
    CMP r3, r4
    JNZ r14, poll
    LDI r15, 45
    LDI r3, 1
    JMP poll

; ── Compute result ────────────────────────────────────────────
compute:
    XOR r12, r12
    ADD r12, r5
    LDI r6, 43
    CMP r15, r6
    JZ r14, do_add
    SUB r12, r7
    JMP build

do_add:
    ADD r12, r7

; ── Build display string and render ──────────────────────────
build:
    ; Save result to RAM
    LDI r6, 0x0380
    STORE r6, r12
    ; Convert first number to string at 0x0300
    LDI r8, 0x0300
    XOR r12, r12
    ADD r12, r5
    CALL nts
    ; Append operator character
    STORE r8, r15
    ADD r8, r9
    ; Convert second number to string
    XOR r12, r12
    ADD r12, r7
    CALL nts
    ; Append '='
    LDI r6, 61
    STORE r8, r6
    ADD r8, r9
    ; Convert result to string
    LDI r6, 0x0380
    LOAD r12, r6
    CALL nts
    ; Null-terminate
    LDI r6, 0
    STORE r8, r6
    ; Render text at screen (0, 0)
    LDI r6, 0x0300
    TEXT r4, r4, r6
    HALT

; ── num_to_str subroutine ────────────────────────────────────
; Input:  r12 = number to convert, r8 = buffer address
; Output: digits written to buffer, r8 advanced past string
; Clobbers: r14, r6, r0, r2
; Uses RAM: 0x0350 (rev buf), 0x0360 (count), 0x0362 (quotient), 0x0364 (ptr)
nts:
    CMP r12, r4
    JNZ r14, nts_l1
    ; Handle zero
    LDI r6, 48
    STORE r8, r6
    ADD r8, r9
    RET

nts_l1:
    ; Init reversed buffer and counter
    LDI r2, 0x0350
    LDI r6, 0x0364
    STORE r6, r2
    LDI r0, 0
    LDI r6, 0x0360
    STORE r6, r0

nts_l2:
    ; Loop: extract digits from right
    CMP r12, r4
    JZ r14, nts_r1
    ; quotient = number / 10
    XOR r0, r0
    ADD r0, r12
    DIV r0, r1
    ; Save quotient
    LDI r6, 0x0362
    STORE r6, r0
    ; remainder = number - quotient * 10
    XOR r6, r6
    ADD r6, r0
    MUL r6, r1
    SUB r12, r6
    ; Convert to ASCII
    ADD r12, r10
    ; Store in reversed buffer
    LDI r6, 0x0364
    LOAD r2, r6
    STORE r2, r12
    ADD r2, r9
    LDI r6, 0x0364
    STORE r6, r2
    ; Increment digit count
    LDI r6, 0x0360
    LOAD r0, r6
    ADD r0, r9
    STORE r6, r0
    ; number = quotient
    LDI r6, 0x0362
    LOAD r12, r6
    JMP nts_l2

nts_r1:
    ; Reverse: copy digits from buffer to output in correct order
    LDI r6, 0x0360
    LOAD r2, r6
    LDI r0, 0x0350

nts_r2:
    CMP r2, r4
    JZ r14, nts_end
    SUB r2, r9
    XOR r6, r6
    ADD r6, r0
    ADD r6, r2
    LOAD r6, r6
    STORE r8, r6
    ADD r8, r9
    JMP nts_r2

nts_end:
    RET
