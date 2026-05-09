; DESCRIPTION: Draws a black rectangle at (31, 166) with width 89 and height 12.
; PLAN: r0=31(x), r1=166(y), r2=89(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 166
LDI r2, 89
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
