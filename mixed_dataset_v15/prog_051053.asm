; DESCRIPTION: Draws a magenta rectangle at (124, 2) with width 119 and height 60.
; PLAN: r0=124(x), r1=2(y), r2=119(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 2
LDI r2, 119
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
