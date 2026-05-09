; DESCRIPTION: Renders a magenta disk with center (432, 131) and radius 28.
; PLAN: r0=432(x), r1=131(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 131
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
