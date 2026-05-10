; DESCRIPTION: Places a green circle of radius 21 at center (194, 104).
; PLAN: r0=194(x), r1=104(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 104
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
