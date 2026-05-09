; DESCRIPTION: Renders a magenta disk with center (423, 77) and radius 51.
; PLAN: r0=423(x), r1=77(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 77
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
