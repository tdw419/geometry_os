; DESCRIPTION: Places a purple circle of radius 24 at center (433, 152).
; PLAN: r0=433(x), r1=152(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 152
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
