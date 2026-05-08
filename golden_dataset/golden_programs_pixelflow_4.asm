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
    LDI r1, 1
    LDI r5, MODE
    STORE r5, r1
    
    ; Init scroll
    LDI r1, 0
    LDI r5, SCROLL
    STORE r5, r1
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r6, 0x111122
    FILL r6

    ; Draw header bar
    LDI r10, 0x00FF00     ; green header
    LDI r5, 0
    LDI r7, 0
    LDI r11, 256
    LDI r3, 16
    RECTF r5, r7, r11, r3, r10

    ; Title text
    LDI r5, 4
    LDI r7, 2
    LDI r0, STATUS_BUF
    DRAWTEXT r5, r7, r0, r16, r10

    ; Draw weight visualization area (green border)
    LDI r10, 0x00FF00
    LDI r5, 4
    LDI r7, 20
    LDI r11, 248
    LDI r3, 180
    RECTF r5, r7, r11, r3, r10

    ; Inner area (dark)
    LDI r10, 0x0A0A1A
    LDI r5, 6
    LDI r7, 22
    LDI r11, 244
    LDI r3, 176
    RECTF r5, r7, r11, r3, r10

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r10, 0x334455
    LDI r12, 8            ; y start
    draw_row_loop:
        LDI r8, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r14, r8
            ADD r14, r12
            LDI r2, 0xFF
            AND r14, r2       ; mod 256
            SHLI r14, 16       ; blue channel
            OR r14, r10        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r5, 2
            RECTF r8, r12, r5, r5, r14
            
            ADDI r8, 3
            LDI r0, 250
            CMP r8, r0
            BLT r4, draw_col_loop
        
        ADDI r12, 3
        LDI r0, 198
        CMP r12, r0
        BLT r4, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r10, 0x444444
    LDI r5, 4
    LDI r7, 204
    LDI r11, 248
    LDI r3, 40
    RECTF r5, r7, r11, r3, r10

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r10, r17
        
        ; Bar position
        LDI r1, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r1      ; +1
        ADD r16, r1      ; +1 = +2
        LDI r5, 8       ; x start
        ADD r5, r16
        
        ; Bar height (simulated)
        LDI r7, 230
        LDI r11, 20      ; bar width
        LDI r3, 10      ; bar height (would be logits)
        
        RECTF r5, r7, r11, r3, r10
        
        ADDI r16, 1
        LDI r0, 8
        CMP r16, r0
        BLT r4, bar_loop

    ; Status text at bottom
    LDI r5, 4
    LDI r7, 246
    LDI r0, STATUS_BUF
    DRAWTEXT r5, r7, r0, r16, r6

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r10
    JZ r10, main_loop
    
    ; ESC = exit
    LDI r0, 27
    CMPI r10, 27
    JZ r4, exit_app
    
    ; Tab = switch mode
    LDI r0, 9
    CMPI r10, 9
    JNZ r4, main_loop
    
    ; Toggle mode
    LDI r5, MODE
    LOAD r7, r5
    LDI r1, 1
    ADD r7, r1
    LDI r0, 3
    CMPI r7, 3
    BLT r4, store_mode
    LDI r7, 0
    store_mode:
    STORE r5, r7
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r5, MODE
    LOAD r7, r5
    CMPI r7, 0
    JNZ r4, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r7, 1
    JNZ r4, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT