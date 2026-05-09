; DESCRIPTION: Places a magenta circle of radius 48 at center (55, 100).
; PLAN: r0=55(x), r1=100(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 100
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
