; DESCRIPTION: Places a white circle of radius 33 at center (90, 112).
; PLAN: r0=90(x), r1=112(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 112
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
