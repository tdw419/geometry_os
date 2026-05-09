; DESCRIPTION: Composite: Draws a magenta line from (470, 10) to (507, 202) then Creates a black rectangular region at (128, 11) spanning 119 by 34 pixels then Sets a single red pixel at (259, 66).
; PLAN: r0=470(x1), r1=10(y1), r2=507(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=11(y), r7=119(width), r8=34(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=66(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 470
LDI r1, 10
LDI r2, 507
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 11
LDI r7, 119
LDI r8, 34
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 66
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
