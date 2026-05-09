; DESCRIPTION: Draws a red circle centered at (321, 145) with radius 56.
; PLAN: r0=321(x), r1=145(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 145
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
