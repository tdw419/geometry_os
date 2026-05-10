; DESCRIPTION: Composite: Places a green dot at position (102, 232) then Draws a yellow circle centered at (468, 75) with radius 33.
; PLAN: r0=102(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=468(x), r6=75(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 468
LDI r6, 75
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
