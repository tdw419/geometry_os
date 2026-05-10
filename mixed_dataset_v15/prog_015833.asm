; DESCRIPTION: Renders a purple disk with center (189, 143) and radius 73.
; PLAN: r0=189(x), r1=143(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 143
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
