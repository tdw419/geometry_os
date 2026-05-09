; DESCRIPTION: Renders a blue disk with center (87, 75) and radius 18.
; PLAN: r0=87(x), r1=75(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 75
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
