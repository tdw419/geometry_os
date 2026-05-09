; DESCRIPTION: Renders a blue disk with center (177, 198) and radius 39.
; PLAN: r0=177(x), r1=198(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 198
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
