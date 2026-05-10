; DESCRIPTION: Draws a magenta rectangle at (124, 24) with width 119 and height 78.
; PLAN: r0=124(x), r1=24(y), r2=119(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 24
LDI r2, 119
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
