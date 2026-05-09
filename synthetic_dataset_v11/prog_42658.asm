; DESCRIPTION: Renders a blue disk with center (64, 74) and radius 49.
; PLAN: r0=64(x), r1=74(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 74
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
