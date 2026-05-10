; DESCRIPTION: Draws a magenta rectangle at (34, 78) with width 85 and height 119.
; PLAN: r0=34(x), r1=78(y), r2=85(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 78
LDI r2, 85
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
