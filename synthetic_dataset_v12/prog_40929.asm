; DESCRIPTION: Places a magenta circle of radius 58 at center (149, 100).
; PLAN: r0=149(x), r1=100(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 100
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
