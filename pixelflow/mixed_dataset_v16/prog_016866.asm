; DESCRIPTION: Draws a red circle centered at (335, 132) with radius 59.
; PLAN: r0=335(x), r1=132(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 132
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
