; DESCRIPTION: Draws a black rectangle at (134, 29) with width 114 and height 59.
; PLAN: r0=134(x), r1=29(y), r2=114(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 29
LDI r2, 114
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
