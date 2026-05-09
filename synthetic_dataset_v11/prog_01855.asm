; DESCRIPTION: Places a white circle of radius 23 at center (204, 23).
; PLAN: r0=204(x), r1=23(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 23
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
