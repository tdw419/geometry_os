; DESCRIPTION: Places a purple disk with center (204, 113) and radius 73.
; PLAN: r0=204(x), r1=113(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 113
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
