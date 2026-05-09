; DESCRIPTION: Renders a purple disk with center (176, 87) and radius 70.
; PLAN: r0=176(x), r1=87(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 87
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
