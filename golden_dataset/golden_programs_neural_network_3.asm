; DESCRIPTION: This GeOS assembly code implements a batch neural network inference for an XOR problem using matrix multiplication (MATMUL). It processes four XOR inputs simultaneously in batches, computes the hidden layer with ReLU activation, and outputs predictions, displaying them on screen with visual feedback indicating correctness.

; neural_network.asm -- Batch Neural Network Inference using MATMUL
; Phase 260: Demonstrates MATMUL opcode for 2-layer XOR network
;
; Unlike nn_demo.asm which processes one input at a time with MATVEC,
; this demo stacks all 4 XOR inputs into a batch matrix and uses
; MATMUL to compute the entire hidden layer in one opcode call.
;
; Network: 2 -> 4 -> 1 (XOR with RELU activation)
; Batch size: 4 (all XOR inputs at once)
;
; Screen layout:
;   Top: "XOR Neural Net (MATMUL)" title
;   Middle: 4 boxes showing input -> prediction
;   Bottom: "Green=correct  Red=wrong"
;
; RAM Layout:
;   0x2000: Input batch matrix (4x2) -- all 4 XOR inputs
;   0x2020: Layer 1 weights (4x2) -- hidden layer
;   0x2080: Layer 1 bias (4)
;   0x2100: Hidden activations (4x4) -- after MATMUL + bias + RELU
;   0x2200: Layer 2 weights (1x4) -- output layer
;   0x2240: Layer 2 bias (1)
;   0x2300: Output matrix (4x1) -- predictions
;   0x3000: Text buffer for display

; === Load Input Batch (4x2 matrix, all XOR combinations) ===
; Row 0: [0, 0] -> expected 0
LDI r7, 0
LDI r6, 0x2000
STORE r6, r7
LDI r6, 0x2001
STORE r6, r7
; Row 1: [0, 1] -> expected 1
LDI r7, 0
LDI r6, 0x2002
STORE r6, r7
LDI r7, 0x00010000
LDI r6, 0x2003
STORE r6, r7
; Row 2: [1, 0] -> expected 1
LDI r7, 0x00010000
LDI r6, 0x2004
STORE r6, r7
LDI r7, 0
LDI r6, 0x2005
STORE r6, r7
; Row 3: [1, 1] -> expected 0
LDI r7, 0x00010000
LDI r6, 0x2006
STORE r6, r7
LDI r6, 0x2007
STORE r6, r7

; === Load Layer 1 Weights (4x2) ===
; Same weights as nn_demo.asm
LDI r7, 0x00006F34
LDI r6, 0x2020
STORE r6, r7
LDI r7, 0xFFFFF315
LDI r6, 0x2021
STORE r6, r7
LDI r7, 0xFFFFDC9B
LDI r6, 0x2022
STORE r6, r7
LDI r7, 0xFFFFC410
LDI r6, 0x2023
STORE r6, r7
LDI r7, 0x00014EB5
LDI r6, 0x2024
STORE r6, r7
LDI r7, 0x00014BF9
LDI r6, 0x2025
STORE r6, r7
LDI r7, 0x00014D00
LDI r6, 0x2026
STORE r6, r7
LDI r7, 0x0001434E
LDI r6, 0x2027
STORE r6, r7

; === Load Layer 1 Bias (4) ===
LDI r7, 0xFFFFF00B
LDI r6, 0x2080
STORE r6, r7
LDI r7, 0x00000000
LDI r6, 0x2081
STORE r6, r7
LDI r7, 0xFFFEB407
LDI r6, 0x2082
STORE r6, r7
LDI r7, 0x00000000
LDI r6, 0x2083
STORE r6, r7

; === Load Layer 2 Weights (1x4) ===
LDI r7, 0xFFFFF6B5
LDI r6, 0x2200
STORE r6, r7
LDI r7, 0x00006237
LDI r6, 0x2201
STORE r6, r7
LDI r7, 0xFFFE74D0
LDI r6, 0x2202
STORE r6, r7
LDI r7, 0x0000CAB5
LDI r6, 0x2203
STORE r6, r7

; === Load Layer 2 Bias ===
LDI r7, 0x00000000
LDI r6, 0x2240
STORE r6, r7

; === Clear screen (dark blue background) ===
LDI r13, 0
LDI r7, 0
LDI r12, 256
LDI r2, 256
LDI r14, 0x00101828
RECTF r13, r7, r12, r2, r14

