; DESCRIPTION: Places a green circle of radius 60 at center (308, 104).
; PLAN: r0=308(x), r1=104(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 104
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
