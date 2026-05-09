; DESCRIPTION: Renders a purple disk with center (112, 178) and radius 39.
; PLAN: r0=112(x), r1=178(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 178
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
