; DESCRIPTION: Places a magenta circle of radius 62 at center (372, 77).
; PLAN: r0=372(x), r1=77(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 77
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
