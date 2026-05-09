; DESCRIPTION: Renders a magenta disk with center (285, 57) and radius 51.
; PLAN: r0=285(x), r1=57(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 57
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
