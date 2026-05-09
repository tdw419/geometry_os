; DESCRIPTION: Places a white circle of radius 51 at center (444, 139).
; PLAN: r0=444(x), r1=139(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 139
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
