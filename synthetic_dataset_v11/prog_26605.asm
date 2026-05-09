; DESCRIPTION: Places a magenta circle of radius 76 at center (141, 79).
; PLAN: r0=141(x), r1=79(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 79
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
