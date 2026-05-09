; DESCRIPTION: Places a white circle of radius 61 at center (330, 106).
; PLAN: r0=330(x), r1=106(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 106
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
