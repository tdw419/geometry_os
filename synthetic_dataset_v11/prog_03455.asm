; DESCRIPTION: Renders a purple disk with center (45, 215) and radius 40.
; PLAN: r0=45(x), r1=215(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 215
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
