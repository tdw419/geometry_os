; DESCRIPTION: Places a white disk with center (45, 61) and radius 35.
; PLAN: r0=45(x), r1=61(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 61
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
