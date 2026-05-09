; DESCRIPTION: Draws a yellow rectangle at (5, 66) with width 19 and height 31.
; PLAN: r0=5(x), r1=66(y), r2=19(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 66
LDI r2, 19
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
