; DESCRIPTION: Renders a purple disk with center (79, 156) and radius 65.
; PLAN: r0=79(x), r1=156(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 156
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
