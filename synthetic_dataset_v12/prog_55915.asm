; DESCRIPTION: Draws a yellow rectangle at (361, 170) with width 36 and height 73.
; PLAN: r0=361(x), r1=170(y), r2=36(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 170
LDI r2, 36
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
