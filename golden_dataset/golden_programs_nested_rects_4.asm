; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r13, 0
LDI r10, 0
LDI r12, 256
LDI r2, 256
LDI r8, 0xFF0000
RECTF r13, r10, r12, r2, r8

; Green rectangle (20px inset)
LDI r13, 20
LDI r10, 20
LDI r12, 216
LDI r2, 216
LDI r8, 0x00FF00
RECTF r13, r10, r12, r2, r8

; Blue rectangle (40px inset)
LDI r13, 40
LDI r10, 40
LDI r12, 176
LDI r2, 176
LDI r8, 0x0000FF
RECTF r13, r10, r12, r2, r8

; Yellow rectangle (60px inset)
LDI r13, 60
LDI r10, 60
LDI r12, 136
LDI r2, 136
LDI r8, 0xFFFF00
RECTF r13, r10, r12, r2, r8

; Magenta rectangle (80px inset)
LDI r13, 80
LDI r10, 80
LDI r12, 96
LDI r2, 96
LDI r8, 0xFF00FF
RECTF r13, r10, r12, r2, r8

; Cyan rectangle (100px inset)
LDI r13, 100
LDI r10, 100
LDI r12, 56
LDI r2, 56
LDI r8, 0x00FFFF
RECTF r13, r10, r12, r2, r8

; White center (120px inset)
LDI r13, 120
LDI r10, 120
LDI r12, 16
LDI r2, 16
LDI r8, 0xFFFFFF
RECTF r13, r10, r12, r2, r8

HALT
