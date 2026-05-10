; DESCRIPTION: Places a white disk with center (379, 33) and radius 77.
; PLAN: r0=379(x), r1=33(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 33
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
