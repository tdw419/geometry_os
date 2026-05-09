; DESCRIPTION: Renders a purple disk with center (372, 135) and radius 76.
; PLAN: r0=372(x), r1=135(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 135
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
