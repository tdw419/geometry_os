; DESCRIPTION: Places a purple circle of radius 11 at center (433, 21).
; PLAN: r0=433(x), r1=21(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 21
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
