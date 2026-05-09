; DESCRIPTION: Composite: Draws a green circle centered at (249, 205) with radius 40 then Sets a single black pixel at (15, 52).
; PLAN: r0=249(x), r1=205(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=52(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 205
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 52
LDI r7, 0x000000
PSET r5, r6, r7
HALT
