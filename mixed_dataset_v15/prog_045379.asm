; DESCRIPTION: Renders a purple circular shape at (226, 102) with radius 71.
; PLAN: r0=226(x), r1=102(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 102
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
