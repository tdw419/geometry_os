; DESCRIPTION: Places a magenta circle of radius 54 at center (140, 89).
; PLAN: r0=140(x), r1=89(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 89
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
