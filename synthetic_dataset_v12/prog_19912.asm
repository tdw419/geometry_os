; DESCRIPTION: Places a magenta circle of radius 56 at center (219, 145).
; PLAN: r0=219(x), r1=145(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 145
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
