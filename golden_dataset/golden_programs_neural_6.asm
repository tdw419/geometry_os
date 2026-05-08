; DESCRIPTION: A colored line centered at the screen with fixed size.

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
    IKEY r1
    JZ r1, main_loop
    
    ; 1-3 keys change input pattern
    CMPI r1, 49    ; '1'
    JNZ r0, try_key2
    CALL init_pattern1
    CALL forward_pass
    CALL display_results
    JMP main_loop

    try_key2:
    CMPI r1, 50    ; '2'
    JNZ r0, try_key3
    CALL init_pattern2
    CALL forward_pass
    CALL display_results
    JMP main_loop

    try_key3:
    CMPI r1, 51    ; '3'
    JNZ r0, try_space
    CALL init_pattern3
    CALL forward_pass
    CALL display_results
    JMP main_loop

    try_space:
    CMPI r1, 32    ; space = random input
    JNZ r0, check_esc
    CALL init_random
    CALL forward_pass
    CALL display_results
    JMP main_loop

    check_esc:
    CMPI r1, 27
    JZ r0, exit_app
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
    LDI r3, 0x00010000   ; 1.0 fp
    LDI r11, 0x00000000   ; 0.0 fp
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    
    ; Row 1: anti-diagonal [0,0,0,1, 0,0,1,0, 0,1,0,0, 1,0,0,0]
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    
    ; Remaining 6 rows: random-ish patterns
    LDI r2, 6
    fill_remaining:
        LDI r1, 16
        fill_row:
            ; Alternate between small positive and negative
            LDI r4, 0x00008000   ; 0.5
            STORE r20, r4
            ADDI r20, 1
            ADDI r1, 0xFFFF      ; r1--
            JNZ r1, fill_row
        ADDI r2, 0xFFFF
        JNZ r2, fill_remaining
    
    ; Biases: small negative (to keep outputs near zero)
    LDI r20, B1_BASE
    LDI r3, 0xFFFF0000  ; -1.0 fp (bias)
    LDI r2, 8
    fill_bias:
    STORE r20, r3
    ADDI r20, 1
    ADDI r2, 0xFFFF
    JNZ r2, fill_bias
    
    ; Layer 2: 3 neurons x 8 inputs (simple identity-like)
    LDI r20, W2_BASE
    ; Class 0: activates on hidden[0]
    LDI r3, 0x00020000   ; 2.0 fp
    STORE r20, r3
    ADDI r20, 1
    LDI r2, 7
    zero_rest_l2_0:
    LDI r11, 0
    STORE r20, r11
    ADDI r20, 1
    ADDI r2, 0xFFFF
    JNZ r2, zero_rest_l2_0
    
    ; Class 1: activates on hidden[1]
    LDI r11, 0
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    LDI r2, 6
    zero_rest_l2_1:
    STORE r20, r11
    ADDI r20, 1
    ADDI r2, 0xFFFF
    JNZ r2, zero_rest_l2_1
    
    ; Class 2: activates on hidden[2..7] sum
    LDI r4, 6
    LDI r14, 0x00005555   ; 1/3 fp
    fill_class2:
    STORE r20, r14
    ADDI r20, 1
    ADDI r4, 0xFFFF
    JNZ r4, fill_class2
    LDI r11, 0
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    
    ; Layer 2 biases
    LDI r20, B2_BASE
    LDI r3, 0xFFFF8000  ; -0.5
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r3
    
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
    LDI r3, 0x00010000   ; 1.0
    LDI r11, 0x00000000   ; 0.0
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    RET

init_pattern2:
    ; Anti-diagonal: [0,0,0,1, 0,0,1,0, 0,1,0,0, 1,0,0,0]
    LDI r20, INPUT
    LDI r3, 0x00010000
    LDI r11, 0x00000000
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r3
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    STORE r20, r11
    ADDI r20, 1
    RET

init_pattern3:
    ; All ones
    LDI r20, INPUT
    LDI r3, 0x00010000
    LDI r2, 16
    fill_ones:
    STORE r20, r3
    ADDI r20, 1
    ADDI r2, 0xFFFF
    JNZ r2, fill_ones
    RET

