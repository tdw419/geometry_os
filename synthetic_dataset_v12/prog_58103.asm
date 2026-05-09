; DESCRIPTION: Composite: Creates a cyan rectangular region at (347, 91) spanning 87 by 75 pixels then Sets a single red pixel at (332, 17) then Renders a orange line between points (10, 230) and (439, 124).
; PLAN: r0=347(x), r1=91(y), r2=87(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=17(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=10(x1), r11=230(y1), r12=439(x2), r13=124(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 91
LDI r2, 87
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 17
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 10
LDI r11, 230
LDI r12, 439
LDI r13, 124
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
