; nested_app.asm - A simple counting app for recursive nesting.
; Fills screen with a unique color based on its PID and counts up.

LDI r10, 0x203040 ; default color
LDI r11, 0        ; counter

loop:
    ; Increment counter
    ADDI r11, 1
    
    ; Clear screen with color + counter offset
    MOV r0, r10
    ADD r0, r11
    FILL r0
    
    ; Draw counter as text
    LDI r1, 10
    LDI r2, 10
    LDI r3, 0x8000 ; RAM buffer for text
    STRO r3, "NESTED PID: "
    LDI r4, 0xFFFFFF
    LDI r5, 0
    DRAWTEXT r1, r2, r3, r4, r5
    
    FRAME
    JMP loop
