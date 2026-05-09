; DESCRIPTION: Places a magenta circle of radius 73 at center (341, 112).
; PLAN: r0=341(x), r1=112(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 112
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
