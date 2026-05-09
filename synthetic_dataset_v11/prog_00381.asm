; DESCRIPTION: Draws a yellow rectangle at (114, 29) with width 35 and height 51.
; PLAN: r0=114(x), r1=29(y), r2=35(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 29
LDI r2, 35
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
