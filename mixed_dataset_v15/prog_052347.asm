; DESCRIPTION: Places a magenta circle of radius 56 at center (234, 149).
; PLAN: r0=234(x), r1=149(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 149
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
