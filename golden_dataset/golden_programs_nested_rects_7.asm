; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r6, 0
LDI r15, 0
LDI r13, 256
LDI r14, 256
LDI r12, 0xFF0000
RECTF r6, r15, r13, r14, r12

; Green rectangle (20px inset)
LDI r6, 20
LDI r15, 20
LDI r13, 216
LDI r14, 216
LDI r12, 0x00FF00
RECTF r6, r15, r13, r14, r12

; Blue rectangle (40px inset)
LDI r6, 40
LDI r15, 40
LDI r13, 176
LDI r14, 176
LDI r12, 0x0000FF
RECTF r6, r15, r13, r14, r12

; Yellow rectangle (60px inset)
LDI r6, 60
LDI r15, 60
LDI r13, 136
LDI r14, 136
LDI r12, 0xFFFF00
RECTF r6, r15, r13, r14, r12

; Magenta rectangle (80px inset)
LDI r6, 80
LDI r15, 80
LDI r13, 96
LDI r14, 96
LDI r12, 0xFF00FF
RECTF r6, r15, r13, r14, r12

; Cyan rectangle (100px inset)
LDI r6, 100
LDI r15, 100
LDI r13, 56
LDI r14, 56
LDI r12, 0x00FFFF
RECTF r6, r15, r13, r14, r12

; White center (120px inset)
LDI r6, 120
LDI r15, 120
LDI r13, 16
LDI r14, 16
LDI r12, 0xFFFFFF
RECTF r6, r15, r13, r14, r12

HALT
