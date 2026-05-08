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
    LDI r14, 0x111122
    FILL r14

    ; Draw header bar
    LDI r9, 0x00FF00     ; green header
    LDI r0, 0
    LDI r10, 0
    LDI r5, 256
    LDI r12, 16
    RECTF r0, r10, r5, r12, r9

    ; Title text
    LDI r0, 4
    LDI r10, 2
    LDI r7, STATUS_BUF
    DRAWTEXT r0, r10, r7, r16, r9

    ; Draw weight visualization area (green border)
    LDI r9, 0x00FF00
    LDI r0, 4
    LDI r10, 20
    LDI r5, 248
    LDI r12, 180
    RECTF r0, r10, r5, r12, r9

    ; Inner area (dark)
    LDI r9, 0x0A0A1A
    LDI r0, 6
    LDI r10, 22
    LDI r5, 244
    LDI r12, 176
    RECTF r0, r10, r5, r12, r9

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r9, 0x334455
    LDI r2, 8            ; y start
    draw_row_loop:
        LDI r4, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r6, r4
            ADD r6, r2
            LDI r8, 0xFF
            AND r6, r8       ; mod 256
            SHLI r6, 16       ; blue channel
            OR r6, r9        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r0, 2
            RECTF r4, r2, r0, r0, r6
            
            ADDI r4, 3
            LDI r7, 250
            CMP r4, r7
            BLT r15, draw_col_loop
        
        ADDI r2, 3
        LDI r7, 198
        CMP r2, r7
        BLT r15, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r9, 0x444444
    LDI r0, 4
    LDI r10, 204
    LDI r5, 248
    LDI r12, 40
    RECTF r0, r10, r5, r12, r9

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r9, r17
        
        ; Bar position
        LDI r13, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r13      ; +1
        ADD r16, r13      ; +1 = +2
        LDI r0, 8       ; x start
        ADD r0, r16
        
        ; Bar height (simulated)
        LDI r10, 230
        LDI r5, 20      ; bar width
        LDI r12, 10      ; bar height (would be logits)
        
        RECTF r0, r10, r5, r12, r9
        
        ADDI r16, 1
        LDI r7, 8
        CMP r16, r7
        BLT r15, bar_loop

    ; Status text at bottom
    LDI r0, 4
    LDI r10, 246
    LDI r7, STATUS_BUF
    DRAWTEXT r0, r10, r7, r16, r14

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r9
    JZ r9, main_loop
    
    ; ESC = exit
    LDI r7, 27
    CMPI r9, 27
    JZ r15, exit_app
    
    ; Tab = switch mode
    LDI r7, 9
    CMPI r9, 9
    JNZ r15, main_loop
    
    ; Toggle mode
    LDI r0, MODE
    LOAD r10, r0
    LDI r13, 1
    ADD r10, r13
    LDI r7, 3
    CMPI r10, 3
    BLT r15, store_mode
    LDI r10, 0
    store_mode:
    STORE r0, r10
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r0, MODE
    LOAD r10, r0
    CMPI r10, 0
    JNZ r15, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r10, 1
    JNZ r15, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT