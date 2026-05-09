; DESCRIPTION: Places a purple circle of radius 24 at center (104, 120).
; PLAN: r0=104(x), r1=120(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 120
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
