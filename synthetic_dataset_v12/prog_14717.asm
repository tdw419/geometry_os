; DESCRIPTION: Renders a magenta disk with center (133, 113) and radius 34.
; PLAN: r0=133(x), r1=113(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 113
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
