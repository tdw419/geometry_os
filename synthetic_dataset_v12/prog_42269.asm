; DESCRIPTION: Renders a blue disk with center (345, 74) and radius 74.
; PLAN: r0=345(x), r1=74(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 74
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
