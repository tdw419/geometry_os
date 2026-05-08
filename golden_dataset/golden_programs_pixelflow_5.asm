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
    LDI r3, 1
    LDI r8, MODE
    STORE r8, r3
    
    ; Init scroll
    LDI r3, 0
    LDI r8, SCROLL
    STORE r8, r3
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r11, 0x111122
    FILL r11

    ; Draw header bar
    LDI r4, 0x00FF00     ; green header
    LDI r8, 0
    LDI r14, 0
    LDI r6, 256
    LDI r15, 16
    RECTF r8, r14, r6, r15, r4

    ; Title text
    LDI r8, 4
    LDI r14, 2
    LDI r7, STATUS_BUF
    DRAWTEXT r8, r14, r7, r16, r4

    ; Draw weight visualization area (green border)
    LDI r4, 0x00FF00
    LDI r8, 4
    LDI r14, 20
    LDI r6, 248
    LDI r15, 180
    RECTF r8, r14, r6, r15, r4

    ; Inner area (dark)
    LDI r4, 0x0A0A1A
    LDI r8, 6
    LDI r14, 22
    LDI r6, 244
    LDI r15, 176
    RECTF r8, r14, r6, r15, r4

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r4, 0x334455
    LDI r9, 8            ; y start
    draw_row_loop:
        LDI r12, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r0, r12
            ADD r0, r9
            LDI r10, 0xFF
            AND r0, r10       ; mod 256
            SHLI r0, 16       ; blue channel
            OR r0, r4        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r8, 2
            RECTF r12, r9, r8, r8, r0
            
            ADDI r12, 3
            LDI r7, 250
            CMP r12, r7
            BLT r1, draw_col_loop
        
        ADDI r9, 3
        LDI r7, 198
        CMP r9, r7
        BLT r1, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r4, 0x444444
    LDI r8, 4
    LDI r14, 204
    LDI r6, 248
    LDI r15, 40
    RECTF r8, r14, r6, r15, r4

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r4, r17
        
        ; Bar position
        LDI r3, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r3      ; +1
        ADD r16, r3      ; +1 = +2
        LDI r8, 8       ; x start
        ADD r8, r16
        
        ; Bar height (simulated)
        LDI r14, 230
        LDI r6, 20      ; bar width
        LDI r15, 10      ; bar height (would be logits)
        
        RECTF r8, r14, r6, r15, r4
        
        ADDI r16, 1
        LDI r7, 8
        CMP r16, r7
        BLT r1, bar_loop

    ; Status text at bottom
    LDI r8, 4
    LDI r14, 246
    LDI r7, STATUS_BUF
    DRAWTEXT r8, r14, r7, r16, r11

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r4
    JZ r4, main_loop
    
    ; ESC = exit
    LDI r7, 27
    CMPI r4, 27
    JZ r1, exit_app
    
    ; Tab = switch mode
    LDI r7, 9
    CMPI r4, 9
    JNZ r1, main_loop
    
    ; Toggle mode
    LDI r8, MODE
    LOAD r14, r8
    LDI r3, 1
    ADD r14, r3
    LDI r7, 3
    CMPI r14, 3
    BLT r1, store_mode
    LDI r14, 0
    store_mode:
    STORE r8, r14
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r8, MODE
    LOAD r14, r8
    CMPI r14, 0
    JNZ r1, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r14, 1
    JNZ r1, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT