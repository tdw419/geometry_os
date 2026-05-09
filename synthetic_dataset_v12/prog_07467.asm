; DESCRIPTION: Composite: Places a black line segment connecting (175, 199) to (466, 97) then Sets a single green pixel at (314, 242).
; PLAN: r0=175(x1), r1=199(y1), r2=466(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=242(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 199
LDI r2, 466
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 242
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
