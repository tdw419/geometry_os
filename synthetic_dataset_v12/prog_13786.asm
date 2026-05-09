; DESCRIPTION: Renders a purple disk with center (157, 123) and radius 16.
; PLAN: r0=157(x), r1=123(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 123
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
