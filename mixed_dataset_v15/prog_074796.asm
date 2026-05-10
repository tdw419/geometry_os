; DESCRIPTION: Composite: Renders a green line between points (407, 106) and (186, 6) then Creates a orange circular shape at (177, 205) with radius 45 then Sets a single red pixel at (158, 181).
; PLAN: r0=407(x1), r1=106(y1), r2=186(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=205(y), r7=45(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=181(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 106
LDI r2, 186
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 205
LDI r7, 45
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 181
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
