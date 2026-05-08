; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r13, 0
LDI r1, 0
LDI r15, 256
LDI r8, 256
LDI r7, 0xFF0000
RECTF r13, r1, r15, r8, r7

; Green rectangle (20px inset)
LDI r13, 20
LDI r1, 20
LDI r15, 216
LDI r8, 216
LDI r7, 0x00FF00
RECTF r13, r1, r15, r8, r7

; Blue rectangle (40px inset)
LDI r13, 40
LDI r1, 40
LDI r15, 176
LDI r8, 176
LDI r7, 0x0000FF
RECTF r13, r1, r15, r8, r7

; Yellow rectangle (60px inset)
LDI r13, 60
LDI r1, 60
LDI r15, 136
LDI r8, 136
LDI r7, 0xFFFF00
RECTF r13, r1, r15, r8, r7

; Magenta rectangle (80px inset)
LDI r13, 80
LDI r1, 80
LDI r15, 96
LDI r8, 96
LDI r7, 0xFF00FF
RECTF r13, r1, r15, r8, r7

; Cyan rectangle (100px inset)
LDI r13, 100
LDI r1, 100
LDI r15, 56
LDI r8, 56
LDI r7, 0x00FFFF
RECTF r13, r1, r15, r8, r7

; White center (120px inset)
LDI r13, 120
LDI r1, 120
LDI r15, 16
LDI r8, 16
LDI r7, 0xFFFFFF
RECTF r13, r1, r15, r8, r7

HALT
