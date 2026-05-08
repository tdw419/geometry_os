; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; nn_demo.asm -- XOR Neural Network Forward Pass Demo
; Phase 79: Demonstrates MATVEC and RELU opcodes
;
; A 2->4->1 neural network trained (with RELU) to solve XOR.
; Forward pass runs entirely inside the VM using fixed-point 16.16 arithmetic.
; Green box = correct prediction, Red box = wrong.
;
; Layout: 4 boxes across the screen.
; Left to right: XOR(0,0), XOR(0,1), XOR(1,0), XOR(1,1)

; === RAM Layout ===
; 0x1000: Input (2)
; 0x1100: Layer 1 weights (4x2)
; 0x1160: Layer 1 bias (4)
; 0x1200: Hidden output (4)
; 0x1300: Layer 2 weights (1x4)
; 0x1340: Layer 2 bias (1)
; 0x1400: Final output (1)

; --- Load Layer 1 Weights (4x2) ---
LDI r14, 0x00006F34
LDI r7, 0x1100
STORE r7, r14
LDI r14, 0xFFFFF315
LDI r7, 0x1101
STORE r7, r14
LDI r14, 0xFFFFDC9B
LDI r7, 0x1102
STORE r7, r14
LDI r14, 0xFFFFC410
LDI r7, 0x1103
STORE r7, r14
LDI r14, 0x00014EB5
LDI r7, 0x1104
STORE r7, r14
LDI r14, 0x00014BF9
LDI r7, 0x1105
STORE r7, r14
LDI r14, 0x00014D00
LDI r7, 0x1106
STORE r7, r14
LDI r14, 0x0001434E
LDI r7, 0x1107
STORE r7, r14

; --- Load Layer 1 Bias (4) ---
LDI r14, 0xFFFFF00B
LDI r7, 0x1160
STORE r7, r14
LDI r14, 0x00000000
LDI r7, 0x1161
STORE r7, r14
LDI r14, 0xFFFEB407
LDI r7, 0x1162
STORE r7, r14
LDI r14, 0x00000000
LDI r7, 0x1163
STORE r7, r14

; --- Load Layer 2 Weights (1x4) ---
LDI r14, 0xFFFFF6B5
LDI r7, 0x1300
STORE r7, r14
LDI r14, 0x00006237
LDI r7, 0x1301
STORE r7, r14
LDI r14, 0xFFFE74D0
LDI r7, 0x1302
STORE r7, r14
LDI r14, 0x0000CAB5
LDI r7, 0x1303
STORE r7, r14

; --- Load Layer 2 Bias ---
LDI r14, 0x00000000
LDI r7, 0x1340
STORE r7, r14

; --- Clear screen ---
LDI r11, 0
LDI r14, 0
LDI r13, 256
LDI r0, 256
LDI r9, 0x00181818
RECTF r11, r14, r13, r0, r9

; --- r20 = test case index ---
LDI r20, 0

; ============================================
; Main loop: run all 4 XOR test cases
; ============================================
run_all:
    ; Set inputs and expected output
    CMPI r20, 0
    JNZ r20, case1
    LDI r14, 0
    LDI r7, 0x1000
    STORE r7, r14
    LDI r7, 0x1001
    STORE r7, r14
    LDI r21, 0
    JMP do_forward

case1:
    CMPI r20, 1
    JNZ r20, case2
    LDI r14, 0
    LDI r7, 0x1000
    STORE r7, r14
    LDI r14, 0x00010000
    LDI r7, 0x1001
    STORE r7, r14
    LDI r21, 1
    JMP do_forward

case2:
    CMPI r20, 2
    JNZ r20, case3
    LDI r14, 0x00010000
    LDI r7, 0x1000
    STORE r7, r14
    LDI r14, 0
    LDI r7, 0x1001
    STORE r7, r14
    LDI r21, 1
    JMP do_forward

case3:
    LDI r14, 0x00010000
    LDI r7, 0x1000
    STORE r7, r14
    LDI r14, 0x00010000
    LDI r7, 0x1001
    STORE r7, r14
    LDI r21, 0

; ============================================
; Forward pass
; ============================================
do_forward:
    ; Layer 1: MATVEC (4 rows x 2 cols) * input(2) -> hidden(4)
    LDI r14, 0x1100
    LDI r13, 0x1000
    LDI r0, 0x1200
    LDI r9, 4
    LDI r8, 2
    MATVEC r14, r13, r0, r9, r8

    ; Add bias + RELU for each hidden neuron
    LDI r2, 0
act_loop:
    CMPI r2, 4
    JZ r2, layer2

    ; Load hidden[i]
    LDI r12, 0x1200
    ADD r12, r2
    LOAD r6, r12

    ; Add bias[i]
    LDI r12, 0x1160
    ADD r12, r2
    LOAD r15, r12
    ADD r6, r15

    ; RELU
    RELU r6

    ; Store back
    LDI r12, 0x1200
    ADD r12, r2
    STORE r12, r6

    ; i++
    LDI r14, 1
    ADD r2, r14
    JMP act_loop

layer2:
    ; Layer 2: MATVEC (1 row x 4 cols) * hidden(4) -> output(1)
    LDI r14, 0x1300
    LDI r13, 0x1200
    LDI r0, 0x1400
    LDI r9, 1
    LDI r8, 4
    MATVEC r14, r13, r0, r9, r8

    ; Add output bias
    LDI r12, 0x1400
    LOAD r6, r12
    LDI r12, 0x1340
    LOAD r15, r12
    ADD r6, r15
    LDI r12, 0x1400
    STORE r12, r6

    ; Classify: sign bit check -> positive = 1, negative/zero = 0
    LDI r12, 0x1400
    LOAD r6, r12
    ; Check top bit: if set, value is negative
    LDI r14, 0x80000000
    AND r14, r6
    CMPI r14, 0
    JNZ r14, is_zero

    ; Value is non-negative. Is it exactly 0?
    CMPI r6, 0
    JNZ r6, is_one

is_zero:
    LDI r22, 0
    JMP show
is_one:
    LDI r22, 1

; ============================================
; Display result
; ============================================
show:
    ; Position: x = 20 + r20*60
    LDI r14, 60
    MUL r14, r20
    LDI r13, 20
    ADD r14, r13

    ; Color: green if prediction == expected
    SUB r22, r21
    JZ r22, green
    LDI r9, 0x00FF0000
    JMP draw
green:
    LDI r9, 0x0000FF00
draw:
    LDI r13, 108
    LDI r0, 40
    LDI r8, 40
    RECTF r14, r13, r0, r8, r9

    ; Next test
    LDI r14, 1
    ADD r20, r14
    CMPI r20, 4
    JNZ r20, run_all

; === Done: show frame, wait for key ===
FRAME
wait:
    IKEY r11
    CMPI r11, 0
    JZ r11, wait
    HALT
