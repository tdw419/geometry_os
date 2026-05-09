; DESCRIPTION: Draws a green rectangle at (1, 101) with width 101 and height 96.
; PLAN: r0=1(x), r1=101(y), r2=101(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 101
LDI r2, 101
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
