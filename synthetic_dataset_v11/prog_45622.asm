; DESCRIPTION: Draws a red circle centered at (83, 110) with radius 23.
; PLAN: r0=83(x), r1=110(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 110
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