; === Draw title bar ===
LDI r13, 0
LDI r7, 10
LDI r12, 256
LDI r2, 20
LDI r14, 0x00224466
RECTF r13, r7, r12, r2, r14

; Title text: "XOR Neural Network (MATMUL)"
LDI r7, 0x3000
STRO r7, "XOR Neural Network"
LDI r12, 30
LDI r2, 12
LDI r7, 0x3000
TEXT r12, r2, r7
LDI r7, 0x3000
STRO r7, "(MATMUL Batch)"
LDI r12, 100
LDI r7, 0x3000
TEXT r12, r2, r7

; ============================================
; LAYER 1: Batch forward pass using MATMUL
; Input(4x2) * W1^T(2x4) -> Hidden(4x4)
;
; Actually: we need Input(4x2) * W1(2x4)^T
; But our weights are stored as W1(4x2) meaning
; hidden[i] = sum_j(W1[i][j] * input[j])
;
; For MATMUL: C = A * B where A(MxK) * B(KxN) = C(MxN)
; We want: Hidden(4x4) = Input(4x2) * W1_transposed(2x4)
;
; W1_transposed[i][j] = W1[j][i]
; So we build W1_T at 0x2040
; ============================================

; Build W1_transposed (2x4) from W1 (4x2)
; W1_T[0][0] = W1[0][0] = 0x00006F34
LDI r7, 0x00006F34
LDI r6, 0x2040
STORE r6, r7
; W1_T[0][1] = W1[1][0] = 0xFFFFDC9B
LDI r7, 0xFFFFDC9B
LDI r6, 0x2041
STORE r6, r7
; W1_T[0][2] = W1[2][0] = 0x00014EB5
LDI r7, 0x00014EB5
LDI r6, 0x2042
STORE r6, r7
; W1_T[0][3] = W1[3][0] = 0x00014D00
LDI r7, 0x00014D00
LDI r6, 0x2043
STORE r6, r7
; W1_T[1][0] = W1[0][1] = 0xFFFFF315
LDI r7, 0xFFFFF315
LDI r6, 0x2044
STORE r6, r7
; W1_T[1][1] = W1[1][1] = 0xFFFFC410
LDI r7, 0xFFFFC410
LDI r6, 0x2045
STORE r6, r7
; W1_T[1][2] = W1[2][1] = 0x00014BF9
LDI r7, 0x00014BF9
LDI r6, 0x2046
STORE r6, r7
; W1_T[1][3] = W1[3][1] = 0x0001434E
LDI r7, 0x0001434E
LDI r6, 0x2047
STORE r6, r7

; MATMUL dst=0x2100, A=0x2000(input 4x2), B=0x2040(W1_T 2x4), M=4, N=4, K=2
LDI r7, 0x2100
LDI r12, 0x2000
LDI r2, 0x2040
LDI r14, 4
LDI r4, 4
LDI r5, 2
MATMUL r7, r12, r2, r14, r4, r5

; Add bias and apply RELU to each hidden neuron
; Hidden is 4x4 matrix (4 samples, 4 hidden neurons each)
; We need to add bias[j] to Hidden[i][j] for all i, then RELU
LDI r10, 0
bias_relu_loop:
    CMPI r10, 4
    JZ r13, layer2_batch
    ; Process row i, column j where j = r10
    ; For each sample row (0..3)
    LDI r11, 0
sample_loop:
    CMPI r11, 4
    JZ r13, next_bias
    ; addr = 0x2100 + row*4 + col
    LDI r3, 0x2100
    LDI r7, 4
    MUL r7, r11
    ADD r3, r7
    ADD r3, r10
    LOAD r6, r3
    ; Add bias[col]
    LDI r0, 0x2080
    ADD r0, r10
    LOAD r1, r0
    ADD r6, r1
    ; RELU
    RELU r6
    ; Store back
    STORE r3, r6
    ; Next sample row
    LDI r7, 1
    ADD r11, r7
    JMP sample_loop
next_bias:
    LDI r7, 1
    ADD r10, r7
    JMP bias_relu_loop

