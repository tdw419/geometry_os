; DESCRIPTION: Places a white circle of radius 23 at center (104, 26).
; PLAN: r0=104(x), r1=26(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 26
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
