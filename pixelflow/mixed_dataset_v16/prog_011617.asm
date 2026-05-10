; DESCRIPTION: Renders a purple disk with center (123, 65) and radius 30.
; PLAN: r0=123(x), r1=65(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 65
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
