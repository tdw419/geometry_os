; kernel_demo.asm -- Geometry OS "Kernel" Demo
; Loaded at 0x3000

main:
    ; Find Screen Driver (Type 1)
    LDI r29, 0x7000
    LOAD r28, r29 ; count
    LDI r27, 0x7004 ; table start

search_loop:
    JZ r28, no_driver
    LOAD r26, r27 ; type
    CMPI r26, 1
    JZ r0, found_screen
    ADDI r27, 16
    SUBI r28, 1
    JMP search_loop

found_screen:
    ; Get Handler Address (at offset 8 from entry start)
    ADDI r27, 8
    LOAD r25, r27 ; r25 = handler address

    ; Use Screen Driver to clear to Blue
    LDI r1, 0 ; command 0 = clear
    LDI r2, 0x000000FF ; blue

    LDI r29, call_h1
    ADDI r29, 1
    STORE r29, r25
call_h1:
    CALL 0

    ; Use Screen Driver to draw a pixel
    LDI r1, 1 ; command 1 = pixel
    LDI r2, 128 ; x
    LDI r3, 128 ; y

    LDI r29, call_h2
    ADDI r29, 1
    STORE r29, r25
call_h2:
    CALL 0
done:
    HALT

no_driver:
    LDI r0, 0xFF0000FF ; red error
    FILL r0
    HALT

