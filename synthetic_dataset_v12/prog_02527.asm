; DESCRIPTION: Renders a purple disk with center (140, 95) and radius 71.
; PLAN: r0=140(x), r1=95(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 95
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
