; DESCRIPTION: Renders a purple disk with center (204, 146) and radius 25.
; PLAN: r0=204(x), r1=146(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 146
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
