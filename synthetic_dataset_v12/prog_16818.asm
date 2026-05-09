; DESCRIPTION: Places a magenta circle of radius 71 at center (266, 85).
; PLAN: r0=266(x), r1=85(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 85
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
