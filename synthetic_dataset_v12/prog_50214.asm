; DESCRIPTION: Composite: Draws a magenta line from (439, 10) to (136, 58) then Creates a yellow rectangular region at (130, 233) spanning 70 by 14 pixels then Sets a single red pixel at (491, 127).
; PLAN: r0=439(x1), r1=10(y1), r2=136(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=233(y), r7=70(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x), r11=127(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 10
LDI r2, 136
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 233
LDI r7, 70
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 127
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
