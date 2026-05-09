; DESCRIPTION: Composite: Places a orange line segment connecting (175, 78) to (311, 209) then Sets a single green pixel at (478, 26).
; PLAN: r0=175(x1), r1=78(y1), r2=311(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=26(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 78
LDI r2, 311
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 26
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
