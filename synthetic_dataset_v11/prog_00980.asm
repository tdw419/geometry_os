; DESCRIPTION: Places a purple circle of radius 53 at center (178, 112).
; PLAN: r0=178(x), r1=112(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 112
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
