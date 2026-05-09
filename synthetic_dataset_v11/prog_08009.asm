; DESCRIPTION: Renders a blue disk with center (87, 85) and radius 80.
; PLAN: r0=87(x), r1=85(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 85
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
