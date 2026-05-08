; DESCRIPTION: Display a rectangle using color red at the screen.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r7, 0
LDI r1, 0
LDI r11, 256
LDI r5, 256
LDI r12, 0xFF0000
RECTF r7, r1, r11, r5, r12

; Green rectangle (20px inset)
LDI r7, 20
LDI r1, 20
LDI r11, 216
LDI r5, 216
LDI r12, 0x00FF00
RECTF r7, r1, r11, r5, r12

; Blue rectangle (40px inset)
LDI r7, 40
LDI r1, 40
LDI r11, 176
LDI r5, 176
LDI r12, 0x0000FF
RECTF r7, r1, r11, r5, r12

; Yellow rectangle (60px inset)
LDI r7, 60
LDI r1, 60
LDI r11, 136
LDI r5, 136
LDI r12, 0xFFFF00
RECTF r7, r1, r11, r5, r12

; Magenta rectangle (80px inset)
LDI r7, 80
LDI r1, 80
LDI r11, 96
LDI r5, 96
LDI r12, 0xFF00FF
RECTF r7, r1, r11, r5, r12

; Cyan rectangle (100px inset)
LDI r7, 100
LDI r1, 100
LDI r11, 56
LDI r5, 56
LDI r12, 0x00FFFF
RECTF r7, r1, r11, r5, r12

; White center (120px inset)
LDI r7, 120
LDI r1, 120
LDI r11, 16
LDI r5, 16
LDI r12, 0xFFFFFF
RECTF r7, r1, r11, r5, r12

HALT
