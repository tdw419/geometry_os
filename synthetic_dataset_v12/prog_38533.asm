; DESCRIPTION: Places a white circle of radius 39 at center (119, 138).
; PLAN: r0=119(x), r1=138(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 138
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
