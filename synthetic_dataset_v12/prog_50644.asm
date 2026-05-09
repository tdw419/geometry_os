; DESCRIPTION: Places a magenta circle of radius 19 at center (32, 66).
; PLAN: r0=32(x), r1=66(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 66
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
