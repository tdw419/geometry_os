; DESCRIPTION: Draws a black rectangle at (452, 140) with width 31 and height 106.
; PLAN: r0=452(x), r1=140(y), r2=31(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 140
LDI r2, 31
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
