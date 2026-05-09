; DESCRIPTION: Places a magenta circle of radius 31 at center (38, 81).
; PLAN: r0=38(x), r1=81(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 81
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
