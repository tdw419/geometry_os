; DESCRIPTION: Renders a purple disk with center (115, 196) and radius 45.
; PLAN: r0=115(x), r1=196(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 196
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
