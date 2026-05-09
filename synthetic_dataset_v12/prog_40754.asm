; DESCRIPTION: Renders a magenta disk with center (80, 86) and radius 11.
; PLAN: r0=80(x), r1=86(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 86
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
