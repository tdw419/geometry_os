; DESCRIPTION: Places a white circle of radius 62 at center (117, 104).
; PLAN: r0=117(x), r1=104(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 104
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
