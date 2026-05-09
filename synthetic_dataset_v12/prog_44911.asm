; DESCRIPTION: Renders a purple disk with center (399, 106) and radius 32.
; PLAN: r0=399(x), r1=106(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 106
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
