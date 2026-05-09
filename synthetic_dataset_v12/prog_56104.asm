; DESCRIPTION: Places a magenta circle of radius 75 at center (293, 123).
; PLAN: r0=293(x), r1=123(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 123
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
