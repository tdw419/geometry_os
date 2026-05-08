; DESCRIPTION: Render a colored object at the screen.

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
    LDI r2, 1
    LDI r10, MODE
    STORE r10, r2
    
    ; Init scroll
    LDI r2, 0
    LDI r10, SCROLL
    STORE r10, r2
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r6, 0x111122
    FILL r6

    ; Draw header bar
    LDI r14, 0x00FF00     ; green header
    LDI r10, 0
    LDI r9, 0
    LDI r11, 256
    LDI r1, 16
    RECTF r10, r9, r11, r1, r14

    ; Title text
    LDI r10, 4
    LDI r9, 2
    LDI r3, STATUS_BUF
    DRAWTEXT r10, r9, r3, r16, r14

    ; Draw weight visualization area (green border)
    LDI r14, 0x00FF00
    LDI r10, 4
    LDI r9, 20
    LDI r11, 248
    LDI r1, 180
    RECTF r10, r9, r11, r1, r14

    ; Inner area (dark)
    LDI r14, 0x0A0A1A
    LDI r10, 6
    LDI r9, 22
    LDI r11, 244
    LDI r1, 176
    RECTF r10, r9, r11, r1, r14

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r14, 0x334455
    LDI r4, 8            ; y start
    draw_row_loop:
        LDI r5, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r15, r5
            ADD r15, r4
            LDI r0, 0xFF
            AND r15, r0       ; mod 256
            SHLI r15, 16       ; blue channel
            OR r15, r14        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r10, 2
            RECTF r5, r4, r10, r10, r15
            
            ADDI r5, 3
            LDI r3, 250
            CMP r5, r3
            BLT r8, draw_col_loop
        
        ADDI r4, 3
        LDI r3, 198
        CMP r4, r3
        BLT r8, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r14, 0x444444
    LDI r10, 4
    LDI r9, 204
    LDI r11, 248
    LDI r1, 40
    RECTF r10, r9, r11, r1, r14

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r14, r17
        
        ; Bar position
        LDI r2, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r2      ; +1
        ADD r16, r2      ; +1 = +2
        LDI r10, 8       ; x start
        ADD r10, r16
        
        ; Bar height (simulated)
        LDI r9, 230
        LDI r11, 20      ; bar width
        LDI r1, 10      ; bar height (would be logits)
        
        RECTF r10, r9, r11, r1, r14
        
        ADDI r16, 1
        LDI r3, 8
        CMP r16, r3
        BLT r8, bar_loop

    ; Status text at bottom
    LDI r10, 4
    LDI r9, 246
    LDI r3, STATUS_BUF
    DRAWTEXT r10, r9, r3, r16, r6

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r14
    JZ r14, main_loop
    
    ; ESC = exit
    LDI r3, 27
    CMPI r14, 27
    JZ r8, exit_app
    
    ; Tab = switch mode
    LDI r3, 9
    CMPI r14, 9
    JNZ r8, main_loop
    
    ; Toggle mode
    LDI r10, MODE
    LOAD r9, r10
    LDI r2, 1
    ADD r9, r2
    LDI r3, 3
    CMPI r9, 3
    BLT r8, store_mode
    LDI r9, 0
    store_mode:
    STORE r10, r9
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r10, MODE
    LOAD r9, r10
    CMPI r9, 0
    JNZ r8, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r9, 1
    JNZ r8, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT