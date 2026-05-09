; DESCRIPTION: Renders a purple disk with center (343, 110) and radius 58.
; PLAN: r0=343(x), r1=110(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 110
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
