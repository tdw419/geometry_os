; DESCRIPTION: Places a magenta circle of radius 32 at center (461, 211).
; PLAN: r0=461(x), r1=211(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 211
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
