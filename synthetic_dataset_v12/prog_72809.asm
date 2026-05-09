; DESCRIPTION: Draws a black rectangle at (85, 66) with width 101 and height 115.
; PLAN: r0=85(x), r1=66(y), r2=101(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 66
LDI r2, 101
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
