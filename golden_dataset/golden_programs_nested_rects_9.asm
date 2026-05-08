; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r2, 0
LDI r11, 0
LDI r12, 256
LDI r3, 256
LDI r9, 0xFF0000
RECTF r2, r11, r12, r3, r9

; Green rectangle (20px inset)
LDI r2, 20
LDI r11, 20
LDI r12, 216
LDI r3, 216
LDI r9, 0x00FF00
RECTF r2, r11, r12, r3, r9

; Blue rectangle (40px inset)
LDI r2, 40
LDI r11, 40
LDI r12, 176
LDI r3, 176
LDI r9, 0x0000FF
RECTF r2, r11, r12, r3, r9

; Yellow rectangle (60px inset)
LDI r2, 60
LDI r11, 60
LDI r12, 136
LDI r3, 136
LDI r9, 0xFFFF00
RECTF r2, r11, r12, r3, r9

; Magenta rectangle (80px inset)
LDI r2, 80
LDI r11, 80
LDI r12, 96
LDI r3, 96
LDI r9, 0xFF00FF
RECTF r2, r11, r12, r3, r9

; Cyan rectangle (100px inset)
LDI r2, 100
LDI r11, 100
LDI r12, 56
LDI r3, 56
LDI r9, 0x00FFFF
RECTF r2, r11, r12, r3, r9

; White center (120px inset)
LDI r2, 120
LDI r11, 120
LDI r12, 16
LDI r3, 16
LDI r9, 0xFFFFFF
RECTF r2, r11, r12, r3, r9

HALT
