; DESCRIPTION: Composite: Sets a single red pixel at (476, 34) then Draws a black circle centered at (321, 84) with radius 57.
; PLAN: r0=476(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=84(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 476
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 321
LDI r6, 84
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
