; DESCRIPTION: Renders a blue disk with center (159, 202) and radius 36.
; PLAN: r0=159(x), r1=202(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 202
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
