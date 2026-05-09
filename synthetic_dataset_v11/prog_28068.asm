; DESCRIPTION: Renders a magenta disk with center (106, 139) and radius 53.
; PLAN: r0=106(x), r1=139(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 139
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
