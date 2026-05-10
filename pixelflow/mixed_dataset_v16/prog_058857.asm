; DESCRIPTION: Places a white circle of radius 20 at center (311, 61).
; PLAN: r0=311(x), r1=61(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 61
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
