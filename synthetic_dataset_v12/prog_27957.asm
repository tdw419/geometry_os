; DESCRIPTION: Places a magenta circle of radius 73 at center (84, 141).
; PLAN: r0=84(x), r1=141(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 141
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
