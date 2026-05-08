; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r13, 0
LDI r1, 0
LDI r3, 256
LDI r5, 256
LDI r8, 0xFF0000
RECTF r13, r1, r3, r5, r8

; Green rectangle (20px inset)
LDI r13, 20
LDI r1, 20
LDI r3, 216
LDI r5, 216
LDI r8, 0x00FF00
RECTF r13, r1, r3, r5, r8

; Blue rectangle (40px inset)
LDI r13, 40
LDI r1, 40
LDI r3, 176
LDI r5, 176
LDI r8, 0x0000FF
RECTF r13, r1, r3, r5, r8

; Yellow rectangle (60px inset)
LDI r13, 60
LDI r1, 60
LDI r3, 136
LDI r5, 136
LDI r8, 0xFFFF00
RECTF r13, r1, r3, r5, r8

; Magenta rectangle (80px inset)
LDI r13, 80
LDI r1, 80
LDI r3, 96
LDI r5, 96
LDI r8, 0xFF00FF
RECTF r13, r1, r3, r5, r8

; Cyan rectangle (100px inset)
LDI r13, 100
LDI r1, 100
LDI r3, 56
LDI r5, 56
LDI r8, 0x00FFFF
RECTF r13, r1, r3, r5, r8

; White center (120px inset)
LDI r13, 120
LDI r1, 120
LDI r3, 16
LDI r5, 16
LDI r8, 0xFFFFFF
RECTF r13, r1, r3, r5, r8

HALT
