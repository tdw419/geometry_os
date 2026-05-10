; DESCRIPTION: Renders a yellow rectangular region spanning 74 by 98 at (208, 106).
; PLAN: r0=208(x), r1=106(y), r2=74(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 106
LDI r2, 74
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
