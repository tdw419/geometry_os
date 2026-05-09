; DESCRIPTION: Renders a blue disk with center (87, 74) and radius 69.
; PLAN: r0=87(x), r1=74(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 74
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
