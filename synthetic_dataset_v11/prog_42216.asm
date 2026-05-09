; DESCRIPTION: Places a white circle of radius 71 at center (120, 129).
; PLAN: r0=120(x), r1=129(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 129
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
