; DESCRIPTION: Places a white circle of radius 52 at center (104, 158).
; PLAN: r0=104(x), r1=158(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 158
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
