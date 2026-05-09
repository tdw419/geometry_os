; DESCRIPTION: Renders a purple disk with center (246, 146) and radius 33.
; PLAN: r0=246(x), r1=146(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 146
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
