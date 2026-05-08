; DESCRIPTION: Geometry OS program to draw a colored object.

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
    LDI r13, 1
    LDI r2, MODE
    STORE r2, r13
    
    ; Init scroll
    LDI r13, 0
    LDI r2, SCROLL
    STORE r2, r13
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r9, 0x111122
    FILL r9

    ; Draw header bar
    LDI r3, 0x00FF00     ; green header
    LDI r2, 0
    LDI r1, 0
    LDI r15, 256
    LDI r8, 16
    RECTF r2, r1, r15, r8, r3

    ; Title text
    LDI r2, 4
    LDI r1, 2
    LDI r6, STATUS_BUF
    DRAWTEXT r2, r1, r6, r16, r3

    ; Draw weight visualization area (green border)
    LDI r3, 0x00FF00
    LDI r2, 4
    LDI r1, 20
    LDI r15, 248
    LDI r8, 180
    RECTF r2, r1, r15, r8, r3

    ; Inner area (dark)
    LDI r3, 0x0A0A1A
    LDI r2, 6
    LDI r1, 22
    LDI r15, 244
    LDI r8, 176
    RECTF r2, r1, r15, r8, r3

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r3, 0x334455
    LDI r0, 8            ; y start
    draw_row_loop:
        LDI r11, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r7, r11
            ADD r7, r0
            LDI r5, 0xFF
            AND r7, r5       ; mod 256
            SHLI r7, 16       ; blue channel
            OR r7, r3        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r2, 2
            RECTF r11, r0, r2, r2, r7
            
            ADDI r11, 3
            LDI r6, 250
            CMP r11, r6
            BLT r12, draw_col_loop
        
        ADDI r0, 3
        LDI r6, 198
        CMP r0, r6
        BLT r12, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r3, 0x444444
    LDI r2, 4
    LDI r1, 204
    LDI r15, 248
    LDI r8, 40
    RECTF r2, r1, r15, r8, r3

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r3, r17
        
        ; Bar position
        LDI r13, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r13      ; +1
        ADD r16, r13      ; +1 = +2
        LDI r2, 8       ; x start
        ADD r2, r16
        
        ; Bar height (simulated)
        LDI r1, 230
        LDI r15, 20      ; bar width
        LDI r8, 10      ; bar height (would be logits)
        
        RECTF r2, r1, r15, r8, r3
        
        ADDI r16, 1
        LDI r6, 8
        CMP r16, r6
        BLT r12, bar_loop

    ; Status text at bottom
    LDI r2, 4
    LDI r1, 246
    LDI r6, STATUS_BUF
    DRAWTEXT r2, r1, r6, r16, r9

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r3
    JZ r3, main_loop
    
    ; ESC = exit
    LDI r6, 27
    CMPI r3, 27
    JZ r12, exit_app
    
    ; Tab = switch mode
    LDI r6, 9
    CMPI r3, 9
    JNZ r12, main_loop
    
    ; Toggle mode
    LDI r2, MODE
    LOAD r1, r2
    LDI r13, 1
    ADD r1, r13
    LDI r6, 3
    CMPI r1, 3
    BLT r12, store_mode
    LDI r1, 0
    store_mode:
    STORE r2, r1
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r2, MODE
    LOAD r1, r2
    CMPI r1, 0
    JNZ r12, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r1, 1
    JNZ r12, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT