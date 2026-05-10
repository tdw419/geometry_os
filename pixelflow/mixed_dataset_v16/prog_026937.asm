; DESCRIPTION: Draws a yellow rectangle at (167, 119) with width 43 and height 80.
; PLAN: r0=167(x), r1=119(y), r2=43(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 119
LDI r2, 43
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
