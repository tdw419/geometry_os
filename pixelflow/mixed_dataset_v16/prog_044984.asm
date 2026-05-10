; DESCRIPTION: Draws a black rectangle at (158, 9) with width 96 and height 77.
; PLAN: r0=158(x), r1=9(y), r2=96(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 9
LDI r2, 96
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
