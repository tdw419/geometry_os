; DESCRIPTION: Places a magenta circle of radius 11 at center (399, 81).
; PLAN: r0=399(x), r1=81(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 81
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
