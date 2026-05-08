; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
    LDI r0, MODE
    STORE r0, r13
    
    ; Init scroll
    LDI r13, 0
    LDI r0, SCROLL
    STORE r0, r13
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r10, 0x111122
    FILL r10

    ; Draw header bar
    LDI r14, 0x00FF00     ; green header
    LDI r0, 0
    LDI r4, 0
    LDI r3, 256
    LDI r9, 16
    RECTF r0, r4, r3, r9, r14

    ; Title text
    LDI r0, 4
    LDI r4, 2
    LDI r8, STATUS_BUF
    DRAWTEXT r0, r4, r8, r16, r14

    ; Draw weight visualization area (green border)
    LDI r14, 0x00FF00
    LDI r0, 4
    LDI r4, 20
    LDI r3, 248
    LDI r9, 180
    RECTF r0, r4, r3, r9, r14

    ; Inner area (dark)
    LDI r14, 0x0A0A1A
    LDI r0, 6
    LDI r4, 22
    LDI r3, 244
    LDI r9, 176
    RECTF r0, r4, r3, r9, r14

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r14, 0x334455
    LDI r11, 8            ; y start
    draw_row_loop:
        LDI r1, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r2, r1
            ADD r2, r11
            LDI r5, 0xFF
            AND r2, r5       ; mod 256
            SHLI r2, 16       ; blue channel
            OR r2, r14        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r0, 2
            RECTF r1, r11, r0, r0, r2
            
            ADDI r1, 3
            LDI r8, 250
            CMP r1, r8
            BLT r12, draw_col_loop
        
        ADDI r11, 3
        LDI r8, 198
        CMP r11, r8
        BLT r12, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r14, 0x444444
    LDI r0, 4
    LDI r4, 204
    LDI r3, 248
    LDI r9, 40
    RECTF r0, r4, r3, r9, r14

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r14, r17
        
        ; Bar position
        LDI r13, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r13      ; +1
        ADD r16, r13      ; +1 = +2
        LDI r0, 8       ; x start
        ADD r0, r16
        
        ; Bar height (simulated)
        LDI r4, 230
        LDI r3, 20      ; bar width
        LDI r9, 10      ; bar height (would be logits)
        
        RECTF r0, r4, r3, r9, r14
        
        ADDI r16, 1
        LDI r8, 8
        CMP r16, r8
        BLT r12, bar_loop

    ; Status text at bottom
    LDI r0, 4
    LDI r4, 246
    LDI r8, STATUS_BUF
    DRAWTEXT r0, r4, r8, r16, r10

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r14
    JZ r14, main_loop
    
    ; ESC = exit
    LDI r8, 27
    CMPI r14, 27
    JZ r12, exit_app
    
    ; Tab = switch mode
    LDI r8, 9
    CMPI r14, 9
    JNZ r12, main_loop
    
    ; Toggle mode
    LDI r0, MODE
    LOAD r4, r0
    LDI r13, 1
    ADD r4, r13
    LDI r8, 3
    CMPI r4, 3
    BLT r12, store_mode
    LDI r4, 0
    store_mode:
    STORE r0, r4
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r0, MODE
    LOAD r4, r0
    CMPI r4, 0
    JNZ r12, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r4, 1
    JNZ r12, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT