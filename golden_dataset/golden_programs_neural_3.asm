; DESCRIPTION: This GeOS assembly code implements a simple two-layer neural network with matrix-vector multiplication (MATVEC) and ReLU activation functions. It classifies a 4x4 pixel pattern into three categories: diagonal, anti-diagonal, or other. The weights are initialized for detecting diagonal lines, and the input can be changed via keyboard inputs. The code displays the input grid, output bars representing the classification scores, and the winning category on the screen.

; neural.asm -- Neural network inference running natively in Geometry OS VM
;
; Demonstrates the MATVEC and RELU opcodes for neural inference.
; A tiny 2-layer MLP classifies a 4x4 pixel pattern into 3 classes.
;
; Architecture: 16 inputs -> 8 hidden (ReLU) -> 3 outputs (softmax)
; Weights stored in RAM as 16.16 fixed-point values.
;
; RAM Layout:
;   0x2000-0x207F  Layer 1 weights (8 rows x 16 cols = 128 cells)
;   0x2080-0x2087  Layer 1 biases (8 cells)
;   0x2090-0x20CF  Layer 2 weights (3 rows x 8 cols = 24 cells)
;   0x20D0-0x20D2  Layer 2 biases (3 cells)
;   0x2100-0x210F  Input vector (16 cells)
;   0x2110-0x2117  Hidden layer output (8 cells)
;   0x2120-0x2122  Output layer (3 cells)
;   0x2200         Output class (u32)
;   0x2300         Text buffers

#define W1_BASE    0x2000
#define B1_BASE    0x2080
#define W2_BASE    0x2090
#define B2_BASE    0x20D0
#define INPUT      0x2100
#define HIDDEN     0x2110
#define OUTPUT     0x2120
#define CLASS      0x2200
#define TEXT_BUF   0x2300
#define STATUS     0x2350

; Helper constants for 16.16 fixed-point
#define FP_ONE     0x00010000    ; 1.0 in 16.16
#define FP_HALF    0x00008000    ; 0.5 in 16.16
#define FP_TEN     0x000A0000    ; 10.0

START:
    ; Initialize weights for a simple pattern detector
    ; This detects diagonal lines in a 4x4 grid
    CALL init_weights
    
    ; Initialize input pattern (diagonal)
    CALL init_input
    
    ; Run inference
    CALL forward_pass
    
    ; Display results
    CALL display_results

main_loop:
    FRAME
    IKEY r9
    JZ r9, main_loop
    
    ; 1-3 keys change input pattern
    CMPI r9, 49    ; '1'
    JNZ r1, try_key2
    CALL init_pattern1
    CALL forward_pass
    CALL display_results
    JMP main_loop

    try_key2:
    CMPI r9, 50    ; '2'
    JNZ r1, try_key3
    CALL init_pattern2
    CALL forward_pass
    CALL display_results
    JMP main_loop

    try_key3:
    CMPI r9, 51    ; '3'
    JNZ r1, try_space
    CALL init_pattern3
    CALL forward_pass
    CALL display_results
    JMP main_loop

    try_space:
    CMPI r9, 32    ; space = random input
    JNZ r1, check_esc
    CALL init_random
    CALL forward_pass
    CALL display_results
    JMP main_loop

    check_esc:
    CMPI r9, 27
    JZ r1, exit_app
    JMP main_loop

exit_app:
    HALT

; ========================================
; Initialize weights for diagonal line detector
; ========================================
init_weights:
    ; Layer 1: 8 neurons x 16 inputs
    ; Neuron 0: detects top-left diagonal
    LDI r20, W1_BASE
    
    ; Row 0: detects main diagonal [1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1]
    LDI r13, 0x00010000   ; 1.0 fp
    LDI r5, 0x00000000   ; 0.0 fp
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    
    ; Row 1: anti-diagonal [0,0,0,1, 0,0,1,0, 0,1,0,0, 1,0,0,0]
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    
    ; Remaining 6 rows: random-ish patterns
    LDI r0, 6
    fill_remaining:
        LDI r9, 16
        fill_row:
            ; Alternate between small positive and negative
            LDI r4, 0x00008000   ; 0.5
            STORE r20, r4
            ADDI r20, 1
            ADDI r9, 0xFFFF      ; r9--
            JNZ r9, fill_row
        ADDI r0, 0xFFFF
        JNZ r0, fill_remaining
    
    ; Biases: small negative (to keep outputs near zero)
    LDI r20, B1_BASE
    LDI r13, 0xFFFF0000  ; -1.0 fp (bias)
    LDI r0, 8
    fill_bias:
    STORE r20, r13
    ADDI r20, 1
    ADDI r0, 0xFFFF
    JNZ r0, fill_bias
    
    ; Layer 2: 3 neurons x 8 inputs (simple identity-like)
    LDI r20, W2_BASE
    ; Class 0: activates on hidden[0]
    LDI r13, 0x00020000   ; 2.0 fp
    STORE r20, r13
    ADDI r20, 1
    LDI r0, 7
    zero_rest_l2_0:
    LDI r5, 0
    STORE r20, r5
    ADDI r20, 1
    ADDI r0, 0xFFFF
    JNZ r0, zero_rest_l2_0
    
    ; Class 1: activates on hidden[1]
    LDI r5, 0
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    LDI r0, 6
    zero_rest_l2_1:
    STORE r20, r5
    ADDI r20, 1
    ADDI r0, 0xFFFF
    JNZ r0, zero_rest_l2_1
    
    ; Class 2: activates on hidden[2..7] sum
    LDI r4, 6
    LDI r14, 0x00005555   ; 1/3 fp
    fill_class2:
    STORE r20, r14
    ADDI r20, 1
    ADDI r4, 0xFFFF
    JNZ r4, fill_class2
    LDI r5, 0
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    
    ; Layer 2 biases
    LDI r20, B2_BASE
    LDI r13, 0xFFFF8000  ; -0.5
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r13
    
    RET

