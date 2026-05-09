; DESCRIPTION: Creates a yellow circular shape at (309, 170) with radius 51.
; PLAN: r0=309(x), r1=170(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 170
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
