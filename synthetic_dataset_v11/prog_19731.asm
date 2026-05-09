; DESCRIPTION: Places a magenta circle of radius 30 at center (123, 199).
; PLAN: r0=123(x), r1=199(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 199
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
