; DESCRIPTION: Draws a green circle centered at (186, 170) with radius 80.
; PLAN: r0=186(x), r1=170(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 170
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
