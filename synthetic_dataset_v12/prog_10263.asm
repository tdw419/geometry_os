; DESCRIPTION: Places a magenta circle of radius 31 at center (325, 64).
; PLAN: r0=325(x), r1=64(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 64
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
