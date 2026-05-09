; DESCRIPTION: Renders a purple disk with center (176, 75) and radius 55.
; PLAN: r0=176(x), r1=75(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 75
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
