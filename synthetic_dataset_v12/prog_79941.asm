; DESCRIPTION: Composite: Places a white line segment connecting (154, 41) to (125, 218) then Sets a single blue pixel at (208, 226) then Creates a magenta circular shape at (345, 196) with radius 15.
; PLAN: r0=154(x1), r1=41(y1), r2=125(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=226(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=345(x), r11=196(y), r12=15(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 41
LDI r2, 125
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 226
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 196
LDI r12, 15
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
