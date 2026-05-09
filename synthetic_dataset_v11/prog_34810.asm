; DESCRIPTION: Draws a yellow rectangle at (4, 100) with width 66 and height 19.
; PLAN: r0=4(x), r1=100(y), r2=66(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 100
LDI r2, 66
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
