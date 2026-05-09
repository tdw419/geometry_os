; DESCRIPTION: Renders a purple disk with center (45, 55) and radius 10.
; PLAN: r0=45(x), r1=55(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 55
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
