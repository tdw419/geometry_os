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
    LDI r2, 1
    LDI r5, MODE
    STORE r5, r2
    
    ; Init scroll
    LDI r2, 0
    LDI r5, SCROLL
    STORE r5, r2
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r7, 0x111122
    FILL r7

    ; Draw header bar
    LDI r14, 0x00FF00     ; green header
    LDI r5, 0
    LDI r4, 0
    LDI r12, 256
    LDI r10, 16
    RECTF r5, r4, r12, r10, r14

    ; Title text
    LDI r5, 4
    LDI r4, 2
    LDI r15, STATUS_BUF
    DRAWTEXT r5, r4, r15, r16, r14

    ; Draw weight visualization area (green border)
    LDI r14, 0x00FF00
    LDI r5, 4
    LDI r4, 20
    LDI r12, 248
    LDI r10, 180
    RECTF r5, r4, r12, r10, r14

    ; Inner area (dark)
    LDI r14, 0x0A0A1A
    LDI r5, 6
    LDI r4, 22
    LDI r12, 244
    LDI r10, 176
    RECTF r5, r4, r12, r10, r14

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r14, 0x334455
    LDI r11, 8            ; y start
    draw_row_loop:
        LDI r1, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r0, r1
            ADD r0, r11
            LDI r13, 0xFF
            AND r0, r13       ; mod 256
            SHLI r0, 16       ; blue channel
            OR r0, r14        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r5, 2
            RECTF r1, r11, r5, r5, r0
            
            ADDI r1, 3
            LDI r15, 250
            CMP r1, r15
            BLT r9, draw_col_loop
        
        ADDI r11, 3
        LDI r15, 198
        CMP r11, r15
        BLT r9, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r14, 0x444444
    LDI r5, 4
    LDI r4, 204
    LDI r12, 248
    LDI r10, 40
    RECTF r5, r4, r12, r10, r14

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
        LDI r5, 8       ; x start
        ADD r5, r16
        
        ; Bar height (simulated)
        LDI r4, 230
        LDI r12, 20      ; bar width
        LDI r10, 10      ; bar height (would be logits)
        
        RECTF r5, r4, r12, r10, r14
        
        ADDI r16, 1
        LDI r15, 8
        CMP r16, r15
        BLT r9, bar_loop

    ; Status text at bottom
    LDI r5, 4
    LDI r4, 246
    LDI r15, STATUS_BUF
    DRAWTEXT r5, r4, r15, r16, r7

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r14
    JZ r14, main_loop
    
    ; ESC = exit
    LDI r15, 27
    CMPI r14, 27
    JZ r9, exit_app
    
    ; Tab = switch mode
    LDI r15, 9
    CMPI r14, 9
    JNZ r9, main_loop
    
    ; Toggle mode
    LDI r5, MODE
    LOAD r4, r5
    LDI r2, 1
    ADD r4, r2
    LDI r15, 3
    CMPI r4, 3
    BLT r9, store_mode
    LDI r4, 0
    store_mode:
    STORE r5, r4
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r5, MODE
    LOAD r4, r5
    CMPI r4, 0
    JNZ r9, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r4, 1
    JNZ r9, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT