; DESCRIPTION: Places a magenta circle of radius 39 at center (273, 85).
; PLAN: r0=273(x), r1=85(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 85
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
