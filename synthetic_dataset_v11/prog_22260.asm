; DESCRIPTION: Creates a yellow circular shape at (233, 208) with radius 11.
; PLAN: r0=233(x), r1=208(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 208
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
