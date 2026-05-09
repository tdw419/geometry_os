; DESCRIPTION: Renders a purple disk with center (82, 77) and radius 72.
; PLAN: r0=82(x), r1=77(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 77
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
