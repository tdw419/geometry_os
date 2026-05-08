; DESCRIPTION: This GeOS assembly code demonstrates a forward pass of a 2-4-1 neural network trained to solve the XOR problem using fixed-point 16.16 arithmetic. The code loads weights and biases for two layers, performs matrix-vector multiplication (MATVEC) and Rectified Linear Unit (RELU) activation, and displays the results on the screen with green indicating correct predictions and red indicating incorrect ones for the four XOR test cases.

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
LDI r15, 0x00006F34
LDI r12, 0x1100
STORE r12, r15
LDI r15, 0xFFFFF315
LDI r12, 0x1101
STORE r12, r15
LDI r15, 0xFFFFDC9B
LDI r12, 0x1102
STORE r12, r15
LDI r15, 0xFFFFC410
LDI r12, 0x1103
STORE r12, r15
LDI r15, 0x00014EB5
LDI r12, 0x1104
STORE r12, r15
LDI r15, 0x00014BF9
LDI r12, 0x1105
STORE r12, r15
LDI r15, 0x00014D00
LDI r12, 0x1106
STORE r12, r15
LDI r15, 0x0001434E
LDI r12, 0x1107
STORE r12, r15

; --- Load Layer 1 Bias (4) ---
LDI r15, 0xFFFFF00B
LDI r12, 0x1160
STORE r12, r15
LDI r15, 0x00000000
LDI r12, 0x1161
STORE r12, r15
LDI r15, 0xFFFEB407
LDI r12, 0x1162
STORE r12, r15
LDI r15, 0x00000000
LDI r12, 0x1163
STORE r12, r15

; --- Load Layer 2 Weights (1x4) ---
LDI r15, 0xFFFFF6B5
LDI r12, 0x1300
STORE r12, r15
LDI r15, 0x00006237
LDI r12, 0x1301
STORE r12, r15
LDI r15, 0xFFFE74D0
LDI r12, 0x1302
STORE r12, r15
LDI r15, 0x0000CAB5
LDI r12, 0x1303
STORE r12, r15

; --- Load Layer 2 Bias ---
LDI r15, 0x00000000
LDI r12, 0x1340
STORE r12, r15

; --- Clear screen ---
LDI r8, 0
LDI r15, 0
LDI r0, 256
LDI r1, 256
LDI r5, 0x00181818
RECTF r8, r15, r0, r1, r5

; --- r20 = test case index ---
LDI r20, 0

; ============================================
; Main loop: run all 4 XOR test cases
; ============================================
run_all:
    ; Set inputs and expected output
    CMPI r20, 0
    JNZ r20, case1
    LDI r15, 0
    LDI r12, 0x1000
    STORE r12, r15
    LDI r12, 0x1001
    STORE r12, r15
    LDI r21, 0
    JMP do_forward

case1:
    CMPI r20, 1
    JNZ r20, case2
    LDI r15, 0
    LDI r12, 0x1000
    STORE r12, r15
    LDI r15, 0x00010000
    LDI r12, 0x1001
    STORE r12, r15
    LDI r21, 1
    JMP do_forward

case2:
    CMPI r20, 2
    JNZ r20, case3
    LDI r15, 0x00010000
    LDI r12, 0x1000
    STORE r12, r15
    LDI r15, 0
    LDI r12, 0x1001
    STORE r12, r15
    LDI r21, 1
    JMP do_forward

case3:
    LDI r15, 0x00010000
    LDI r12, 0x1000
    STORE r12, r15
    LDI r15, 0x00010000
    LDI r12, 0x1001
    STORE r12, r15
    LDI r21, 0

; ============================================
; Forward pass
; ============================================
do_forward:
    ; Layer 1: MATVEC (4 rows x 2 cols) * input(2) -> hidden(4)
    LDI r15, 0x1100
    LDI r0, 0x1000
    LDI r1, 0x1200
    LDI r5, 4
    LDI r13, 2
    MATVEC r15, r0, r1, r5, r13

    ; Add bias + RELU for each hidden neuron
    LDI r10, 0
act_loop:
    CMPI r10, 4
    JZ r10, layer2

    ; Load hidden[i]
    LDI r7, 0x1200
    ADD r7, r10
    LOAD r4, r7

    ; Add bias[i]
    LDI r7, 0x1160
    ADD r7, r10
    LOAD r11, r7
    ADD r4, r11

    ; RELU
    RELU r4

    ; Store back
    LDI r7, 0x1200
    ADD r7, r10
    STORE r7, r4

    ; i++
    LDI r15, 1
    ADD r10, r15
    JMP act_loop

layer2:
    ; Layer 2: MATVEC (1 row x 4 cols) * hidden(4) -> output(1)
    LDI r15, 0x1300
    LDI r0, 0x1200
    LDI r1, 0x1400
    LDI r5, 1
    LDI r13, 4
    MATVEC r15, r0, r1, r5, r13

    ; Add output bias
    LDI r7, 0x1400
    LOAD r4, r7
    LDI r7, 0x1340
    LOAD r11, r7
    ADD r4, r11
    LDI r7, 0x1400
    STORE r7, r4

    ; Classify: sign bit check -> positive = 1, negative/zero = 0
    LDI r7, 0x1400
    LOAD r4, r7
    ; Check top bit: if set, value is negative
    LDI r15, 0x80000000
    AND r15, r4
    CMPI r15, 0
    JNZ r15, is_zero

    ; Value is non-negative. Is it exactly 0?
    CMPI r4, 0
    JNZ r4, is_one

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
    LDI r15, 60
    MUL r15, r20
    LDI r0, 20
    ADD r15, r0

    ; Color: green if prediction == expected
    SUB r22, r21
    JZ r22, green
    LDI r5, 0x00FF0000
    JMP draw
green:
    LDI r5, 0x0000FF00
draw:
    LDI r0, 108
    LDI r1, 40
    LDI r13, 40
    RECTF r15, r0, r1, r13, r5

    ; Next test
    LDI r15, 1
    ADD r20, r15
    CMPI r20, 4
    JNZ r20, run_all

; === Done: show frame, wait for key ===
FRAME
wait:
    IKEY r8
    CMPI r8, 0
    JZ r8, wait
    HALT
