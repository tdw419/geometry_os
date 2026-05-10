; DESCRIPTION: Composite: Sets a single green pixel at (261, 199) then Draws a blue circle centered at (322, 133) with radius 10.
; PLAN: r0=261(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=133(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 322
LDI r6, 133
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
