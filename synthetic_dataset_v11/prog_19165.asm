; DESCRIPTION: Draws a yellow rectangle at (74, 4) with width 114 and height 95.
; PLAN: r0=74(x), r1=4(y), r2=114(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 4
LDI r2, 114
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
