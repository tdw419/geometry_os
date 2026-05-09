; DESCRIPTION: Places a magenta circle of radius 56 at center (310, 131).
; PLAN: r0=310(x), r1=131(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 131
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
