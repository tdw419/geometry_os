; DESCRIPTION: Renders a magenta disk with center (419, 147) and radius 55.
; PLAN: r0=419(x), r1=147(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 147
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
