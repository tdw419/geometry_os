; DESCRIPTION: Places a white disk with center (66, 112) and radius 14.
; PLAN: r0=66(x), r1=112(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 112
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
