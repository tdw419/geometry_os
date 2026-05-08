; DESCRIPTION: Display a rectangle using color red at the screen.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r11, 0
LDI r5, 0
LDI r14, 256
LDI r4, 256
LDI r13, 0xFF0000
RECTF r11, r5, r14, r4, r13

; Green rectangle (20px inset)
LDI r11, 20
LDI r5, 20
LDI r14, 216
LDI r4, 216
LDI r13, 0x00FF00
RECTF r11, r5, r14, r4, r13

; Blue rectangle (40px inset)
LDI r11, 40
LDI r5, 40
LDI r14, 176
LDI r4, 176
LDI r13, 0x0000FF
RECTF r11, r5, r14, r4, r13

; Yellow rectangle (60px inset)
LDI r11, 60
LDI r5, 60
LDI r14, 136
LDI r4, 136
LDI r13, 0xFFFF00
RECTF r11, r5, r14, r4, r13

; Magenta rectangle (80px inset)
LDI r11, 80
LDI r5, 80
LDI r14, 96
LDI r4, 96
LDI r13, 0xFF00FF
RECTF r11, r5, r14, r4, r13

; Cyan rectangle (100px inset)
LDI r11, 100
LDI r5, 100
LDI r14, 56
LDI r4, 56
LDI r13, 0x00FFFF
RECTF r11, r5, r14, r4, r13

; White center (120px inset)
LDI r11, 120
LDI r5, 120
LDI r14, 16
LDI r4, 16
LDI r13, 0xFFFFFF
RECTF r11, r5, r14, r4, r13

HALT
