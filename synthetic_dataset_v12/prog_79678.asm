; DESCRIPTION: Composite: Sets a single cyan pixel at (414, 226) then Places a yellow line segment connecting (74, 196) to (505, 137) then Creates a black circular shape at (247, 200) with radius 40.
; PLAN: r0=414(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=74(x1), r6=196(y1), r7=505(x2), r8=137(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=200(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 74
LDI r6, 196
LDI r7, 505
LDI r8, 137
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 200
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
