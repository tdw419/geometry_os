; DESCRIPTION: Places a purple circle of radius 41 at center (111, 116).
; PLAN: r0=111(x), r1=116(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 116
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
