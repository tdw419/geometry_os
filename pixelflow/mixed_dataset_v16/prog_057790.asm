; DESCRIPTION: Draws a magenta rectangle at (375, 201) with width 73 and height 20.
; PLAN: r0=375(x), r1=201(y), r2=73(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 201
LDI r2, 73
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
