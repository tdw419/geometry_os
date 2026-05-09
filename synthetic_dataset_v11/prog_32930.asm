; DESCRIPTION: Draws a blue rectangle at (22, 78) with width 106 and height 92.
; PLAN: r0=22(x), r1=78(y), r2=106(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 78
LDI r2, 106
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
