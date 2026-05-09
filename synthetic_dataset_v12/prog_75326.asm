; DESCRIPTION: Renders a purple disk with center (279, 184) and radius 34.
; PLAN: r0=279(x), r1=184(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 184
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
