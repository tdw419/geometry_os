; DESCRIPTION: Composite: Draws a cyan circle centered at (175, 167) with radius 15 then Sets a single cyan pixel at (423, 242).
; PLAN: r0=175(x), r1=167(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=242(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 167
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 242
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
