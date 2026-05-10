; DESCRIPTION: Places a white disk with center (164, 76) and radius 74.
; PLAN: r0=164(x), r1=76(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 76
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
