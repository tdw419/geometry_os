; DESCRIPTION: Draws a black rectangle at (366, 102) with width 59 and height 106.
; PLAN: r0=366(x), r1=102(y), r2=59(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 102
LDI r2, 59
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
