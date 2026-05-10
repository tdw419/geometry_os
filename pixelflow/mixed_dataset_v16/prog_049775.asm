; DESCRIPTION: Places a purple circle of radius 58 at center (379, 159).
; PLAN: r0=379(x), r1=159(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 159
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
