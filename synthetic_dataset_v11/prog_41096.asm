; DESCRIPTION: Draws a red rectangle at (88, 52) with width 88 and height 119.
; PLAN: r0=88(x), r1=52(y), r2=88(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 52
LDI r2, 88
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
