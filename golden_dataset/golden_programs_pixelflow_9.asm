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
    LDI r6, 1
    LDI r10, MODE
    STORE r10, r6
    
    ; Init scroll
    LDI r6, 0
    LDI r10, SCROLL
    STORE r10, r6
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r3, 0x111122
    FILL r3

    ; Draw header bar
    LDI r4, 0x00FF00     ; green header
    LDI r10, 0
    LDI r14, 0
    LDI r11, 256
    LDI r0, 16
    RECTF r10, r14, r11, r0, r4

    ; Title text
    LDI r10, 4
    LDI r14, 2
    LDI r9, STATUS_BUF
    DRAWTEXT r10, r14, r9, r16, r4

    ; Draw weight visualization area (green border)
    LDI r4, 0x00FF00
    LDI r10, 4
    LDI r14, 20
    LDI r11, 248
    LDI r0, 180
    RECTF r10, r14, r11, r0, r4

    ; Inner area (dark)
    LDI r4, 0x0A0A1A
    LDI r10, 6
    LDI r14, 22
    LDI r11, 244
    LDI r0, 176
    RECTF r10, r14, r11, r0, r4

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r4, 0x334455
    LDI r13, 8            ; y start
    draw_row_loop:
        LDI r15, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r1, r15
            ADD r1, r13
            LDI r2, 0xFF
            AND r1, r2       ; mod 256
            SHLI r1, 16       ; blue channel
            OR r1, r4        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r10, 2
            RECTF r15, r13, r10, r10, r1
            
            ADDI r15, 3
            LDI r9, 250
            CMP r15, r9
            BLT r5, draw_col_loop
        
        ADDI r13, 3
        LDI r9, 198
        CMP r13, r9
        BLT r5, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r4, 0x444444
    LDI r10, 4
    LDI r14, 204
    LDI r11, 248
    LDI r0, 40
    RECTF r10, r14, r11, r0, r4

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r4, r17
        
        ; Bar position
        LDI r6, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r6      ; +1
        ADD r16, r6      ; +1 = +2
        LDI r10, 8       ; x start
        ADD r10, r16
        
        ; Bar height (simulated)
        LDI r14, 230
        LDI r11, 20      ; bar width
        LDI r0, 10      ; bar height (would be logits)
        
        RECTF r10, r14, r11, r0, r4
        
        ADDI r16, 1
        LDI r9, 8
        CMP r16, r9
        BLT r5, bar_loop

    ; Status text at bottom
    LDI r10, 4
    LDI r14, 246
    LDI r9, STATUS_BUF
    DRAWTEXT r10, r14, r9, r16, r3

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r4
    JZ r4, main_loop
    
    ; ESC = exit
    LDI r9, 27
    CMPI r4, 27
    JZ r5, exit_app
    
    ; Tab = switch mode
    LDI r9, 9
    CMPI r4, 9
    JNZ r5, main_loop
    
    ; Toggle mode
    LDI r10, MODE
    LOAD r14, r10
    LDI r6, 1
    ADD r14, r6
    LDI r9, 3
    CMPI r14, 3
    BLT r5, store_mode
    LDI r14, 0
    store_mode:
    STORE r10, r14
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r10, MODE
    LOAD r14, r10
    CMPI r14, 0
    JNZ r5, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r14, 1
    JNZ r5, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT