; DESCRIPTION: Places a magenta circle of radius 37 at center (84, 203).
; PLAN: r0=84(x), r1=203(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 203
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
