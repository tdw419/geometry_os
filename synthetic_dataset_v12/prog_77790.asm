; DESCRIPTION: Places a magenta circle of radius 30 at center (141, 217).
; PLAN: r0=141(x), r1=217(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 217
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
