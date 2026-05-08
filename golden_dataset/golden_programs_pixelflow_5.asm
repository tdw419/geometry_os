; DESCRIPTION: This GeOS assembly code initializes a neural network visualizer that connects to a pixelflow server via a socket. It displays weight matrices as pixel patterns and generated text on the screen, with interactive features for switching modes and scrolling through content.

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
    LDI r14, 1
    LDI r8, MODE
    STORE r8, r14
    
    ; Init scroll
    LDI r14, 0
    LDI r8, SCROLL
    STORE r8, r14
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r13, 0x111122
    FILL r13

    ; Draw header bar
    LDI r9, 0x00FF00     ; green header
    LDI r8, 0
    LDI r7, 0
    LDI r11, 256
    LDI r15, 16
    RECTF r8, r7, r11, r15, r9

    ; Title text
    LDI r8, 4
    LDI r7, 2
    LDI r5, STATUS_BUF
    DRAWTEXT r8, r7, r5, r16, r9

    ; Draw weight visualization area (green border)
    LDI r9, 0x00FF00
    LDI r8, 4
    LDI r7, 20
    LDI r11, 248
    LDI r15, 180
    RECTF r8, r7, r11, r15, r9

    ; Inner area (dark)
    LDI r9, 0x0A0A1A
    LDI r8, 6
    LDI r7, 22
    LDI r11, 244
    LDI r15, 176
    RECTF r8, r7, r11, r15, r9

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r9, 0x334455
    LDI r4, 8            ; y start
    draw_row_loop:
        LDI r6, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r3, r6
            ADD r3, r4
            LDI r12, 0xFF
            AND r3, r12       ; mod 256
            SHLI r3, 16       ; blue channel
            OR r3, r9        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r8, 2
            RECTF r6, r4, r8, r8, r3
            
            ADDI r6, 3
            LDI r5, 250
            CMP r6, r5
            BLT r2, draw_col_loop
        
        ADDI r4, 3
        LDI r5, 198
        CMP r4, r5
        BLT r2, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r9, 0x444444
    LDI r8, 4
    LDI r7, 204
    LDI r11, 248
    LDI r15, 40
    RECTF r8, r7, r11, r15, r9

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r9, r17
        
        ; Bar position
        LDI r14, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r14      ; +1
        ADD r16, r14      ; +1 = +2
        LDI r8, 8       ; x start
        ADD r8, r16
        
        ; Bar height (simulated)
        LDI r7, 230
        LDI r11, 20      ; bar width
        LDI r15, 10      ; bar height (would be logits)
        
        RECTF r8, r7, r11, r15, r9
        
        ADDI r16, 1
        LDI r5, 8
        CMP r16, r5
        BLT r2, bar_loop

    ; Status text at bottom
    LDI r8, 4
    LDI r7, 246
    LDI r5, STATUS_BUF
    DRAWTEXT r8, r7, r5, r16, r13

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r9
    JZ r9, main_loop
    
    ; ESC = exit
    LDI r5, 27
    CMPI r9, 27
    JZ r2, exit_app
    
    ; Tab = switch mode
    LDI r5, 9
    CMPI r9, 9
    JNZ r2, main_loop
    
    ; Toggle mode
    LDI r8, MODE
    LOAD r7, r8
    LDI r14, 1
    ADD r7, r14
    LDI r5, 3
    CMPI r7, 3
    BLT r2, store_mode
    LDI r7, 0
    store_mode:
    STORE r8, r7
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r8, MODE
    LOAD r7, r8
    CMPI r7, 0
    JNZ r2, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r7, 1
    JNZ r2, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT