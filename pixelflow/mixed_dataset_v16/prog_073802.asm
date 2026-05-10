; DESCRIPTION: Places a magenta circle of radius 72 at center (149, 77).
; PLAN: r0=149(x), r1=77(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 77
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
