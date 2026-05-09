; DESCRIPTION: Renders a blue disk with center (57, 56) and radius 37.
; PLAN: r0=57(x), r1=56(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 56
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
