; DESCRIPTION: Renders a purple disk with center (96, 162) and radius 78.
; PLAN: r0=96(x), r1=162(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 162
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
