; DESCRIPTION: Draws a black rectangle at (146, 110) with width 114 and height 73.
; PLAN: r0=146(x), r1=110(y), r2=114(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 110
LDI r2, 114
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
