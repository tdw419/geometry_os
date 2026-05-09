; DESCRIPTION: Renders a magenta disk with center (396, 77) and radius 14.
; PLAN: r0=396(x), r1=77(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 77
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
