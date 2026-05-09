; DESCRIPTION: Places a magenta circle of radius 38 at center (105, 44).
; PLAN: r0=105(x), r1=44(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 44
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
