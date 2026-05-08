; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

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
LDI r2, 0x00006F34
LDI r14, 0x1100
STORE r14, r2
LDI r2, 0xFFFFF315
LDI r14, 0x1101
STORE r14, r2
LDI r2, 0xFFFFDC9B
LDI r14, 0x1102
STORE r14, r2
LDI r2, 0xFFFFC410
LDI r14, 0x1103
STORE r14, r2
LDI r2, 0x00014EB5
LDI r14, 0x1104
STORE r14, r2
LDI r2, 0x00014BF9
LDI r14, 0x1105
STORE r14, r2
LDI r2, 0x00014D00
LDI r14, 0x1106
STORE r14, r2
LDI r2, 0x0001434E
LDI r14, 0x1107
STORE r14, r2

; --- Load Layer 1 Bias (4) ---
LDI r2, 0xFFFFF00B
LDI r14, 0x1160
STORE r14, r2
LDI r2, 0x00000000
LDI r14, 0x1161
STORE r14, r2
LDI r2, 0xFFFEB407
LDI r14, 0x1162
STORE r14, r2
LDI r2, 0x00000000
LDI r14, 0x1163
STORE r14, r2

; --- Load Layer 2 Weights (1x4) ---
LDI r2, 0xFFFFF6B5
LDI r14, 0x1300
STORE r14, r2
LDI r2, 0x00006237
LDI r14, 0x1301
STORE r14, r2
LDI r2, 0xFFFE74D0
LDI r14, 0x1302
STORE r14, r2
LDI r2, 0x0000CAB5
LDI r14, 0x1303
STORE r14, r2

; --- Load Layer 2 Bias ---
LDI r2, 0x00000000
LDI r14, 0x1340
STORE r14, r2

; --- Clear screen ---
LDI r8, 0
LDI r2, 0
LDI r11, 256
LDI r10, 256
LDI r1, 0x00181818
RECTF r8, r2, r11, r10, r1

; --- r20 = test case index ---
LDI r20, 0

; ============================================
; Main loop: run all 4 XOR test cases
; ============================================
run_all:
    ; Set inputs and expected output
    CMPI r20, 0
    JNZ r20, case1
    LDI r2, 0
    LDI r14, 0x1000
    STORE r14, r2
    LDI r14, 0x1001
    STORE r14, r2
    LDI r21, 0
    JMP do_forward

case1:
    CMPI r20, 1
    JNZ r20, case2
    LDI r2, 0
    LDI r14, 0x1000
    STORE r14, r2
    LDI r2, 0x00010000
    LDI r14, 0x1001
    STORE r14, r2
    LDI r21, 1
    JMP do_forward

case2:
    CMPI r20, 2
    JNZ r20, case3
    LDI r2, 0x00010000
    LDI r14, 0x1000
    STORE r14, r2
    LDI r2, 0
    LDI r14, 0x1001
    STORE r14, r2
    LDI r21, 1
    JMP do_forward

case3:
    LDI r2, 0x00010000
    LDI r14, 0x1000
    STORE r14, r2
    LDI r2, 0x00010000
    LDI r14, 0x1001
    STORE r14, r2
    LDI r21, 0

; ============================================
; Forward pass
; ============================================
do_forward:
    ; Layer 1: MATVEC (4 rows x 2 cols) * input(2) -> hidden(4)
    LDI r2, 0x1100
    LDI r11, 0x1000
    LDI r10, 0x1200
    LDI r1, 4
    LDI r4, 2
    MATVEC r2, r11, r10, r1, r4

    ; Add bias + RELU for each hidden neuron
    LDI r6, 0
act_loop:
    CMPI r6, 4
    JZ r6, layer2

    ; Load hidden[i]
    LDI r9, 0x1200
    ADD r9, r6
    LOAD r7, r9

    ; Add bias[i]
    LDI r9, 0x1160
    ADD r9, r6
    LOAD r13, r9
    ADD r7, r13

    ; RELU
    RELU r7

    ; Store back
    LDI r9, 0x1200
    ADD r9, r6
    STORE r9, r7

    ; i++
    LDI r2, 1
    ADD r6, r2
    JMP act_loop

layer2:
    ; Layer 2: MATVEC (1 row x 4 cols) * hidden(4) -> output(1)
    LDI r2, 0x1300
    LDI r11, 0x1200
    LDI r10, 0x1400
    LDI r1, 1
    LDI r4, 4
    MATVEC r2, r11, r10, r1, r4

    ; Add output bias
    LDI r9, 0x1400
    LOAD r7, r9
    LDI r9, 0x1340
    LOAD r13, r9
    ADD r7, r13
    LDI r9, 0x1400
    STORE r9, r7

    ; Classify: sign bit check -> positive = 1, negative/zero = 0
    LDI r9, 0x1400
    LOAD r7, r9
    ; Check top bit: if set, value is negative
    LDI r2, 0x80000000
    AND r2, r7
    CMPI r2, 0
    JNZ r2, is_zero

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
    LDI r2, 60
    MUL r2, r20
    LDI r11, 20
    ADD r2, r11

    ; Color: green if prediction == expected
    SUB r22, r21
    JZ r22, green
    LDI r1, 0x00FF0000
    JMP draw
green:
    LDI r1, 0x0000FF00
draw:
    LDI r11, 108
    LDI r10, 40
    LDI r4, 40
    RECTF r2, r11, r10, r4, r1

    ; Next test
    LDI r2, 1
    ADD r20, r2
    CMPI r20, 4
    JNZ r20, run_all

; === Done: show frame, wait for key ===
FRAME
wait:
    IKEY r8
    CMPI r8, 0
    JZ r8, wait
    HALT
