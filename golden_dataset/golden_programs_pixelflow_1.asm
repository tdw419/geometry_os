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
    LDI r10, 1
    LDI r9, MODE
    STORE r9, r10
    
    ; Init scroll
    LDI r10, 0
    LDI r9, SCROLL
    STORE r9, r10
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r8, 0x111122
    FILL r8

    ; Draw header bar
    LDI r1, 0x00FF00     ; green header
    LDI r9, 0
    LDI r12, 0
    LDI r7, 256
    LDI r11, 16
    RECTF r9, r12, r7, r11, r1

    ; Title text
    LDI r9, 4
    LDI r12, 2
    LDI r3, STATUS_BUF
    DRAWTEXT r9, r12, r3, r16, r1

    ; Draw weight visualization area (green border)
    LDI r1, 0x00FF00
    LDI r9, 4
    LDI r12, 20
    LDI r7, 248
    LDI r11, 180
    RECTF r9, r12, r7, r11, r1

    ; Inner area (dark)
    LDI r1, 0x0A0A1A
    LDI r9, 6
    LDI r12, 22
    LDI r7, 244
    LDI r11, 176
    RECTF r9, r12, r7, r11, r1

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r1, 0x334455
    LDI r4, 8            ; y start
    draw_row_loop:
        LDI r14, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r6, r14
            ADD r6, r4
            LDI r2, 0xFF
            AND r6, r2       ; mod 256
            SHLI r6, 16       ; blue channel
            OR r6, r1        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r9, 2
            RECTF r14, r4, r9, r9, r6
            
            ADDI r14, 3
            LDI r3, 250
            CMP r14, r3
            BLT r5, draw_col_loop
        
        ADDI r4, 3
        LDI r3, 198
        CMP r4, r3
        BLT r5, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r1, 0x444444
    LDI r9, 4
    LDI r12, 204
    LDI r7, 248
    LDI r11, 40
    RECTF r9, r12, r7, r11, r1

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r1, r17
        
        ; Bar position
        LDI r10, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r10      ; +1
        ADD r16, r10      ; +1 = +2
        LDI r9, 8       ; x start
        ADD r9, r16
        
        ; Bar height (simulated)
        LDI r12, 230
        LDI r7, 20      ; bar width
        LDI r11, 10      ; bar height (would be logits)
        
        RECTF r9, r12, r7, r11, r1
        
        ADDI r16, 1
        LDI r3, 8
        CMP r16, r3
        BLT r5, bar_loop

    ; Status text at bottom
    LDI r9, 4
    LDI r12, 246
    LDI r3, STATUS_BUF
    DRAWTEXT r9, r12, r3, r16, r8

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r1
    JZ r1, main_loop
    
    ; ESC = exit
    LDI r3, 27
    CMPI r1, 27
    JZ r5, exit_app
    
    ; Tab = switch mode
    LDI r3, 9
    CMPI r1, 9
    JNZ r5, main_loop
    
    ; Toggle mode
    LDI r9, MODE
    LOAD r12, r9
    LDI r10, 1
    ADD r12, r10
    LDI r3, 3
    CMPI r12, 3
    BLT r5, store_mode
    LDI r12, 0
    store_mode:
    STORE r9, r12
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r9, MODE
    LOAD r12, r9
    CMPI r12, 0
    JNZ r5, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r12, 1
    JNZ r5, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT