; DESCRIPTION: Creates a yellow circular shape at (51, 97) with radius 40.
; PLAN: r0=51(x), r1=97(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 97
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
