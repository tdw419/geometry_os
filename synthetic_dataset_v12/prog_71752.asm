; DESCRIPTION: Composite: Sets a single orange pixel at (344, 2) then Places a orange line segment connecting (114, 20) to (263, 144) then Creates a yellow circular shape at (62, 166) with radius 10.
; PLAN: r0=344(x), r1=2(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=20(y1), r7=263(x2), r8=144(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=166(y), r12=10(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 344
LDI r1, 2
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 114
LDI r6, 20
LDI r7, 263
LDI r8, 144
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 166
LDI r12, 10
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
