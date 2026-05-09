; DESCRIPTION: Draws a magenta rectangle at (224, 99) with width 75 and height 89.
; PLAN: r0=224(x), r1=99(y), r2=75(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 99
LDI r2, 75
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
