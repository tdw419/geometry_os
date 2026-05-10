; DESCRIPTION: Places a white disk with center (106, 112) and radius 13.
; PLAN: r0=106(x), r1=112(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 112
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
