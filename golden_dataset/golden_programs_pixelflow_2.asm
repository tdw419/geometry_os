; DESCRIPTION: Draws a colored object at the screen with fixed size.

; pixelflow.asm -- Neural network visualizer for Geometry OS
; Connects to pixelflow server via /tmp/pixelflow.sock
; Shows weight matrices as pixel patterns and generated text
;
; RAM layout:
;   0x4000 = mode (0=weights, 1=logits, 2=generate)
;   0x4004 = scroll offset
;   0x4008 = generation result buffer (256 words = 256 chars)
;   0x4100 = status text buffer
;   0x4200 = server response buffer

#define MODE        0x4000
#define SCROLL      0x4004
#define GEN_BUF     0x4008
#define STATUS_BUF  0x4100
#define RESP_BUF    0x4200

START:
    ; Init mode to weights view
    LDI r3, 1
    LDI r2, MODE
    STORE r2, r3
    
    ; Init scroll
    LDI r3, 0
    LDI r2, SCROLL
    STORE r2, r3
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r7, 0x111122
    FILL r7

    ; Draw header bar
    LDI r13, 0x00FF00     ; green header
    LDI r2, 0
    LDI r5, 0
    LDI r1, 256
    LDI r9, 16
    RECTF r2, r5, r1, r9, r13

    ; Title text
    LDI r2, 4
    LDI r5, 2
    LDI r15, STATUS_BUF
    DRAWTEXT r2, r5, r15, r16, r13

    ; Draw weight visualization area (green border)
    LDI r13, 0x00FF00
    LDI r2, 4
    LDI r5, 20
    LDI r1, 248
    LDI r9, 180
    RECTF r2, r5, r1, r9, r13

    ; Inner area (dark)
    LDI r13, 0x0A0A1A
    LDI r2, 6
    LDI r5, 22
    LDI r1, 244
    LDI r9, 176
    RECTF r2, r5, r1, r9, r13

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r13, 0x334455
    LDI r6, 8            ; y start
    draw_row_loop:
        LDI r8, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r12, r8
            ADD r12, r6
            LDI r10, 0xFF
            AND r12, r10       ; mod 256
            SHLI r12, 16       ; blue channel
            OR r12, r13        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r2, 2
            RECTF r8, r6, r2, r2, r12
            
            ADDI r8, 3
            LDI r15, 250
            CMP r8, r15
            BLT r14, draw_col_loop
        
        ADDI r6, 3
        LDI r15, 198
        CMP r6, r15
        BLT r14, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r13, 0x444444
    LDI r2, 4
    LDI r5, 204
    LDI r1, 248
    LDI r9, 40
    RECTF r2, r5, r1, r9, r13

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r13, r17
        
        ; Bar position
        LDI r3, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r3      ; +1
        ADD r16, r3      ; +1 = +2
        LDI r2, 8       ; x start
        ADD r2, r16
        
        ; Bar height (simulated)
        LDI r5, 230
        LDI r1, 20      ; bar width
        LDI r9, 10      ; bar height (would be logits)
        
        RECTF r2, r5, r1, r9, r13
        
        ADDI r16, 1
        LDI r15, 8
        CMP r16, r15
        BLT r14, bar_loop

    ; Status text at bottom
    LDI r2, 4
    LDI r5, 246
    LDI r15, STATUS_BUF
    DRAWTEXT r2, r5, r15, r16, r7

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r13
    JZ r13, main_loop
    
    ; ESC = exit
    LDI r15, 27
    CMPI r13, 27
    JZ r14, exit_app
    
    ; Tab = switch mode
    LDI r15, 9
    CMPI r13, 9
    JNZ r14, main_loop
    
    ; Toggle mode
    LDI r2, MODE
    LOAD r5, r2
    LDI r3, 1
    ADD r5, r3
    LDI r15, 3
    CMPI r5, 3
    BLT r14, store_mode
    LDI r5, 0
    store_mode:
    STORE r2, r5
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r2, MODE
    LOAD r5, r2
    CMPI r5, 0
    JNZ r14, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r5, 1
    JNZ r14, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT