; DESCRIPTION: Places a magenta circle of radius 49 at center (314, 132).
; PLAN: r0=314(x), r1=132(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 132
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
