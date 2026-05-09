; DESCRIPTION: Renders a purple disk with center (106, 162) and radius 28.
; PLAN: r0=106(x), r1=162(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 162
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
