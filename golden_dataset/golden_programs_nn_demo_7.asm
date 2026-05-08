; DESCRIPTION: Render a red rectangle at the screen.

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
LDI r12, 0x00006F34
LDI r0, 0x1100
STORE r0, r12
LDI r12, 0xFFFFF315
LDI r0, 0x1101
STORE r0, r12
LDI r12, 0xFFFFDC9B
LDI r0, 0x1102
STORE r0, r12
LDI r12, 0xFFFFC410
LDI r0, 0x1103
STORE r0, r12
LDI r12, 0x00014EB5
LDI r0, 0x1104
STORE r0, r12
LDI r12, 0x00014BF9
LDI r0, 0x1105
STORE r0, r12
LDI r12, 0x00014D00
LDI r0, 0x1106
STORE r0, r12
LDI r12, 0x0001434E
LDI r0, 0x1107
STORE r0, r12

; --- Load Layer 1 Bias (4) ---
LDI r12, 0xFFFFF00B
LDI r0, 0x1160
STORE r0, r12
LDI r12, 0x00000000
LDI r0, 0x1161
STORE r0, r12
LDI r12, 0xFFFEB407
LDI r0, 0x1162
STORE r0, r12
LDI r12, 0x00000000
LDI r0, 0x1163
STORE r0, r12

; --- Load Layer 2 Weights (1x4) ---
LDI r12, 0xFFFFF6B5
LDI r0, 0x1300
STORE r0, r12
LDI r12, 0x00006237
LDI r0, 0x1301
STORE r0, r12
LDI r12, 0xFFFE74D0
LDI r0, 0x1302
STORE r0, r12
LDI r12, 0x0000CAB5
LDI r0, 0x1303
STORE r0, r12

; --- Load Layer 2 Bias ---
LDI r12, 0x00000000
LDI r0, 0x1340
STORE r0, r12

; --- Clear screen ---
LDI r13, 0
LDI r12, 0
LDI r11, 256
LDI r15, 256
LDI r10, 0x00181818
RECTF r13, r12, r11, r15, r10

; --- r20 = test case index ---
LDI r20, 0

; ============================================
; Main loop: run all 4 XOR test cases
; ============================================
run_all:
    ; Set inputs and expected output
    CMPI r20, 0
    JNZ r20, case1
    LDI r12, 0
    LDI r0, 0x1000
    STORE r0, r12
    LDI r0, 0x1001
    STORE r0, r12
    LDI r21, 0
    JMP do_forward

case1:
    CMPI r20, 1
    JNZ r20, case2
    LDI r12, 0
    LDI r0, 0x1000
    STORE r0, r12
    LDI r12, 0x00010000
    LDI r0, 0x1001
    STORE r0, r12
    LDI r21, 1
    JMP do_forward

case2:
    CMPI r20, 2
    JNZ r20, case3
    LDI r12, 0x00010000
    LDI r0, 0x1000
    STORE r0, r12
    LDI r12, 0
    LDI r0, 0x1001
    STORE r0, r12
    LDI r21, 1
    JMP do_forward

case3:
    LDI r12, 0x00010000
    LDI r0, 0x1000
    STORE r0, r12
    LDI r12, 0x00010000
    LDI r0, 0x1001
    STORE r0, r12
    LDI r21, 0

; ============================================
; Forward pass
; ============================================
do_forward:
    ; Layer 1: MATVEC (4 rows x 2 cols) * input(2) -> hidden(4)
    LDI r12, 0x1100
    LDI r11, 0x1000
    LDI r15, 0x1200
    LDI r10, 4
    LDI r1, 2
    MATVEC r12, r11, r15, r10, r1

    ; Add bias + RELU for each hidden neuron
    LDI r4, 0
act_loop:
    CMPI r4, 4
    JZ r4, layer2

    ; Load hidden[i]
    LDI r3, 0x1200
    ADD r3, r4
    LOAD r2, r3

    ; Add bias[i]
    LDI r3, 0x1160
    ADD r3, r4
    LOAD r9, r3
    ADD r2, r9

    ; RELU
    RELU r2

    ; Store back
    LDI r3, 0x1200
    ADD r3, r4
    STORE r3, r2

    ; i++
    LDI r12, 1
    ADD r4, r12
    JMP act_loop

layer2:
    ; Layer 2: MATVEC (1 row x 4 cols) * hidden(4) -> output(1)
    LDI r12, 0x1300
    LDI r11, 0x1200
    LDI r15, 0x1400
    LDI r10, 1
    LDI r1, 4
    MATVEC r12, r11, r15, r10, r1

    ; Add output bias
    LDI r3, 0x1400
    LOAD r2, r3
    LDI r3, 0x1340
    LOAD r9, r3
    ADD r2, r9
    LDI r3, 0x1400
    STORE r3, r2

    ; Classify: sign bit check -> positive = 1, negative/zero = 0
    LDI r3, 0x1400
    LOAD r2, r3
    ; Check top bit: if set, value is negative
    LDI r12, 0x80000000
    AND r12, r2
    CMPI r12, 0
    JNZ r12, is_zero

    ; Value is non-negative. Is it exactly 0?
    CMPI r2, 0
    JNZ r2, is_one

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
    LDI r12, 60
    MUL r12, r20
    LDI r11, 20
    ADD r12, r11

    ; Color: green if prediction == expected
    SUB r22, r21
    JZ r22, green
    LDI r10, 0x00FF0000
    JMP draw
green:
    LDI r10, 0x0000FF00
draw:
    LDI r11, 108
    LDI r15, 40
    LDI r1, 40
    RECTF r12, r11, r15, r1, r10

    ; Next test
    LDI r12, 1
    ADD r20, r12
    CMPI r20, 4
    JNZ r20, run_all

; === Done: show frame, wait for key ===
FRAME
wait:
    IKEY r13
    CMPI r13, 0
    JZ r13, wait
    HALT
