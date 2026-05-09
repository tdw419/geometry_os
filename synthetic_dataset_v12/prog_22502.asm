; DESCRIPTION: Renders a purple disk with center (338, 52) and radius 37.
; PLAN: r0=338(x), r1=52(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 52
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
