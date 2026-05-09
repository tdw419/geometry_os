; DESCRIPTION: Places a magenta circle of radius 12 at center (402, 100).
; PLAN: r0=402(x), r1=100(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 100
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
