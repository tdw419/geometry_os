; DESCRIPTION: Places a white disk with center (55, 30) and radius 13.
; PLAN: r0=55(x), r1=30(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 30
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
