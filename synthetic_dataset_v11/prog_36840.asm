; DESCRIPTION: Renders a purple disk with center (65, 73) and radius 62.
; PLAN: r0=65(x), r1=73(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 73
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
