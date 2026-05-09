; DESCRIPTION: Draws a cyan circle centered at (246, 170) with radius 74.
; PLAN: r0=246(x), r1=170(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 170
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
