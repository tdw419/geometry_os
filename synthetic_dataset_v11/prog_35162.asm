; DESCRIPTION: Draws a black rectangle at (158, 16) with width 65 and height 106.
; PLAN: r0=158(x), r1=16(y), r2=65(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 16
LDI r2, 65
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
