; DESCRIPTION: Draws a orange circle centered at (449, 92) with radius 56.
; PLAN: r0=449(x), r1=92(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 92
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
