; DESCRIPTION: Draws a black rectangle at (15, 122) with width 114 and height 72.
; PLAN: r0=15(x), r1=122(y), r2=114(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 122
LDI r2, 114
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
