; DESCRIPTION: Composite: Sets a single green pixel at (17, 238) then Places a red line segment connecting (94, 38) to (483, 16) then Creates a blue circular shape at (360, 171) with radius 63.
; PLAN: r0=17(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=38(y1), r7=483(x2), r8=16(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=171(y), r12=63(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 17
LDI r1, 238
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 94
LDI r6, 38
LDI r7, 483
LDI r8, 16
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 171
LDI r12, 63
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
