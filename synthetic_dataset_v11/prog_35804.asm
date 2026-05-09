; DESCRIPTION: Places a purple circle of radius 40 at center (199, 199).
; PLAN: r0=199(x), r1=199(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 199
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
