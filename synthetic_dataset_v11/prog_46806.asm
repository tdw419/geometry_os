; DESCRIPTION: Places a magenta circle of radius 54 at center (87, 77).
; PLAN: r0=87(x), r1=77(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 77
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
