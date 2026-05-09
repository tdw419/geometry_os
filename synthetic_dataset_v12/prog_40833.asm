; DESCRIPTION: Renders a magenta disk with center (250, 119) and radius 15.
; PLAN: r0=250(x), r1=119(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 119
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
