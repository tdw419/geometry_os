; DESCRIPTION: Renders a magenta disk with center (71, 84) and radius 53.
; PLAN: r0=71(x), r1=84(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 84
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