; ========================================
; Initialize input: diagonal pattern
; ========================================
init_input:
    CALL init_pattern1
    RET

init_pattern1:
    ; Main diagonal: [1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1]
    LDI r20, INPUT
    LDI r13, 0x00010000   ; 1.0
    LDI r5, 0x00000000   ; 0.0
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    RET

init_pattern2:
    ; Anti-diagonal: [0,0,0,1, 0,0,1,0, 0,1,0,0, 1,0,0,0]
    LDI r20, INPUT
    LDI r13, 0x00010000
    LDI r5, 0x00000000
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r13
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    STORE r20, r5
    ADDI r20, 1
    RET

init_pattern3:
    ; All ones
    LDI r20, INPUT
    LDI r13, 0x00010000
    LDI r0, 16
    fill_ones:
    STORE r20, r13
    ADDI r20, 1
    ADDI r0, 0xFFFF
    JNZ r0, fill_ones
    RET

init_random:
    ; Checkerboard pattern
    LDI r20, INPUT
    LDI r13, 0x00010000
    LDI r5, 0x00000000
    LDI r0, 16
    LDI r9, 0
    fill_checker:
    AND r9, r13         ; test bit 0... rough approximation
    LDI r4, 1
    AND r9, r4
    JNZ r9, store_zero
    STORE r20, r13
    JMP next_checker
    store_zero:
    STORE r20, r5
    next_checker:
    ADDI r20, 1
    ADDI r9, 1
    ADDI r0, 0xFFFF
    JNZ r0, fill_checker
    RET

; ========================================
; Forward pass: input -> hidden -> output
; ========================================
forward_pass:
    ; Layer 1: MATVEC(weight, input, hidden, 8, 16)
    LDI r3, W1_BASE
    LDI r7, INPUT
    LDI r6, HIDDEN
    LDI r8, 8       ; rows
    LDI r15, 16      ; cols
    MATVEC r3, r7, r6, r8, r15
    
    ; Add biases
    LDI r3, B1_BASE
    LDI r7, HIDDEN
    LDI r0, 8
    add_bias1:
    LOAD r13, r3     ; bias
    LOAD r5, r7     ; hidden[i]
    ADD r5, r13       ; hidden[i] += bias
    STORE r7, r5
    ADDI r3, 1
    ADDI r7, 1
    ADDI r0, 0xFFFF
    JNZ r0, add_bias1
    
    ; ReLU on hidden layer
    LDI r7, HIDDEN
    LDI r0, 8
    relu_loop:
    LOAD r5, r7
    ; Check if negative (bit 31 set)
    LDI r9, 0x80000000
    AND r9, r5
    JNZ r9, relu_zero
    JMP relu_next
    relu_zero:
    LDI r5, 0
    STORE r7, r5
    relu_next:
    ADDI r7, 1
    ADDI r0, 0xFFFF
    JNZ r0, relu_loop
    
    ; Layer 2: MATVEC(weight, hidden, output, 3, 8)
    LDI r3, W2_BASE
    LDI r7, HIDDEN
    LDI r6, OUTPUT
    LDI r8, 3       ; rows
    LDI r15, 8       ; cols
    MATVEC r3, r7, r6, r8, r15
    
    ; Add biases
    LDI r3, B2_BASE
    LDI r7, OUTPUT
    LDI r0, 3
    add_bias2:
    LOAD r13, r3
    LOAD r5, r7
    ADD r5, r13
    STORE r7, r5
    ADDI r3, 1
    ADDI r7, 1
    ADDI r0, 0xFFFF
    JNZ r0, add_bias2
    
    ; Find argmax
    LDI r3, OUTPUT
    LDI r0, 0        ; best class
    LDI r9, 0        ; best value (as raw u32, higher = more positive)
    LDI r4, 3        ; counter
    LDI r14, 0        ; current index
    argmax_loop:
    LOAD r5, r3
    CMP r9, r5           ; reversed: check if r9 >= r5 (i.e., r5 <= r9)
    BGE r1, not_better   ; skip if current max >= new value
    ; r5 >= r9 (unsigned comparison works for positive fp values)
    MOV r9, r5
    MOV r0, r14
    not_better:
    ADDI r3, 1
    ADDI r14, 1
    ADDI r4, 0xFFFF
    JNZ r4, argmax_loop
    
    ; Store result
    LDI r3, CLASS
    STORE r3, r0
    
    RET

