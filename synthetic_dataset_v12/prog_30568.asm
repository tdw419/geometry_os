; DESCRIPTION: Composite: Renders a yellow line between points (140, 102) and (207, 127) then Creates a green circular shape at (334, 165) with radius 79 then Sets a single orange pixel at (448, 11).
; PLAN: r0=140(x1), r1=102(y1), r2=207(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=165(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=448(x), r11=11(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 102
LDI r2, 207
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 165
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 448
LDI r11, 11
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
