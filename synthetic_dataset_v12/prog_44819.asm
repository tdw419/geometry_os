; DESCRIPTION: Composite: Sets a single green pixel at (350, 122) then Draws a green circle centered at (195, 92) with radius 59.
; PLAN: r0=350(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=92(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 195
LDI r6, 92
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
