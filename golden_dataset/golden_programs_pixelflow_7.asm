; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
    LDI r12, MODE
    STORE r12, r10
    
    ; Init scroll
    LDI r10, 0
    LDI r12, SCROLL
    STORE r12, r10
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r8, 0x111122
    FILL r8

    ; Draw header bar
    LDI r6, 0x00FF00     ; green header
    LDI r12, 0
    LDI r0, 0
    LDI r15, 256
    LDI r9, 16
    RECTF r12, r0, r15, r9, r6

    ; Title text
    LDI r12, 4
    LDI r0, 2
    LDI r14, STATUS_BUF
    DRAWTEXT r12, r0, r14, r16, r6

    ; Draw weight visualization area (green border)
    LDI r6, 0x00FF00
    LDI r12, 4
    LDI r0, 20
    LDI r15, 248
    LDI r9, 180
    RECTF r12, r0, r15, r9, r6

    ; Inner area (dark)
    LDI r6, 0x0A0A1A
    LDI r12, 6
    LDI r0, 22
    LDI r15, 244
    LDI r9, 176
    RECTF r12, r0, r15, r9, r6

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r6, 0x334455
    LDI r7, 8            ; y start
    draw_row_loop:
        LDI r3, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r4, r3
            ADD r4, r7
            LDI r2, 0xFF
            AND r4, r2       ; mod 256
            SHLI r4, 16       ; blue channel
            OR r4, r6        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r12, 2
            RECTF r3, r7, r12, r12, r4
            
            ADDI r3, 3
            LDI r14, 250
            CMP r3, r14
            BLT r13, draw_col_loop
        
        ADDI r7, 3
        LDI r14, 198
        CMP r7, r14
        BLT r13, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r6, 0x444444
    LDI r12, 4
    LDI r0, 204
    LDI r15, 248
    LDI r9, 40
    RECTF r12, r0, r15, r9, r6

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r6, r17
        
        ; Bar position
        LDI r10, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r10      ; +1
        ADD r16, r10      ; +1 = +2
        LDI r12, 8       ; x start
        ADD r12, r16
        
        ; Bar height (simulated)
        LDI r0, 230
        LDI r15, 20      ; bar width
        LDI r9, 10      ; bar height (would be logits)
        
        RECTF r12, r0, r15, r9, r6
        
        ADDI r16, 1
        LDI r14, 8
        CMP r16, r14
        BLT r13, bar_loop

    ; Status text at bottom
    LDI r12, 4
    LDI r0, 246
    LDI r14, STATUS_BUF
    DRAWTEXT r12, r0, r14, r16, r8

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r6
    JZ r6, main_loop
    
    ; ESC = exit
    LDI r14, 27
    CMPI r6, 27
    JZ r13, exit_app
    
    ; Tab = switch mode
    LDI r14, 9
    CMPI r6, 9
    JNZ r13, main_loop
    
    ; Toggle mode
    LDI r12, MODE
    LOAD r0, r12
    LDI r10, 1
    ADD r0, r10
    LDI r14, 3
    CMPI r0, 3
    BLT r13, store_mode
    LDI r0, 0
    store_mode:
    STORE r12, r0
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r12, MODE
    LOAD r0, r12
    CMPI r0, 0
    JNZ r13, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r0, 1
    JNZ r13, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT