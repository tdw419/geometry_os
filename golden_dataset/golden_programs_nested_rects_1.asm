; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; NESTED_RECTS -- Draw concentric rectangles from outside in
; Outer = red, inner = green, innermost = blue
; Each rectangle shrinks by 20 pixels on each side
; Test: visible nested colored rectangles

; Outer red rectangle
LDI r5, 0
LDI r6, 0
LDI r8, 256
LDI r0, 256
LDI r12, 0xFF0000
RECTF r5, r6, r8, r0, r12

; Green rectangle (20px inset)
LDI r5, 20
LDI r6, 20
LDI r8, 216
LDI r0, 216
LDI r12, 0x00FF00
RECTF r5, r6, r8, r0, r12

; Blue rectangle (40px inset)
LDI r5, 40
LDI r6, 40
LDI r8, 176
LDI r0, 176
LDI r12, 0x0000FF
RECTF r5, r6, r8, r0, r12

; Yellow rectangle (60px inset)
LDI r5, 60
LDI r6, 60
LDI r8, 136
LDI r0, 136
LDI r12, 0xFFFF00
RECTF r5, r6, r8, r0, r12

; Magenta rectangle (80px inset)
LDI r5, 80
LDI r6, 80
LDI r8, 96
LDI r0, 96
LDI r12, 0xFF00FF
RECTF r5, r6, r8, r0, r12

; Cyan rectangle (100px inset)
LDI r5, 100
LDI r6, 100
LDI r8, 56
LDI r0, 56
LDI r12, 0x00FFFF
RECTF r5, r6, r8, r0, r12

; White center (120px inset)
LDI r5, 120
LDI r6, 120
LDI r8, 16
LDI r0, 16
LDI r12, 0xFFFFFF
RECTF r5, r6, r8, r0, r12

HALT
