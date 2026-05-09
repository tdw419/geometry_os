; DESCRIPTION: Composite: Places a purple line segment connecting (423, 165) to (167, 24) then Sets a single white pixel at (358, 225) then Creates a orange circular shape at (444, 178) with radius 46.
; PLAN: r0=423(x1), r1=165(y1), r2=167(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=225(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=444(x), r11=178(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 165
LDI r2, 167
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 225
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 444
LDI r11, 178
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
