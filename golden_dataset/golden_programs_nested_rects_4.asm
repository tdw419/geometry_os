; DESCRIPTION: This GeOS assembly code draws a series of concentric rectangles on the screen, starting from an outermost red rectangle and progressively shrinking inward with each subsequent rectangle colored green, blue, yellow, magenta, cyan, and finally white at the center. Each rectangle is inset by 20 pixels compared to its predecessor.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r8, 0
LDI r15, 0
LDI r12, 256
LDI r7, 256
LDI r9, 0xFF0000
RECTF r8, r15, r12, r7, r9

; Green rectangle (20px inset)
LDI r8, 20
LDI r15, 20
LDI r12, 216
LDI r7, 216
LDI r9, 0x00FF00
RECTF r8, r15, r12, r7, r9

; Blue rectangle (40px inset)
LDI r8, 40
LDI r15, 40
LDI r12, 176
LDI r7, 176
LDI r9, 0x0000FF
RECTF r8, r15, r12, r7, r9

; Yellow rectangle (60px inset)
LDI r8, 60
LDI r15, 60
LDI r12, 136
LDI r7, 136
LDI r9, 0xFFFF00
RECTF r8, r15, r12, r7, r9

; Magenta rectangle (80px inset)
LDI r8, 80
LDI r15, 80
LDI r12, 96
LDI r7, 96
LDI r9, 0xFF00FF
RECTF r8, r15, r12, r7, r9

; Cyan rectangle (100px inset)
LDI r8, 100
LDI r15, 100
LDI r12, 56
LDI r7, 56
LDI r9, 0x00FFFF
RECTF r8, r15, r12, r7, r9

; White center (120px inset)
LDI r8, 120
LDI r15, 120
LDI r12, 16
LDI r7, 16
LDI r9, 0xFFFFFF
RECTF r8, r15, r12, r7, r9

HALT
