; DESCRIPTION: Composite: Creates a green circular shape at (406, 186) with radius 13 then Sets a single yellow pixel at (167, 175).
; PLAN: r0=406(x), r1=186(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=175(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 406
LDI r1, 186
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 175
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
