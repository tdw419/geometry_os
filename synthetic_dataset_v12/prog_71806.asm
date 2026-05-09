; DESCRIPTION: Places a white circle of radius 54 at center (324, 139).
; PLAN: r0=324(x), r1=139(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 139
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
