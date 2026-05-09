; DESCRIPTION: Draws a black rectangle at (306, 31) with width 80 and height 114.
; PLAN: r0=306(x), r1=31(y), r2=80(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 31
LDI r2, 80
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
