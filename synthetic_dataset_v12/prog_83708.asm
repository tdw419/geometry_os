; DESCRIPTION: Draws a yellow rectangle at (44, 34) with width 114 and height 53.
; PLAN: r0=44(x), r1=34(y), r2=114(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 34
LDI r2, 114
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
