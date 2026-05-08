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
    LDI r6, MODE
    STORE r6, r2
    
    ; Init scroll
    LDI r2, 0
    LDI r6, SCROLL
    STORE r6, r2
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r3, 0x111122
    FILL r3

    ; Draw header bar
    LDI r12, 0x00FF00     ; green header
    LDI r6, 0
    LDI r4, 0
    LDI r15, 256
    LDI r13, 16
    RECTF r6, r4, r15, r13, r12

    ; Title text
    LDI r6, 4
    LDI r4, 2
    LDI r11, STATUS_BUF
    DRAWTEXT r6, r4, r11, r16, r12

    ; Draw weight visualization area (green border)
    LDI r12, 0x00FF00
    LDI r6, 4
    LDI r4, 20
    LDI r15, 248
    LDI r13, 180
    RECTF r6, r4, r15, r13, r12

    ; Inner area (dark)
    LDI r12, 0x0A0A1A
    LDI r6, 6
    LDI r4, 22
    LDI r15, 244
    LDI r13, 176
    RECTF r6, r4, r15, r13, r12

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r12, 0x334455
    LDI r8, 8            ; y start
    draw_row_loop:
        LDI r14, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r0, r14
            ADD r0, r8
            LDI r1, 0xFF
            AND r0, r1       ; mod 256
            SHLI r0, 16       ; blue channel
            OR r0, r12        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r6, 2
            RECTF r14, r8, r6, r6, r0
            
            ADDI r14, 3
            LDI r11, 250
            CMP r14, r11
            BLT r9, draw_col_loop
        
        ADDI r8, 3
        LDI r11, 198
        CMP r8, r11
        BLT r9, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r12, 0x444444
    LDI r6, 4
    LDI r4, 204
    LDI r15, 248
    LDI r13, 40
    RECTF r6, r4, r15, r13, r12

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r12, r17
        
        ; Bar position
        LDI r2, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r2      ; +1
        ADD r16, r2      ; +1 = +2
        LDI r6, 8       ; x start
        ADD r6, r16
        
        ; Bar height (simulated)
        LDI r4, 230
        LDI r15, 20      ; bar width
        LDI r13, 10      ; bar height (would be logits)
        
        RECTF r6, r4, r15, r13, r12
        
        ADDI r16, 1
        LDI r11, 8
        CMP r16, r11
        BLT r9, bar_loop

    ; Status text at bottom
    LDI r6, 4
    LDI r4, 246
    LDI r11, STATUS_BUF
    DRAWTEXT r6, r4, r11, r16, r3

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r12
    JZ r12, main_loop
    
    ; ESC = exit
    LDI r11, 27
    CMPI r12, 27
    JZ r9, exit_app
    
    ; Tab = switch mode
    LDI r11, 9
    CMPI r12, 9
    JNZ r9, main_loop
    
    ; Toggle mode
    LDI r6, MODE
    LOAD r4, r6
    LDI r2, 1
    ADD r4, r2
    LDI r11, 3
    CMPI r4, 3
    BLT r9, store_mode
    LDI r4, 0
    store_mode:
    STORE r6, r4
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r6, MODE
    LOAD r4, r6
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