; DESCRIPTION: Display a rectangle using color red at the screen.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r1, 0
LDI r15, 0
LDI r2, 256
LDI r9, 256
LDI r7, 0xFF0000
RECTF r1, r15, r2, r9, r7

; Green rectangle (20px inset)
LDI r1, 20
LDI r15, 20
LDI r2, 216
LDI r9, 216
LDI r7, 0x00FF00
RECTF r1, r15, r2, r9, r7

; Blue rectangle (40px inset)
LDI r1, 40
LDI r15, 40
LDI r2, 176
LDI r9, 176
LDI r7, 0x0000FF
RECTF r1, r15, r2, r9, r7

; Yellow rectangle (60px inset)
LDI r1, 60
LDI r15, 60
LDI r2, 136
LDI r9, 136
LDI r7, 0xFFFF00
RECTF r1, r15, r2, r9, r7

; Magenta rectangle (80px inset)
LDI r1, 80
LDI r15, 80
LDI r2, 96
LDI r9, 96
LDI r7, 0xFF00FF
RECTF r1, r15, r2, r9, r7

; Cyan rectangle (100px inset)
LDI r1, 100
LDI r15, 100
LDI r2, 56
LDI r9, 56
LDI r7, 0x00FFFF
RECTF r1, r15, r2, r9, r7

; White center (120px inset)
LDI r1, 120
LDI r15, 120
LDI r2, 16
LDI r9, 16
LDI r7, 0xFFFFFF
RECTF r1, r15, r2, r9, r7

HALT
