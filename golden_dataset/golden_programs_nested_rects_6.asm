; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r1, 0
LDI r10, 0
LDI r5, 256
LDI r2, 256
LDI r4, 0xFF0000
RECTF r1, r10, r5, r2, r4

; Green rectangle (20px inset)
LDI r1, 20
LDI r10, 20
LDI r5, 216
LDI r2, 216
LDI r4, 0x00FF00
RECTF r1, r10, r5, r2, r4

; Blue rectangle (40px inset)
LDI r1, 40
LDI r10, 40
LDI r5, 176
LDI r2, 176
LDI r4, 0x0000FF
RECTF r1, r10, r5, r2, r4

; Yellow rectangle (60px inset)
LDI r1, 60
LDI r10, 60
LDI r5, 136
LDI r2, 136
LDI r4, 0xFFFF00
RECTF r1, r10, r5, r2, r4

; Magenta rectangle (80px inset)
LDI r1, 80
LDI r10, 80
LDI r5, 96
LDI r2, 96
LDI r4, 0xFF00FF
RECTF r1, r10, r5, r2, r4

; Cyan rectangle (100px inset)
LDI r1, 100
LDI r10, 100
LDI r5, 56
LDI r2, 56
LDI r4, 0x00FFFF
RECTF r1, r10, r5, r2, r4

; White center (120px inset)
LDI r1, 120
LDI r10, 120
LDI r5, 16
LDI r2, 16
LDI r4, 0xFFFFFF
RECTF r1, r10, r5, r2, r4

HALT
