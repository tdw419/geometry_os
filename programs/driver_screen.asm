; driver_screen.asm -- Sample Screen Driver
; Registers at 0x2000

; --- Driver Entry Point ---
start:
    ; Register Driver (Simplified)
    LDI r27, 0x7004
    
    ; [0] Type = 1 (Screen)
    LDI r26, 1
    STORE r27, r26
    
    ; [4] Init = init_screen
    ADDI r27, 4
    LDI r26, init_screen
    STORE r27, r26
    
    ; [8] Handler = handler_screen
    ADDI r27, 4
    LDI r26, handler_screen
    STORE r27, r26
    
    ; Increment count
    LDI r29, 0x7000
    LOAD r28, r29
    ADDI r28, 1
    STORE r29, r28
    
    RET

; --- Init Routine ---
init_screen:
    LDI r0, 0x0000 ; Black
    FILL r0
    RET

; --- Handler Routine ---
handler_screen:
    ; r1 = command (0=clear, 1=pixel)
    ; r2 = color / x
    ; r3 = y
    JZ r1, do_clear
    CMPI r1, 1
    JZ r0, do_pixel
    RET

do_clear:
    FILL r2
    RET

do_pixel:
    LDI r4, 0xFF00FF00 ; Green for test
    PSET r2, r3, r4
    RET
