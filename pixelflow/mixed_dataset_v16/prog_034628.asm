; DESCRIPTION: Composite: Draws a cyan circle centered at (112, 207) with radius 23 then Sets a single cyan pixel at (40, 124).
; PLAN: r0=112(x), r1=207(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=124(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 207
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 124
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
