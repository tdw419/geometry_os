; DESCRIPTION: Draws a yellow rectangle at (181, 115) with width 96 and height 22.
; PLAN: r0=181(x), r1=115(y), r2=96(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 115
LDI r2, 96
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
