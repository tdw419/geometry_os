; DESCRIPTION: Renders a purple disk with center (178, 70) and radius 22.
; PLAN: r0=178(x), r1=70(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 70
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
