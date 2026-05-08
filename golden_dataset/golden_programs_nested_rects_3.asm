; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r14, 0
LDI r4, 0
LDI r6, 256
LDI r7, 256
LDI r2, 0xFF0000
RECTF r14, r4, r6, r7, r2

; Green rectangle (20px inset)
LDI r14, 20
LDI r4, 20
LDI r6, 216
LDI r7, 216
LDI r2, 0x00FF00
RECTF r14, r4, r6, r7, r2

; Blue rectangle (40px inset)
LDI r14, 40
LDI r4, 40
LDI r6, 176
LDI r7, 176
LDI r2, 0x0000FF
RECTF r14, r4, r6, r7, r2

; Yellow rectangle (60px inset)
LDI r14, 60
LDI r4, 60
LDI r6, 136
LDI r7, 136
LDI r2, 0xFFFF00
RECTF r14, r4, r6, r7, r2

; Magenta rectangle (80px inset)
LDI r14, 80
LDI r4, 80
LDI r6, 96
LDI r7, 96
LDI r2, 0xFF00FF
RECTF r14, r4, r6, r7, r2

; Cyan rectangle (100px inset)
LDI r14, 100
LDI r4, 100
LDI r6, 56
LDI r7, 56
LDI r2, 0x00FFFF
RECTF r14, r4, r6, r7, r2

; White center (120px inset)
LDI r14, 120
LDI r4, 120
LDI r6, 16
LDI r7, 16
LDI r2, 0xFFFFFF
RECTF r14, r4, r6, r7, r2

HALT
