; DESCRIPTION: Places a white circle of radius 30 at center (139, 89).
; PLAN: r0=139(x), r1=89(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 89
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
