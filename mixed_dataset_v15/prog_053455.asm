; DESCRIPTION: Places a magenta circle of radius 74 at center (79, 129).
; PLAN: r0=79(x), r1=129(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 129
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
