; DESCRIPTION: Draws a black rectangle at (99, 95) with width 114 and height 17.
; PLAN: r0=99(x), r1=95(y), r2=114(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 95
LDI r2, 114
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
