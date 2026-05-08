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
    LDI r11, 1
    LDI r7, MODE
    STORE r7, r11
    
    ; Init scroll
    LDI r11, 0
    LDI r7, SCROLL
    STORE r7, r11
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r4, 0x111122
    FILL r4

    ; Draw header bar
    LDI r6, 0x00FF00     ; green header
    LDI r7, 0
    LDI r13, 0
    LDI r3, 256
    LDI r5, 16
    RECTF r7, r13, r3, r5, r6

    ; Title text
    LDI r7, 4
    LDI r13, 2
    LDI r8, STATUS_BUF
    DRAWTEXT r7, r13, r8, r16, r6

    ; Draw weight visualization area (green border)
    LDI r6, 0x00FF00
    LDI r7, 4
    LDI r13, 20
    LDI r3, 248
    LDI r5, 180
    RECTF r7, r13, r3, r5, r6

    ; Inner area (dark)
    LDI r6, 0x0A0A1A
    LDI r7, 6
    LDI r13, 22
    LDI r3, 244
    LDI r5, 176
    RECTF r7, r13, r3, r5, r6

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r6, 0x334455
    LDI r2, 8            ; y start
    draw_row_loop:
        LDI r12, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r14, r12
            ADD r14, r2
            LDI r0, 0xFF
            AND r14, r0       ; mod 256
            SHLI r14, 16       ; blue channel
            OR r14, r6        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r7, 2
            RECTF r12, r2, r7, r7, r14
            
            ADDI r12, 3
            LDI r8, 250
            CMP r12, r8
            BLT r10, draw_col_loop
        
        ADDI r2, 3
        LDI r8, 198
        CMP r2, r8
        BLT r10, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r6, 0x444444
    LDI r7, 4
    LDI r13, 204
    LDI r3, 248
    LDI r5, 40
    RECTF r7, r13, r3, r5, r6

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r6, r17
        
        ; Bar position
        LDI r11, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r11      ; +1
        ADD r16, r11      ; +1 = +2
        LDI r7, 8       ; x start
        ADD r7, r16
        
        ; Bar height (simulated)
        LDI r13, 230
        LDI r3, 20      ; bar width
        LDI r5, 10      ; bar height (would be logits)
        
        RECTF r7, r13, r3, r5, r6
        
        ADDI r16, 1
        LDI r8, 8
        CMP r16, r8
        BLT r10, bar_loop

    ; Status text at bottom
    LDI r7, 4
    LDI r13, 246
    LDI r8, STATUS_BUF
    DRAWTEXT r7, r13, r8, r16, r4

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r6
    JZ r6, main_loop
    
    ; ESC = exit
    LDI r8, 27
    CMPI r6, 27
    JZ r10, exit_app
    
    ; Tab = switch mode
    LDI r8, 9
    CMPI r6, 9
    JNZ r10, main_loop
    
    ; Toggle mode
    LDI r7, MODE
    LOAD r13, r7
    LDI r11, 1
    ADD r13, r11
    LDI r8, 3
    CMPI r13, 3
    BLT r10, store_mode
    LDI r13, 0
    store_mode:
    STORE r7, r13
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r7, MODE
    LOAD r13, r7
    CMPI r13, 0
    JNZ r10, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r13, 1
    JNZ r10, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT