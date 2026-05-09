; DESCRIPTION: Places a white circle of radius 57 at center (81, 100).
; PLAN: r0=81(x), r1=100(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 100
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
