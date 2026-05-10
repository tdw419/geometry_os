; DESCRIPTION: Places a white disk with center (7, 29) and radius 33.
; PLAN: r0=7(x), r1=29(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 7
LDI r1, 29
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
