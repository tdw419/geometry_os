; DESCRIPTION: Places a white circle of radius 75 at center (141, 93).
; PLAN: r0=141(x), r1=93(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 93
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
