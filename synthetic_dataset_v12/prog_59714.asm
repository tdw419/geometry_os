; DESCRIPTION: Composite: Renders a yellow line between points (199, 52) and (99, 135) then Places a cyan circle of radius 73 at center (383, 139) then Sets a single green pixel at (351, 145).
; PLAN: r0=199(x1), r1=52(y1), r2=99(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=139(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=351(x), r11=145(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 52
LDI r2, 99
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 139
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 351
LDI r11, 145
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
