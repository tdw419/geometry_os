; DESCRIPTION: Composite: Sets a single green pixel at (185, 72) then Draws a yellow circle centered at (23, 86) with radius 17.
; PLAN: r0=185(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=86(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 23
LDI r6, 86
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
