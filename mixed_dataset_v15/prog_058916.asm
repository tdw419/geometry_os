; DESCRIPTION: Renders a magenta disk with center (223, 157) and radius 51.
; PLAN: r0=223(x), r1=157(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 157
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
