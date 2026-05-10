; DESCRIPTION: Places a white disk with center (293, 185) and radius 44.
; PLAN: r0=293(x), r1=185(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 185
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
