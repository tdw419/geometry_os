; DESCRIPTION: Draws a yellow rectangle at (121, 15) with width 43 and height 52.
; PLAN: r0=121(x), r1=15(y), r2=43(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 15
LDI r2, 43
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
