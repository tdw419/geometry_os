; DESCRIPTION: Places a orange disk with center (18, 110) and radius 33.
; PLAN: r0=18(x), r1=110(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 110
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
