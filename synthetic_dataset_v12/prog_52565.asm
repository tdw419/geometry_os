; DESCRIPTION: Composite: Sets a single blue pixel at (469, 13) then Draws a yellow circle centered at (437, 176) with radius 37.
; PLAN: r0=469(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=176(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 469
LDI r1, 13
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 176
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
