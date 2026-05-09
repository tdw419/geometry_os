; DESCRIPTION: Places a magenta circle of radius 50 at center (181, 201).
; PLAN: r0=181(x), r1=201(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 201
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
