; DESCRIPTION: Places a white circle of radius 51 at center (457, 121).
; PLAN: r0=457(x), r1=121(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 121
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
