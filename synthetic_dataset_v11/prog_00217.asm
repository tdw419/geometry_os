; DESCRIPTION: Draws a black rectangle at (51, 96) with width 114 and height 69.
; PLAN: r0=51(x), r1=96(y), r2=114(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 96
LDI r2, 114
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
