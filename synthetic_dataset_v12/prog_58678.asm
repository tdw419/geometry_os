; DESCRIPTION: Composite: Places a blue line segment connecting (276, 114) to (270, 63) then Sets a single yellow pixel at (135, 9) then Creates a red circular shape at (195, 109) with radius 21.
; PLAN: r0=276(x1), r1=114(y1), r2=270(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=9(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=109(y), r12=21(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 114
LDI r2, 270
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 9
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 195
LDI r11, 109
LDI r12, 21
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
