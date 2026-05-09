; DESCRIPTION: Renders a magenta disk with center (142, 125) and radius 11.
; PLAN: r0=142(x), r1=125(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 125
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
