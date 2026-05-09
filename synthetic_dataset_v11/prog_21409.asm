; DESCRIPTION: Renders a purple disk with center (45, 154) and radius 30.
; PLAN: r0=45(x), r1=154(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 154
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