; ========================================
; Display results on screen
; ========================================
display_results:
    ; Clear screen
    LDI r13, 0x0A0A1E
    FILL r13
    
    ; Title
    LDI r9, 0x00AA00
    LDI r3, 0
    LDI r7, 0
    LDI r6, 256
    LDI r8, 20
    RECTF r3, r7, r6, r8, r9
    
    LDI r20, STATUS
    STRO r20, "NEURAL NETWORK (VM NATIVE)"
    TEXTI 4, 3, "NEURAL NETWORK (VM NATIVE)"
    
    ; Draw 4x4 input grid
    LDI r20, TEXT_BUF
    STRO r20, "Input 4x4"
    TEXTI 4, 24, "Input 4x4:"
    
    LDI r3, INPUT
    LDI r7, 0        ; row counter
    draw_input_y:
    LDI r6, 0        ; col counter
    draw_input_x:
    LOAD r5, r3      ; input value
    
    ; Color: if value > 0.5, bright green; else dark
    LDI r9, 0x001100   ; threshold ~0.07 in fp
    CMP r5, r9
    BLT r1, dim_pixel
    
    ; Bright pixel
    LDI r9, 0x00FF00
    JMP draw_pixel
    dim_pixel:
    LDI r9, 0x112211
    draw_pixel:
    
    ; Position: 4 + col*12, 36 + row*12, size 10x10
    LDI r4, 4
    LDI r14, 12
    MUL r14, r6       ; r14 = col * 12
    ADD r4, r14        ; x = 4 + col*12
    
    LDI r14, 36
    LDI r10, 12
    MUL r10, r7       ; r10 = row * 12
    ADD r14, r10        ; y = 36 + row*12
    
    LDI r10, 10        ; w
    LDI r11, 10        ; h
    RECTF r4, r14, r10, r11, r9
    
    ADDI r3, 1
    ADDI r6, 1
    CMPI r6, 4
    BLT r1, draw_input_x
    
    ADDI r7, 1
    CMPI r7, 4
    BLT r1, draw_input_y
    
    ; Draw output bars (3 classes)
    TEXTI 4, 100, "Output:"
    
    LDI r3, OUTPUT
    LDI r7, 0        ; class counter
    draw_output:
    LOAD r5, r3      ; output value (fixed point)
    
    ; Bar height: take high 16 bits and scale
    ; output value is 16.16 fp, extract integer part
    LDI r9, 16
    SHR r5, r9        ; get integer part (signed)
    ; Clamp to 0-40 range for display
    LDI r9, 40
    CMP r5, r9
    BGE r1, clamp_high
    JMP check_neg
    clamp_high:
    MOV r5, r9
    check_neg:
    CMPI r5, 0
    BGE r1, not_neg
    LDI r5, 0
    not_neg:
    
    ; Color based on class
    LDI r9, 0xFF4444  ; class 0 = red
    CMPI r7, 1
    JNZ r1, not_class1
    LDI r9, 0x44FF44  ; class 1 = green
    not_class1:
    CMPI r7, 2
    JNZ r1, not_class2
    LDI r9, 0x4444FF  ; class 2 = blue
    not_class2:
    
    ; Highlight winner
    LDI r4, CLASS
    LOAD r4, r4
    CMP r7, r4
    JNZ r1, not_winner
    ; Brighter color for winner
    LDI r9, 0xFFFF00  ; yellow = winner
    not_winner:
    
    ; Bar position: 4 + class*80, 140, width 60, height = output value
    LDI r4, 4
    LDI r14, 80
    MUL r14, r7
    ADD r4, r14        ; x
    LDI r14, 140
    ADD r14, r5        ; y (bottom-anchored: higher value = taller bar going up)
    LDI r10, 60        ; w
    LDI r11, 40
    SUB r11, r5        ; h = 40 - bar_height
    RECTF r4, r14, r10, r11, r9
    
    ; Class label (fixed x positions)
    CMPI r7, 0
    JNZ r1, label1
    TEXTI 20, 185, "diag"
    JMP next_output
    label1:
    CMPI r7, 1
    JNZ r1, label2
    TEXTI 100, 185, "anti"
    JMP next_output
    label2:
    TEXTI 180, 185, "other"
    
    next_output:
    ADDI r3, 1
    ADDI r7, 1
    CMPI r7, 3
    BLT r1, draw_output
    
    ; Winner text
    LDI r3, CLASS
    LOAD r7, r3
    CMPI r7, 0
    JNZ r1, win1
    TEXTI 4, 210, "Winner: DIAGONAL"
    JMP done_display
    win1:
    CMPI r7, 1
    JNZ r1, win2
    TEXTI 4, 210, "Winner: ANTI-DIAG"
    JMP done_display
    win2:
    TEXTI 4, 210, "Winner: OTHER"
    
    done_display:
    TEXTI 4, 230, "Press 1,2,3 for patterns. Space=random."
    TEXTI 4, 244, "ESC to exit."
    
    RET
