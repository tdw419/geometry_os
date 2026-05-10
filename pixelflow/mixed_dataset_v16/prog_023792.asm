; DESCRIPTION: Composite: Sets a single blue pixel at (203, 133) then Draws a yellow circle centered at (462, 31) with radius 14.
; PLAN: r0=203(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=462(x), r6=31(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 462
LDI r6, 31
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
