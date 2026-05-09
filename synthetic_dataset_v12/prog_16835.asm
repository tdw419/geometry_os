; DESCRIPTION: Composite: Sets a single magenta pixel at (475, 245) then Draws a purple circle centered at (454, 85) with radius 22.
; PLAN: r0=475(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=85(y), r7=22(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 454
LDI r6, 85
LDI r7, 22
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
