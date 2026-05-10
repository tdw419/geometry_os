; DESCRIPTION: Places a white disk with center (83, 180) and radius 29.
; PLAN: r0=83(x), r1=180(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 180
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