init_random:
    ; Checkerboard pattern
    LDI r20, INPUT
    LDI r3, 0x00010000
    LDI r11, 0x00000000
    LDI r2, 16
    LDI r1, 0
    fill_checker:
    AND r1, r3         ; test bit 0... rough approximation
    LDI r4, 1
    AND r1, r4
    JNZ r1, store_zero
    STORE r20, r3
    JMP next_checker
    store_zero:
    STORE r20, r11
    next_checker:
    ADDI r20, 1
    ADDI r1, 1
    ADDI r2, 0xFFFF
    JNZ r2, fill_checker
    RET

; ========================================
; Forward pass: input -> hidden -> output
; ========================================
forward_pass:
    ; Layer 1: MATVEC(weight, input, hidden, 8, 16)
    LDI r15, W1_BASE
    LDI r10, INPUT
    LDI r6, HIDDEN
    LDI r13, 8       ; rows
    LDI r7, 16      ; cols
    MATVEC r15, r10, r6, r13, r7
    
    ; Add biases
    LDI r15, B1_BASE
    LDI r10, HIDDEN
    LDI r2, 8
    add_bias1:
    LOAD r3, r15     ; bias
    LOAD r11, r10     ; hidden[i]
    ADD r11, r3       ; hidden[i] += bias
    STORE r10, r11
    ADDI r15, 1
    ADDI r10, 1
    ADDI r2, 0xFFFF
    JNZ r2, add_bias1
    
    ; ReLU on hidden layer
    LDI r10, HIDDEN
    LDI r2, 8
    relu_loop:
    LOAD r11, r10
    ; Check if negative (bit 31 set)
    LDI r1, 0x80000000
    AND r1, r11
    JNZ r1, relu_zero
    JMP relu_next
    relu_zero:
    LDI r11, 0
    STORE r10, r11
    relu_next:
    ADDI r10, 1
    ADDI r2, 0xFFFF
    JNZ r2, relu_loop
    
    ; Layer 2: MATVEC(weight, hidden, output, 3, 8)
    LDI r15, W2_BASE
    LDI r10, HIDDEN
    LDI r6, OUTPUT
    LDI r13, 3       ; rows
    LDI r7, 8       ; cols
    MATVEC r15, r10, r6, r13, r7
    
    ; Add biases
    LDI r15, B2_BASE
    LDI r10, OUTPUT
    LDI r2, 3
    add_bias2:
    LOAD r3, r15
    LOAD r11, r10
    ADD r11, r3
    STORE r10, r11
    ADDI r15, 1
    ADDI r10, 1
    ADDI r2, 0xFFFF
    JNZ r2, add_bias2
    
    ; Find argmax
    LDI r15, OUTPUT
    LDI r2, 0        ; best class
    LDI r1, 0        ; best value (as raw u32, higher = more positive)
    LDI r4, 3        ; counter
    LDI r14, 0        ; current index
    argmax_loop:
    LOAD r11, r15
    CMP r1, r11           ; reversed: check if r1 >= r11 (i.e., r11 <= r1)
    BGE r0, not_better   ; skip if current max >= new value
    ; r11 >= r1 (unsigned comparison works for positive fp values)
    MOV r1, r11
    MOV r2, r14
    not_better:
    ADDI r15, 1
    ADDI r14, 1
    ADDI r4, 0xFFFF
    JNZ r4, argmax_loop
    
    ; Store result
    LDI r15, CLASS
    STORE r15, r2
    
    RET

