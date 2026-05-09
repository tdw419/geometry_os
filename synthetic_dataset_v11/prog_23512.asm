; DESCRIPTION: Renders a magenta disk with center (145, 200) and radius 24.
; PLAN: r0=145(x), r1=200(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 200
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
