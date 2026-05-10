; DESCRIPTION: Places a magenta circle of radius 51 at center (99, 80).
; PLAN: r0=99(x), r1=80(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 80
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
