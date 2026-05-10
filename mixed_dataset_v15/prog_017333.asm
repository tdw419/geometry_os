; DESCRIPTION: Composite: Sets a single yellow pixel at (8, 158) then Draws a magenta circle centered at (254, 101) with radius 31 then Places a yellow line segment connecting (105, 91) to (133, 80).
; PLAN: r0=8(x), r1=158(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=101(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x1), r11=91(y1), r12=133(x2), r13=80(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 8
LDI r1, 158
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 254
LDI r6, 101
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 91
LDI r12, 133
LDI r13, 80
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
