; DESCRIPTION: Places a white circle of radius 61 at center (375, 82).
; PLAN: r0=375(x), r1=82(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 82
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
