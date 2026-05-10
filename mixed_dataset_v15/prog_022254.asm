; DESCRIPTION: Renders a yellow rectangular region spanning 15 by 22 at (158, 23).
; PLAN: r0=158(x), r1=23(y), r2=15(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 23
LDI r2, 15
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
