; DESCRIPTION: Places a purple circle of radius 10 at center (11, 209).
; PLAN: r0=11(x), r1=209(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 11
LDI r1, 209
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
