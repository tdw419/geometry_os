; DESCRIPTION: Draws a red circle centered at (266, 90) with radius 56.
; PLAN: r0=266(x), r1=90(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 90
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
