; DESCRIPTION: Draws a blue rectangle at (134, 73) with width 31 and height 88.
; PLAN: r0=134(x), r1=73(y), r2=31(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 73
LDI r2, 31
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
