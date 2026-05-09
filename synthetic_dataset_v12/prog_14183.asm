; DESCRIPTION: Composite: Places a orange dot at position (472, 93) then Places a red line segment connecting (373, 226) to (110, 40) then Creates a yellow circular shape at (323, 165) with radius 69.
; PLAN: r0=472(x), r1=93(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=226(y1), r7=110(x2), r8=40(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=165(y), r12=69(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 472
LDI r1, 93
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 373
LDI r6, 226
LDI r7, 110
LDI r8, 40
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 165
LDI r12, 69
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
