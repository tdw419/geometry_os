; DESCRIPTION: Draws a black rectangle at (158, 101) with width 28 and height 90.
; PLAN: r0=158(x), r1=101(y), r2=28(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 101
LDI r2, 28
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
