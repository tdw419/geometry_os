; DESCRIPTION: Renders a purple disk with center (210, 163) and radius 34.
; PLAN: r0=210(x), r1=163(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 163
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
