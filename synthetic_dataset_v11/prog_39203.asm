; DESCRIPTION: Places a magenta circle of radius 34 at center (156, 114).
; PLAN: r0=156(x), r1=114(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 114
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
