; DESCRIPTION: Draws a red rectangle at (71, 155) with width 110 and height 88.
; PLAN: r0=71(x), r1=155(y), r2=110(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 155
LDI r2, 110
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
