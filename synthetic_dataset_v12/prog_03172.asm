; DESCRIPTION: Draws a magenta rectangle at (7, 109) with width 22 and height 119.
; PLAN: r0=7(x), r1=109(y), r2=22(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 109
LDI r2, 22
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
