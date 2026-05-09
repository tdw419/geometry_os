; DESCRIPTION: Places a purple circle of radius 13 at center (439, 133).
; PLAN: r0=439(x), r1=133(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 133
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
