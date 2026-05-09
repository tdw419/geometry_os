; DESCRIPTION: Places a purple circle of radius 62 at center (429, 101).
; PLAN: r0=429(x), r1=101(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 101
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
