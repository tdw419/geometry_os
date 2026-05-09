; DESCRIPTION: Renders a magenta disk with center (403, 155) and radius 52.
; PLAN: r0=403(x), r1=155(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 155
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
