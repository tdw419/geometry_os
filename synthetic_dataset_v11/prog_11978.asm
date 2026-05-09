; DESCRIPTION: Places a magenta circle of radius 34 at center (131, 175).
; PLAN: r0=131(x), r1=175(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 175
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
