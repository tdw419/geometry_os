; DESCRIPTION: Draws a yellow rectangle at (19, 92) with width 31 and height 43.
; PLAN: r0=19(x), r1=92(y), r2=31(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 92
LDI r2, 31
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
