; DESCRIPTION: Renders a purple disk with center (189, 138) and radius 48.
; PLAN: r0=189(x), r1=138(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 138
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
