; DESCRIPTION: Places a magenta circle of radius 52 at center (151, 106).
; PLAN: r0=151(x), r1=106(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 106
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
