; DESCRIPTION: Renders a blue disk with center (54, 177) and radius 52.
; PLAN: r0=54(x), r1=177(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 177
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
