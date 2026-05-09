; DESCRIPTION: Places a magenta circle of radius 51 at center (54, 179).
; PLAN: r0=54(x), r1=179(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 179
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
