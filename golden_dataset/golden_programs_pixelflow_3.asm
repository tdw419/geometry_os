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
    LDI r14, 1
    LDI r15, MODE
    STORE r15, r14
    
    ; Init scroll
    LDI r14, 0
    LDI r15, SCROLL
    STORE r15, r14
    
    ; Title
    LDI r20, STATUS_BUF
    STRO r20, "PIXELFLOW NEURAL ENGINE"

main_loop:
    ; Clear screen
    LDI r4, 0x111122
    FILL r4

    ; Draw header bar
    LDI r0, 0x00FF00     ; green header
    LDI r15, 0
    LDI r3, 0
    LDI r7, 256
    LDI r10, 16
    RECTF r15, r3, r7, r10, r0

    ; Title text
    LDI r15, 4
    LDI r3, 2
    LDI r13, STATUS_BUF
    DRAWTEXT r15, r3, r13, r16, r0

    ; Draw weight visualization area (green border)
    LDI r0, 0x00FF00
    LDI r15, 4
    LDI r3, 20
    LDI r7, 248
    LDI r10, 180
    RECTF r15, r3, r7, r10, r0

    ; Inner area (dark)
    LDI r0, 0x0A0A1A
    LDI r15, 6
    LDI r3, 22
    LDI r7, 244
    LDI r10, 176
    RECTF r15, r3, r7, r10, r0

    ; Draw simulated weight pattern (diagonal stripes = placeholder)
    ; In real version, this reads from pixelflow server
    LDI r0, 0x334455
    LDI r11, 8            ; y start
    draw_row_loop:
        LDI r5, 10       ; x start
        draw_col_loop:
            ; Compute color based on position (simulated weight heatmap)
            ; Blue channel = position-based pattern
            MOV r1, r5
            ADD r1, r11
            LDI r12, 0xFF
            AND r1, r12       ; mod 256
            SHLI r1, 16       ; blue channel
            OR r1, r0        ; mix with base
            
            ; Draw 2x2 pixel block
            LDI r15, 2
            RECTF r5, r11, r15, r15, r1
            
            ADDI r5, 3
            LDI r13, 250
            CMP r5, r13
            BLT r8, draw_col_loop
        
        ADDI r11, 3
        LDI r13, 198
        CMP r11, r13
        BLT r8, draw_row_loop

    ; Draw logits bar chart at bottom
    LDI r0, 0x444444
    LDI r15, 4
    LDI r3, 204
    LDI r7, 248
    LDI r10, 40
    RECTF r15, r3, r7, r10, r0

    ; Simulated logits bars (5 bars)
    LDI r16, 0       ; bar counter
    bar_loop:
        ; Bar color: gradient from green to red
        SHLI r16, 5
        LDI r17, 0x00FF00
        ADD r17, r16     ; shift hue
        MOV r0, r17
        
        ; Bar position
        LDI r14, 1
        SHLI r16, 5       ; x = counter * 32
        ADD r16, r14      ; +1
        ADD r16, r14      ; +1 = +2
        LDI r15, 8       ; x start
        ADD r15, r16
        
        ; Bar height (simulated)
        LDI r3, 230
        LDI r7, 20      ; bar width
        LDI r10, 10      ; bar height (would be logits)
        
        RECTF r15, r3, r7, r10, r0
        
        ADDI r16, 1
        LDI r13, 8
        CMP r16, r13
        BLT r8, bar_loop

    ; Status text at bottom
    LDI r15, 4
    LDI r3, 246
    LDI r13, STATUS_BUF
    DRAWTEXT r15, r3, r13, r16, r4

    ; Render frame
    FRAME
    
    ; Check for key input
    IKEY r0
    JZ r0, main_loop
    
    ; ESC = exit
    LDI r13, 27
    CMPI r0, 27
    JZ r8, exit_app
    
    ; Tab = switch mode
    LDI r13, 9
    CMPI r0, 9
    JNZ r8, main_loop
    
    ; Toggle mode
    LDI r15, MODE
    LOAD r3, r15
    LDI r14, 1
    ADD r3, r14
    LDI r13, 3
    CMPI r3, 3
    BLT r8, store_mode
    LDI r3, 0
    store_mode:
    STORE r15, r3
    
    ; Update status text
    LDI r20, STATUS_BUF
    LDI r15, MODE
    LOAD r3, r15
    CMPI r3, 0
    JNZ r8, try_logits
    STRO r20, "MODE: WEIGHTS"
    JMP main_loop
    try_logits:
    CMPI r3, 1
    JNZ r8, try_gen
    STRO r20, "MODE: LOGITS"
    JMP main_loop
    try_gen:
    STRO r20, "MODE: GENERATE"

    JMP main_loop

exit_app:
    HALT