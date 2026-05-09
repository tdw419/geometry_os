; DESCRIPTION: Renders a purple disk with center (300, 157) and radius 18.
; PLAN: r0=300(x), r1=157(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 157
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
