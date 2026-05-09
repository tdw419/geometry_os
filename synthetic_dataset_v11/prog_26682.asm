; DESCRIPTION: Places a white circle of radius 58 at center (156, 104).
; PLAN: r0=156(x), r1=104(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 104
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
