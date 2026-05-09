; DESCRIPTION: Places a purple circle of radius 12 at center (17, 48).
; PLAN: r0=17(x), r1=48(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 48
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
