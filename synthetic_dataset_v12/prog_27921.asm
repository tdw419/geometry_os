; DESCRIPTION: Places a purple circle of radius 43 at center (247, 84).
; PLAN: r0=247(x), r1=84(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 84
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
