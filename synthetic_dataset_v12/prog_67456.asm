; DESCRIPTION: Renders a magenta disk with center (331, 124) and radius 51.
; PLAN: r0=331(x), r1=124(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 124
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
