; DESCRIPTION: Draws a yellow rectangle at (49, 181) with width 71 and height 17.
; PLAN: r0=49(x), r1=181(y), r2=71(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 181
LDI r2, 71
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
