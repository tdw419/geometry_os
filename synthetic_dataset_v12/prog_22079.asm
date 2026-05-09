; DESCRIPTION: Draws a orange circle centered at (449, 51) with radius 30.
; PLAN: r0=449(x), r1=51(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 51
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
