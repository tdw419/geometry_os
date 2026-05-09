; DESCRIPTION: Renders a magenta disk with center (145, 95) and radius 35.
; PLAN: r0=145(x), r1=95(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 95
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
