; DESCRIPTION: Draws a black rectangle at (29, 119) with width 70 and height 92.
; PLAN: r0=29(x), r1=119(y), r2=70(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 119
LDI r2, 70
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
