; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r14, 0
LDI r6, 0
LDI r2, 256
LDI r13, 256
LDI r5, 0xFF0000
RECTF r14, r6, r2, r13, r5

; Green rectangle (20px inset)
LDI r14, 20
LDI r6, 20
LDI r2, 216
LDI r13, 216
LDI r5, 0x00FF00
RECTF r14, r6, r2, r13, r5

; Blue rectangle (40px inset)
LDI r14, 40
LDI r6, 40
LDI r2, 176
LDI r13, 176
LDI r5, 0x0000FF
RECTF r14, r6, r2, r13, r5

; Yellow rectangle (60px inset)
LDI r14, 60
LDI r6, 60
LDI r2, 136
LDI r13, 136
LDI r5, 0xFFFF00
RECTF r14, r6, r2, r13, r5

; Magenta rectangle (80px inset)
LDI r14, 80
LDI r6, 80
LDI r2, 96
LDI r13, 96
LDI r5, 0xFF00FF
RECTF r14, r6, r2, r13, r5

; Cyan rectangle (100px inset)
LDI r14, 100
LDI r6, 100
LDI r2, 56
LDI r13, 56
LDI r5, 0x00FFFF
RECTF r14, r6, r2, r13, r5

; White center (120px inset)
LDI r14, 120
LDI r6, 120
LDI r2, 16
LDI r13, 16
LDI r5, 0xFFFFFF
RECTF r14, r6, r2, r13, r5

HALT
