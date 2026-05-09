; DESCRIPTION: Renders a magenta disk with center (80, 71) and radius 60.
; PLAN: r0=80(x), r1=71(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 71
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
