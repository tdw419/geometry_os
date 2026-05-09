; DESCRIPTION: Places a white circle of radius 45 at center (104, 155).
; PLAN: r0=104(x), r1=155(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 155
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
