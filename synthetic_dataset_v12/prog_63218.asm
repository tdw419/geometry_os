; DESCRIPTION: Places a white circle of radius 61 at center (336, 73).
; PLAN: r0=336(x), r1=73(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 73
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
