; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r12, 0
LDI r9, 0
LDI r10, 256
LDI r6, 256
LDI r5, 0xFF0000
RECTF r12, r9, r10, r6, r5

; Green rectangle (20px inset)
LDI r12, 20
LDI r9, 20
LDI r10, 216
LDI r6, 216
LDI r5, 0x00FF00
RECTF r12, r9, r10, r6, r5

; Blue rectangle (40px inset)
LDI r12, 40
LDI r9, 40
LDI r10, 176
LDI r6, 176
LDI r5, 0x0000FF
RECTF r12, r9, r10, r6, r5

; Yellow rectangle (60px inset)
LDI r12, 60
LDI r9, 60
LDI r10, 136
LDI r6, 136
LDI r5, 0xFFFF00
RECTF r12, r9, r10, r6, r5

; Magenta rectangle (80px inset)
LDI r12, 80
LDI r9, 80
LDI r10, 96
LDI r6, 96
LDI r5, 0xFF00FF
RECTF r12, r9, r10, r6, r5

; Cyan rectangle (100px inset)
LDI r12, 100
LDI r9, 100
LDI r10, 56
LDI r6, 56
LDI r5, 0x00FFFF
RECTF r12, r9, r10, r6, r5

; White center (120px inset)
LDI r12, 120
LDI r9, 120
LDI r10, 16
LDI r6, 16
LDI r5, 0xFFFFFF
RECTF r12, r9, r10, r6, r5

HALT
