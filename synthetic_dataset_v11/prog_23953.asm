; DESCRIPTION: Draws a green rectangle at (31, 101) with width 31 and height 49.
; PLAN: r0=31(x), r1=101(y), r2=31(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 101
LDI r2, 31
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
