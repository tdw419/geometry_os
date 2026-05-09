; DESCRIPTION: Renders a magenta disk with center (336, 131) and radius 79.
; PLAN: r0=336(x), r1=131(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 131
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
