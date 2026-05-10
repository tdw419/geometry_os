; DESCRIPTION: Renders a yellow rectangular region spanning 118 by 36 at (391, 188).
; PLAN: r0=391(x), r1=188(y), r2=118(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 188
LDI r2, 118
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
