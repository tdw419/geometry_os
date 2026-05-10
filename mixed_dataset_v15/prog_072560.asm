; DESCRIPTION: Creates a blue circular shape at (56, 57) with radius 51.
; PLAN: r0=56(x), r1=57(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 57
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
