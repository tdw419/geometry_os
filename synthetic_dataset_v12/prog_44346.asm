; DESCRIPTION: Draws a yellow rectangle at (452, 167) with width 11 and height 75.
; PLAN: r0=452(x), r1=167(y), r2=11(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 167
LDI r2, 11
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
