; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r13, 0
LDI r15, 0
LDI r3, 256
LDI r0, 256
LDI r9, 0xFF0000
RECTF r13, r15, r3, r0, r9

; Green rectangle (20px inset)
LDI r13, 20
LDI r15, 20
LDI r3, 216
LDI r0, 216
LDI r9, 0x00FF00
RECTF r13, r15, r3, r0, r9

; Blue rectangle (40px inset)
LDI r13, 40
LDI r15, 40
LDI r3, 176
LDI r0, 176
LDI r9, 0x0000FF
RECTF r13, r15, r3, r0, r9

; Yellow rectangle (60px inset)
LDI r13, 60
LDI r15, 60
LDI r3, 136
LDI r0, 136
LDI r9, 0xFFFF00
RECTF r13, r15, r3, r0, r9

; Magenta rectangle (80px inset)
LDI r13, 80
LDI r15, 80
LDI r3, 96
LDI r0, 96
LDI r9, 0xFF00FF
RECTF r13, r15, r3, r0, r9

; Cyan rectangle (100px inset)
LDI r13, 100
LDI r15, 100
LDI r3, 56
LDI r0, 56
LDI r9, 0x00FFFF
RECTF r13, r15, r3, r0, r9

; White center (120px inset)
LDI r13, 120
LDI r15, 120
LDI r3, 16
LDI r0, 16
LDI r9, 0xFFFFFF
RECTF r13, r15, r3, r0, r9

HALT
