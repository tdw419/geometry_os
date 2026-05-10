; DESCRIPTION: Places a white disk with center (145, 14) and radius 34.
; PLAN: r0=145(x), r1=14(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 14
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
