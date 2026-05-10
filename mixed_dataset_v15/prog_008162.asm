; DESCRIPTION: Draws a yellow rectangle at (348, 121) with width 43 and height 89.
; PLAN: r0=348(x), r1=121(y), r2=43(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 121
LDI r2, 43
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
