; DESCRIPTION: Renders a purple disk with center (329, 144) and radius 78.
; PLAN: r0=329(x), r1=144(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 144
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
