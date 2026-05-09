; DESCRIPTION: Places a black circle of radius 50 at center (129, 104).
; PLAN: r0=129(x), r1=104(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 104
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
