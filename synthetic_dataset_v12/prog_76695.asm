; DESCRIPTION: Places a white circle of radius 49 at center (282, 139).
; PLAN: r0=282(x), r1=139(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 139
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
