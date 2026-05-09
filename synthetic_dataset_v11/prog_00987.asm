; DESCRIPTION: Renders a blue disk with center (199, 177) and radius 49.
; PLAN: r0=199(x), r1=177(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 177
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
