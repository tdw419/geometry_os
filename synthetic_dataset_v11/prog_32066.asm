; DESCRIPTION: Draws a black rectangle at (96, 153) with width 118 and height 84.
; PLAN: r0=96(x), r1=153(y), r2=118(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 153
LDI r2, 118
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
