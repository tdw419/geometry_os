; DESCRIPTION: Composite: Sets a single yellow pixel at (351, 86) then Renders a cyan box of size 94x70 starting at (360, 180) then Creates a purple circular shape at (156, 110) with radius 31.
; PLAN: r0=351(x), r1=86(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=180(y), r7=94(width), r8=70(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=110(y), r12=31(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 86
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 360
LDI r6, 180
LDI r7, 94
LDI r8, 70
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 110
LDI r12, 31
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
