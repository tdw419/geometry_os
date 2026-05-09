; DESCRIPTION: Renders a blue disk with center (111, 158) and radius 56.
; PLAN: r0=111(x), r1=158(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 158
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
