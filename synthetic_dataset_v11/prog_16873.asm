; DESCRIPTION: Draws a blue rectangle at (41, 52) with width 92 and height 88.
; PLAN: r0=41(x), r1=52(y), r2=92(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 52
LDI r2, 92
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
