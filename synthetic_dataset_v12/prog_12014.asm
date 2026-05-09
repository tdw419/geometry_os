; DESCRIPTION: Renders a purple disk with center (264, 236) and radius 18.
; PLAN: r0=264(x), r1=236(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 236
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
