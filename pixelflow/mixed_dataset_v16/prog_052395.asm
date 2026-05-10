; DESCRIPTION: Composite: Draws a yellow circle centered at (370, 176) with radius 70 then Sets a single black pixel at (294, 78).
; PLAN: r0=370(x), r1=176(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=78(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 176
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 78
LDI r7, 0x000000
PSET r5, r6, r7
HALT
