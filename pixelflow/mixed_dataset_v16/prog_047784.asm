; DESCRIPTION: Draws a yellow rectangle at (432, 70) with width 77 and height 88.
; PLAN: r0=432(x), r1=70(y), r2=77(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 70
LDI r2, 77
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
