; DESCRIPTION: Places a magenta circle of radius 23 at center (66, 23).
; PLAN: r0=66(x), r1=23(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 23
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
