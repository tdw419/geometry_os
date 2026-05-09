; DESCRIPTION: Places a white circle of radius 73 at center (98, 181).
; PLAN: r0=98(x), r1=181(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 181
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
