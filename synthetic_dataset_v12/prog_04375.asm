; DESCRIPTION: Composite: Sets a single cyan pixel at (142, 0) then Places a black line segment connecting (139, 162) to (497, 30) then Creates a yellow circular shape at (81, 76) with radius 57.
; PLAN: r0=142(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=162(y1), r7=497(x2), r8=30(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=76(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 162
LDI r7, 497
LDI r8, 30
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 76
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