; ========================================
; Display results on screen
; ========================================
display_results:
    ; Clear screen
    LDI r3, 0x0A0A1E
    FILL r3
    
    ; Title
    LDI r1, 0x00AA00
    LDI r15, 0
    LDI r10, 0
    LDI r6, 256
    LDI r13, 20
    RECTF r15, r10, r6, r13, r1
    
    LDI r20, STATUS
    STRO r20, "NEURAL NETWORK (VM NATIVE)"
    TEXTI 4, 3, "NEURAL NETWORK (VM NATIVE)"
    
    ; Draw 4x4 input grid
    LDI r20, TEXT_BUF
    STRO r20, "Input 4x4"
    TEXTI 4, 24, "Input 4x4:"
    
    LDI r15, INPUT
    LDI r10, 0        ; row counter
    draw_input_y:
    LDI r6, 0        ; col counter
    draw_input_x:
    LOAD r11, r15      ; input value
    
    ; Color: if value > 0.5, bright green; else dark
    LDI r1, 0x001100   ; threshold ~0.07 in fp
    CMP r11, r1
    BLT r0, dim_pixel
    
    ; Bright pixel
    LDI r1, 0x00FF00
    JMP draw_pixel
    dim_pixel:
    LDI r1, 0x112211
    draw_pixel:
    
    ; Position: 4 + col*12, 36 + row*12, size 10x10
    LDI r4, 4
    LDI r14, 12
    MUL r14, r6       ; r14 = col * 12
    ADD r4, r14        ; x = 4 + col*12
    
    LDI r14, 36
    LDI r9, 12
    MUL r9, r10       ; r9 = row * 12
    ADD r14, r9        ; y = 36 + row*12
    
    LDI r9, 10        ; w
    LDI r8, 10        ; h
    RECTF r4, r14, r9, r8, r1
    
    ADDI r15, 1
    ADDI r6, 1
    CMPI r6, 4
    BLT r0, draw_input_x
    
    ADDI r10, 1
    CMPI r10, 4
    BLT r0, draw_input_y
    
    ; Draw output bars (3 classes)
    TEXTI 4, 100, "Output:"
    
    LDI r15, OUTPUT
    LDI r10, 0        ; class counter
    draw_output:
    LOAD r11, r15      ; output value (fixed point)
    
    ; Bar height: take high 16 bits and scale
    ; output value is 16.16 fp, extract integer part
    LDI r1, 16
    SHR r11, r1        ; get integer part (signed)
    ; Clamp to 0-40 range for display
    LDI r1, 40
    CMP r11, r1
    BGE r0, clamp_high
    JMP check_neg
    clamp_high:
    MOV r11, r1
    check_neg:
    CMPI r11, 0
    BGE r0, not_neg
    LDI r11, 0
    not_neg:
    
    ; Color based on class
    LDI r1, 0xFF4444  ; class 0 = red
    CMPI r10, 1
    JNZ r0, not_class1
    LDI r1, 0x44FF44  ; class 1 = green
    not_class1:
    CMPI r10, 2
    JNZ r0, not_class2
    LDI r1, 0x4444FF  ; class 2 = blue
    not_class2:
    
    ; Highlight winner
    LDI r4, CLASS
    LOAD r4, r4
    CMP r10, r4
    JNZ r0, not_winner
    ; Brighter color for winner
    LDI r1, 0xFFFF00  ; yellow = winner
    not_winner:
    
    ; Bar position: 4 + class*80, 140, width 60, height = output value
    LDI r4, 4
    LDI r14, 80
    MUL r14, r10
    ADD r4, r14        ; x
    LDI r14, 140
    ADD r14, r11        ; y (bottom-anchored: higher value = taller bar going up)
    LDI r9, 60        ; w
    LDI r8, 40
    SUB r8, r11        ; h = 40 - bar_height
    RECTF r4, r14, r9, r8, r1
    
    ; Class label (fixed x positions)
    CMPI r10, 0
    JNZ r0, label1
    TEXTI 20, 185, "diag"
    JMP next_output
    label1:
    CMPI r10, 1
    JNZ r0, label2
    TEXTI 100, 185, "anti"
    JMP next_output
    label2:
    TEXTI 180, 185, "other"
    
    next_output:
    ADDI r15, 1
    ADDI r10, 1
    CMPI r10, 3
    BLT r0, draw_output
    
    ; Winner text
    LDI r15, CLASS
    LOAD r10, r15
    CMPI r10, 0
    JNZ r0, win1
    TEXTI 4, 210, "Winner: DIAGONAL"
    JMP done_display
    win1:
    CMPI r10, 1
    JNZ r0, win2
    TEXTI 4, 210, "Winner: ANTI-DIAG"
    JMP done_display
    win2:
    TEXTI 4, 210, "Winner: OTHER"
    
    done_display:
    TEXTI 4, 230, "Press 1,2,3 for patterns. Space=random."
    TEXTI 4, 244, "ESC to exit."
    
    RET
