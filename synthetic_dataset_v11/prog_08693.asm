; DESCRIPTION: Draws a blue rectangle at (106, 158) with width 56 and height 47.
; PLAN: r0=106(x), r1=158(y), r2=56(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 158
LDI r2, 56
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
