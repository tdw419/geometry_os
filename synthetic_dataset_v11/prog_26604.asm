; DESCRIPTION: Places a white circle of radius 47 at center (109, 191).
; PLAN: r0=109(x), r1=191(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 191
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
