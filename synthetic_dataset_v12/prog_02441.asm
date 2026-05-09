; DESCRIPTION: Places a white circle of radius 52 at center (264, 139).
; PLAN: r0=264(x), r1=139(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 139
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
