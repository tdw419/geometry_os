; DESCRIPTION: Draws a white circle centered at (323, 170) with radius 74.
; PLAN: r0=323(x), r1=170(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 170
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
