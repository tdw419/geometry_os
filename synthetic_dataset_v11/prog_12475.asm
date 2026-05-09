; DESCRIPTION: Places a magenta circle of radius 14 at center (199, 149).
; PLAN: r0=199(x), r1=149(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 149
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
