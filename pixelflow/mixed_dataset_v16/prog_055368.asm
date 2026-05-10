; DESCRIPTION: Creates a green circular shape at (399, 45) with radius 18.
; PLAN: r0=399(x), r1=45(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 45
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
