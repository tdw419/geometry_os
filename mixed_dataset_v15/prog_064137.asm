; DESCRIPTION: Renders a magenta disk with center (377, 112) and radius 46.
; PLAN: r0=377(x), r1=112(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 112
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
