; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r13, 0
LDI r15, 0
LDI r4, 256
LDI r7, 256
LDI r9, 0xFF0000
RECTF r13, r15, r4, r7, r9

; Green rectangle (20px inset)
LDI r13, 20
LDI r15, 20
LDI r4, 216
LDI r7, 216
LDI r9, 0x00FF00
RECTF r13, r15, r4, r7, r9

; Blue rectangle (40px inset)
LDI r13, 40
LDI r15, 40
LDI r4, 176
LDI r7, 176
LDI r9, 0x0000FF
RECTF r13, r15, r4, r7, r9

; Yellow rectangle (60px inset)
LDI r13, 60
LDI r15, 60
LDI r4, 136
LDI r7, 136
LDI r9, 0xFFFF00
RECTF r13, r15, r4, r7, r9

; Magenta rectangle (80px inset)
LDI r13, 80
LDI r15, 80
LDI r4, 96
LDI r7, 96
LDI r9, 0xFF00FF
RECTF r13, r15, r4, r7, r9

; Cyan rectangle (100px inset)
LDI r13, 100
LDI r15, 100
LDI r4, 56
LDI r7, 56
LDI r9, 0x00FFFF
RECTF r13, r15, r4, r7, r9

; White center (120px inset)
LDI r13, 120
LDI r15, 120
LDI r4, 16
LDI r7, 16
LDI r9, 0xFFFFFF
RECTF r13, r15, r4, r7, r9

HALT
