; DESCRIPTION: Creates a magenta circular shape at (84, 51) with radius 18.
; PLAN: r0=84(x), r1=51(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 51
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
