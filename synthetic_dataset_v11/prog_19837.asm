; DESCRIPTION: Draws a yellow rectangle at (114, 138) with width 112 and height 22.
; PLAN: r0=114(x), r1=138(y), r2=112(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 138
LDI r2, 112
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
