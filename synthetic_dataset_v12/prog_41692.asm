; DESCRIPTION: Creates a yellow circular shape at (124, 111) with radius 66.
; PLAN: r0=124(x), r1=111(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 111
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
