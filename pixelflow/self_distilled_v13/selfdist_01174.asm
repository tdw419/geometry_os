; DESCRIPTION: Places a white disk with center (97, 52) and radius 72.
; PLAN: r0=97(x), r1=52(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 52
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
