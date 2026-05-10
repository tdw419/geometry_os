; DESCRIPTION: Places a white circle of radius 36 at center (95, 78).
; PLAN: r0=95(x), r1=78(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 78
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
