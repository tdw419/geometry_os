; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r9, 0
LDI r15, 0
LDI r0, 256
LDI r13, 256
LDI r10, 0xFF0000
RECTF r9, r15, r0, r13, r10

; Green rectangle (20px inset)
LDI r9, 20
LDI r15, 20
LDI r0, 216
LDI r13, 216
LDI r10, 0x00FF00
RECTF r9, r15, r0, r13, r10

; Blue rectangle (40px inset)
LDI r9, 40
LDI r15, 40
LDI r0, 176
LDI r13, 176
LDI r10, 0x0000FF
RECTF r9, r15, r0, r13, r10

; Yellow rectangle (60px inset)
LDI r9, 60
LDI r15, 60
LDI r0, 136
LDI r13, 136
LDI r10, 0xFFFF00
RECTF r9, r15, r0, r13, r10

; Magenta rectangle (80px inset)
LDI r9, 80
LDI r15, 80
LDI r0, 96
LDI r13, 96
LDI r10, 0xFF00FF
RECTF r9, r15, r0, r13, r10

; Cyan rectangle (100px inset)
LDI r9, 100
LDI r15, 100
LDI r0, 56
LDI r13, 56
LDI r10, 0x00FFFF
RECTF r9, r15, r0, r13, r10

; White center (120px inset)
LDI r9, 120
LDI r15, 120
LDI r0, 16
LDI r13, 16
LDI r10, 0xFFFFFF
RECTF r9, r15, r0, r13, r10

HALT
