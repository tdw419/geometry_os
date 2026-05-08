; DESCRIPTION: Geometry OS program to draw a red rectangle.

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
LDI r1, 0x00006F34
LDI r6, 0x1100
STORE r6, r1
LDI r1, 0xFFFFF315
LDI r6, 0x1101
STORE r6, r1
LDI r1, 0xFFFFDC9B
LDI r6, 0x1102
STORE r6, r1
LDI r1, 0xFFFFC410
LDI r6, 0x1103
STORE r6, r1
LDI r1, 0x00014EB5
LDI r6, 0x1104
STORE r6, r1
LDI r1, 0x00014BF9
LDI r6, 0x1105
STORE r6, r1
LDI r1, 0x00014D00
LDI r6, 0x1106
STORE r6, r1
LDI r1, 0x0001434E
LDI r6, 0x1107
STORE r6, r1

; --- Load Layer 1 Bias (4) ---
LDI r1, 0xFFFFF00B
LDI r6, 0x1160
STORE r6, r1
LDI r1, 0x00000000
LDI r6, 0x1161
STORE r6, r1
LDI r1, 0xFFFEB407
LDI r6, 0x1162
STORE r6, r1
LDI r1, 0x00000000
LDI r6, 0x1163
STORE r6, r1

; --- Load Layer 2 Weights (1x4) ---
LDI r1, 0xFFFFF6B5
LDI r6, 0x1300
STORE r6, r1
LDI r1, 0x00006237
LDI r6, 0x1301
STORE r6, r1
LDI r1, 0xFFFE74D0
LDI r6, 0x1302
STORE r6, r1
LDI r1, 0x0000CAB5
LDI r6, 0x1303
STORE r6, r1

; --- Load Layer 2 Bias ---
LDI r1, 0x00000000
LDI r6, 0x1340
STORE r6, r1

; --- Clear screen ---
LDI r0, 0
LDI r1, 0
LDI r12, 256
LDI r7, 256
LDI r13, 0x00181818
RECTF r0, r1, r12, r7, r13

; --- r20 = test case index ---
LDI r20, 0

; ============================================
; Main loop: run all 4 XOR test cases
; ============================================
run_all:
    ; Set inputs and expected output
    CMPI r20, 0
    JNZ r20, case1
    LDI r1, 0
    LDI r6, 0x1000
    STORE r6, r1
    LDI r6, 0x1001
    STORE r6, r1
    LDI r21, 0
    JMP do_forward

case1:
    CMPI r20, 1
    JNZ r20, case2
    LDI r1, 0
    LDI r6, 0x1000
    STORE r6, r1
    LDI r1, 0x00010000
    LDI r6, 0x1001
    STORE r6, r1
    LDI r21, 1
    JMP do_forward

case2:
    CMPI r20, 2
    JNZ r20, case3
    LDI r1, 0x00010000
    LDI r6, 0x1000
    STORE r6, r1
    LDI r1, 0
    LDI r6, 0x1001
    STORE r6, r1
    LDI r21, 1
    JMP do_forward

case3:
    LDI r1, 0x00010000
    LDI r6, 0x1000
    STORE r6, r1
    LDI r1, 0x00010000
    LDI r6, 0x1001
    STORE r6, r1
    LDI r21, 0

; ============================================
; Forward pass
; ============================================
do_forward:
    ; Layer 1: MATVEC (4 rows x 2 cols) * input(2) -> hidden(4)
    LDI r1, 0x1100
    LDI r12, 0x1000
    LDI r7, 0x1200
    LDI r13, 4
    LDI r15, 2
    MATVEC r1, r12, r7, r13, r15

    ; Add bias + RELU for each hidden neuron
    LDI r11, 0
act_loop:
    CMPI r11, 4
    JZ r11, layer2

    ; Load hidden[i]
    LDI r10, 0x1200
    ADD r10, r11
    LOAD r4, r10

    ; Add bias[i]
    LDI r10, 0x1160
    ADD r10, r11
    LOAD r8, r10
    ADD r4, r8

    ; RELU
    RELU r4

    ; Store back
    LDI r10, 0x1200
    ADD r10, r11
    STORE r10, r4

    ; i++
    LDI r1, 1
    ADD r11, r1
    JMP act_loop

layer2:
    ; Layer 2: MATVEC (1 row x 4 cols) * hidden(4) -> output(1)
    LDI r1, 0x1300
    LDI r12, 0x1200
    LDI r7, 0x1400
    LDI r13, 1
    LDI r15, 4
    MATVEC r1, r12, r7, r13, r15

    ; Add output bias
    LDI r10, 0x1400
    LOAD r4, r10
    LDI r10, 0x1340
    LOAD r8, r10
    ADD r4, r8
    LDI r10, 0x1400
    STORE r10, r4

    ; Classify: sign bit check -> positive = 1, negative/zero = 0
    LDI r10, 0x1400
    LOAD r4, r10
    ; Check top bit: if set, value is negative
    LDI r1, 0x80000000
    AND r1, r4
    CMPI r1, 0
    JNZ r1, is_zero

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
    LDI r1, 60
    MUL r1, r20
    LDI r12, 20
    ADD r1, r12

    ; Color: green if prediction == expected
    SUB r22, r21
    JZ r22, green
    LDI r13, 0x00FF0000
    JMP draw
green:
    LDI r13, 0x0000FF00
draw:
    LDI r12, 108
    LDI r7, 40
    LDI r15, 40
    RECTF r1, r12, r7, r15, r13

    ; Next test
    LDI r1, 1
    ADD r20, r1
    CMPI r20, 4
    JNZ r20, run_all

; === Done: show frame, wait for key ===
FRAME
wait:
    IKEY r0
    CMPI r0, 0
    JZ r0, wait
    HALT
