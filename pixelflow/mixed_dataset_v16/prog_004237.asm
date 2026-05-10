; DESCRIPTION: Places a white circle of radius 11 at center (119, 32).
; PLAN: r0=119(x), r1=32(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 32
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
