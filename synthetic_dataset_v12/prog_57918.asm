; DESCRIPTION: Places a white circle of radius 40 at center (138, 157).
; PLAN: r0=138(x), r1=157(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 157
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
