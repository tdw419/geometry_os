; DESCRIPTION: Creates a yellow circular shape at (391, 157) with radius 52.
; PLAN: r0=391(x), r1=157(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 157
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
