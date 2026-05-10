; DESCRIPTION: Composite: Draws a green circle centered at (440, 78) with radius 16 then Sets a single purple pixel at (37, 49).
; PLAN: r0=440(x), r1=78(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=49(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 78
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 49
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
