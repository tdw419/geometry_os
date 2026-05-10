; DESCRIPTION: Places a purple circle of radius 17 at center (90, 56).
; PLAN: r0=90(x), r1=56(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 56
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
