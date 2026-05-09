; DESCRIPTION: Places a magenta circle of radius 30 at center (99, 97).
; PLAN: r0=99(x), r1=97(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 97
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
