; DESCRIPTION: Places a white disk with center (361, 110) and radius 63.
; PLAN: r0=361(x), r1=110(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 110
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
