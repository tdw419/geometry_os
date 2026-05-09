; DESCRIPTION: Draws a magenta rectangle at (30, 9) with width 119 and height 98.
; PLAN: r0=30(x), r1=9(y), r2=119(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 9
LDI r2, 119
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
