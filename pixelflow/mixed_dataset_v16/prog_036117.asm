; DESCRIPTION: Places a white circle of radius 73 at center (85, 101).
; PLAN: r0=85(x), r1=101(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 101
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
