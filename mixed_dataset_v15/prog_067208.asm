; DESCRIPTION: Composite: Places a orange line segment connecting (85, 198) to (167, 163) then Creates a orange circular shape at (181, 81) with radius 78 then Sets a single yellow pixel at (411, 39).
; PLAN: r0=85(x1), r1=198(y1), r2=167(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=81(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x), r11=39(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 198
LDI r2, 167
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 81
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 39
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