; ============================================
; LAYER 2: Batch output using MATMUL
; Hidden(4x4) * W2_T(4x1) -> Output(4x1)
;
; W2 is stored as (1x4), so W2_T is (4x1) = column vector
; ============================================
layer2_batch:
; Build W2_transposed (4x1) from W2 (1x4)
LDI r7, 0xFFFFF6B5
LDI r6, 0x2220
STORE r6, r7
LDI r7, 0x00006237
LDI r6, 0x2221
STORE r6, r7
LDI r7, 0xFFFE74D0
LDI r6, 0x2222
STORE r6, r7
LDI r7, 0x0000CAB5
LDI r6, 0x2223
STORE r6, r7

; MATMUL dst=0x2300, A=0x2100(hidden 4x4), B=0x2220(W2_T 4x1), M=4, N=1, K=4
LDI r7, 0x2300
LDI r12, 0x2100
LDI r2, 0x2220
LDI r14, 4
LDI r4, 1
LDI r5, 4
MATMUL r7, r12, r2, r14, r4, r5

; Add output bias to each sample
LDI r10, 0x2300
LOAD r11, r10
LDI r3, 0x2240
LOAD r6, r3
ADD r11, r6
STORE r10, r11

; ============================================
; Display results: 4 boxes
; ============================================
; Expected outputs: [0, 1, 1, 0]
; For each sample, check sign of output[i]
LDI r10, 0

display_loop:
    CMPI r10, 4
    JZ r13, done_display

    ; Load output[i]
    LDI r11, 0x2300
    ADD r11, r10
    LOAD r3, r11

    ; Classify: sign bit -> negative=0, positive=1
    LDI r7, 0x80000000
    AND r7, r3
    CMPI r7, 0
    JNZ r13, pred_zero

    ; Check if exactly zero
    CMPI r3, 0
    JZ r13, pred_zero

    ; Positive -> prediction = 1
    LDI r22, 1
    JMP check_correct

pred_zero:
    LDI r22, 0

check_correct:
    ; Determine expected: sample 0->0, 1->1, 2->1, 3->0
    CMPI r10, 0
    JNZ r13, chk1
    LDI r21, 0
    JMP do_draw
chk1:
    CMPI r10, 1
    JNZ r13, chk2
    LDI r21, 1
    JMP do_draw
chk2:
    CMPI r10, 2
    JNZ r13, chk3
    LDI r21, 1
    JMP do_draw
chk3:
    LDI r21, 0

do_draw:
    ; Box position: x = 16 + i*58
    LDI r7, 58
    MUL r7, r10
    LDI r12, 16
    ADD r7, r12

    ; Color: green if correct, red if wrong
    SUB r22, r21
    JZ r22, is_correct
    LDI r14, 0x00CC2222
    JMP draw_box
is_correct:
    LDI r14, 0x0022CC22

draw_box:
    ; Draw result box
    LDI r12, 80
    LDI r2, 44
    LDI r4, 70
    RECTF r7, r12, r2, r4, r14

    ; Draw input label
    LDI r7, 0x3000
    CMPI r10, 0
    JNZ r13, lb1
    STRO r7, "0,0"
    JMP show_label
lb1:
    CMPI r10, 1
    JNZ r13, lb2
    STRO r7, "0,1"
    JMP show_label
lb2:
    CMPI r10, 2
    JNZ r13, lb3
    STRO r7, "1,0"
    JMP show_label
lb3:
    STRO r7, "1,1"

show_label:
    ; x position for text (already in r3), y=85
    LDI r7, 0x3000
    LDI r2, 85
    TEXT r3, r2, r7

    ; Draw prediction text
    LDI r7, 0x3000
    CMPI r22, 0
    JNZ r13, show_one
    STRO r7, "= 0"
    JMP show_pred
show_one:
    STRO r7, "= 1"

show_pred:
    LDI r3, 58
    MUL r3, r10
    LDI r6, 16
    ADD r3, r6
    LDI r6, 2
    ADD r3, r6
    LDI r2, 110
    LDI r7, 0x3000
    TEXT r3, r2, r7

    ; Next sample
    LDI r7, 1
    ADD r10, r7
    JMP display_loop

done_display:
; Draw legend at bottom
LDI r7, 0x3000
STRO r7, "Green=correct  Red=wrong"
LDI r12, 30
LDI r2, 200
LDI r7, 0x3000
TEXT r12, r2, r7

; Show frame and wait
FRAME
wait:
    IKEY r13
    CMPI r13, 0
    JZ r13, wait
    HALT
