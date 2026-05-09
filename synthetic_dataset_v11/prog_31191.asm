; DESCRIPTION: Places a magenta circle of radius 21 at center (99, 212).
; PLAN: r0=99(x), r1=212(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 212
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
