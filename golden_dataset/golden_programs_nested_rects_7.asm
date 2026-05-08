; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r4, 0
LDI r0, 0
LDI r9, 256
LDI r13, 256
LDI r10, 0xFF0000
RECTF r4, r0, r9, r13, r10

; Green rectangle (20px inset)
LDI r4, 20
LDI r0, 20
LDI r9, 216
LDI r13, 216
LDI r10, 0x00FF00
RECTF r4, r0, r9, r13, r10

; Blue rectangle (40px inset)
LDI r4, 40
LDI r0, 40
LDI r9, 176
LDI r13, 176
LDI r10, 0x0000FF
RECTF r4, r0, r9, r13, r10

; Yellow rectangle (60px inset)
LDI r4, 60
LDI r0, 60
LDI r9, 136
LDI r13, 136
LDI r10, 0xFFFF00
RECTF r4, r0, r9, r13, r10

; Magenta rectangle (80px inset)
LDI r4, 80
LDI r0, 80
LDI r9, 96
LDI r13, 96
LDI r10, 0xFF00FF
RECTF r4, r0, r9, r13, r10

; Cyan rectangle (100px inset)
LDI r4, 100
LDI r0, 100
LDI r9, 56
LDI r13, 56
LDI r10, 0x00FFFF
RECTF r4, r0, r9, r13, r10

; White center (120px inset)
LDI r4, 120
LDI r0, 120
LDI r9, 16
LDI r13, 16
LDI r10, 0xFFFFFF
RECTF r4, r0, r9, r13, r10

HALT
