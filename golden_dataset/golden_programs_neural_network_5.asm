; DESCRIPTION: A red rectangle centered at the screen with fixed size.

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
LDI r15, 0
LDI r11, 0x2000
STORE r11, r15
LDI r11, 0x2001
STORE r11, r15
; Row 1: [0, 1] -> expected 1
LDI r15, 0
LDI r11, 0x2002
STORE r11, r15
LDI r15, 0x00010000
LDI r11, 0x2003
STORE r11, r15
; Row 2: [1, 0] -> expected 1
LDI r15, 0x00010000
LDI r11, 0x2004
STORE r11, r15
LDI r15, 0
LDI r11, 0x2005
STORE r11, r15
; Row 3: [1, 1] -> expected 0
LDI r15, 0x00010000
LDI r11, 0x2006
STORE r11, r15
LDI r11, 0x2007
STORE r11, r15

; === Load Layer 1 Weights (4x2) ===
; Same weights as nn_demo.asm
LDI r15, 0x00006F34
LDI r11, 0x2020
STORE r11, r15
LDI r15, 0xFFFFF315
LDI r11, 0x2021
STORE r11, r15
LDI r15, 0xFFFFDC9B
LDI r11, 0x2022
STORE r11, r15
LDI r15, 0xFFFFC410
LDI r11, 0x2023
STORE r11, r15
LDI r15, 0x00014EB5
LDI r11, 0x2024
STORE r11, r15
LDI r15, 0x00014BF9
LDI r11, 0x2025
STORE r11, r15
LDI r15, 0x00014D00
LDI r11, 0x2026
STORE r11, r15
LDI r15, 0x0001434E
LDI r11, 0x2027
STORE r11, r15

; === Load Layer 1 Bias (4) ===
LDI r15, 0xFFFFF00B
LDI r11, 0x2080
STORE r11, r15
LDI r15, 0x00000000
LDI r11, 0x2081
STORE r11, r15
LDI r15, 0xFFFEB407
LDI r11, 0x2082
STORE r11, r15
LDI r15, 0x00000000
LDI r11, 0x2083
STORE r11, r15

; === Load Layer 2 Weights (1x4) ===
LDI r15, 0xFFFFF6B5
LDI r11, 0x2200
STORE r11, r15
LDI r15, 0x00006237
LDI r11, 0x2201
STORE r11, r15
LDI r15, 0xFFFE74D0
LDI r11, 0x2202
STORE r11, r15
LDI r15, 0x0000CAB5
LDI r11, 0x2203
STORE r11, r15

; === Load Layer 2 Bias ===
LDI r15, 0x00000000
LDI r11, 0x2240
STORE r11, r15

; === Clear screen (dark blue background) ===
LDI r6, 0
LDI r15, 0
LDI r14, 256
LDI r3, 256
LDI r8, 0x00101828
RECTF r6, r15, r14, r3, r8

; === Draw title bar ===
LDI r6, 0
LDI r15, 10
LDI r14, 256
LDI r3, 20
LDI r8, 0x00224466
RECTF r6, r15, r14, r3, r8

; Title text: "XOR Neural Network (MATMUL)"
LDI r15, 0x3000
STRO r15, "XOR Neural Network"
LDI r14, 30
LDI r3, 12
LDI r15, 0x3000
TEXT r14, r3, r15
LDI r15, 0x3000
STRO r15, "(MATMUL Batch)"
LDI r14, 100
LDI r15, 0x3000
TEXT r14, r3, r15

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
LDI r15, 0x00006F34
LDI r11, 0x2040
STORE r11, r15
; W1_T[0][1] = W1[1][0] = 0xFFFFDC9B
LDI r15, 0xFFFFDC9B
LDI r11, 0x2041
STORE r11, r15
; W1_T[0][2] = W1[2][0] = 0x00014EB5
LDI r15, 0x00014EB5
LDI r11, 0x2042
STORE r11, r15
; W1_T[0][3] = W1[3][0] = 0x00014D00
LDI r15, 0x00014D00
LDI r11, 0x2043
STORE r11, r15
; W1_T[1][0] = W1[0][1] = 0xFFFFF315
LDI r15, 0xFFFFF315
LDI r11, 0x2044
STORE r11, r15
; W1_T[1][1] = W1[1][1] = 0xFFFFC410
LDI r15, 0xFFFFC410
LDI r11, 0x2045
STORE r11, r15
; W1_T[1][2] = W1[2][1] = 0x00014BF9
LDI r15, 0x00014BF9
LDI r11, 0x2046
STORE r11, r15
; W1_T[1][3] = W1[3][1] = 0x0001434E
LDI r15, 0x0001434E
LDI r11, 0x2047
STORE r11, r15

; MATMUL dst=0x2100, A=0x2000(input 4x2), B=0x2040(W1_T 2x4), M=4, N=4, K=2
LDI r15, 0x2100
LDI r14, 0x2000
LDI r3, 0x2040
LDI r8, 4
LDI r9, 4
LDI r12, 2
MATMUL r15, r14, r3, r8, r9, r12

; Add bias and apply RELU to each hidden neuron
; Hidden is 4x4 matrix (4 samples, 4 hidden neurons each)
; We need to add bias[j] to Hidden[i][j] for all i, then RELU
LDI r4, 0
bias_relu_loop:
    CMPI r4, 4
    JZ r6, layer2_batch
    ; Process row i, column j where j = r4
    ; For each sample row (0..3)
    LDI r5, 0
