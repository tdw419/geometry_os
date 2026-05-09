; DESCRIPTION: Places a purple circle of radius 77 at center (159, 155).
; PLAN: r0=159(x), r1=155(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 155
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
