; DESCRIPTION: Renders a magenta disk with center (86, 145) and radius 77.
; PLAN: r0=86(x), r1=145(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 145
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
