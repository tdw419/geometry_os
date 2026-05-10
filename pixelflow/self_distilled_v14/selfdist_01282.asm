; DESCRIPTION: Places a white disk with center (115, 14) and radius 49.
; PLAN: r0=115(x), r1=14(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 14
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
