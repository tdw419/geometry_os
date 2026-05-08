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
LDI r4, 0x00006F34
LDI r0, 0x1100
STORE r0, r4
LDI r4, 0xFFFFF315
LDI r0, 0x1101
STORE r0, r4
LDI r4, 0xFFFFDC9B
LDI r0, 0x1102
STORE r0, r4
LDI r4, 0xFFFFC410
LDI r0, 0x1103
STORE r0, r4
LDI r4, 0x00014EB5
LDI r0, 0x1104
STORE r0, r4
LDI r4, 0x00014BF9
LDI r0, 0x1105
STORE r0, r4
LDI r4, 0x00014D00
LDI r0, 0x1106
STORE r0, r4
LDI r4, 0x0001434E
LDI r0, 0x1107
STORE r0, r4

; --- Load Layer 1 Bias (4) ---
LDI r4, 0xFFFFF00B
LDI r0, 0x1160
STORE r0, r4
LDI r4, 0x00000000
LDI r0, 0x1161
STORE r0, r4
LDI r4, 0xFFFEB407
LDI r0, 0x1162
STORE r0, r4
LDI r4, 0x00000000
LDI r0, 0x1163
STORE r0, r4

; --- Load Layer 2 Weights (1x4) ---
LDI r4, 0xFFFFF6B5
LDI r0, 0x1300
STORE r0, r4
LDI r4, 0x00006237
LDI r0, 0x1301
STORE r0, r4
LDI r4, 0xFFFE74D0
LDI r0, 0x1302
STORE r0, r4
LDI r4, 0x0000CAB5
LDI r0, 0x1303
STORE r0, r4

; --- Load Layer 2 Bias ---
LDI r4, 0x00000000
LDI r0, 0x1340
STORE r0, r4

; --- Clear screen ---
LDI r1, 0
LDI r4, 0
LDI r2, 256
LDI r11, 256
LDI r9, 0x00181818
RECTF r1, r4, r2, r11, r9

; --- r20 = test case index ---
LDI r20, 0

; ============================================
; Main loop: run all 4 XOR test cases
; ============================================
run_all:
    ; Set inputs and expected output
    CMPI r20, 0
    JNZ r20, case1
    LDI r4, 0
    LDI r0, 0x1000
    STORE r0, r4
    LDI r0, 0x1001
    STORE r0, r4
    LDI r21, 0
    JMP do_forward

case1:
    CMPI r20, 1
    JNZ r20, case2
    LDI r4, 0
    LDI r0, 0x1000
    STORE r0, r4
    LDI r4, 0x00010000
    LDI r0, 0x1001
    STORE r0, r4
    LDI r21, 1
    JMP do_forward

case2:
    CMPI r20, 2
    JNZ r20, case3
    LDI r4, 0x00010000
    LDI r0, 0x1000
    STORE r0, r4
    LDI r4, 0
    LDI r0, 0x1001
    STORE r0, r4
    LDI r21, 1
    JMP do_forward

case3:
    LDI r4, 0x00010000
    LDI r0, 0x1000
    STORE r0, r4
    LDI r4, 0x00010000
    LDI r0, 0x1001
    STORE r0, r4
    LDI r21, 0

; ============================================
; Forward pass
; ============================================
do_forward:
    ; Layer 1: MATVEC (4 rows x 2 cols) * input(2) -> hidden(4)
    LDI r4, 0x1100
    LDI r2, 0x1000
    LDI r11, 0x1200
    LDI r9, 4
    LDI r14, 2
    MATVEC r4, r2, r11, r9, r14

    ; Add bias + RELU for each hidden neuron
    LDI r5, 0
act_loop:
    CMPI r5, 4
    JZ r5, layer2

    ; Load hidden[i]
    LDI r12, 0x1200
    ADD r12, r5
    LOAD r7, r12

    ; Add bias[i]
    LDI r12, 0x1160
    ADD r12, r5
    LOAD r3, r12
    ADD r7, r3

    ; RELU
    RELU r7

    ; Store back
    LDI r12, 0x1200
    ADD r12, r5
    STORE r12, r7

    ; i++
    LDI r4, 1
    ADD r5, r4
    JMP act_loop

layer2:
    ; Layer 2: MATVEC (1 row x 4 cols) * hidden(4) -> output(1)
    LDI r4, 0x1300
    LDI r2, 0x1200
    LDI r11, 0x1400
    LDI r9, 1
    LDI r14, 4
    MATVEC r4, r2, r11, r9, r14

    ; Add output bias
    LDI r12, 0x1400
    LOAD r7, r12
    LDI r12, 0x1340
    LOAD r3, r12
    ADD r7, r3
    LDI r12, 0x1400
    STORE r12, r7

    ; Classify: sign bit check -> positive = 1, negative/zero = 0
    LDI r12, 0x1400
    LOAD r7, r12
    ; Check top bit: if set, value is negative
    LDI r4, 0x80000000
    AND r4, r7
    CMPI r4, 0
    JNZ r4, is_zero

    ; Value is non-negative. Is it exactly 0?
    CMPI r7, 0
    JNZ r7, is_one

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
    LDI r4, 60
    MUL r4, r20
    LDI r2, 20
    ADD r4, r2

    ; Color: green if prediction == expected
    SUB r22, r21
    JZ r22, green
    LDI r9, 0x00FF0000
    JMP draw
green:
    LDI r9, 0x0000FF00
draw:
    LDI r2, 108
    LDI r11, 40
    LDI r14, 40
    RECTF r4, r2, r11, r14, r9

    ; Next test
    LDI r4, 1
    ADD r20, r4
    CMPI r20, 4
    JNZ r20, run_all

; === Done: show frame, wait for key ===
FRAME
wait:
    IKEY r1
    CMPI r1, 0
    JZ r1, wait
    HALT
