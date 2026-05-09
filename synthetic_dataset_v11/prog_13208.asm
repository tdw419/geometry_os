; DESCRIPTION: Places a yellow circle of radius 19 at center (199, 237).
; PLAN: r0=199(x), r1=237(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 237
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
