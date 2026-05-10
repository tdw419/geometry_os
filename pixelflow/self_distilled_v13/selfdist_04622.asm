; DESCRIPTION: Places a purple disk with center (199, 139) and radius 19.
; PLAN: r0=199(x), r1=139(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 139
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
