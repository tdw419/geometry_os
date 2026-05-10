; DESCRIPTION: Composite: Renders a blue line between points (466, 153) and (229, 152) then Sets a single cyan pixel at (178, 17) then Places a orange circle of radius 75 at center (163, 149).
; PLAN: r0=466(x1), r1=153(y1), r2=229(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=17(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=149(y), r12=75(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 153
LDI r2, 229
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 17
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 163
LDI r11, 149
LDI r12, 75
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