sample_loop:
    CMPI r5, 4
    JZ r6, next_bias
    ; addr = 0x2100 + row*4 + col
    LDI r1, 0x2100
    LDI r15, 4
    MUL r15, r5
    ADD r1, r15
    ADD r1, r4
    LOAD r11, r1
    ; Add bias[col]
    LDI r7, 0x2080
    ADD r7, r4
    LOAD r2, r7
    ADD r11, r2
    ; RELU
    RELU r11
    ; Store back
    STORE r1, r11
    ; Next sample row
    LDI r15, 1
    ADD r5, r15
    JMP sample_loop
next_bias:
    LDI r15, 1
    ADD r4, r15
    JMP bias_relu_loop

; ============================================
; LAYER 2: Batch output using MATMUL
; Hidden(4x4) * W2_T(4x1) -> Output(4x1)
;
; W2 is stored as (1x4), so W2_T is (4x1) = column vector
; ============================================
layer2_batch:
; Build W2_transposed (4x1) from W2 (1x4)
LDI r15, 0xFFFFF6B5
LDI r11, 0x2220
STORE r11, r15
LDI r15, 0x00006237
LDI r11, 0x2221
STORE r11, r15
LDI r15, 0xFFFE74D0
LDI r11, 0x2222
STORE r11, r15
LDI r15, 0x0000CAB5
LDI r11, 0x2223
STORE r11, r15

; MATMUL dst=0x2300, A=0x2100(hidden 4x4), B=0x2220(W2_T 4x1), M=4, N=1, K=4
LDI r15, 0x2300
LDI r14, 0x2100
LDI r3, 0x2220
LDI r8, 4
LDI r9, 1
LDI r12, 4
MATMUL r15, r14, r3, r8, r9, r12

; Add output bias to each sample
LDI r4, 0x2300
LOAD r5, r4
LDI r1, 0x2240
LOAD r11, r1
ADD r5, r11
STORE r4, r5

; ============================================
; Display results: 4 boxes
; ============================================
; Expected outputs: [0, 1, 1, 0]
; For each sample, check sign of output[i]
LDI r4, 0

display_loop:
    CMPI r4, 4
    JZ r6, done_display

    ; Load output[i]
    LDI r5, 0x2300
    ADD r5, r4
    LOAD r1, r5

    ; Classify: sign bit -> negative=0, positive=1
    LDI r15, 0x80000000
    AND r15, r1
    CMPI r15, 0
    JNZ r6, pred_zero

    ; Check if exactly zero
    CMPI r1, 0
    JZ r6, pred_zero

    ; Positive -> prediction = 1
    LDI r22, 1
    JMP check_correct

pred_zero:
    LDI r22, 0

check_correct:
    ; Determine expected: sample 0->0, 1->1, 2->1, 3->0
    CMPI r4, 0
    JNZ r6, chk1
    LDI r21, 0
    JMP do_draw
chk1:
    CMPI r4, 1
    JNZ r6, chk2
    LDI r21, 1
    JMP do_draw
chk2:
    CMPI r4, 2
    JNZ r6, chk3
    LDI r21, 1
    JMP do_draw
chk3:
    LDI r21, 0

do_draw:
    ; Box position: x = 16 + i*58
    LDI r15, 58
    MUL r15, r4
    LDI r14, 16
    ADD r15, r14

    ; Color: green if correct, red if wrong
    SUB r22, r21
    JZ r22, is_correct
    LDI r8, 0x00CC2222
    JMP draw_box
is_correct:
    LDI r8, 0x0022CC22

draw_box:
    ; Draw result box
    LDI r14, 80
    LDI r3, 44
    LDI r9, 70
    RECTF r15, r14, r3, r9, r8

    ; Draw input label
    LDI r15, 0x3000
    CMPI r4, 0
    JNZ r6, lb1
    STRO r15, "0,0"
    JMP show_label
lb1:
    CMPI r4, 1
    JNZ r6, lb2
    STRO r15, "0,1"
    JMP show_label
lb2:
    CMPI r4, 2
    JNZ r6, lb3
    STRO r15, "1,0"
    JMP show_label
lb3:
    STRO r15, "1,1"

show_label:
    ; x position for text (already in r1), y=85
    LDI r15, 0x3000
    LDI r3, 85
    TEXT r1, r3, r15

    ; Draw prediction text
    LDI r15, 0x3000
    CMPI r22, 0
    JNZ r6, show_one
    STRO r15, "= 0"
    JMP show_pred
show_one:
    STRO r15, "= 1"

show_pred:
    LDI r1, 58
    MUL r1, r4
    LDI r11, 16
    ADD r1, r11
    LDI r11, 2
    ADD r1, r11
    LDI r3, 110
    LDI r15, 0x3000
    TEXT r1, r3, r15

    ; Next sample
    LDI r15, 1
    ADD r4, r15
    JMP display_loop

done_display:
; Draw legend at bottom
LDI r15, 0x3000
STRO r15, "Green=correct  Red=wrong"
LDI r14, 30
LDI r3, 200
LDI r15, 0x3000
TEXT r14, r3, r15

; Show frame and wait
FRAME
wait:
    IKEY r6
    CMPI r6, 0
    JZ r6, wait
    HALT
