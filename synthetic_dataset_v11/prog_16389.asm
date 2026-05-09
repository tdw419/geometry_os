; DESCRIPTION: Draws a black circle centered at (196, 75) with radius 56.
; PLAN: r0=196(x), r1=75(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 75
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
