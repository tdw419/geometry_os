; DESCRIPTION: Creates a yellow circular shape at (407, 102) with radius 51.
; PLAN: r0=407(x), r1=102(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 102
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
