; DESCRIPTION: Composite: Places a cyan circle of radius 44 at center (451, 75) then Places a cyan line segment connecting (458, 238) to (374, 232) then Sets a single purple pixel at (490, 185).
; PLAN: r0=451(x), r1=75(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x1), r6=238(y1), r7=374(x2), r8=232(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=490(x), r11=185(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 451
LDI r1, 75
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 238
LDI r7, 374
LDI r8, 232
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 185
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
